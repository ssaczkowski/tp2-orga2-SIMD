section .data
msg_welcome:    db     `\nCalculating proportion...\n`, 10, 0
;p dd 2.0
;v1 dd 2.0
;v2 dd 2.0
one dd 1.0
r1 dq 0.0
r2 dq 0.0
fmt db "r: %f", 10, 0

section .text
extern _printf

global _calculate_proportion


; r = p*v1 + (1-p)*v2
_calculate_proportion:

push dword msg_welcome
call _printf
add esp,4
push EBP
mov EBP, ESP

mov EDX, [EBP+8] ;p
mov EBX, [EBP+12];v1
mov EAX, [EBP+16];v2

; p * v1 
fld dword [EDX]
fld dword [EBX]
fmul ; ST0 = 4.0

;(1-p)*v2
fld dword [one]
fld dword [EDX]
fsub 
fst   qword   [r1]  
fld dword [EAX]
fmul ; = -2.0

fadd ; 2.0

fst qword [r2]
push dword [r2+4]
push dword [r2]
push fmt
call _printf
add ESP, 12


ret