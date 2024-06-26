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


; y axis 
mov ah , 0ch
mov al , 02h ; green 
mov cx , 320
mov dx , 80
y:
int 10h
inc dx
cmp dx , 400
ja goo
jmp y

goo : 
; x axis 
mov ah , 0ch
mov al , 06h ; color => orange
mov cx , 280
mov dx , 260
repx:
int 10h
inc cx
cmp cx , 360
ja go1
jmp repx

go1 : 
; x axis 
mov ah , 0ch
mov al , 01h ; color => blue
mov cx , 240
mov dx , 180
repx1:
int 10h
inc cx
cmp cx , 400
ja goo1
jmp repx1


goo1 : 
skip : 
mov ah , 07h
int 21h

pop ax
mov ah , 00h
int 10h

mov ax, 4c00h
int 21h
end