EESchema Schematic File Version 4
LIBS:Case Controller-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Gelsoft Bomb Poject Case Controller"
Date ""
Rev "v0.2.1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J1
U 1 1 5D7346A6
P 1550 2750
F 0 "J1" H 1550 2950 50  0000 R CNN
F 1 "ISP" H 1750 2950 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 1550 2750 50  0001 C CNN
F 3 "~" H 1550 2750 50  0001 C CNN
	1    1550 2750
	1    0    0    -1  
$EndComp
Text GLabel 1350 2650 0    50   Output ~ 0
5v
Text GLabel 1350 2750 0    50   Output ~ 0
MOSI
Text GLabel 1850 2650 2    50   Input ~ 0
MISO
Text GLabel 1850 2750 2    50   Output ~ 0
SCK
Text GLabel 1850 2850 2    50   Output ~ 0
RESET
Text GLabel 3350 3200 1    50   Input ~ 0
5v
$Comp
L power:Earth #PWR0101
U 1 1 5D74824F
P 1350 2850
F 0 "#PWR0101" H 1350 2600 50  0001 C CNN
F 1 "Earth" H 1350 2700 50  0001 C CNN
F 2 "" H 1350 2850 50  0001 C CNN
F 3 "~" H 1350 2850 50  0001 C CNN
	1    1350 2850
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0102
U 1 1 5D748395
P 3350 5000
F 0 "#PWR0102" H 3350 4750 50  0001 C CNN
F 1 "Earth" H 3350 4850 50  0001 C CNN
F 2 "" H 3350 5000 50  0001 C CNN
F 3 "~" H 3350 5000 50  0001 C CNN
	1    3350 5000
	1    0    0    -1  
$EndComp
Text GLabel 1200 1350 0    50   Input ~ 0
VIN
Text GLabel 2000 1350 2    50   Output ~ 0
5v
Text GLabel 3950 4000 2    50   BiDi ~ 0
MISO
Text GLabel 3950 4700 2    50   Input ~ 0
RESET
Text GLabel 3950 3900 2    50   BiDi ~ 0
SCK
Text GLabel 3950 4100 2    50   BiDi ~ 0
MOSI
$Comp
L Device:Buzzer BZ1
U 1 1 5D77FD04
P 1550 2150
F 0 "BZ1" H 1702 2179 50  0000 L CNN
F 1 "Buzzer" H 1702 2088 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 1525 2250 50  0001 C CNN
F 3 "~" V 1525 2250 50  0001 C CNN
	1    1550 2150
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0104
U 1 1 5D780156
P 1450 2250
F 0 "#PWR0104" H 1450 2000 50  0001 C CNN
F 1 "Earth" H 1450 2100 50  0001 C CNN
F 2 "" H 1450 2250 50  0001 C CNN
F 3 "~" H 1450 2250 50  0001 C CNN
	1    1450 2250
	1    0    0    -1  
$EndComp
Text GLabel 1450 2050 0    50   Input ~ 0
BUZZER
Text GLabel 3950 4200 2    50   Output ~ 0
BUZZER
$Comp
L The~Gelsoft~Bomb~Project:HDSP-B09G U4
U 1 1 5D82E498
P 9100 4550
F 0 "U4" H 9100 5217 50  0000 C CNN
F 1 "HDSP-B09G" H 9100 5126 50  0000 C CNN
F 2 "The Gelsoft Bomb Project:HDSP-B08G" H 9100 3950 50  0001 C CNN
F 3 "http://www.kingbright.com/attachments/file/psearch/000/00/00/CC56-12CGKWA(Ver.8A).pdf" H 8670 4580 50  0001 C CNN
	1    9100 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4850 6850 4850
Wire Wire Line
	6850 4750 8000 4750
Wire Wire Line
	8000 4650 6850 4650
Wire Wire Line
	6850 4550 8000 4550
Wire Wire Line
	8000 4450 6850 4450
Wire Wire Line
	6850 4350 8000 4350
Wire Wire Line
	8000 4250 6850 4250
Text GLabel 6300 2900 1    50   Input ~ 0
5v
$Comp
L power:Earth #PWR0105
U 1 1 5D74EEF4
P 6300 5250
F 0 "#PWR0105" H 6300 5000 50  0001 C CNN
F 1 "Earth" H 6300 5100 50  0001 C CNN
F 2 "" H 6300 5250 50  0001 C CNN
F 3 "~" H 6300 5250 50  0001 C CNN
	1    6300 5250
	1    0    0    -1  
$EndComp
$Comp
L The~Gelsoft~Bomb~Project:MAX7219 U3
U 1 1 5D751E05
P 6300 4300
F 0 "U3" H 5900 5050 50  0000 C CNN
F 1 "MAX7219" H 6550 5050 50  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm" H 6350 5000 50  0001 C CNN
F 3 "" H 6350 5000 50  0001 C CNN
	1    6300 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 5150 6250 5200
Wire Wire Line
	6250 5200 6300 5200
Wire Wire Line
	6300 5200 6350 5200
Wire Wire Line
	6350 5200 6350 5150
Connection ~ 6300 5200
Wire Wire Line
	6300 5200 6300 5250
Wire Wire Line
	6300 3500 6300 3400
Wire Wire Line
	6300 3400 7000 3400
$Comp
L Device:R R1
U 1 1 5D770D47
P 7000 3550
F 0 "R1" H 6930 3504 50  0000 R CNN
F 1 "20k" H 6930 3595 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6930 3550 50  0001 C CNN
F 3 "~" H 7000 3550 50  0001 C CNN
	1    7000 3550
	-1   0    0    1   
$EndComp
Connection ~ 6300 3400
Wire Wire Line
	6850 3700 7000 3700
Wire Wire Line
	10200 4950 10250 4950
Wire Wire Line
	10250 5800 8000 5800
Wire Wire Line
	5650 5850 10300 5850
Wire Wire Line
	10300 5850 10300 4850
Wire Wire Line
	10300 4850 10200 4850
Wire Wire Line
	10200 4750 10350 4750
Wire Wire Line
	10350 4750 10350 5900
Wire Wire Line
	10350 5900 5600 5900
Wire Wire Line
	5700 4550 5750 4550
Wire Wire Line
	5700 4550 5700 5800
Wire Wire Line
	5650 4450 5750 4450
Wire Wire Line
	5650 4450 5650 5850
Wire Wire Line
	5600 4350 5750 4350
Wire Wire Line
	5600 4350 5600 5900
Wire Wire Line
	5750 4250 5550 4250
Wire Wire Line
	5550 4250 5550 5950
Wire Wire Line
	5550 5950 8050 5950
Wire Wire Line
	10400 4650 10200 4650
Wire Wire Line
	3950 4400 4800 4400
Wire Wire Line
	4800 4400 4800 3700
Wire Wire Line
	4800 3700 5750 3700
Wire Wire Line
	3950 4500 4850 4500
Wire Wire Line
	4850 4500 4850 3900
Wire Wire Line
	4850 3900 5750 3900
Wire Wire Line
	5750 4000 4900 4000
Wire Wire Line
	4900 4000 4900 4600
Wire Wire Line
	4900 4600 3950 4600
$Comp
L MCU_Microchip_ATtiny:ATtiny24A-PU U2
U 1 1 5D807087
P 3350 4100
F 0 "U2" H 2950 4950 50  0000 R CNN
F 1 "ATtiny24A-PU" H 3950 4950 50  0000 R CNN
F 2 "Package_DIP:DIP-14_W7.62mm" H 3350 4100 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc8183.pdf" H 3350 4100 50  0001 C CNN
	1    3350 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector:DB9_Male J2
U 1 1 5D86BF6C
P 1700 3900
F 0 "J2" H 1500 4500 50  0000 L CNN
F 1 "Module Connector" H 1700 4500 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 1700 3900 50  0001 C CNN
F 3 " ~" H 1700 3900 50  0001 C CNN
	1    1700 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5D74C8FE
P 2200 4950
F 0 "J3" H 2172 4832 50  0000 R CNN
F 1 "Battery Header" H 2172 4923 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2200 4950 50  0001 C CNN
F 3 "~" H 2200 4950 50  0001 C CNN
	1    2200 4950
	-1   0    0    1   
$EndComp
Text GLabel 1400 3800 0    50   BiDi ~ 0
VIN
Text GLabel 900  4850 0    50   Output ~ 0
VIN
$Comp
L power:Earth #PWR0107
U 1 1 5D750EEE
P 2000 4950
F 0 "#PWR0107" H 2000 4700 50  0001 C CNN
F 1 "Earth" H 2000 4800 50  0001 C CNN
F 2 "" H 2000 4950 50  0001 C CNN
F 3 "~" H 2000 4950 50  0001 C CNN
	1    2000 4950
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0108
U 1 1 5DD711D2
P 5900 3200
F 0 "#PWR0108" H 5900 2950 50  0001 C CNN
F 1 "Earth" H 5900 3050 50  0001 C CNN
F 2 "" H 5900 3200 50  0001 C CNN
F 3 "~" H 5900 3200 50  0001 C CNN
	1    5900 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5DD72109
P 6050 3150
F 0 "C1" V 5900 3050 50  0000 C CNN
F 1 "470uF" V 5900 3250 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 6088 3000 50  0001 C CNN
F 3 "~" H 6050 3150 50  0001 C CNN
	1    6050 3150
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 3200 5900 3150
Wire Wire Line
	6300 2900 6300 3150
Wire Wire Line
	6200 3150 6300 3150
Connection ~ 6300 3150
Wire Wire Line
	6300 3150 6300 3400
$Comp
L Switch:SW_SPST SW1
U 1 1 5DE69AC5
P 1750 4850
F 0 "SW1" H 1750 5050 50  0000 C CNN
F 1 "Power Switch" H 1750 4950 50  0000 C CNN
F 2 "The Gelsoft Bomb Project:SK12D07VG3" H 1750 4850 50  0001 C CNN
F 3 "~" H 1750 4850 50  0001 C CNN
	1    1750 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4850 2000 4850
Wire Wire Line
	1550 4850 1300 4850
$Comp
L Device:D D1
U 1 1 5DE00C5D
P 1150 4850
F 0 "D1" H 1150 5050 50  0000 C CNN
F 1 "1N5400" H 1150 4950 50  0000 C CNN
F 2 "Diode_THT:D_DO-201AD_P15.24mm_Horizontal" H 1150 4850 50  0001 C CNN
F 3 "~" H 1150 4850 50  0001 C CNN
	1    1150 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	900  4850 1000 4850
$Comp
L power:Earth #PWR0106
U 1 1 5D8940BE
P 1400 4300
F 0 "#PWR0106" H 1400 4050 50  0001 C CNN
F 1 "Earth" H 1400 4150 50  0001 C CNN
F 2 "" H 1400 4300 50  0001 C CNN
F 3 "~" H 1400 4300 50  0001 C CNN
	1    1400 4300
	1    0    0    -1  
$EndComp
Text GLabel 1400 3600 0    50   BiDi ~ 0
5v
Text GLabel 1400 3500 0    50   Input ~ 0
SCK
Text GLabel 1400 3700 0    50   Output ~ 0
MISO
Text GLabel 1400 3900 0    50   Input ~ 0
MOSI
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5DE4595C
P 1950 5450
F 0 "J4" H 1922 5332 50  0000 R CNN
F 1 "Low-Power Switch" H 1922 5423 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1950 5450 50  0001 C CNN
F 3 "~" H 1950 5450 50  0001 C CNN
	1    1950 5450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R5
U 1 1 5DE46244
P 1550 5350
F 0 "R5" V 1450 5250 50  0000 C CNN
F 1 "100k" V 1450 5450 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1480 5350 50  0001 C CNN
F 3 "~" H 1550 5350 50  0001 C CNN
	1    1550 5350
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 5350 1750 5350
Text GLabel 1350 5350 0    50   Output ~ 0
5v
Text GLabel 1700 5450 0    50   Input ~ 0
LOWPOWER
Wire Wire Line
	1350 5350 1400 5350
Wire Wire Line
	1700 5450 1750 5450
Text GLabel 3950 3500 2    50   Input ~ 0
LOWPOWER
Wire Wire Line
	1400 4000 1400 4100
Wire Wire Line
	1400 4100 1400 4200
Connection ~ 1400 4100
Wire Wire Line
	1400 4200 1400 4300
Connection ~ 1400 4200
Connection ~ 1400 4300
$Comp
L Switch:SW_SPST SW2
U 1 1 5DE51DB0
P 1400 6000
F 0 "SW2" H 1250 6150 50  0000 C CNN
F 1 "PLUS" H 1600 6150 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 1400 6000 50  0001 C CNN
F 3 "~" H 1400 6000 50  0001 C CNN
	1    1400 6000
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW3
U 1 1 5DE527E5
P 1400 6400
F 0 "SW3" H 1250 6550 50  0000 C CNN
F 1 "MINUS" H 1600 6550 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 1400 6400 50  0001 C CNN
F 3 "~" H 1400 6400 50  0001 C CNN
	1    1400 6400
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPST SW4
U 1 1 5DE52D8A
P 1400 6800
F 0 "SW4" H 1250 6950 50  0000 C CNN
F 1 "OK" H 1600 6950 50  0000 R CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm" H 1400 6800 50  0001 C CNN
F 3 "~" H 1400 6800 50  0001 C CNN
	1    1400 6800
	1    0    0    -1  
$EndComp
Text GLabel 2000 6000 2    50   Output ~ 0
PLUS
Text GLabel 2000 6400 2    50   Output ~ 0
MINUS
Text GLabel 2000 6800 2    50   Output ~ 0
OK
$Comp
L Device:R R6
U 1 1 5DE69C07
P 1800 6000
F 0 "R6" V 1700 5900 50  0000 C CNN
F 1 "100k" V 1700 6100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1730 6000 50  0001 C CNN
F 3 "~" H 1800 6000 50  0001 C CNN
	1    1800 6000
	0    1    1    0   
$EndComp
$Comp
L Device:R R7
U 1 1 5DE6A423
P 1800 6400
F 0 "R7" V 1700 6300 50  0000 C CNN
F 1 "100k" V 1700 6500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1730 6400 50  0001 C CNN
F 3 "~" H 1800 6400 50  0001 C CNN
	1    1800 6400
	0    1    1    0   
$EndComp
$Comp
L Device:R R8
U 1 1 5DE6AC21
P 1800 6800
F 0 "R8" V 1700 6700 50  0000 C CNN
F 1 "100k" V 1700 6900 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1730 6800 50  0001 C CNN
F 3 "~" H 1800 6800 50  0001 C CNN
	1    1800 6800
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 6000 1650 6000
Wire Wire Line
	1600 6400 1650 6400
Wire Wire Line
	1600 6800 1650 6800
Wire Wire Line
	1950 6800 2000 6800
Wire Wire Line
	1950 6400 2000 6400
Wire Wire Line
	1950 6000 2000 6000
Text GLabel 1000 6400 0    50   Input ~ 0
5v
Wire Wire Line
	1200 6000 1100 6000
Wire Wire Line
	1100 6000 1100 6400
Wire Wire Line
	1100 6400 1000 6400
Wire Wire Line
	1200 6400 1100 6400
Connection ~ 1100 6400
Wire Wire Line
	1200 6800 1100 6800
Wire Wire Line
	1100 6800 1100 6400
Text GLabel 3950 3600 2    50   Input ~ 0
PLUS
Text GLabel 3950 3700 2    50   Input ~ 0
MINUS
Text GLabel 3950 3800 2    50   Input ~ 0
OK
$Comp
L Device:LED D3
U 1 1 5DECBD1F
P 7650 5600
F 0 "D3" H 7800 5450 50  0000 C CNN
F 1 "STRIKE 2" H 7500 5450 50  0000 C CNN
F 2 "The Gelsoft Bomb Project:LED_Square_15x15mm" H 7650 5600 50  0001 C CNN
F 3 "~" H 7650 5600 50  0001 C CNN
	1    7650 5600
	-1   0    0    1   
$EndComp
$Comp
L Device:LED D2
U 1 1 5DECC0F8
P 7650 5300
F 0 "D2" H 7800 5150 50  0000 C CNN
F 1 "STRIKE 1" H 7500 5150 50  0000 C CNN
F 2 "The Gelsoft Bomb Project:LED_Square_15x15mm" H 7650 5300 50  0001 C CNN
F 3 "~" H 7650 5300 50  0001 C CNN
	1    7650 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	10250 4950 10250 5800
Wire Wire Line
	10400 5950 10400 4650
Wire Wire Line
	6850 4950 7350 4950
Wire Wire Line
	7350 4950 7350 5300
Wire Wire Line
	7350 5300 7500 5300
Connection ~ 7350 4950
Wire Wire Line
	7350 4950 8000 4950
Wire Wire Line
	7350 5300 7350 5600
Wire Wire Line
	7350 5600 7500 5600
Connection ~ 7350 5300
Wire Wire Line
	7800 5300 8050 5300
Wire Wire Line
	8050 5300 8050 5950
Connection ~ 8050 5950
Wire Wire Line
	8050 5950 10400 5950
Wire Wire Line
	8000 5600 8000 5800
Wire Wire Line
	7800 5600 8000 5600
Connection ~ 8000 5800
Wire Wire Line
	8000 5800 5700 5800
$Comp
L The~Gelsoft~Bomb~Project:Buck_Converter_Module_7-26v U1
U 1 1 5DE401FE
P 1550 1500
F 0 "U1" H 1600 1915 50  0000 C CNN
F 1 "Buck_Converter_Module_7-26v" H 1600 1824 50  0000 C CNN
F 2 "The Gelsoft Bomb Project:Buck_Converter_Module_7-24v" H 1600 900 50  0001 C CNN
F 3 "https://www.aliexpress.com/item/32636482278.html" H 1550 1500 50  0001 C CNN
	1    1550 1500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0103
U 1 1 5DE40ACE
P 1600 1750
F 0 "#PWR0103" H 1600 1500 50  0001 C CNN
F 1 "Earth" H 1600 1600 50  0001 C CNN
F 2 "" H 1600 1750 50  0001 C CNN
F 3 "~" H 1600 1750 50  0001 C CNN
	1    1600 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 1700 1600 1700
Wire Wire Line
	1600 1700 1600 1750
Wire Wire Line
	1600 1700 1650 1700
Connection ~ 1600 1700
$EndSCHEMATC
