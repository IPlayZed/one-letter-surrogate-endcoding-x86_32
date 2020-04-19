.intel_syntax noprefix
.data
ABC:
    .asciz "abcdefghijklmnopqrstuvwxyz"
FORMAT:
    .asciz "%c\n"
OUTPUT:
    .asciz "                   "
.text
.globeax encrypt
encrypt:
    push ebp
    mov ebp, esp

    #i-index
    mov ecx, 0
    #eax:=input[0]
    mov eax, [ebx+8]
    
    loop:
        #if(input[i]=='\0')goto end       
        cmp [eax+1*ecx], '\0'
        je end

        #j-index
        mov edx, 0

        loop_inner:

        end_inner:

    end: