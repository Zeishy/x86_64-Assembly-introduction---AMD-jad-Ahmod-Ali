BITS 64

section .text
    global my_Revstr

my_Revstr:
    xor r8, r8
    xor rcx, rcx
    xor rax, rax
    jmp loop_revstr

loop_revstr:
    mov r8b, byte [rdi + rcx]
    cmp r8b, 0
    jne loop_push
    jmp loop_pop

loop_push:
    push r8
    inc rcx
    jmp loop_revstr

loop_pop:
    pop r8
    mov [rdi + rax], r8
    inc rax
    dec rcx
    cmp rcx, 0
    jne loop_pop
    jmp end_revstr

end_revstr:
    ret