dosseg
.model small
.data
msg db "Please enter number ","$"
msg2 db "please enter character to print " ,"$"
nwl db 10,13,"$"

.code
main :
mov ax,@data
mov ds,ax

mov dx, offset msg
mov ah,9  ; hello msg 
int 21h


mov ah,1 ; enter number
int 21h

 sub al , 30h ; convert to number
cmp al , 0
jz xt

mov ch,0
mov cl,al

mov ah,9
mov dx,offset nwl
int 21h
; enter char msg
mov ah,9
mov dx,offset msg2
int 21h

; user enter character 
mov ah,1;
int 21h

mov dl,al ; to store value of char
 
;mov al, bl

lpp:
mov ah,2
int 21h
loop lpp


xt :
mov ah,4ch
int 21h
end main
