section .data

msg_welcome:    db     `\nInterpolating... Parameters:\n`, 10, 0
msg_quantity:    db     `\n  Quantity = %p \n`, 10, 0
msg_p:    db     `\n  p = %f \n`, 10, 0
msg_v1:    db     `\n  v1 = %p \n`, 10, 0
msg_v2:    db     `\n  v2 = %d \n`, 10, 0
msg_ptrIMGR: db     `\n  ptrIMGR = %p \n`, 10, 0
msg_ptrIMG2: db     `\n  ptrIMG2 = %p \n`, 10, 0
msg_ptrIMG1: db     `\n  ptrIMG1 = %p \n`, 10, 0
one dd 1.0
r1 dq 0.0
r2 dq 0.0
fmt db "r: %f", 10, 0
v1 dd 3.0
v2 dd 1.0
p dd 0.0


section .text

extern _printf
extern _getValue

global _interpolate


_interpolate:

push dword msg_welcome
call _printf
add esp,4

push EBP
mov EBP, ESP

;Get parameters
mov EDI, [EBP+8] ;ptrIMG1
mov ECX, [EBP+12];ptrIMG2
fld     qword [ebp + 16]
fstp    qword [p]
mov EDX, [EBP+24];ptrIMGR
mov EBX, [EBP+28];cantidad


; for debug
push dword ebx
push dword msg_quantity
call _printf
add esp,4

mov EDX, [EBP+24]
push dword EDX
push dword msg_ptrIMGR
call _printf
add esp,8

mov ECX, [EBP+12]
push dword ECX
push dword msg_ptrIMG2
call _printf
add esp,12

mov EDI,[EBP+8]
push dword [EDI]
push  EDI
push dword msg_ptrIMG1
call _printf
add esp,8



fld dword [p]
fst qword [p]
push dword [p+4]
push dword [p]
push msg_p
call _printf
add ESP, 12


;end for debug


push  EDI ;resitro con puntero
call _getValue
mov edi,eax ;el valor devuelto por la funcion lo tiene eax

push dword [edi]
push dword msg_v1
call _printf
add esp,4



jmp finalizar

calculate_proportion:

cmp ESI,0
sub ESI,1
je finalizar

push dword msg_welcome
call _printf
add esp,4

; p * v1 
fld dword [p]
fld dword [edi+ESI]
fmul


;(1-p)*v2
fld dword [one]
fld dword [p]
fsub 
fst   qword   [r1]  
fld dword [ecx+ESI]
fmul 

fadd 

fst qword [r2]
push dword [r2+4]
push dword [r2]
push fmt
call _printf

jmp calculate_proportion

finalizar:

add ESP, 32
;mov     ESP, EBP
;pop     EBP

ret