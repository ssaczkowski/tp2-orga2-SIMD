section .data
msg_welcome:    db     `\nInterpolating... Parameters:\n`, 10, 0
msg_quantity:    db     `\n  Quantity = %d \n`, 10, 0
msg_p:    db     `\n  p = %f \n`, 10, 0
msg_v1:    db     `\n  v1 = %f \n`, 10, 0
msg_v2:    db     `\n  v2 = %f \n`, 10, 0

p dd 2.0
v1 dd 7.0
v2 dd 6.0
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


mov EDX, [EBP+8] ;p
mov EBX, [EBP+12];v1
mov EAX, [EBP+16];v2
mov ESI, [EBP+24];ptrProportion


push dword [CANTIDAD]
push dword msg_quantity
call _printf
add esp,8

sub esp,8  
mov ebx,p
fld dword [ebx]   
fstp qword [esp]  
push msg_p
call _printf
add esp, 12

sub esp,8 
mov ebx,v1
fld dword [ebx]  
fstp qword [esp]  
push msg_v1
call _printf
add esp, 12


sub esp,8  
mov ebx,v2
fld dword [ebx]   
fstp qword [esp]  
push msg_v2
call _printf
add esp, 12


push p
push v1
push v2
push ptrProportion
call _calculate_proportion

add ESP, 20

ret