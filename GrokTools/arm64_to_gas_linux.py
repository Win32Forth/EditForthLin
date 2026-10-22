"""Translate EditForthWin ARM64 armasm into GNU assembler for Linux AArch64.

The ARM64 armasm kernel is the source of truth. Instructions stay ARM64.
This pass rewrites armasm directives, macros, and the adrp/add symbol form
into GAS that the Linux AArch64 ABI can link. Windows ARM64 and AAPCS64
pass integer arguments in x0-x7 and keep x19-x28 callee-saved, so host
calls keep the registers the kernel already uses.

Hand-written, not produced here:

- Forth/kernel/arm64-linux/identity.s

Set EDITFORTHLIN if the tree is not the parent of GrokTools.
"""

from __future__ import annotations

import os
import re
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
ROOT = os.environ.get(
    "EDITFORTHLIN",
    os.path.abspath(os.path.join(HERE, "..")),
)
SRC = os.path.join(ROOT, "Forth", "kernel", "arm64")
OUT = os.path.join(ROOT, "Forth", "kernel", "arm64-linux", "asm")

FILES = [
    "state.asm",
    "emit.asm",
    "boot_begin.asm",
    "prims.asm",
    "prims_k1.asm",
    "prims_k2.asm",
    "prims_k3.asm",
    "sa_print.asm",
    "sa_files.asm",
    "sa_float.asm",
    "prims_dbg.asm",
    "dict.asm",
    "entry.asm",
    "cold.asm",
    "boot_end.asm",
]

DIRECTIVES = {
    "MACRO", "MEND", "IF", "ELSE", "ENDIF", "END", "INCLUDE", "AREA",
    "EXPORT", "EXTERN", "ALIGN", "DCB", "DCW", "DCD", "DCQ", "SPACE",
    "INCBIN", "ENDP", "EQU",
}

# add/ldr of a bare symbol is armasm's :lo12: form after adrp.
LO12_OPS = {
    "add", "adds", "ldr", "ldrb", "ldrh", "ldrsw", "str", "strb", "strh",
}

REG_RE = re.compile(
    r"^(?:x|w|d|s|q|v|b|h)\d+$|^(?:sp|xzr|wzr|lr|fp|wsp)$",
    re.IGNORECASE,
)
SHIFT_RE = re.compile(
    r"^(?:lsl|lsr|asr|ror|uxtb|uxth|uxtw|uxtx|sxtb|sxth|sxtw|sxtx)$",
    re.IGNORECASE,
)
IDENT_RE = re.compile(r"^[A-Za-z_.][\w.]*$")


class AsmError(Exception):
    pass


def strip_comment(line: str) -> str:
    out = []
    quote = None
    for ch in line:
        if quote:
            out.append(ch)
            if ch == quote:
                quote = None
            continue
        if ch == '"':
            quote = ch
            out.append(ch)
            continue
        if ch == ";":
            break
        out.append(ch)
    return "".join(out).strip()


def first_token(line: str) -> tuple[str, str]:
    line = line.strip()
    match = re.match(r"(\S+)(?:\s+(.*))?$", line)
    if not match:
        return "", ""
    return match.group(1), (match.group(2) or "").strip()


def split_commas(text: str, brackets: bool = True) -> list[str]:
    out = []
    buf = []
    depth = 0
    quote = None
    for ch in text:
        if quote:
            buf.append(ch)
            if ch == quote:
                quote = None
            continue
        if ch == '"':
            quote = ch
            buf.append(ch)
            continue
        if brackets and ch == "[":
            depth += 1
        elif brackets and ch == "]" and depth > 0:
            depth -= 1
        if ch == "," and depth == 0 and quote is None:
            out.append("".join(buf).strip())
            buf = []
            continue
        buf.append(ch)
    if buf:
        part = "".join(buf).strip()
        if part:
            out.append(part)
    return out


def parse_int(text: str):
    token = text.strip().replace("_", "")
    if not token:
        return None
    sign = 1
    if token[0] in "+-":
        sign = -1 if token[0] == "-" else 1
        token = token[1:]
    try:
        if token.lower().startswith("0x"):
            return sign * int(token, 16)
        if token.isdigit():
            return sign * int(token, 10)
    except ValueError:
        return None
    return None


def fmt_num(value: int) -> str:
    if value < 0:
        return str(value)
    if value <= 9:
        return str(value)
    return hex(value)


def eval_cond(expr: str, equs: dict, loc: str) -> bool:
    text = expr.strip()
    for src, dst in (
        (":SHL:", "<<"),
        (":SHR:", ">>"),
        (":MOD:", "%"),
        (":OR:", "|"),
        (":EOR:", "^"),
        (":AND:", "&"),
        (":LOR:", " or "),
        (":LAND:", " and "),
        ("<>", "!="),
    ):
        text = text.replace(src, dst)
    text = re.sub(r"(?<![<>!=])=(?!=)", "==", text)

    def sub_name(match: re.Match) -> str:
        name = match.group(0)
        if name in ("or", "and", "not"):
            return name
        if name not in equs:
            raise AsmError(f"{loc}: unknown name in IF: {name}")
        return str(equs[name])

    text = re.sub(r"\b[A-Za-z_][A-Za-z0-9_]*\b", sub_name, text)
    try:
        return bool(eval(text, {"__builtins__": {}}, {}))  # noqa: S307
    except Exception as exc:
        raise AsmError(f"{loc}: cannot evaluate IF {expr!r} ({text!r}): {exc}") from exc


def section_directive(name: str) -> str:
    if name == ".text":
        return '.section .text, "ax", %progbits'
    if name in (".rdata", ".rodata"):
        return '.section .rodata, "a", %progbits'
    if name == ".data":
        return '.section .data, "aw", %progbits'
    if name == ".bss":
        return '.section .bss, "aw", %nobits'
    flags = '"a"'
    kind = "%progbits"
    return f".section {name}, {flags}, {kind}"


def subst_hash_equs(text: str, equs: dict) -> str:
    def repl(match: re.Match) -> str:
        name = match.group(1)
        if name not in equs:
            return match.group(0)
        return "#" + fmt_num(equs[name])

    return re.sub(r"#([A-Za-z_][A-Za-z0-9_]*)", repl, text)


def fix_lo12(line: str) -> str:
    match = re.match(r"(\S+)\s+(.*)$", line.strip())
    if not match:
        return line.strip()
    mnemonic, rest = match.group(1), match.group(2)
    if mnemonic.lower() not in LO12_OPS:
        return line.strip()
    parts = split_commas(rest)
    changed = False
    for index, part in enumerate(parts):
        token = part.strip()
        if (
            not token
            or token.startswith("[")
            or token.startswith("#")
            or token.startswith(":")
        ):
            continue
        head = token.split()[0]
        if REG_RE.match(head) or SHIFT_RE.match(head):
            continue
        if IDENT_RE.match(token):
            parts[index] = ":lo12:" + token
            changed = True
    if not changed:
        return line.strip()
    return mnemonic + " " + ", ".join(parts)


def operand_expr(token: str, equs: dict) -> str:
    number = parse_int(token)
    if number is not None:
        return fmt_num(number)
    if token in equs:
        return fmt_num(equs[token])
    return token


class Translator:
    def __init__(self, path: str):
        self.path = path
        self.equs = {}
        self.exports = set()
        self.macros = {}
        self.events = []
        self.labels = []
        self.skip = []
        self.defining = None
        self.macro_params = []
        self.macro_body = []
        self.depth = 0
        self.loc = path

    def skipping(self) -> bool:
        return any(self.skip)

    def add(self, event):
        if not self.skipping():
            self.events.append(event)

    def load(self, path: str):
        with open(path, "r", encoding="utf-8", errors="replace") as handle:
            lines = handle.read().splitlines()
        previous = self.loc
        for number, raw in enumerate(lines, 1):
            self.loc = f"{path}:{number}"
            if self.feed(raw):
                break
        self.loc = previous

    def feed(self, raw: str) -> bool:
        """Process one physical line. Return True to stop this file."""
        code = strip_comment(raw.rstrip("\r"))
        if not code:
            return False
        if raw[:1] in " \t":
            label, rest = None, code
        else:
            bits = code.split(None, 1)
            label = bits[0]
            rest = bits[1] if len(bits) > 1 else ""
        return self.handle(label, rest)

    def handle(self, label, rest: str) -> bool:
        if self.defining == "pending":
            self.begin_macro(label, rest)
            return False
        if self.defining:
            token, _ = first_token(rest if label is None else rest)
            if (label is None and token.upper() == "MEND") or rest.upper() == "MEND":
                self.macros[self.defining] = (self.macro_params, self.macro_body)
                self.defining = None
                self.macro_params = []
                self.macro_body = []
                return False
            self.macro_body.append((label, rest))
            return False

        token, args = first_token(rest if label is None else rest)
        upper = token.upper() if token else ""

        if self.skipping() and upper not in ("IF", "ELSE", "ENDIF", "END"):
            return False

        if label is None and token in self.macros:
            self.expand(token, args)
            return False

        if upper == "MACRO":
            if label is not None:
                raise AsmError(f"{self.loc}: MACRO must be alone")
            self.defining = "pending"
            return False
        if upper == "IF":
            self.do_if(args)
            return False
        if upper == "ELSE":
            self.do_else()
            return False
        if upper == "ENDIF":
            self.do_endif()
            return False
        if upper == "END":
            return True
        if upper == "INCLUDE":
            self.include(args)
            return False
        if upper == "EQU":
            if not label:
                raise AsmError(f"{self.loc}: EQU needs a name")
            value = parse_int(args)
            if value is None:
                raise AsmError(f"{self.loc}: bad EQU {args!r}")
            self.equs[label] = value
            return False
        if upper == "EXPORT":
            for name in split_commas(args):
                self.exports.add(name.strip())
            return False
        if upper == "EXTERN":
            return False
        if upper == "AREA":
            self.do_area(args)
            return False
        if upper == "ENDP":
            self.add(("endp",))
            return False
        if upper == "ALIGN":
            if label:
                self.note_label(label, False)
            number = parse_int(args)
            if number is None:
                raise AsmError(f"{self.loc}: bad ALIGN {args!r}")
            self.add(("align", number))
            return False
        if upper == "SPACE":
            if label:
                self.note_label(label, False)
            number = parse_int(args)
            if number is None:
                raise AsmError(f"{self.loc}: bad SPACE {args!r}")
            self.add(("space", number))
            return False
        if upper == "INCBIN":
            if label:
                self.note_label(label, False)
            path = args.strip().strip('"')
            self.add(("incbin", path))
            return False
        if upper in ("DCB", "DCW", "DCD", "DCQ"):
            if label:
                self.note_label(label, False)
            self.do_data(upper, args)
            return False
        if upper == "PROC":
            if not label:
                raise AsmError(f"{self.loc}: PROC needs a name")
            self.note_label(label, True)
            return False
        if label and not rest:
            self.note_label(label, False)
            return False
        if label and rest and upper not in DIRECTIVES and token not in self.macros:
            # `name  instruction` is not used; `name DCB` was handled.
            # A leftover label-plus-text is a label and an instruction.
            self.note_label(label, False)
            self.emit_insn(rest)
            return False
        if label is None and token:
            self.emit_insn(rest)
            return False
        if label and rest:
            raise AsmError(f"{self.loc}: unrecognized line {label} {rest}")
        return False

    def begin_macro(self, label, rest: str):
        text = rest if label is None else f"{label} {rest}".strip()
        name, params = first_token(text)
        if not name:
            raise AsmError(f"{self.loc}: macro needs a name")
        self.defining = name
        self.macro_params = [part.strip() for part in split_commas(params)] if params else []
        self.macro_body = []

    def expand(self, name: str, argtext: str):
        params, body = self.macros[name]
        args = split_commas(argtext, brackets=False) if argtext else []
        if len(args) != len(params):
            raise AsmError(
                f"{self.loc}: {name} expects {len(params)} args, got {len(args)}: {argtext!r}"
            )
        pairs = sorted(zip(params, args), key=lambda item: len(item[0]), reverse=True)
        self.depth += 1
        if self.depth > 12:
            raise AsmError(f"{self.loc}: macro nesting too deep at {name}")
        saved = self.loc
        for index, (lab, body_rest) in enumerate(body):
            self.loc = f"{saved}:<{name}:{index + 1}>"
            new_lab = substitute(lab, pairs) if lab else None
            new_rest = substitute(body_rest, pairs)
            self.handle(new_lab, new_rest)
        self.loc = saved
        self.depth -= 1

    def do_if(self, expr: str):
        if self.skipping():
            self.skip.append(True)
            return
        self.skip.append(not eval_cond(expr, self.equs, self.loc))

    def do_else(self):
        if not self.skip:
            raise AsmError(f"{self.loc}: ELSE without IF")
        frame = self.skip.pop()
        if self.skipping():
            self.skip.append(True)
        else:
            self.skip.append(not frame)

    def do_endif(self):
        if not self.skip:
            raise AsmError(f"{self.loc}: ENDIF without IF")
        self.skip.pop()

    def include(self, text: str):
        rel = text.strip().strip('"')
        path = rel if os.path.isabs(rel) else os.path.join(ROOT, rel)
        if not os.path.isfile(path):
            raise AsmError(f"{self.loc}: missing include {rel}")
        self.load(path)

    def do_area(self, text: str):
        parts = split_commas(text)
        if not parts:
            raise AsmError(f"{self.loc}: AREA needs a name")
        name = parts[0].strip().strip("|")
        if not name.startswith("."):
            name = "." + name
        align = None
        for part in parts[1:]:
            piece = part.strip()
            if piece.upper().startswith("ALIGN"):
                if "=" not in piece:
                    raise AsmError(f"{self.loc}: bad AREA align {piece}")
                align = parse_int(piece.split("=", 1)[1])
                if align is None:
                    raise AsmError(f"{self.loc}: bad AREA align {piece}")
        self.add(("area", name, align))

    def note_label(self, name: str, is_proc: bool):
        self.labels.append(name)
        self.add(("label", name, is_proc))

    def do_data(self, kind: str, text: str):
        if kind == "DCB":
            blob = bytearray()
            for item in split_commas(text, brackets=False):
                if item.startswith('"'):
                    if len(item) < 2 or not item.endswith('"'):
                        raise AsmError(f"{self.loc}: bad string {item!r}")
                    blob.extend(item[1:-1].encode("utf-8"))
                else:
                    number = parse_int(item)
                    if number is None and item in self.equs:
                        number = self.equs[item]
                    if number is None:
                        raise AsmError(f"{self.loc}: bad DCB {item!r}")
                    blob.append(number & 0xFF)
            self.add(("bytes", bytes(blob)))
            return
        values = [operand_expr(item, self.equs) for item in split_commas(text, brackets=False)]
        if not values:
            raise AsmError(f"{self.loc}: empty {kind}")
        width = {"DCW": "hword", "DCD": "word", "DCQ": "quad"}[kind]
        self.add((width, values))

    def emit_insn(self, text: str):
        line = fix_lo12(text.strip())
        line = subst_hash_equs(line, self.equs)
        self.add(("insn", line))


def substitute(text: str, pairs: list) -> str:
    for name, value in pairs:
        text = text.replace(name, value)
    return text


def emit_gas(src_name: str, unit: Translator) -> str:
    lines = [
        f"// Generated by GrokTools/arm64_to_gas_linux.py from Forth/kernel/arm64/{src_name}",
        "// Do not edit. Forth/kernel/arm64 armasm is the source of truth.",
        "",
    ]
    seen = set()
    for name in unit.labels:
        if name in seen:
            continue
        seen.add(name)
        if name in unit.exports:
            lines.append(f".global {name}")
        else:
            lines.append(f".local {name}")
    if seen:
        lines.append("")
    current_proc = None
    for event in unit.events:
        kind = event[0]
        if kind == "area":
            _, name, align = event
            lines.append(section_directive(name))
            if align is not None:
                lines.append(f".balign {1 << align}")
        elif kind == "label":
            _, name, is_proc = event
            if is_proc or name in unit.exports:
                # Data exports stay ordinary symbols. PROC marks a function.
                if is_proc:
                    lines.append(f".type {name}, %function")
                    current_proc = name
            lines.append(f"{name}:")
        elif kind == "endp":
            if current_proc:
                lines.append(f".size {current_proc}, .-{current_proc}")
                current_proc = None
        elif kind == "insn":
            lines.append(f"    {event[1]}")
        elif kind == "bytes":
            blob = event[1]
            for offset in range(0, len(blob), 16):
                chunk = blob[offset:offset + 16]
                nums = ", ".join(str(byte) for byte in chunk)
                lines.append(f"    .byte {nums}")
        elif kind == "hword":
            lines.append("    .hword " + ", ".join(event[1]))
        elif kind == "word":
            lines.append("    .word " + ", ".join(event[1]))
        elif kind == "quad":
            lines.append("    .quad " + ", ".join(event[1]))
        elif kind == "space":
            lines.append(f"    .space {event[1]}")
        elif kind == "align":
            lines.append(f"    .balign {event[1]}")
        elif kind == "incbin":
            lines.append(f'    .incbin "{event[1]}"')
        else:
            raise AsmError(f"bad event {kind}")
    lines.append('.section .note.GNU-stack, "", %progbits')
    lines.append("")
    return "\n".join(lines)


def translate_file(name: str) -> str:
    path = os.path.join(SRC, name)
    unit = Translator(path)
    unit.load(path)
    if unit.defining:
        raise AsmError(f"{path}: unclosed MACRO {unit.defining}")
    if unit.skip:
        raise AsmError(f"{path}: unclosed IF")
    return emit_gas(name, unit)


def write_gas(dest: str, text: str, limit: int = 112000) -> list[str]:
    """Write GAS text. A file over `limit` bytes is split on line boundaries.

    The pieces are concatenated before assemble. Symbol directives stay in
    the first piece, which is why the split is only a storage cut.
    """
    raw = text.encode("utf-8")
    if len(raw) <= limit:
        with open(dest, "w", encoding="utf-8", newline="\n") as handle:
            handle.write(text)
        return [dest]
    lines = text.splitlines(keepends=True)
    parts = []
    buf = []
    size = 0
    for line in lines:
        encoded = len(line.encode("utf-8"))
        if buf and size + encoded > limit:
            parts.append("".join(buf))
            buf = []
            size = 0
        buf.append(line)
        size += encoded
    if buf:
        parts.append("".join(buf))
    written = []
    for index, part in enumerate(parts):
        if index == 0:
            path = dest
        else:
            path = dest + f".part{index + 1}"
        with open(path, "w", encoding="utf-8", newline="\n") as handle:
            handle.write(part)
        written.append(path)
    return written


def main() -> int:
    os.makedirs(OUT, exist_ok=True)
    for name in FILES:
        try:
            text = translate_file(name)
        except AsmError as exc:
            print(f"error: {exc}", file=sys.stderr)
            return 1
        dest = os.path.join(OUT, os.path.splitext(name)[0] + ".s")
        for stale in (dest + ".part2", dest + ".part3", dest + ".part4"):
            if os.path.isfile(stale) and len(text.encode("utf-8")) <= 112000:
                os.remove(stale)
        written = write_gas(dest, text)
        shown = ", ".join(os.path.relpath(path, ROOT) for path in written)
        print(f"  {name} -> {shown}")
    print(f"Translated {len(FILES)} files into {os.path.relpath(OUT, ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
