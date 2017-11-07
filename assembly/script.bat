nasm -f win32 -o _area_circulo.o _area_circulo.asm
mingw32-gcc -Wall -o _main _area_circulo.o
_main.exe