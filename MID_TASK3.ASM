dosseg
.model small
.data
msg db "Please Enter a Group of small characters ",10,13,"$"
strr db 100 dup(?)
nv db 10,13,"You Enter invalid Character ",10,13,"$"

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
cmp al,"a"
jb nvalid
cmp al, "z"
ja nvalid 
mov [si],al
inc si
jmp read

 nvalid :
  mov dx , offset nv
  mov ah,9
  int 21h

ex: 
mov ah,4ch
int 21h
end main 
