nasm -f win32 -o calculate_proportion.o calculate_proportion.asm
nasm -f win32 -o interpolate.o interpolate.asm
mingw32-gcc -Wall -o interpolate interpolate.o calculate_proportion.o
interpolate.exe