section .data
p dd 2.0
v1 dd 2.0
v2 dd 2.0
one dd 1.0
r1 dq 0.0
r2 dq 0.0
fmt db "r: %f", 10, 0

section .text
extern _printf

global _main


; r = p*v1 + (1-p)*v2
_main:

; p * v1 
fld dword [p]
fld dword [v1]
fmul ; ST0 = 4.0

;(1-p)*v2
fld dword [one]
fld dword [p]
fsub 
fst   qword   [r1]  
fld dword [v2]
fmul ; = -2.0

fadd ; 2.0

fst qword [r2]
push dword [r2+4]
push dword [r2]
push fmt
call _printf
add ESP, 12

ret