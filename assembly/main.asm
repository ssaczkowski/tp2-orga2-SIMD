section .data
msg_welcome:    db     `\nInterpolating...\n`, 10, 0
p dd 2.0
v1 dd 2.0
v2 dd 2.0

section .text
extern _printf
extern _calculate_proportion

global _main


_main:

push dword msg_welcome
call _printf
add esp,4
push EBP
mov EBP, ESP

push p
push v1
push v2
call _calculate_proportion
add ESP, 12

ret