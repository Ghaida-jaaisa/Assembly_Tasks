dosseg
.model small
.data
msg db "please press a small character ", 10,13,"$"
msg2 db 10,13, "The capital letter of your key is  : ", "$"
msg3 db 10,13,"Error !! ","$"
.code
main :
mov ax , @data
mov ds , ax

mov ah,9 ; print intro message 
mov dx , offset msg
int 21h

mov ah , 1 ; user enter small letter 
int 21h
          ; we need to make sure that letter in range
cmp al,"a"
jb ex
cmp al ,"z"
ja ex

sub al,20h ; convert small letter to capital
mov cl,al  ; to avoid some problem

mov ah,9
mov dx , offset msg2 ; print msg2 
int 21h

mov ah,2  ; Function to print letter 
mov dl,cl ;print Capital letter
int 21h
jmp qt 
 ex :
 mov ah,9
 mov dx , offset msg3
 int 21h

 qt : 
mov ah,4ch
int 21h
end main




