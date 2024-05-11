dosseg
.model small
.data
msg db "Hello , Ghaida ...! " , "$"
.code
main :
mov ax , @data
mov ds , ax

mov ah,9 ; 9-> printing strings
mov dx , offset msg
int 21h

mov ah, 4ch
int 21h
end main

