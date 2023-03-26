global _start

SYS_READ equ 0
SYS_WRITE equ 1
SYS_EXIT equ 60

STDIN equ 0
STDOUT equ 1

BUFSIZE equ 25

section .bss
	buf resb BUFSIZE

section .text
_start:
	mov rax, SYS_READ
	mov rdi, STDIN
	lea rsi, [buf]
	mov rdx, BUFSIZE
	syscall

	; rax stores the number of bytes read
	; -1 means error
	; 0 means EOF
	cmp rax, 0
	jl fail
	je end

	mov rdx, rax ; write the same amount as read
	mov rax, SYS_WRITE
	mov rdi, STDOUT
	lea rsi, [buf]
	syscall

	jmp _start

fail:
	mov rax, SYS_EXIT
	mov rdi, 1
	syscall

end:
	mov rax, SYS_EXIT
	mov rdi, 0
	syscall
