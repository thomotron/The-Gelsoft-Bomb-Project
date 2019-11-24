EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Gelsoft Bomb Poject Case Controller"
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
P 1850 4000
F 0 "J1" H 1850 4200 50  0000 R CNN
F 1 "ISP" H 2050 4200 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 1850 4000 50  0001 C CNN
F 3 "~" H 1850 4000 50  0001 C CNN
	1    1850 4000
	1    0    0    -1  
$EndComp
Text GLabel 1650 3900 0    50   Output ~ 0
5v
Text GLabel 1650 4000 0    50   Output ~ 0
MOSI
Text GLabel 2150 3900 2    50   Input ~ 0
MISO
Text GLabel 2150 4000 2    50   Output ~ 0
SCK
Text GLabel 2150 4100 2    50   Output ~ 0
RESET
$Comp
L power:Earth #PWR0101
U 1 1 5D74824F
P 1650 4100
F 0 "#PWR0101" H 1650 3850 50  0001 C CNN
F 1 "Earth" H 1650 3950 50  0001 C CNN
F 2 "" H 1650 4100 50  0001 C CNN
F 3 "~" H 1650 4100 50  0001 C CNN
	1    1650 4100
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0102
U 1 1 5D748395
P 3350 5100
F 0 "#PWR0102" H 3350 4850 50  0001 C CNN
F 1 "Earth" H 3350 4950 50  0001 C CNN
F 2 "" H 3350 5100 50  0001 C CNN
F 3 "~" H 3350 5100 50  0001 C CNN
	1    3350 5100
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U1
U 1 1 5D74AD90
P 1900 2700
F 0 "U1" H 1750 2850 50  0000 C CNN
F 1 "L7805" H 2050 2850 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-4_Vertical" H 1925 2550 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 1900 2650 50  0001 C CNN
	1    1900 2700
	1    0    0    -1  
$EndComp
Text GLabel 1600 2700 0    50   Input ~ 0
VIN
Text GLabel 2200 2700 2    50   Output ~ 0
5v
$Comp
L power:Earth #PWR0103
U 1 1 5D74BAAF
P 1900 3000
F 0 "#PWR0103" H 1900 2750 50  0001 C CNN
F 1 "Earth" H 1900 2850 50  0001 C CNN
F 2 "" H 1900 3000 50  0001 C CNN
F 3 "~" H 1900 3000 50  0001 C CNN
	1    1900 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:Buzzer BZ1
U 1 1 5D77FD04
P 1850 3400
F 0 "BZ1" H 2002 3429 50  0000 L CNN
F 1 "Buzzer" H 2002 3338 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 1825 3500 50  0001 C CNN
F 3 "~" V 1825 3500 50  0001 C CNN
	1    1850 3400
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR0104
U 1 1 5D780156
P 1750 3500
F 0 "#PWR0104" H 1750 3250 50  0001 C CNN
F 1 "Earth" H 1750 3350 50  0001 C CNN
F 2 "" H 1750 3500 50  0001 C CNN
F 3 "~" H 1750 3500 50  0001 C CNN
	1    1750 3500
	1    0    0    -1  
$EndComp
Text GLabel 1750 3300 0    50   Input ~ 0
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
	6850 4950 8000 4950
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
	10250 4950 10250 5450
Wire Wire Line
	10250 5450 5700 5450
Wire Wire Line
	5650 5500 10300 5500
Wire Wire Line
	10300 5500 10300 4850
Wire Wire Line
	10300 4850 10200 4850
Wire Wire Line
	10200 4750 10350 4750
Wire Wire Line
	10350 4750 10350 5550
Wire Wire Line
	10350 5550 5600 5550
Wire Wire Line
	5700 4550 5750 4550
Wire Wire Line
	5700 4550 5700 5450
Wire Wire Line
	5650 4450 5750 4450
Wire Wire Line
	5650 4450 5650 5500
Wire Wire Line
	5600 4350 5750 4350
Wire Wire Line
	5600 4350 5600 5550
Wire Wire Line
	5750 4250 5550 4250
Wire Wire Line
	5550 4250 5550 5600
Wire Wire Line
	5550 5600 10400 5600
Wire Wire Line
	10400 5600 10400 4650
Wire Wire Line
	10400 4650 10200 4650
Wire Wire Line
	4800 4400 4800 3700
Wire Wire Line
	4800 3700 5750 3700
Wire Wire Line
	4850 4500 4850 3900
Wire Wire Line
	4850 3900 5750 3900
Wire Wire Line
	5750 4000 4900 4000
Wire Wire Line
	4900 4000 4900 4600
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
P 2000 5150
F 0 "J2" H 1800 5750 50  0000 L CNN
F 1 "Module Connector" H 2000 5750 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Male_Horizontal_P2.77x2.84mm_EdgePinOffset4.94mm_Housed_MountingHolesOffset7.48mm" H 2000 5150 50  0001 C CNN
F 3 " ~" H 2000 5150 50  0001 C CNN
	1    2000 5150
	1    0    0    -1  
$EndComp
Text GLabel 1700 4750 0    50   BiDi ~ 0
5v
Text GLabel 1700 5450 0    50   Output ~ 0
CORRECT
Text GLabel 1700 5250 0    50   Output ~ 0
STRIKE
Text GLabel 1700 5050 0    50   Input ~ 0
DISARM
Text GLabel 1700 4850 0    50   Input ~ 0
LOWPOWER
$Comp
L power:Earth #PWR0106
U 1 1 5D8940BE
P 1700 5550
F 0 "#PWR0106" H 1700 5300 50  0001 C CNN
F 1 "Earth" H 1700 5400 50  0001 C CNN
F 2 "" H 1700 5550 50  0001 C CNN
F 3 "~" H 1700 5550 50  0001 C CNN
	1    1700 5550
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5D74C8FE
P 2000 6150
F 0 "J3" H 1972 6032 50  0000 R CNN
F 1 "Battery Header" H 1972 6123 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 2000 6150 50  0001 C CNN
F 3 "~" H 2000 6150 50  0001 C CNN
	1    2000 6150
	-1   0    0    1   
$EndComp
Text GLabel 1700 4950 0    50   BiDi ~ 0
VIN
Text GLabel 1800 6050 0    50   Output ~ 0
VIN
$Comp
L power:Earth #PWR0107
U 1 1 5D750EEE
P 1800 6150
F 0 "#PWR0107" H 1800 5900 50  0001 C CNN
F 1 "Earth" H 1800 6000 50  0001 C CNN
F 2 "" H 1800 6150 50  0001 C CNN
F 3 "~" H 1800 6150 50  0001 C CNN
	1    1800 6150
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
F 1 "100uF" V 5900 3250 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 6088 3000 50  0001 C CNN
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
Wire Wire Line
	3950 4500 4850 4500
Wire Wire Line
	4900 4600 3950 4600
Text GLabel 4050 4700 2    50   Input ~ 0
RESET
Text GLabel 4050 4000 2    50   Output ~ 0
MISO
Text GLabel 4050 3900 2    50   Input ~ 0
SCK
Text GLabel 4050 3600 2    50   Input ~ 0
STRIKE
Text GLabel 4050 3700 2    50   Output ~ 0
DISARM
Text GLabel 4050 4100 2    50   Input ~ 0
MOSI
Text GLabel 4050 4200 2    50   Output ~ 0
BUZZER
Text GLabel 4050 3800 2    50   Output ~ 0
LOWPOWER
Text GLabel 4050 3500 2    50   Input ~ 0
CORRECT
Wire Wire Line
	3950 4700 4050 4700
$Comp
L Connector_Generic:Conn_01x07 J5
U 1 1 5DDDF234
P 3750 2700
F 0 "J5" H 3668 3217 50  0000 C CNN
F 1 "Conn_01x07" H 3668 3126 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 3750 2700 50  0001 C CNN
F 3 "~" H 3750 2700 50  0001 C CNN
	1    3750 2700
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x07 J4
U 1 1 5DDDC6DC
P 3750 1750
F 0 "J4" H 3668 2267 50  0000 C CNN
F 1 "Conn_01x07" H 3668 2176 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 3750 1750 50  0001 C CNN
F 3 "~" H 3750 1750 50  0001 C CNN
	1    3750 1750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3950 4400 4800 4400
Text GLabel 3350 3100 1    50   Input ~ 0
5v
Wire Wire Line
	3350 5100 3350 5000
Wire Wire Line
	3950 4200 4050 4200
Wire Wire Line
	4050 4100 3950 4100
Wire Wire Line
	3950 4000 4050 4000
Wire Wire Line
	3950 3900 4050 3900
Wire Wire Line
	4050 3800 3950 3800
Wire Wire Line
	3950 3700 4050 3700
Wire Wire Line
	4050 3600 3950 3600
Wire Wire Line
	3950 3500 4050 3500
Wire Wire Line
	3350 3200 3350 3100
Text GLabel 3950 1450 2    50   Input ~ 0
5v
Text GLabel 3950 1550 2    50   Input ~ 0
Pin2
Text GLabel 3950 1650 2    50   Input ~ 0
Pin3
Text GLabel 3950 1750 2    50   Input ~ 0
RESET
Text GLabel 3950 1850 2    50   Input ~ 0
Pin5
Text GLabel 3950 1950 2    50   Input ~ 0
BUZZER
Text GLabel 3950 2050 2    50   Input ~ 0
MOSI
Text GLabel 3950 2400 2    50   Input ~ 0
MISO
Text GLabel 3950 2500 2    50   Input ~ 0
SCK
Text GLabel 3950 2600 2    50   Input ~ 0
LOWPOWER
Text GLabel 3950 2700 2    50   Input ~ 0
DISARM
Text GLabel 3950 2800 2    50   Input ~ 0
STRIKE
Text GLabel 3950 2900 2    50   Input ~ 0
CORRECT
Text GLabel 3950 3000 2    50   Input ~ 0
GND
Text GLabel 3350 5050 2    50   Input ~ 0
GND
Text GLabel 4000 4400 1    50   Input ~ 0
Pin2
Text GLabel 4100 4500 1    50   Input ~ 0
Pin3
Text GLabel 4200 4600 1    50   Input ~ 0
Pin5
$EndSCHEMATC
