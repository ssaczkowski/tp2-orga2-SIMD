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
;end for debug


mov EDX, ESI ;p 
mov EBX, v1 
mov EDI, v2 
mov ESI, ptrProportion


mov EBX, [EBP+12];CANTIDAD
mov eax,[ebx]


comparar:

cmp eax,0
sub eax,1
je finalizar

;calculate_proportion:

; p * v1 
fld dword [EDX]
fld dword [EBX]
fmul ; ST0 = 4.0


;(1-p)*v2
fld dword [one]
fld dword [EDX]
fsub 
fst   qword   [r1]  
fld dword [EDI]
fmul ; = -2.0

fadd ; 2.0



fst qword [r2]
push dword [r2+4]
push dword [r2]
mov EDX,ESI

fst   qword   [EDX]



;push fmt
;call _printf
;add ESP, 4

push dword eax
push dword msg_quantity
call _printf
add esp,4
pop eax

jmp comparar

finalizar:

push dword eax
push dword msg_quantity
call _printf
add esp,4
pop eax

add ESP, 32
mov     ESP, EBP
pop     EBP

ret