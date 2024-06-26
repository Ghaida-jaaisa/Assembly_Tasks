dosseg
.model small
.stack 100
.data
.code

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
; user input
mov ah , 1 
int 21h;
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
repeat1 : 
int 10h
inc cx 
dec dx
cmp dx , 0
jl skip 
jmp repeat1




skip : 
mov ah , 07h
int 21h

pop ax
mov ah , 00h
int 10h

mov ax, 4c00h
int 21h
end
