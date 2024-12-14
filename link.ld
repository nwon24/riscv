ENTRY(_start)


SECTIONS {
        . = 0x80000000;
	.text : ALIGN(4096) {
		*(.init);
		*(.text);
	}
	.bss : ALIGN(4096) {
		_bss = .;
		*(.bss);
		. += 4096;
		_sp = .;
		. += 4096;
		gptr = .;
		_ebss = .;
	}
	.rodata : ALIGN(4096) {
		*(.rodata);
	}
	.data : ALIGN(4096) {
		*(.data);
	}
}
