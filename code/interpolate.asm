section .data
msg_welcome:    db     `\nInterpolating... Parameters:\n`, 10, 0
msg_quantity:    db     `\n  Quantity = %d \n`, 10, 0
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

ptrProportion dd 0

section .text
extern _printf

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


; for debug
push dword EBX
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
;end for debug





mov EBX, [EBP+12];CANTIDAD
;mov ebx,[ebx]
mov eax,[ebx]
comparar:

cmp eax,0
sub eax,1
je finalizar


;*************REVISAR LOS [XXX+EAX]******

;calculate_proportion:

; p * v1 
fld dword [ESI]
fld dword [edi+eax]
fmul ; ST0 = 4.0


;(1-p)*v2
fld dword [one]
fld dword [ESI]
fsub 
fst   qword   [r1]  
fld dword [ecx+eax]
fmul ; = -2.0

fadd ; 2.0

;fst qword [r2]

;mov edx,[r2]

fst qword [r2]
push dword [r2+4]
push dword [r2]
push fmt
call _printf

;push dword [r2+4]
;push dword [r2]
;mov EDX,ESI

;fst   qword   [EDX+eax]




jmp comparar

finalizar:

push dword eax
push dword msg_quantity
call _printf
add esp,4
pop eax

; for debug

;mov edx,[edx]
push dword [r2]
push dword msg_ptrIMGR
call _printf
add esp,8


;end for debug

add ESP, 32
mov     ESP, EBP
pop     EBP

ret