EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Gelsoft Bomb Project Keypad Module"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 5D7346A6
P 3150 4200
F 0 "J1" H 3150 4400 50  0000 R CNN
F 1 "ISP" H 3350 4400 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 3150 4200 50  0001 C CNN
F 3 "~" H 3150 4200 50  0001 C CNN
	1    3150 4200
	1    0    0    -1  
$EndComp
Text GLabel 2950 4100 0    50   Output ~ 0
5v
Text GLabel 2950 4200 0    50   Output ~ 0
MOSI
Text GLabel 3450 4100 2    50   Input ~ 0
MISO
Text GLabel 3450 4200 2    50   Output ~ 0
SCK
Text GLabel 3450 4300 2    50   Output ~ 0
RESET
Text GLabel 5000 2950 1    50   Input ~ 0
5v
$Comp
L power:Earth #PWR0101
U 1 1 5D74824F
P 2950 4300
F 0 "#PWR0101" H 2950 4050 50  0001 C CNN
F 1 "Earth" H 2950 4150 50  0001 C CNN
F 2 "" H 2950 4300 50  0001 C CNN
F 3 "~" H 2950 4300 50  0001 C CNN
	1    2950 4300
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0102
U 1 1 5D748395
P 5000 5750
F 0 "#PWR0102" H 5000 5500 50  0001 C CNN
F 1 "Earth" H 5000 5600 50  0001 C CNN
F 2 "" H 5000 5750 50  0001 C CNN
F 3 "~" H 5000 5750 50  0001 C CNN
	1    5000 5750
	1    0    0    -1  
$EndComp
Text GLabel 5600 3650 2    50   Output ~ 0
MISO
Text GLabel 4400 3250 0    50   Input ~ 0
RESET
Text GLabel 5600 3750 2    50   Input ~ 0
SCK
Text GLabel 5600 3550 2    50   Input ~ 0
MOSI
$Comp
L Connector:DB9_Female J2
U 1 1 5D86BF6C
P 3300 5350
F 0 "J2" H 3100 5950 50  0000 L CNN
F 1 "Module Connector" H 3300 5950 50  0000 L CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x09_P1.27mm_Vertical" H 3300 5350 50  0001 C CNN
F 3 " ~" H 3300 5350 50  0001 C CNN
	1    3300 5350
	1    0    0    -1  
$EndComp
Text GLabel 3000 5650 0    50   Output ~ 0
5v
Text GLabel 3000 5750 0    50   Output ~ 0
SCK
Text GLabel 3000 5350 0    50   Input ~ 0
MOSI
Text GLabel 3000 5550 0    50   Output ~ 0
MISO
$Comp
L power:Earth #PWR0106
U 1 1 5D8940BE
P 2900 5150
F 0 "#PWR0106" H 2900 4900 50  0001 C CNN
F 1 "Earth" H 2900 5000 50  0001 C CNN
F 2 "" H 2900 5150 50  0001 C CNN
F 3 "~" H 2900 5150 50  0001 C CNN
	1    2900 5150
	1    0    0    -1  
$EndComp
Text GLabel 3000 5450 0    50   Output ~ 0
VIN
$Comp
L 74xx:74HC595 U2
U 1 1 5D7F550F
P 7050 2400
F 0 "U2" H 6800 2950 50  0000 C CNN
F 1 "74HC595" H 7300 2950 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 7050 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/sn74hc595.pdf" H 7050 2400 50  0001 C CNN
	1    7050 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2000 7650 2000
Wire Wire Line
	7650 2100 7450 2100
Wire Wire Line
	7450 2200 7650 2200
Wire Wire Line
	7650 2300 7450 2300
Wire Wire Line
	7450 2400 7650 2400
Wire Wire Line
	7650 2500 7450 2500
Wire Wire Line
	7450 2600 7650 2600
Wire Wire Line
	7650 2700 7450 2700
$Comp
L power:Earth #PWR0103
U 1 1 5D80F0B8
P 7050 3100
F 0 "#PWR0103" H 7050 2850 50  0001 C CNN
F 1 "Earth" H 7050 2950 50  0001 C CNN
F 2 "" H 7050 3100 50  0001 C CNN
F 3 "~" H 7050 3100 50  0001 C CNN
	1    7050 3100
	1    0    0    -1  
$EndComp
Text GLabel 7050 1800 1    50   Input ~ 0
5v
Text GLabel 8100 1800 1    50   Input ~ 0
5v
Text GLabel 8600 2600 2    50   Input ~ 0
5v
Wire Wire Line
	8600 2700 8700 2700
Wire Wire Line
	8700 2700 8700 3550
Wire Wire Line
	8600 2200 8750 2200
Wire Wire Line
	8750 2200 8750 3600
Wire Wire Line
	8600 2100 8800 2100
Wire Wire Line
	8800 2100 8800 3650
Wire Wire Line
	8600 2000 8850 2000
Wire Wire Line
	8850 2000 8850 3700
$Comp
L power:Earth #PWR0105
U 1 1 5D814C30
P 8150 3350
F 0 "#PWR0105" H 8150 3100 50  0001 C CNN
F 1 "Earth" H 8150 3200 50  0001 C CNN
F 2 "" H 8150 3350 50  0001 C CNN
F 3 "~" H 8150 3350 50  0001 C CNN
	1    8150 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2950 8150 2900
$Comp
L The~Gelsoft~Bomb~Project:3x4_Keypad U3
U 1 1 5D8220AC
P 7200 5000
F 0 "U3" H 6750 5500 50  0000 L CNN
F 1 "3x4_Keypad" H 7250 5500 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 7050 5400 50  0001 C CNN
F 3 "" H 7050 5400 50  0001 C CNN
	1    7200 5000
	1    0    0    -1  
$EndComp
$Comp
L The~Gelsoft~Bomb~Project:MC11605A6W7-BNMLW U4
U 1 1 5D822D57
P 8150 1900
F 0 "U4" H 7800 1950 50  0000 C CNN
F 1 "MC11605A6W7-BNMLW" H 8600 1950 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Vertical" H 7950 2100 50  0001 C CNN
F 3 "https://ae01.alicdn.com/kf/HTB1vj1BmdcnBKNjSZR0q6AFqFXa9.jpg" H 7950 2100 50  0001 C CNN
	1    8150 1900
	1    0    0    -1  
$EndComp
$Comp
L Module---Keypad-rescue:ATmega8-16PU-MCU_Microchip_ATmega U1
U 1 1 5D825400
P 5000 4350
F 0 "U1" H 4550 5700 50  0000 C CNN
F 1 "ATmega8-16PU" H 5450 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 5000 4350 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2486-8-bit-avr-microcontroller-atmega8_l_datasheet.pdf" H 5000 4350 50  0001 C CNN
	1    5000 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5250 6650 5250
Wire Wire Line
	6650 5350 5600 5350
Wire Wire Line
	5600 5150 6650 5150
Wire Wire Line
	6650 5050 5600 5050
Wire Wire Line
	5600 4950 6600 4950
Wire Wire Line
	6600 4950 6600 4850
Wire Wire Line
	6600 4850 6650 4850
Wire Wire Line
	6650 4750 6550 4750
Wire Wire Line
	6550 4750 6550 4850
Wire Wire Line
	6550 4850 5600 4850
Wire Wire Line
	5600 4750 6500 4750
Wire Wire Line
	6500 4750 6500 4650
Wire Wire Line
	6500 4650 6650 4650
Wire Wire Line
	6450 3700 6450 4650
Wire Wire Line
	6450 4650 5600 4650
Wire Wire Line
	6450 3700 8850 3700
Wire Wire Line
	5600 4450 6400 4450
Wire Wire Line
	6400 4450 6400 3650
Wire Wire Line
	6400 3650 8800 3650
Wire Wire Line
	6350 3600 6350 4350
Wire Wire Line
	6350 4350 5600 4350
Wire Wire Line
	6350 3600 8750 3600
Wire Wire Line
	5600 4250 6300 4250
Wire Wire Line
	6300 4250 6300 3550
Wire Wire Line
	6300 3550 8700 3550
Wire Wire Line
	4400 3650 4050 3650
Wire Wire Line
	4050 3650 4050 2300
Wire Wire Line
	4050 2300 6650 2300
Wire Wire Line
	5600 4150 6250 4150
Wire Wire Line
	6250 4150 6250 2500
Wire Wire Line
	6250 2500 6650 2500
Wire Wire Line
	5600 4050 6200 4050
Wire Wire Line
	6200 4050 6200 2200
Wire Wire Line
	6200 2200 6650 2200
Wire Wire Line
	6650 2000 6150 2000
Wire Wire Line
	6150 2000 6150 3950
Wire Wire Line
	6150 3950 5600 3950
$Comp
L Device:R R1
U 1 1 5DA19ACD
P 8150 3100
F 0 "R1" H 8220 3146 50  0000 L CNN
F 1 "10k" H 8220 3055 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0614_L14.3mm_D5.7mm_P20.32mm_Horizontal" V 8080 3100 50  0001 C CNN
F 3 "~" H 8150 3100 50  0001 C CNN
	1    8150 3100
	1    0    0    -1  
$EndComp
Wire Notes Line
	5500 4700 5300 4700
Wire Notes Line
	5300 5400 5500 5400
Wire Notes Line
	5500 4600 5300 4600
Wire Notes Line
	5300 4600 5300 5400
Wire Notes Line
	5500 4200 5300 4200
Wire Notes Line
	5300 4500 5500 4500
Wire Notes Line
	5500 3900 5300 3900
Wire Notes Line
	5300 3900 5300 4500
Text Notes 5250 5100 2    50   ~ 0
Keypad
Text Notes 5250 4700 2    50   ~ 0
LCD Enable
Text Notes 5250 4100 2    50   ~ 0
Shift Reg.
Text Notes 5250 4400 2    50   ~ 0
LCD Mode/LED
Wire Wire Line
	3000 4950 3000 5050
Wire Wire Line
	3000 5050 3000 5150
Connection ~ 3000 5050
Wire Wire Line
	3000 5150 3000 5250
Connection ~ 3000 5150
Wire Wire Line
	2900 5150 3000 5150
Wire Wire Line
	8050 2900 8050 3300
Wire Wire Line
	8050 3300 8150 3300
Wire Wire Line
	8150 3300 8150 3350
Wire Wire Line
	8150 3300 8150 3250
Connection ~ 8150 3300
$EndSCHEMATC
