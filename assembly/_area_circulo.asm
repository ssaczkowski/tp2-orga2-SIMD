section .data
radio dd 10.0
area dq 0.0
fmt db "area: %f", 10, 0

section .text
extern _printf

global _main

_main:

fld dword [radio]
fmul st0, st0
fldpi
fmul
fst qword [area]
push dword [area+4]
push dword [area]
push fmt
call _printf
add ESP, 12

ret