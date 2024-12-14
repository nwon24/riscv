TGT = riscv64-elf

MACH = virt

AS = $(TGT)-as
LD = $(TGT)-ld

SRC = rv64.s
OBJ = ${SRC:.s=.o}
LDS = link.ld

LDFLAGS = -nostdlib

KERN = kernel

all: $(KERN)

$(KERN): $(OBJ) $(LDS)
	$(LD) -T $(LDS) $(LDFLAGS) -o $(KERN) $(OBJ)
clean:
	rm -f $(OBJ) $(KERN)
run: $(KERN)
	qemu-system-riscv64 -machine $(MACH) -kernel $(KERN) -bios none -nographic
