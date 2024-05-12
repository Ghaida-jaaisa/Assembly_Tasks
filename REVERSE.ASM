dosseg
.model small
.data
msg db "Enter you string  : " ,10,13,"$"       
msg2 db 10,13,"Your reverse string is : ",10,13,"$"
strr db 100 dup(?)
.code
main:
mov ax , @data
mov ds , ax

mov cx , 0 ;
 ; hello msg
 mov dx , offset msg
 mov ah,9
int 21h

mov si , offset strr

; recieve data
repeat :
mov ah,1
int 21h
cmp al,13
jz ex 
mov [si] ,al
inc si
inc cx
jmp repeat


ex:
mov dx , offset msg2
mov ah,9
int 21h

print :
dec si
mov dl,[si]
mov ah,2
int 21h
loop print


mov ah,4ch
int 21h
end main
