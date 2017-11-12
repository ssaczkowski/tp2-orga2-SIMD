section .data

msg_welcome:    db     `\nInterpolating... Parameters:\n`, 10, 0
msg_quantity:    db     `\n  Quantity = %p \n`, 10, 0
msg_p:    db     `\n  p = %f \n`, 10, 0
msg_v1:    db     `\n  v1 = %f \n`, 10, 0
msg_v2:    db     `\n  v2 = %f \n`, 10, 0
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
mov EBX, [EBP+28];cantida


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
add esp,8

push dword EDI
push dword msg_ptrIMG1
call _printf
add esp,8


fld dword [p]
fst qword [p]
push dword [p+4]
push dword [p]
push fmt
call _printf
add ESP, 12

;end for debug


mov EBX, [EBP+12];CANTIDAD
mov eax,[ebx]

calculate_proportion:

cmp eax,0
sub eax,1
je finalizar


; p * v1 
fld dword [p]
fld dword [edi+eax]
fmul


;(1-p)*v2
fld dword [one]
fld dword [p]
fsub 
fst   qword   [r1]  
fld dword [ecx+eax]
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