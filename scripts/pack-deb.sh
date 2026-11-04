#!/usr/bin/env bash
# Pack EditForthLin into a .deb that uses the system Qt 6.
# Run this on the machine that linked the binaries.
#
#   bash build-arm64.sh && bash scripts/pack-deb.sh arm64
#   bash build-x64.sh   && bash scripts/pack-deb.sh amd64
#
# Ubuntu 24.04 and Linux Mint 22 spell the Qt libraries with a t64 suffix.
# Depends is filled from the binaries (dpkg-shlibdeps) plus the Qt platform
# plugin they dlopen. apt install downloads those packages. The .deb does
# not bundle Qt, cmake, or nasm.
set -euo pipefail

root=$(cd "$(dirname "$0")/.." && pwd)
arch_in=${1:-}
case "$arch_in" in
  arm64|aarch64)
    deb_arch=arm64
    bin_arch=arm64
    forth_name=fortharm64
    editor_name=editforthlinarm64
    ;;
  amd64|x64|x86_64)
    deb_arch=amd64
    bin_arch=x64
    forth_name=forthx64
    editor_name=editforthlinx64
    ;;
  *)
    echo "usage: bash scripts/pack-deb.sh arm64|amd64" >&2
    exit 2
    ;;
esac

forth="$root/Forth/build/$bin_arch/$forth_name"
editor="$root/Edit/build/$bin_arch/$editor_name"
if [[ ! -x $forth || ! -x $editor ]]; then
  echo "pack-deb: missing $forth or $editor" >&2
  echo "Build on this architecture first: bash build-${bin_arch}.sh" >&2
  exit 1
fi

if [[ $deb_arch == arm64 ]]; then
  version=$(sed -n 's/.*"\([0-9][0-9.]*\)".*/\1/p' "$root/Forth/kernel/arm64-linux/identity.s" | head -1)
else
  version=$(sed -n 's/.*"\([0-9][0-9.]*\)".*/\1/p' "$root/Forth/kernel/x64-linux/identity.asm" | head -1)
fi
if [[ -z $version ]]; then
  echo "pack-deb: could not read the kernel version" >&2
  exit 1
fi

os_name=unknown
if [[ -r /etc/os-release ]]; then
  # shellcheck disable=SC1091
  . /etc/os-release
  os_name=${PRETTY_NAME:-$NAME}
fi

stage=$(mktemp -d)
trap 'rm -rf "$stage"' EXIT

mkdir -p \
  "$stage/opt/editforthlin/Resources" \
  "$stage/usr/bin" \
  "$stage/usr/share/applications" \
  "$stage/usr/share/doc/editforthlin" \
  "$stage/DEBIAN"

install -m 0755 "$editor" "$stage/opt/editforthlin/$editor_name"
install -m 0755 "$forth" "$stage/opt/editforthlin/$forth_name"
tar -C "$root/Forth/Resources" \
  --exclude='System/Emitter/runner/emit-lin' \
  -cf - Library System Docs Config \
  | tar -C "$stage/opt/editforthlin/Resources" -xf -
ln -s "/opt/editforthlin/$editor_name" "$stage/usr/bin/editforthlin"
install -m 0644 "$root/packaging/editforthlin.desktop" \
  "$stage/usr/share/applications/editforthlin.desktop"

cat > "$stage/usr/share/doc/editforthlin/copyright" << EOF
EditForthLin ${version}
Public domain, same spirit as the other EditForth trees.
EOF

# Libraries the binaries link, plus the Qt platform plugin they dlopen.
# apt install of the .deb downloads every name in Depends. dpkg -i does not.
depends=""
probe=$(mktemp -d)
mkdir -p "$probe/debian"
cat > "$probe/debian/control" << EOF
Source: editforthlin
Section: devel

Package: editforthlin
Architecture: ${deb_arch}
Description: probe
EOF
shlibs=$(cd "$probe" && dpkg-shlibdeps -O "$editor" "$forth" 2>/dev/null || true)
rm -rf "$probe"
depends=${shlibs#shlibs:Depends=}
depends=${depends//$'\n'/}
if [[ -z $depends ]]; then
  depends="libc6, libgcc-s1, libstdc++6, libqt6core6t64, libqt6gui6t64, libqt6network6t64, libqt6widgets6t64"
fi
add_dep() {
  local name=$1
  local padded=", ${depends},"
  if [[ $padded == *", ${name},"* || $padded == *", ${name} ("* ]]; then
    return
  fi
  depends="${depends}, ${name}"
}
add_dep qt6-qpa-plugins
add_dep libgl1
add_dep libxkbcommon0

installed_kb=$(du -sk "$stage" | awk '{print $1}')
cat > "$stage/DEBIAN/control" << EOF
Package: editforthlin
Version: ${version}
Section: devel
Priority: optional
Architecture: ${deb_arch}
Maintainer: Tom Zimmer <win32forth@mac.com>
Installed-Size: ${installed_kb}
Depends: ${depends}
Homepage: https://github.com/Win32Forth/EditForthLin
Description: EditForthLin Forth editor
 EditForthLin is a Qt 6 editor and a companion Forth engine.
 This ${deb_arch} package was built on ${os_name} for Ubuntu 24.04
 and Linux Mint 22. apt install downloads the libraries in Depends,
 including Qt 6 and the Qt platform plugin. dpkg -i does not.
 The package does not include cmake, nasm, or the other build tools.
 User Forth files stay in ~/Documents/EditForthLin and are copied
 there on the first run.
EOF

out_dir="$root/Releases"
mkdir -p "$out_dir"
out="$out_dir/editforthlin_${version}_${deb_arch}.deb"
rm -f "$out"
dpkg-deb --root-owner-group -Zxz --build "$stage" "$out"
echo "Built: $out"
