.MODEL SMALL
.STACK 64
.DATA

str1 db 100 
str2 db 100 
str3 db ?

.CODE

mov ax,@data
mov ds,ax

mov cl,0


mov si,offset str1
mov di,offset str3



l1:


mov ah,1
int 21h 
 
mov si,offset str1

cmp al,'#'
je print1 


sub ax,30h
mov [si],al

    
mov [di],al   
;;;;;;;;;;;;;;;;;;;;;;;;;; lodsb بتنقل محتويات si على al  
;;;;;;;;;;;;;;;;;;;;;;;;;; movs بنقل المكان الي بتاشر عليه (si)--->الى المكان الي بتاشر عليه (di)
;;;;;;;;;;;;;;;;;;;;;;;;;; stosb copy from al to [di]

add ax,30h
cmp al,'-'
je l2
inc si
inc di
inc cl
cmp cl,100
jae logout

jne l1
movsb
mov cl,0
l2:

mov ah,1
int 21h

     
     
mov si,offset str2
cmp al,'#'
je print1 

sub ax,30h
mov [si],al


 
mov [di],al

    







add ax,30h 
cmp al,'_'
je print

inc si
inc di
inc cl
cmp cl,100
jae logout
     
jne l2
    
    
    
    
    
    
print1: 
mov dl,al
mov ah,2
int 21h
.exit


   
   ;;;;;;;;;;;;;;;;;;;;;;;;;; lodsb بتنقل محتويات si على al  
;;;;;;;;;;;;;;;;;;;;;;;;;; movs بنقل المكان الي بتاشر عليه (si)--->الى المكان الي بتاشر عليه (di)
;;;;;;;;;;;;;;;;;;;;;;;;;; stosb copy from al to [di]
   
   
   
   

print:
lea si,str3
 STOSB


Rloop:

LODSB
mov dL,al
add dx,30h                                      
cld 
mov ah,2 
int 21h          
   
loop Rloop

logout:
mov ah,4ch
int 21



.exit


END   


