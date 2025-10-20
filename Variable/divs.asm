section .data
  number1 dq 40
  number2 dq 5
  result dq 0

  buffer dw '0000000000',0xA


section .text
  global _start

_start:
  mov rax,[number1]
  mov rbx,[number2]
  xor rdx,rdx
  div rbx

  mov rcx,10
  mov rbx,buffer+9
  mov rdx,0

convert_loop:
  xor rdx,rdx ; Clear RDX register
  div rcx ; Division RCX
  add dl,'0' ; Digit Of ASCII
  dec rbx ;Move Buffer For Binary 
  mov [rbx],dl ;store ASCII
  test rax,rax ; Check for zero
  jnz convert_loop ; Loop Again 


  mov rax,1
  mov rdi,1
  mov rsi,rbx
  lea rdx, [buffer + 9]
  sub rdx, rbx
  syscall

  mov rax,60
  xor rdi,rdi
  syscall
