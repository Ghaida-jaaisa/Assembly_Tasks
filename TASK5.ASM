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
cmp al,20h
jz special
 cmp al,"a"
jb nvalid
cmp al, "z"
ja nvalid
special : 
mov [si],al
inc si
inc bl
jmp read


start :

; now strr has all small letters
; bl has the lenght of string;

mov si, offset strr
mov bh,0 ; this to check if pervious char was space or not
mov cl,bl
capital :
mov al,[si]
cmp cl , bl  ; ture just when pointer in first character in string
jz yes ; lets capitalize this charachter
cmp bl , 0 ; 
jz ex    ; you finish visiting all characters
mov bh , [si-1]
cmp bh , 20h ; if this character == space
jz yes
jmp cont
yes :
sub al,32 ; convert to capital
jmp cont 
; multishared section
cont:
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
