section .data
msg_welcome:    db     `\nInterpolating...\n`, 10, 0
msg_quantity:    db     `\n Quantity %d \n`, 10, 0
msg_p:    db     `\n p %f `, 10, 0
p dd 2.0
v1 dd 2.0
v2 dd 2.0
ptrIMG1 dd 0
ptrIMG2 dd 0
ptrIMGR dd 0
CANTIDAD dd 4

ptrProportion dd 0

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

push dword [CANTIDAD]
push dword msg_quantity
call _printf
add esp,8

push dword [p]
push dword msg_p
call _printf
add esp,8

push p
push v1
push v2
push ptrProportion
call _calculate_proportion

add ESP, 20

ret