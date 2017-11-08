nasm -f win32 -o _calculate_proportion.o _calculate_proportion.asm
mingw32-gcc -Wall -o _main _calculate_proportion.o
_main.exe