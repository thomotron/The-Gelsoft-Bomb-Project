EESchema Schematic File Version 4
LIBS:The Bomb Project-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 5D7346A6
P 2550 2400
F 0 "J?" V 2646 2212 50  0000 R CNN
F 1 "ISP" V 2555 2212 50  0000 R CNN
F 2 "" H 2550 2400 50  0001 C CNN
F 3 "~" H 2550 2400 50  0001 C CNN
	1    2550 2400
	1    0    0    -1  
$EndComp
Text GLabel 2350 2300 0    50   Output ~ 0
5v
Text GLabel 2350 2400 0    50   Output ~ 0
MOSI
Text GLabel 2850 2300 2    50   Input ~ 0
MISO
Text GLabel 2850 2400 2    50   Output ~ 0
SCK
Text GLabel 2850 2500 2    50   Output ~ 0
RESET
Text GLabel 2600 3400 1    50   Input ~ 0
5v
$Comp
L power:Earth #PWR?
U 1 1 5D74824F
P 2350 2500
F 0 "#PWR?" H 2350 2250 50  0001 C CNN
F 1 "Earth" H 2350 2350 50  0001 C CNN
F 2 "" H 2350 2500 50  0001 C CNN
F 3 "~" H 2350 2500 50  0001 C CNN
	1    2350 2500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 5D748395
P 2600 6400
F 0 "#PWR?" H 2600 6150 50  0001 C CNN
F 1 "Earth" H 2600 6250 50  0001 C CNN
F 2 "" H 2600 6400 50  0001 C CNN
F 3 "~" H 2600 6400 50  0001 C CNN
	1    2600 6400
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U?
U 1 1 5D74AD90
P 1000 2850
F 0 "U?" H 1000 3092 50  0000 C CNN
F 1 "L7805" H 1000 3001 50  0000 C CNN
F 2 "" H 1025 2700 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 1000 2800 50  0001 C CNN
	1    1000 2850
	1    0    0    -1  
$EndComp
Text GLabel 700  2850 0    50   Input ~ 0
VIN
Text GLabel 1300 2850 2    50   Output ~ 0
5v
$Comp
L power:Earth #PWR?
U 1 1 5D74BAAF
P 1000 3150
F 0 "#PWR?" H 1000 2900 50  0001 C CNN
F 1 "Earth" H 1000 3000 50  0001 C CNN
F 2 "" H 1000 3150 50  0001 C CNN
F 3 "~" H 1000 3150 50  0001 C CNN
	1    1000 3150
	1    0    0    -1  
$EndComp
Text GLabel 3200 4100 2    50   Output ~ 0
MISO
Text GLabel 3200 5200 2    50   Input ~ 0
RESET
Text GLabel 3200 4200 2    50   Input ~ 0
SCK
Text GLabel 3200 3800 2    50   Input ~ 0
STRIKE
Text GLabel 3200 3900 2    50   Output ~ 0
DISARM
Text GLabel 3200 4000 2    50   Input ~ 0
MOSI
$Comp
L Device:Buzzer BZ?
U 1 1 5D77FD04
P 2650 1750
F 0 "BZ?" H 2802 1779 50  0000 L CNN
F 1 "Buzzer" H 2802 1688 50  0000 L CNN
F 2 "" V 2625 1850 50  0001 C CNN
F 3 "~" V 2625 1850 50  0001 C CNN
	1    2650 1750
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 5D780156
P 2550 1850
F 0 "#PWR?" H 2550 1600 50  0001 C CNN
F 1 "Earth" H 2550 1700 50  0001 C CNN
F 2 "" H 2550 1850 50  0001 C CNN
F 3 "~" H 2550 1850 50  0001 C CNN
	1    2550 1850
	1    0    0    -1  
$EndComp
Text GLabel 2550 1650 0    50   Input ~ 0
BUZZER\MISO
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U?
U 1 1 5D738683
P 2600 4900
F 0 "U?" H 1956 4946 50  0000 R CNN
F 1 "ATmega328P-PU" H 1956 4855 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 2600 4900 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 2600 4900 50  0001 C CNN
	1    2600 4900
	1    0    0    -1  
$EndComp
Text GLabel 3200 4400 2    50   Output ~ 0
BUZZER
Text GLabel 3200 4600 2    50   Output ~ 0
D1EN
Text GLabel 3200 4700 2    50   Output ~ 0
D2EN
Text GLabel 3200 4800 2    50   Output ~ 0
D3EN
Text GLabel 3200 4900 2    50   Output ~ 0
D4EN
Text GLabel 3200 4300 2    50   Output ~ 0
LOWPOWER
Text GLabel 3200 3700 2    50   Input ~ 0
CORRECT
$Comp
L The~Gelsoft~Bomb~Project:HDSP-B08G U?
U 1 1 5D82E498
P 8350 5550
F 0 "U?" H 8350 6217 50  0000 C CNN
F 1 "HDSP-B08G" H 8350 6126 50  0000 C CNN
F 2 "The Gelsoft Bomb Project:HDSP-B08G" H 8350 4950 50  0001 C CNN
F 3 "http://www.kingbright.com/attachments/file/psearch/000/00/00/CC56-12CGKWA(Ver.8A).pdf" H 7920 5580 50  0001 C CNN
	1    8350 5550
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 5D74EEF4
P 4600 4900
F 0 "#PWR?" H 4600 4650 50  0001 C CNN
F 1 "Earth" H 4600 4750 50  0001 C CNN
F 2 "" H 4600 4900 50  0001 C CNN
F 3 "~" H 4600 4900 50  0001 C CNN
	1    4600 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4900 4650 4900
Wire Wire Line
	6450 5500 6450 5950
Wire Wire Line
	6450 5950 7250 5950
Wire Wire Line
	5900 5500 6450 5500
Wire Wire Line
	5900 5400 6500 5400
Wire Wire Line
	6500 5850 6500 5400
Wire Wire Line
	7250 5850 6500 5850
Wire Wire Line
	6550 5750 7250 5750
Wire Wire Line
	6550 5300 6550 5750
Wire Wire Line
	5900 5300 6550 5300
Wire Wire Line
	6600 5200 5900 5200
Wire Wire Line
	6600 5650 6600 5200
Wire Wire Line
	7250 5650 6600 5650
Wire Wire Line
	6650 5550 7250 5550
Wire Wire Line
	6650 5100 6650 5550
Wire Wire Line
	5900 5100 6650 5100
Wire Wire Line
	6700 5000 5900 5000
Wire Wire Line
	6700 5450 6700 5000
Wire Wire Line
	7250 5450 6700 5450
Wire Wire Line
	6750 5350 7250 5350
Wire Wire Line
	6750 4900 6750 5350
Wire Wire Line
	5900 4900 6750 4900
Wire Wire Line
	6800 4800 5900 4800
Wire Wire Line
	6800 5250 6800 4800
Wire Wire Line
	7250 5250 6800 5250
Text GLabel 4650 4800 0    50   Input ~ 0
5v
$Comp
L The~Gelsoft~Bomb~Project:HT16K33_SOP28 U?
U 1 1 5D745634
P 5450 4400
F 0 "U?" H 5275 4265 50  0000 C CNN
F 1 "HT16K33_SOP28" H 5275 4174 50  0000 C CNN
F 2 "The Gelsoft Bomb Project:SOP-28_7.5x15.4mm_P1.27mm" H 5300 2350 50  0001 C CNN
F 3 "" H 5350 4100 50  0001 C CNN
	1    5450 4400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
