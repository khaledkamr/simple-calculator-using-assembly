
org 100h

.data

m1 db "enter the first number: $"
m2 db 10,13, "enter the second number: $"
m3 db 10,13, "the result = $"

.code

mov ah,09
mov dx,offset m1      
int 21h

mov ah,01
int 21h

mov bl,al
sub bl,48

mov ah,09
mov dx,offset m2
int 21h 

mov ah,01
int 21h

mov bh,al
sub bh,48 

mov ah,09
mov dx,offset m3
int 21h 

add bh,bl ;bh = bl + bh
add bh,30h                    

mov dl,bh

mov ah,02 
int 21h 
