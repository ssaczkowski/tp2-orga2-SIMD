section .data

msg_welcome:    db     `\nInterpolating... Parameters:\n`, 10, 0
msg_quantity:    db     `\n  Quantity = %p \n`, 10, 0
msg_p:    db     `\n  p = %f \n`, 10, 0

msg_ptrIMGR: db     `\n  ptrIMGR = %p \n`, 10, 0
msg_ptrIMG2: db     `\n  ptrIMG2 = %p \n`, 10, 0
msg_ptrIMG1: db     `\n  ptrIMG1 = %p \n`, 10, 0

msg_proof: db     `\n  proof = %d \n`, 10, 0

one dd 1.0
r1 dq 0.0
r2 dq 0.0
fmt db "r: %f", 10, 0

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
mov EBX, [EBP+12];ptrIMG2
fld     qword [ebp + 16]
fstp    qword [p]
mov EDX, [EBP+24];ptrIMGR
mov ECX, [EBP+28];quantity

; for debug
push dword ECX
push dword msg_quantity
call _printf
add esp,4
pop  dword ECX


mov EDX, [EBP+24]
push dword [EDX]
push dword EDX
push dword msg_ptrIMGR
call _printf
add esp,8

mov EBX, [EBP+12]
push dword [EBX]
push dword EBX
push dword msg_ptrIMG2
call _printf
add esp,12

mov EDI,[EBP+8]
push dword [EDI]
push dword EDI
push dword msg_ptrIMG1
call _printf
add esp,12

fld dword [p]
fst qword [p]
push dword [p+4]
push dword [p]
push msg_p
call _printf
add ESP, 12
;end for debug



calculate_proportion:

mov ECX, [EBP+28];get quantity

push dword ECX
push dword msg_quantity
call _printf
add esp,4
pop  dword ECX

cmp ECX,0
je finalizar

sub ECX,1

push dword ECX
push dword msg_quantity
call _printf
add esp,4
pop  dword ECX


push 0
push  EDI 
call _getValue
mov EDI,EAX 
add esp,8


push 0
push  EBX 
call _getValue
mov EBX,EAX 
add esp,8


; p * v1 
fld dword [p]
fld dword [EDI]
fmul



;(1-p)*v2
fld dword [one]
fld dword [p]
fsub 
fst   qword   [r1]  
fld dword [EBX]
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


ret