# rv64.s 
# Assembly language assist

UART = 0x10000000

.text

.globl _start
_start:

	la	gp,gptr		# Set global pointer defined in linker script

	csrw	satp,zero	# Clear SATP (no paging yet)
	la	sp,_sp		# Set stack
# Clear bss
	la	t5,_bss
	la	t6,_ebss
1:
	sd	zero,(t5)
	addi	t5,t5,8
	bltu	t5,t6,1b

	la	t5,UART
	la	t6,msg
2:
	lb	t4,(t6)
	beqz	t4,die
	sb	t4,(t5)
	addi	t6,t6,1
	j	2b
die:	
	nop
	j	die

.section .rodata
msg:
	.asciz	"Hello, world!\n"
.end
