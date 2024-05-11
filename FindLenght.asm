dosseg
.model small
.data
msg db "Please enter a group of characters",10,13,"$"
strr db 100 dup(?)
msg2 db 10,13,"The length of your string is : " ,"$"
msg3 db 10,13,"Lenght more than 9 characters","$"

.code
main :
mov ax ,@data
mov ds,ax

;hello msg
mov dx , offset msg
mov ah,9
int 21h

mov si, offset strr
mov bl,0 ; to save lenght of string

read :
mov ah,1
int 21h
cmp al,13
jz ex
mov [si],al
inc si
inc bl
jmp read

ex:
cmp bl,0
jb over
cmp bl,9
ja over

 mov ah,9
 mov dx , offset msg2
 int 21h


 add bl,30h
 mov dl,bl
 mov ah,2 ; print lenght 
 int 21h
 jmp final

over :
mov dx , offset msg3
mov ah,9
int 21h

final :
mov ah,4ch
int 21h
end main
