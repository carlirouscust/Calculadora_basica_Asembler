.model small
.stack 100h
.data
    ; Mensajes mostrados al usuario
    msg_Menu db 10, 13, '--------Menu--------', 10, 13, '$'
    msg_Suma db '   1. Suma $'
    msg_Resta db 10,13,'   2. Resta $'
    msg_Multiplicacion db 10,13,'   3. Multiplicacion $'
    msg_Division db 10,13,'   4. Division $'
    msg_Salir db 10,13,'   5. Salir $'
    msg_Opcion db 10,13,'   Seleccione: $'
    msg_PrimerNumero db 10,13,10,13,'Ingrese el primer numero: $'
    msg_SegundoNumero db 10,13,'Ingrese el segundo numero: $'
    msg_Resultado db 10,13,10,13,'El resultado es: $'
    msg_Cerrar db 10,13,10,13,'Finalizado $' 
    msg_Continuar db 10,13,10,13,'Presione una tecla para continuar $'

    
    numero1 db ?
    numero2 db ?
    resultado db ? 
    seleccion  db ?

.code
mov ax, @data
mov ds, ax

; Etiqueta para mostrar el menú
menu:
    
    lea dx, msg_Menu
    mov ah, 9
    int 21h

    ; Mostrar las opciones
    lea dx, msg_Suma
    mov ah, 9
    int 21h

    lea dx, msg_Resta 
    mov ah, 9
    int 21h

    lea dx, msg_Multiplicacion
    mov ah, 9
    int 21h

    lea dx, msg_Division 
    mov ah, 9
    int 21h

    lea dx, msg_Salir 
    mov ah, 9
    int 21h

    
    lea dx, msg_Opcion 
    mov ah, 9
    int 21h

    
    mov ah, 1
    int 21h
    sub al, 48
    mov seleccion, al

; Comparar la seleccion
cmp seleccion, 1
je Op_Suma

cmp seleccion, 2
je Op_Resta

cmp seleccion, 3
je Op_Multiplicacion

cmp seleccion, 4
je Op_Division

cmp seleccion, 5
je exit_p

; Sección para la operación de suma
Op_Suma:
    
    lea dx, msg_PrimerNumero 
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov numero1, al

    
    lea dx, msg_SegundoNumero 
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h 
    sub al, 48
    mov numero2, al

    
    mov al,numero1
    add al, numero2
    mov ah, 0
    aaa

    ; Convertir y mostrar el resultado
    mov bx, ax
    add bh, 48
    add bl, 48 
    add numero1, 48
    add numero2, 48

    lea dx, msg_Resultado 
    mov ah, 9
    int 21h
    
    mov ah, 2  
    mov dl, numero1
    int 21h 
    
    mov ah, 2  
    mov dl, '+'
    int 21h
    
    mov ah, 2  
    mov dl, numero2
    int 21h 
    
    mov ah, 2  
    mov dl, '='
    int 21h 
    
    mov ah, 2
    mov dl, bh
    int 21h 
    
    mov ah, 2
    mov dl, bl
    int 21h  
    
    jmp regresar


Op_Resta:
    
    lea dx, msg_PrimerNumero 
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov numero1, al

    
    lea dx, msg_SegundoNumero 
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h 
    sub al, 48
    mov numero2, al
     
    
    mov al,numero1
    sub al,numero2 
    mov ah, 0
    aaa
    
    
    mov bx, ax
    add bh, 48
    add bl, 48 
    
    lea dx, msg_Resultado
    mov ah, 9
    int 21h

    
    mov ah, 2  
    mov dl, numero1
    int 21h 
    
    mov ah, 2  
    mov dl, '-'
    int 21h
    
    mov ah, 2  
    mov dl, numero2
    int 21h 
    
    mov ah, 2  
    mov dl, '='
    int 21h 
    
    mov ah, 2
    mov dl, bh
    int 21h 
        
    mov ah, 2
    mov dl, bl
    int 21h

    jmp regresar


Op_Multiplicacion:
    
    lea dx, msg_PrimerNumero
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov numero1, al

    
    lea dx, msg_SegundoNumero 
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov numero2, al

    
    mul numero1
    aam

    
    mov bx, ax
    add bh, 48
    add bl, 48 
    add numero1, 48
    add numero2, 48 

    lea dx, msg_Resultado 
    mov ah, 9
    int 21h
    
    mov ah, 2  
    mov dl, numero1
    int 21h 
    
    mov ah, 2  
    mov dl, 'x'
    int 21h
    
    mov ah, 2  
    mov dl, numero2
    int 21h 
    
    mov ah, 2  
    mov dl, '='
    int 21h
    
    mov ah, 2
    mov dl, bh
    int 21h

    mov ah, 2
    mov dl, bl
    int 21h

    jmp regresar


Op_Division:
    
    lea dx, msg_PrimerNumero 
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov numero1, al

    
    lea dx, msg_SegundoNumero 
    mov ah, 9
    int 21h

    mov ah, 1
    int 21h
    sub al, 48
    mov numero2, al

   
    mov al, numero1
    xor ah, ah        
    div numero2
    mov resultado, al

    
    add resultado, 48 
    add numero1, 48
    add numero2, 48

    lea dx, msg_Resultado 
    mov ah, 9
    int 21h
    
    mov ah, 2  
    mov dl, numero1
    int 21h 
    
    mov ah, 2  
    mov dl, '/'
    int 21h
    
    mov ah, 2  
    mov dl, numero2
    int 21h 
    
    mov ah, 2  
    mov dl, '='
    int 21h
    
    mov ah, 2
    mov dl, resultado
    int 21h
    
    jmp regresar


exit_p:
    lea dx, msg_Cerrar
    mov ah, 9
    int 21h

    
    exit:
    mov ah, 4ch
    int 21h  
    

regresar:
    lea dx, msg_Continuar 
    mov ah, 9    
    int 21h  
    
    
    mov ah, 1
    int 21h
    sub al, 48

    
    jmp menu