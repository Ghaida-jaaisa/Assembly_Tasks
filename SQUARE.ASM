dosseg
.model small
.stack 100
.data
.code
mov ax , @data 
mov ds , ax

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
mov cx , 80
mov dx , 240
again:
int 10h
inc cx
cmp cx , 560
ja go
jmp again

go :
; y axis 
mov ah , 0ch
mov al , 01h ; color => blue
mov cx , 320
mov dx , 0
bb:
int 10h
inc dx
cmp dx , 480
ja goo
jmp bb

goo : 
; right vertical line 
mov al , 01h ; color => blue
mov cx , 560
mov dx , 0
try:
int 10h
inc dx
cmp dx , 480
ja next
jmp try

next : 
; left vertical line
mov al , 01h ; color => blue
mov cx , 80
mov dx , 0
again1:
int 10h
inc dx
cmp dx , 480
ja next2
jmp again1

next2 : 
; from center to top right 
mov ah , 0ch 
mov al , 04h
mov cx , 320
mov dx , 240
repeat:
int 10h
inc cx 
dec dx 
cmp dx , 0
jl skip 
jmp repeat

skip :
;from center to top left 

mov ah , 0ch 
mov al , 07h
mov cx , 320
mov dx , 240
repeat2:
int 10h
dec cx 
dec dx

cmp dx , 0
jl q 
jmp repeat2
q:
mov ah , 07h
int 21h

pop ax
mov ah , 00h
int 10h








mov ah ,4ch
int 21h
end
