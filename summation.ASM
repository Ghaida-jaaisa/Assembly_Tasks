dosseg
.model small
.stack 100
.data
num1 db "Enter number 1 " , 10,13,"$"
num2 db  10,13,"Enter number 2 " , 10,13,"$"
res  db 10,13,"Summation  =  ","$"

.code
main:
mov ax, @data
mov ds, ax

mov dx , offset num1
mov ah, 9
int 21h 

mov ax , 0
mov bx , 0
mov cx , 0
mov dx , 0
mov cl , 10

read1 :
mov ah , 1
int 21h
cmp al , 13
jz cont
sub al , 30h
mov dl , al
mov al , bl
mul cl
mov bx , ax
add bl ,dl
jmp read1

; bl have th e value of the first number

cont :
mov dx , offset num2
mov ah , 9
int 21h

mov ax, 0
mov dx , 0 

read2 : 
mov ah , 1
int 21h
cmp al , 13
jz start 
sub al , 30h
mov ch , al
mov al , dl
mul cl
mov dx , ax
add dl ,ch
jmp read2

; dl has the value of second number 
; bl have the value of first number 
start : 
add bl , dl    ; bl have the summation  
mov dl ,"$"
mov dh ,"$"
push dx

mov cl , bl
mov ch , 10


lp : 
mov ah ,0
mov al , cl 
div ch
mov cl , al
push ax
cmp al,0
jnz lp

; summation message

mov dx , offset res
mov ah , 9
int 21h

repeat : 
pop ax
cmp al,"$"
jz xt 
mov dl , ah
add  dl , 30h
mov ah , 2
int 21h
jmp repeat 


xt : 
mov ah ,4ch
int 21h
end main











