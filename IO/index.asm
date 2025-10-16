section .data
  msg db 'Hello, World!', 0xA
  len equ $ - msg
  msg1 db 'Bakar Bodi!',0xA
  len1 equ $ - msg1

section .text
  global _start

_start:
  mov rax,1
  mov rdi,1
  mov rsi,msg1
  mov rdx,len1
  syscall

  mov rax,60
  xor rdi,rdi
  syscall
