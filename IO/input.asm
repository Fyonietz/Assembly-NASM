section .bss  
  input_buffer resb 256 ;Make Reserve Buffer 256 Bytes
  buffer_len equ 256 ;Count Buffer leng

section .data
  prompt db 'Enter Text: ',0
  prompt_len equ $ - prompt

  newline db 0xA

section .text 
  global _start

_start:
  ;Print promt
  mov rax,1 ; Make Syscall
  mov rdi,1 ;Make Sysout
  mov rsi,prompt ;Move prompt to Sysout
  mov rdx,prompt_len ;
  syscall

  ;Read Input From User
  mov rax,0
  mov rdi,0
  mov rsi,input_buffer
  mov rdx,buffer_len
  syscall

  ;Save The Number Of Buffer
  mov rdx,rax

  ;Print output
  mov rax,1
  mov rdi,1
  mov rsi,input_buffer
  syscall

  mov rax,60
  xor rdi,rdi
  syscall
