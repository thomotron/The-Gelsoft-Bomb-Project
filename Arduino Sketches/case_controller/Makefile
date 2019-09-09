MCU=attiny24

all: case_controller

case_controller: case_controller.c
	# Compile
	avr-gcc -mmcu=$(MCU) -c case_controller.c

	# Link
	avr-gcc -mmcu=$(MCU) -o case_controller.elf case_controller.o

	# HEXify
	avr-objcopy -j .text -j .data -O ihex case_controller.elf case_controller.hex
