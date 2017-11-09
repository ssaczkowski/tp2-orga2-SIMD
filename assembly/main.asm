section .data
msg_welcome:    db     `\nMAIN\n`, 10, 0

CANTIDAD dd 4
p dd 2.0
ptrIMGR dd 0
ptrIMG2 dd 0
ptrIMG1 dd 0


section .text
extern _printf
extern _interpolate

global _main

_main:

push dword msg_welcome
call _printf
add esp,4
push EBP
mov EBP, ESP

push p
push CANTIDAD
push ptrIMGR
;push ptrIMG2
;push ptrIMG1
call _interpolate
add ESP, 16

ret