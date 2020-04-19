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

    push esi
    push ecx
    push edi
    push ebx
    push eax
    push edx


    #esi=input[]
    mov esi, [ebp+8]
    #ecx=key[]
    mov ecx, [ebp+12]
    #edi=output[]
    mov edi, [ebp+16]
    #edx=abc[]
    mov ebx, offset ABC



    Loop:
        #int i;
        mov edx, i
        mov al, [esi+edx]
        cmp al, 0
        je Vege
        #int j=0;
        mov edx, 0
        mov dword ptr j, edx


        Loop_belso:
            mov edx, dword ptr j
            cmp al, [ebx+edx]
            je Vege_belso
            #j++;
            inc dword ptr [j]
            #goto
            jmp Loop_belso



        Vege_belso:
            mov edx, j
            mov al, [ecx+edx]
            mov edx, i
            mov [edi+edx], al
            inc dword ptr [i]
            #goto
            jmp Loop
    Vege:
        mov al, 0
        mov edx, i
        mov [edi+edx], al
        mov eax, edi

    pop edx
    pop eax
    pop ebx
    pop edi
    pop ecx
    pop esi


    mov esp , ebp
    pop ebp

    ret