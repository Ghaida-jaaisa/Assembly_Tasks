dosseg
.model small
.data
strr db "Enter your password",10,13,"$"
noc db 10,13,"Your Password is InCorrect" , 10,13,"$"
cor db 10,13,"Your Password is Correct",10,13,"$"
user db 100 dup(?)
pass db "GHAIDA","$"



.code
main :
mov ax, @data
mov ds ,ax

;hello msg
mov dx,offset strr
mov ah,9
int 21h

mov cx , 0
mov si,offset pass
cal :   ; know the size of stored string 
mov al,[si]
cmp al,'$'
jz start
inc cl
inc si
jmp cal 
; now cx has the lenght 


start : 
mov si,offset user

read:
mov ah,7
int 21h
cmp al,13
jz check
mov dl,'*'
mov [si],al
inc si
mov ah,2
int 21h
jmp read

check:
mov si,offset user
mov di,offset pass

compare: 
mov dl , [si]
mov dh , [di]
cmp dl,dh
jnz er
inc si
inc di
loop compare



; you are here , your pass in correct
mov dx , offset cor
mov ah,9
int 21h
jmp q

 er:
mov dx,offset noc
mov ah,9
int 21h

q:
mov ah,4ch
int 21h
end main
