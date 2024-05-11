dosseg
.model small
.data
msg db " enter group of charachters ",10,13,"$"
strr db 100 dup(?)
msg2 db 10,13,"number of repeatuion of character a : ","$"

 .code
main :
mov ax ,@data
mov ds,ax

; hello msg
mov dx , offset msg
mov ah,9
int 21h

mov si, offset strr

mov cl , 0 ;  to count repeation of "a"

read:
mov ah,1 ; enter character
int 21h
cmp al,13 ; character!= enter
jz ex
cmp al,"a" ; check if character == "a"
jz correct
cont:
mov [si],al
inc si
jmp read
correct :
inc cl
jmp cont

ex:
add cl,30h
mov dx, offset msg2
mov ah,9
int 21h

mov dl,cl
mov ah,2
int 21h



mov ah,4ch
int 21h
end main









final :
mov ah,4ch
int 21h
end main










