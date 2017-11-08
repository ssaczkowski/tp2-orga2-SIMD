nasm -f win32 -o calculate_proportion.o calculate_proportion.asm
nasm -f win32 -o main.o main.asm
mingw32-gcc -Wall -o main main.o calculate_proportion.o
main.exe