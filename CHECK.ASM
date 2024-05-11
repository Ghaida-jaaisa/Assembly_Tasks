dosseg
.model small
.data
msg db " Enter Number any from 0 to 9",10,13,"$"
msg1 db 10,13,"Number is EVEN","$"
msg2 db 10,13,"Number is ODD ","$"
msg3 db 10,13,"Erooor .. not a number ","$"

.code
main :
mov ax , @data
mov ds , ax

;
mov ah,9
mov dx , offset msg
int 21h

;enter number
mov ah,1
int 21h

cmp al,"0"
jb error
cmp al,"9"
ja error

;Number Valid
;Number now is in al
;mov bl,2
;mov ah,0
;div bl ; if number even ah will be zero otherwise not
 and al,1
 cmp al,0 
jz even1
jmp odd
even1:
mov ah,9
mov dx , offset msg1
int 21h
jmp ex
odd:
mov ah,9
mov dx,offset msg2
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
