nasm -f win32 -o interpolate.o interpolate.asm
mingw32-gcc -Wall -o main interpolate.o images.c
main.exe