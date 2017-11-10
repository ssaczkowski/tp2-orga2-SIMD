nasm -f win32 -o interpolate.o interpolate.asm
nasm -f win32 -o main.o main.asm
mingw32-gcc -Wall -o main main.o  interpolate.o
main.exe