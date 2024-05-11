dosseg
.model small
.data
msg db  "please enter character from a->z " , "$"
er db "Not a character .. try again ","$"
nwl db 10,13,"$"
.code
main :
mov ax,@data
mov ds,ax
; hello msg
mov ah,9
mov dx,offset msg
int 21h

;enter character
mov ah,1
int 21h

cmp al,"a"
jb error
cmp al, "z"
ja error

; valid character
;character now in al
mov ah,9
mov dx , offset nwl
int 21h

repeat:
mov dl,al
mov ah,2
int 21h
cmp al,"z"
je ex
inc al ; to move to the next characte

jmp repeat

error :
mov ah,9
mov dx,offset er
int 21h

ex:
mov ah,4ch
int 21h
end main
