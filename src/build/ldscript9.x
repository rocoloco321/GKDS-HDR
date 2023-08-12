/* NCPatcher: Auto-generated linker script */

INPUT (
	"build\source\exceptionhandler.c.o"
	"build\source\globalmap.c.o"
	"build\source\mkds.c.o"
	"build\source\rob.c.o"
	"build\source\symbols.c.o"
)

OUTPUT ("build\arm9.elf")

MEMORY {
	bin (rwx): ORIGIN = 0x00000000, LENGTH = 0x00100000
	arm (rwx): ORIGIN = 0x021DA340, LENGTH = 0x00100000
	over_020B60B0 (rwx): ORIGIN = 0x020B60B0, LENGTH = 0x00000004
	over_020792D4 (rwx): ORIGIN = 0x020792D4, LENGTH = 0x00000002
}

SECTIONS {
	.arm.text : ALIGN(4) {
		* (.text)
		* (.rodata)
		* (.init_array)
		* (.data)
		* (.text.*)
		* (.rodata.*)
		* (.init_array.*)
		* (.data.*)
		. = ALIGN(4);
	} > arm AT > bin

	.arm.bss : ALIGN(4) {
		* (.bss)
		* (.bss.*)
		. = ALIGN(4);
	} > arm AT > bin

	.ncp_over_0x020B60B0 : { KEEP(* (.ncp_over_0x020B60B0)) } > over_020B60B0 AT > bin
	.ncp_over_0x020792D4 : { KEEP(* (.ncp_over_0x020792D4)) } > over_020792D4 AT > bin

	/DISCARD/ : {*(.*)}
}

EXTERN (
	ncp_jump_0x020366D0
)
