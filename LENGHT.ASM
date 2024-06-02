dosseg
.model small
.stack 100


.data
msg db "Enter your String :  " ,10,13,"$"
res db  10,13,"Your Length is : " , 10 , 13 , "$"



.code
main :
mov ax , @data
mov ds , ax

mov ah , 9
mov dx , offset msg
int 21h 

mov cx , 0 
read :
mov ah , 1
int 21h
cmp al , 13
jz cont 
inc cl 
jmp read 

; cl has the lengh of string 
cont:

mov ah , 9
mov dx , offset res
int 21h

mov dl , "$"
mov dh , "$"
push dx

mov bl , 10

lp :
mov ah , 0
mov al ,cl
div bl
mov cl , al
push ax
cmp al , 0
jnz lp 


repeat :
pop ax
cmp al ,"$"
jz ex
mov dl , ah
add dl , 30h
mov ah ,  2
int 21h
jmp repeat


ex:
mov ah , 4ch
int 21h
end main 












