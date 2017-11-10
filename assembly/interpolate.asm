section .data
msg_welcome:    db     `\nInterpolating... Parameters:\n`, 10, 0
msg_quantity:    db     `\n  Quantity = %d \n`, 10, 0
msg_p:    db     `\n  p = %f \n`, 10, 0
msg_v1:    db     `\n  v1 = %f \n`, 10, 0
msg_v2:    db     `\n  v2 = %f \n`, 10, 0
msg_ptrIMGR: db     `\n  ptrIMGR = %p \n`, 10, 0
msg_ptrIMG2: db     `\n  ptrIMG2 = %p \n`, 10, 0
msg_ptrIMG1: db     `\n  ptrIMG1 = %p \n`, 10, 0

;p dd 2.0
v1 dd 7.0
v2 dd 6.0
;ptrIMG1 dd 0
;ptrIMG2 dd 0
;ptrIMGR dd 0
;CANTIDAD dd 4

ptrProportion dd 0

section .text
extern _printf
extern _calculate_proportion

global _interpolate


_interpolate:

push dword msg_welcome
call _printf
add esp,4
push EBP
mov EBP, ESP


mov EDX, [EBP+8] ;ptrIMGR
mov EBX, [EBP+12];CANTIDAD
mov ESI, [EBP+16];p
mov ECX, [EBP+24];ptrIMG2
mov EDI, [EBP+28];ptrIMG1


push dword [EBX]
push dword msg_quantity
call _printf
add esp,8

sub esp,8   
fld dword [ESI] 
fstp qword [esp]  
push msg_p
call _printf
add esp, 12

push dword [EDX]
push dword msg_ptrIMGR
call _printf
add esp,8

push dword [ECX]
push dword msg_ptrIMG2
call _printf
add esp,8

push dword [EDI]
push dword msg_ptrIMG1
call _printf
add esp,8

;fld dword [EBX]
;push v1
;push v2
;push ptrProportion
;call _calculate_proportion

add ESP, 32

ret