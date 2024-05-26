dosseg
.model small
.data
;strr db "Enter your password",10,13,"$"
MSG1 db 10,13,"WELCOME" , 10,13,"$"
msg2 db 10,13,"WELCOME",10,13,"$"
ma db 10,13,"Correct",10,13,"$"
no db 10,13,"No Match",10,13,"$"
user db 100 dup(?)


.code
main :
mov ax, @data
mov ds ,ax


mov cx , 0
mov si,offset msg1
cal :   ; know the size of stored string 
mov al,[si]
cmp al,'$'
jz start
inc cl
inc si
jmp cal 
; now cx has the lenght 


start : 
mov si,offset msg1
mov di , offset msg2



check: 
mov dl , [si]
mov dh , [di]
cmp dl,dh
jnz er
inc si
inc di
loop check 
 

; you are here , your pass in correct
mov dx , offset ma
mov ah,9
int 21h
jmp q


er:
mov dx , offset no
mov ah,9
int 21h

    
   q:
mov ah,4ch
int 21h
end main
