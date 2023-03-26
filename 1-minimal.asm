global _start

section .text
_start:
	; 60 = UNIX exit system call code
	mov rax, 60

	; 0 = exit status parameter
	mov rdi, 0

	; calls exit(0)
	syscall
