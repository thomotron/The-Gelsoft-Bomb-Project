MCU=attiny24
ISP=usbtiny
CLOCK=8000000

all: case_controller

clean:
	rm *.o *.elf *.hex

case_controller: case_controller.c
	# Compile
	avr-gcc -mmcu=$(MCU) -Os -DF_CPU=$(CLOCK)UL -c case_controller.c

	# Link
	avr-gcc -mmcu=$(MCU) -o case_controller.elf case_controller.o

	# HEXify
	avr-objcopy -j .text -j .data -O ihex case_controller.elf case_controller.hex

	# Show program size
	avr-size --format=avr --mcu=$(MCU) case_controller.elf

flash: case_controller
	# Flash
	avrdude -p $(MCU) -c $(ISP) -U flash:w:case_controller.hex

fuse:
	# Burn fuses
	avrdude -p $(MCU) -c $(ISP) -U lfuse:w:0xE2:m -U hfuse:w:0xDF:m -U efuse:w:0xFF:m
