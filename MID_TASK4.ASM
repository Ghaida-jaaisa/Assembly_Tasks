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
mov bx, 0
read :
mov ah,1  ;enter character 
int 21h
cmp al,13
jz start
cmp al,"a"
jb nvalid
cmp al, "z"
ja nvalid 
mov [si],al
inc si
inc bl
jmp read


start :
; now strr has all small letters 
mov si, offset strr

capital :
mov al,[si]
cmp bl , 0
jz ex
sub al,32 ; convert to capital
mov dl,al
mov ah,2
int 21h
inc si
dec bl
jmp capital

  nvalid :
  mov dx , offset nv
  mov ah,9
  int 21h

ex: 
mov ah,4ch
int 21h
end main 
