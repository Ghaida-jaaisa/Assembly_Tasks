dosseg
.model small
.data
msg db "Enter multi-digit number ",10,13,"$"



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
jz quit
sub al,30h   ; al has the number 
mov dl,al  ; has the value of number
mov al,bl
mul cl  ; mul al * cl
mov bx , ax
add bl , dl
jmp read





 quit : 
mov ah,4ch
int 21h
end main
