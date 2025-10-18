section .data
  number1 dq 2032131
  number2 dq 1241231
  result dq 0
  
  buffer db '000000000',0xA

section .text
  global _start


_start:
  mov rax,[number1]
  mov rbx,[number2]
  mul rbx
  mov [result],rax

  mov rcx,10
  mov rbx,buffer+9
  mov rdx,0

convert_loop:
  xor rdx,rdx
  div rcx
  add dl,'0'
  dec rbx
  mov [rbx],dl
  test rax,rax
  jnz convert_loop

  mov rax,1 
  mov rdi,1 
  mov rsi,rbx
  lea rdx,[buffer+9]
  sub rdx,rbx
  syscall

  mov rax,60
  xor rdi,rdi
  syscall
