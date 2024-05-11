dosseg
.model small
.data
msg db "Please enter number from 0 - 9",10,13,"$"
msg2 db 10,13,"Valid Number .... ",10,13,"$"
msg3 db 10,13,"Eroooor .. NOT VALID " , 10,13,"$"
.code
main :
mov ax , @data
mov ds , ax

; print intro msg
mov ah,9
mov dx , offset msg
int 21h

; user will enter number
mov ah,1
int 21h

cmp al,"0"
jb error
cmp al,"9"
ja error 

 ; IF number valid
 mov ah,9
 mov dx , offset msg2
 int 21h

 jmp ex 
 error :
 mov ah,9
 mov dx , offset msg3
 int 21h

 ex:
 mov ah,4ch
 int 21h
 end main
