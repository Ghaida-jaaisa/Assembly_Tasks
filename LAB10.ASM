dosseg
.model small
.stack 100
.data
msg1 db "Welcome User , After graph appear enter value of m , c respectively to generate y = mx + c" , 10 , 13 ,"$"
nwl db 10,13,"$"
msg3 db 10,13,"Eroooor .. NOT VALID " , 10,13,"$"
strr db 100 dup(?)

.code
main : 
mov ax , @data
mov ds , ax


; hello msg
mov dx , offset msg1
mov ah , 9
int 21h

mov si, offset strr

; get video mode
mov ah , 0fh
int 10h
push ax

; set video mode
mov ah , 00h
mov al , 12h
int 10h

; x axis 
mov ah , 0ch
mov al , 01h ; color => blue
mov cx , 0
mov dx , 240
repx:
int 10h
inc cx
cmp cx , 480
ja go
jmp repx
;---------------------------------------------------
go :
; y axis 
mov ah , 0ch
mov al , 01h ; color => blue
mov cx , 240
mov dx , 0
y:
int 10h
inc dx
cmp dx , 480
ja goo
jmp y
;------------------------------------------
goo : 
;  right vertical line 
mov ah , 0ch
mov al , 01h ; => blue
mov cx , 480
mov dx , 0
aga :
int 10h
inc dx
cmp dx , 480
ja ex
jmp aga

ex : 
;---------------------------------------------
;left vertical line 
mov ah , 0ch
mov al , 01h ; => blue
mov cx , 0
mov dx , 0
gain :
int 10h
inc dx
cmp dx , 480
ja q
jmp gain



q: 
; write pixel 
mov ah, 0ch    ; call function
mov al , 06h ; specify color => green 
;---------------------------------------------------
; linear equation y = x 
mov dx , 480
mov cx , 0
mov ah , 0ch 
mov al , 02h
repeat : 
int 10h
inc cx 
dec dx
cmp dx , 0
jl exit 
jmp repeat
exit : 
;------------------------------------------------------------
; apply  y = a*x

; user input
mov ah , 1     ; enter value of m
int 21h;
cmp al,"0"
jb error
cmp al,"9"
ja error 
sub al , 30h  ; convert to number
mov bl , al ; save value of number 
mov  ax , 240 
div bl
mov bl , al ; bl = 240 / #


mov dx , 480
mov cx , 240

sub cl , bl   ; specify start point  ; succeful 
mov ah , 0ch 
mov al , 02h
repeat1 : 
int 10h
inc cx  ;;;; there is the core of the problem  >3
dec dx ; error : dx should dec number of times equal to number enetreed  by user 
dec dx
dec dx
dec dx
cmp dx , 0
jl contc 
jmp repeat1


;----------------------------------------------- displacment area ----------------------------------------------------------------

contc :
mov dx , offset nwl
mov ah,9
int 21h
; user input
mov ah , 1     ; enter value of c
int 21h;
cmp al,"0"
jb error
cmp al,"9"
ja error 
sub al , 30h  ; convert to number
mov bl , al ; save value of number 


;mov ax , 240   
;div bl  ; 240/# will be in al 
;mov cx , 80
;add cx , 240
;sub cl , al 
; cx = start point

mov dx , 480
mov cx , 0
mov cl , bl
mov ah , 0ch 
mov al , 06h
repeat2 : 
int 10h
inc cx 
dec dx
cmp dx , 0
jl skip 
jmp repeat2




four :
dec dx
dec dx
dec dx
dec dx
;jmp return 


skip : 
mov ah , 07h
int 21h
 
 error : 
pop ax
mov ah , 00h
int 10h


  mov ah,9
 mov dx , offset msg3
 int 21h 



mov ax, 4c00h
int 21h
end main