
echo Compiling C-code...

gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -mtune=prescott -Ilib_tomcrypt/headers -Ilib_tomcrypt/math/tommath -c ./unix/sys_unix.c
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -mtune=prescott -Ilib_tomcrypt/headers -Ilib_tomcrypt/math/tommath -c ./unix/sys_linux.c
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -mtune=prescott -Ilib_tomcrypt/headers -Ilib_tomcrypt/math/tommath -c ./unix/elf32_parser.c
gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -mtune=prescott -Ilib_tomcrypt/headers -Ilib_tomcrypt/math/tommath -c ./unix/sys_cod4linker_linux.c

gcc -m32 -Wall -O0 -g -fno-omit-frame-pointer -D PUNKBUSTER -mtune=prescott -Ilib_tomcrypt/headers -Ilib_tomcrypt/math/tommath -c *.c

echo Compiling NASM...

nasm -f elf qcommon_hooks.asm
nasm -f elf cmd_hooks.asm
nasm -f elf filesystem_hooks.asm
nasm -f elf punkbuster_hooks.asm
nasm -f elf xassets_hooks.asm
nasm -f elf trace_hooks.asm
nasm -f elf misc_hooks.asm
nasm -f elf scr_vm_hooks.asm
nasm -f elf g_sv_hooks.asm
nasm -f elf server_hooks.asm
nasm -f elf msg_hooks.asm

echo Linking...
gcc -m32 -rdynamic -Wl,-ldl,-lpthread,-lm,-lstdc++,-Tlinkerscript.ld,--dynamic-list=pluginExports.ld -o cod4x17a_dedrun *.o -L./ -ltomcrypt_linux -ltommath_linux

rm *.o

./version_make_progress.sh
