/* Public domain.
   Executable pages for ALLOCATE-EXEC, FREE-EXEC, MPROTECT, and ICACHE-INVAL.
   Prot bits match the Mac kernel: 1=read, 2=write, 4=execute.
   ALLOCATE-EXEC memory starts read/write. MPROTECT 5 makes it read/execute.
   JIT-WPROTECT does not switch pages. */

#include <stdint.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

static unsigned long long host_page(void)
{
    long page = sysconf(_SC_PAGESIZE);
    if (page <= 0)
        page = 4096;
    return (unsigned long long)page;
}

static int host_posix_prot(long long prot)
{
    int p = PROT_NONE;
    if (prot & 1)
        p |= PROT_READ;
    if (prot & 2)
        p |= PROT_WRITE;
    if (prot & 4)
        p |= PROT_EXEC;
    return p;
}

long long host_alloc_exec(unsigned long long n, void **out)
{
    unsigned long long page;
    unsigned long long mask;
    void *ptr;

    if (out != NULL)
        *out = NULL;
    page = host_page();
    if (n == 0)
        n = page;
    mask = page - 1;
    n = (n + mask) & ~mask;
    ptr = mmap(NULL, (size_t)n, PROT_READ | PROT_WRITE,
               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (ptr == MAP_FAILED)
        return -1;
    if (out != NULL)
        *out = ptr;
    return 0;
}

long long host_free_exec(void *addr, unsigned long long n)
{
    unsigned long long page;
    unsigned long long mask;

    if (addr == NULL)
        return 0;
    page = host_page();
    mask = page - 1;
    if (n == 0)
        n = page;
    n = (n + mask) & ~mask;
    if (munmap(addr, (size_t)n) != 0)
        return -1;
    return 0;
}

long long host_mprotect(void *addr, unsigned long long n, long long prot)
{
    unsigned long long page;
    unsigned long long mask;
    unsigned long long base;
    unsigned long long end;

    if (addr == NULL)
        return -1;
    page = host_page();
    mask = page - 1;
    base = (unsigned long long)(uintptr_t)addr & ~mask;
    end = (unsigned long long)(uintptr_t)addr + n;
    end = (end + mask) & ~mask;
    if (end <= base)
        end = base + page;
    if (mprotect((void *)(uintptr_t)base, (size_t)(end - base),
                 host_posix_prot(prot)) != 0)
        return -1;
    return 0;
}

void host_icache_inval(void *addr, unsigned long long n)
{
    if (addr == NULL || n == 0)
        return;
#if defined(__GNUC__) || defined(__clang__)
    __builtin___clear_cache((char *)addr, (char *)addr + n);
#else
    (void)addr;
    (void)n;
#endif
}

/* Leaf that returns 7. x64 is mov eax,7; ret. */
long long host_native_ret7(void *addr)
{
    if (addr == NULL)
        return -1;
#if defined(__x86_64__) || defined(_M_X64)
    {
        static const unsigned char code[] = { 0xB8, 0x07, 0x00, 0x00, 0x00, 0xC3 };
        memcpy(addr, code, sizeof code);
        return (long long)sizeof code;
    }
#elif defined(__aarch64__)
    {
        unsigned int code[2];
        code[0] = 0xD28000E0u;
        code[1] = 0xD65F03C0u;
        memcpy(addr, code, sizeof code);
        return (long long)sizeof code;
    }
#else
    (void)addr;
    return -1;
#endif
}
