dosseg
.model small
.data
msg db "Please Enter a String ",10,13,"$"
strr db 100 dup(?)


.code
main:
mov ax , @data
mov ds,ax

;hello 
mov dx , offset msg
mov ah,9
int 21h

mov si , offset strr

read :
mov ah,1  ;enter character 
int 21h
cmp al,13
jz ex
mov [si],al
inc si
jmp read


ex: 
mov ah,4ch
int 21h
end main 
