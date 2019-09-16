MCU=atmega8
ISP=usbtiny

all: module

clean:
	rm *.o *.elf *.hex

module: module.c
	# Compile
	avr-gcc -mmcu=$(MCU) -c module.c

	# Link
	avr-gcc -mmcu=$(MCU) -o module.elf module.o

	# HEXify
	avr-objcopy -j .text -j .data -O ihex module.elf module.hex

flash: module
	# Flash
	avrdude -p $(MCU) -c $(ISP) -U flash:w:module.hex

fuse:
	# Burn fuses
	avrdude -p $(MCU) -c $(ISP) -U lfuse:w:0xE4:m -U hfuse:w:0xD9:m
