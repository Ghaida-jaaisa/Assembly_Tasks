dosseg
.model small
.data
msg db "Enter multi-digit number ",10,13,"$"
cor db 10,13,"Number is divisble by 13",10,13,"$"
noc db 10,13,"Number is not divisible by 13 " , 10,13,"$"



.code
main:
mov ax , @data
mov ds , ax

mov dx, offset msg
mov ah,9
int 21h

mov bx , 0
mov cl , 10
mov ax,0
mov dx,0

read :
mov ah,1
int 21h 
cmp al,13
jz start
sub al,30h   ; al has the number 
mov dl,al  ; has the value of number
mov al,bl
mul cl  ; mul al * cl
mov bx , ax
add bl , dl
jmp read


start :
mov ax ,bx
mov dl,13
div dl
cmp ah , 0
jz corr
jmp norr 

corr :
mov dx , offset cor 
mov ah,9
int 21h
jmp quit 

norr :
mov dx , offset noc
mov ah,9
int 21h

 quit : 
mov ah,4ch
int 21h
end main
