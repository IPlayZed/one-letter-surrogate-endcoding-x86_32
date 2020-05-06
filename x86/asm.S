.intel_syntax noprefix
.data
ABC: .asciz "abcdefghijklmnopqrstuvwxyz"

i: .int 0
j: .int 0

.text
.global encrypt
encrypt:
    push ebp
    mov ebp, esp

    push eax
    push ebx
    push ecx
    push edx
    push edi
    push esi

    #esi:=input
    mov esi, [ebp+8]
    #ecx:=key
    mov ecx, [ebp+12]
    #edi:=output
    mov edi, [ebp+16]
    #ebx:=abc
    mov ebx, offset ABC

    Loop:
        #edx:=i
        mov edx, i
        #al:=(input+edx)
        mov al, [esi+edx]
        #al=='\0'
        cmp al, 0
        #:if true goto End 
        je End
        #*j=0
        mov edx, 0
        mov j, edx

        Loop_inner:
            #edx:=j
            mov edx, j
            #al==(abc+j)
            cmp al, [ebx+edx]
            #:if true goto End_inner
            je End_inner
            #*j++;
            inc dword ptr [j]
            #goto Loop_inner
            jmp Loop_inner

        End_inner:
            #edx:=j
            mov edx, j
            #al:=(key+j)
            mov al, [ecx+edx]
            #edx:=i
            mov edx, i
            #*(output+i):=*(key+j)
            mov [edi+edx], al
            #*(i)++
            inc dword ptr [i]
            #goto Loop
            jmp Loop
    End:
        #al:='\0'
        mov al, 0
        #edx:=i
        mov edx, i
        #=*(output+i):='\0'
        mov [edi+edx], al
        #return output
        mov eax, edi

    #CDECL konvenció
    pop esi
    pop edi
    pop edx
    pop ecx
    pop ebx
    pop eax

    mov esp, ebp
    pop ebp

    ret