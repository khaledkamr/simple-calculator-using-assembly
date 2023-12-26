
org 100h

.data
     
m1 db 10,13, "enter the first number: $"
m2 db 10,13, "enter the second number: $"
m3 db 10,13, "enter the operator: $"
m4 db 10,13, "the result = $"
m5 db 10,13, "do you want another operation?",10,13,"if yes press 1 if no press 0",10,13, "$"
m6 db 10,13, "wrong input",10,13,"$"

.code

calc:
mov ah,09
mov dx,offset m1
int 21h       ;print "enter the first number: "

mov ah,01      
int 21h       ;get input from th user

mov bl,al     
sub bl,48

mov ah,09
mov dx,offset m2
int 21h       ;print "enter the second number: "

mov ah,01
int 21h       ;get input from th user

mov bh,al
sub bh,30h

mov ah,09
mov dx,offset m3
int 21h       ;print "enter the operator: "

mov ah,01
int 21h       ;get input from th user

cmp al,'+'
je addition

cmp al,'-'
je subtraction 

cmp al,'*'
je multiplication

cmp al,'/'
je division

addition:
mov ah,09
mov dx,offset m4
int 21h       ;print "the result = "

add bl,bh
add bl,30h

mov dl,bl  

mov ah,02
int 21h       ;print the value
jmp repeat

subtraction: 
mov ah,09
mov dx,offset m4
int 21h       ;print "the result = "

sub bl,bh
add bl,30h

mov dl,bl 

mov ah,02
int 21h       ;print the value
jmp repeat

multiplication: 
mov ah,09
mov dx,offset m4
int 21h       ;print "the result = "

mov al,bl
mul bh

mov dl,al
add dl,30h  

mov ah,02
int 21h       ;print the value
jmp repeat

division:   
mov ah,09
mov dx,offset m4
int 21h       ;print "the result = "

mov ah,00
mov al,bl
div bh 

mov dl,al
add dl,30h

mov ah,02
int 21h       ;print the value
jmp repeat

repeat:
mov ah,09
mov dx,offset m5
int 21h       ;print "do you want another operation?"
              ;      "if yes press 1 if no press 0"

mov ah,01
int 21h       ;get input from th user

cmp al,'1'
je calc

cmp al,'0'
je finish

jne wrong

wrong:
mov ah,09
mov dx,offset m6
int 21h       ;print "wrong input"
mov ah,00
int 21h

finish:
mov ah,00
int 21h

     


            