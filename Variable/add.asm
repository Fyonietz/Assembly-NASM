section .data
  number1 dq 5
  number2 dq 120
  result dq 0

  outbuf db '0000000000',0xA
  outlen equ 11


section .text
global _start

_start:
  ;Adding number1 + number 2
  mov rax,[number1]
  add rax,[number2]
  mov [result],rax
  ;To Sysout You Need Convert It Into ASCII String
  
  ;Prepare/Req for converting
  mov rcx,10 ; Decimal number 1,2,3,4,5,6,7,8,9,0
  mov rbx,outbuf+9 ; Point The Last Number ie,12 to 2 and 1 
  mov rdx,0

  ;Converting
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
  lea rdx, [outbuf + 9]
  sub rdx, rbx
  syscall

  mov rax,60
  xor rdi,rdi
  syscall
