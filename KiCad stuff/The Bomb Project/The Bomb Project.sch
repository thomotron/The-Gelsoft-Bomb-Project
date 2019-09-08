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
P 1650 4400
F 0 "J?" H 1650 4600 50  0000 R CNN
F 1 "ISP" H 1850 4600 50  0000 R CNN
F 2 "" H 1650 4400 50  0001 C CNN
F 3 "~" H 1650 4400 50  0001 C CNN
	1    1650 4400
	1    0    0    -1  
$EndComp
Text GLabel 1450 4300 0    50   Output ~ 0
5v
Text GLabel 1450 4400 0    50   Output ~ 0
MOSI
Text GLabel 1950 4300 2    50   Input ~ 0
MISO
Text GLabel 1950 4400 2    50   Output ~ 0
SCK
Text GLabel 1950 4500 2    50   Output ~ 0
RESET
Text GLabel 3100 2300 1    50   Input ~ 0
5v
$Comp
L power:Earth #PWR?
U 1 1 5D74824F
P 1450 4500
F 0 "#PWR?" H 1450 4250 50  0001 C CNN
F 1 "Earth" H 1450 4350 50  0001 C CNN
F 2 "" H 1450 4500 50  0001 C CNN
F 3 "~" H 1450 4500 50  0001 C CNN
	1    1450 4500
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 5D748395
P 3100 5300
F 0 "#PWR?" H 3100 5050 50  0001 C CNN
F 1 "Earth" H 3100 5150 50  0001 C CNN
F 2 "" H 3100 5300 50  0001 C CNN
F 3 "~" H 3100 5300 50  0001 C CNN
	1    3100 5300
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Linear:L7805 U?
U 1 1 5D74AD90
P 1700 3100
F 0 "U?" H 1700 3342 50  0000 C CNN
F 1 "L7805" H 1700 3251 50  0000 C CNN
F 2 "" H 1725 2950 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 1700 3050 50  0001 C CNN
	1    1700 3100
	1    0    0    -1  
$EndComp
Text GLabel 1400 3100 0    50   Input ~ 0
VIN
Text GLabel 2000 3100 2    50   Output ~ 0
5v
$Comp
L power:Earth #PWR?
U 1 1 5D74BAAF
P 1700 3400
F 0 "#PWR?" H 1700 3150 50  0001 C CNN
F 1 "Earth" H 1700 3250 50  0001 C CNN
F 2 "" H 1700 3400 50  0001 C CNN
F 3 "~" H 1700 3400 50  0001 C CNN
	1    1700 3400
	1    0    0    -1  
$EndComp
Text GLabel 3700 3000 2    50   Output ~ 0
MISO
Text GLabel 3700 4100 2    50   Input ~ 0
RESET
Text GLabel 3700 3100 2    50   Input ~ 0
SCK
Text GLabel 3700 2700 2    50   Input ~ 0
STRIKE
Text GLabel 3700 2800 2    50   Output ~ 0
DISARM
Text GLabel 3700 2900 2    50   Input ~ 0
MOSI
$Comp
L Device:Buzzer BZ?
U 1 1 5D77FD04
P 1650 3800
F 0 "BZ?" H 1802 3829 50  0000 L CNN
F 1 "Buzzer" H 1802 3738 50  0000 L CNN
F 2 "" V 1625 3900 50  0001 C CNN
F 3 "~" V 1625 3900 50  0001 C CNN
	1    1650 3800
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 5D780156
P 1550 3900
F 0 "#PWR?" H 1550 3650 50  0001 C CNN
F 1 "Earth" H 1550 3750 50  0001 C CNN
F 2 "" H 1550 3900 50  0001 C CNN
F 3 "~" H 1550 3900 50  0001 C CNN
	1    1550 3900
	1    0    0    -1  
$EndComp
Text GLabel 1550 3700 0    50   Input ~ 0
BUZZER\MISO
$Comp
L MCU_Microchip_ATmega:ATmega328P-PU U?
U 1 1 5D738683
P 3100 3800
F 0 "U?" H 2700 5250 50  0000 R CNN
F 1 "ATmega328P-PU" H 3900 5250 50  0000 R CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 3100 3800 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/ATmega328_P%20AVR%20MCU%20with%20picoPower%20Technology%20Data%20Sheet%2040001984A.pdf" H 3100 3800 50  0001 C CNN
	1    3100 3800
	1    0    0    -1  
$EndComp
Text GLabel 3700 3300 2    50   Output ~ 0
BUZZER
Text GLabel 3700 3200 2    50   Output ~ 0
LOWPOWER
Text GLabel 3700 2600 2    50   Input ~ 0
CORRECT
$Comp
L The~Gelsoft~Bomb~Project:HDSP-B09G U?
U 1 1 5D82E498
P 8850 4450
F 0 "U?" H 8850 5117 50  0000 C CNN
F 1 "HDSP-B09G" H 8850 5026 50  0000 C CNN
F 2 "The Gelsoft Bomb Project:HDSP-B08G" H 8850 3850 50  0001 C CNN
F 3 "http://www.kingbright.com/attachments/file/psearch/000/00/00/CC56-12CGKWA(Ver.8A).pdf" H 8420 4480 50  0001 C CNN
	1    8850 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4850 7750 4850
Wire Wire Line
	7750 4750 6600 4750
Wire Wire Line
	6600 4650 7750 4650
Wire Wire Line
	7750 4550 6600 4550
Wire Wire Line
	6600 4450 7750 4450
Wire Wire Line
	7750 4350 6600 4350
Wire Wire Line
	6600 4250 7750 4250
Wire Wire Line
	7750 4150 6600 4150
Text GLabel 6050 3250 1    50   Input ~ 0
5v
$Comp
L power:Earth #PWR?
U 1 1 5D74EEF4
P 6050 5150
F 0 "#PWR?" H 6050 4900 50  0001 C CNN
F 1 "Earth" H 6050 5000 50  0001 C CNN
F 2 "" H 6050 5150 50  0001 C CNN
F 3 "~" H 6050 5150 50  0001 C CNN
	1    6050 5150
	1    0    0    -1  
$EndComp
$Comp
L The~Gelsoft~Bomb~Project:MAX7219 U?
U 1 1 5D751E05
P 6050 4200
F 0 "U?" H 5650 4950 50  0000 C CNN
F 1 "MAX7219" H 6300 4950 50  0000 C CNN
F 2 "" H 6100 4900 50  0001 C CNN
F 3 "" H 6100 4900 50  0001 C CNN
	1    6050 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5050 6000 5100
Wire Wire Line
	6000 5100 6050 5100
Wire Wire Line
	6050 5100 6100 5100
Wire Wire Line
	6100 5100 6100 5050
Connection ~ 6050 5100
Wire Wire Line
	6050 5100 6050 5150
Wire Wire Line
	6050 3400 6050 3300
Wire Wire Line
	6050 3300 6750 3300
$Comp
L Device:R R?
U 1 1 5D770D47
P 6750 3450
F 0 "R?" H 6680 3404 50  0000 R CNN
F 1 "20k" H 6680 3495 50  0000 R CNN
F 2 "" V 6680 3450 50  0001 C CNN
F 3 "~" H 6750 3450 50  0001 C CNN
	1    6750 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	6050 3300 6050 3250
Connection ~ 6050 3300
Wire Wire Line
	6600 3600 6750 3600
Wire Wire Line
	9950 4850 10000 4850
Wire Wire Line
	10000 4850 10000 5350
Wire Wire Line
	10000 5350 5450 5350
Wire Wire Line
	5400 5400 10050 5400
Wire Wire Line
	10050 5400 10050 4750
Wire Wire Line
	10050 4750 9950 4750
Wire Wire Line
	9950 4650 10100 4650
Wire Wire Line
	10100 4650 10100 5450
Wire Wire Line
	10100 5450 5350 5450
Wire Wire Line
	5450 4450 5500 4450
Wire Wire Line
	5450 4450 5450 5350
Wire Wire Line
	5400 4350 5500 4350
Wire Wire Line
	5400 4350 5400 5400
Wire Wire Line
	5350 4250 5500 4250
Wire Wire Line
	5350 4250 5350 5450
Wire Wire Line
	5500 4150 5300 4150
Wire Wire Line
	5300 4150 5300 5500
Wire Wire Line
	5300 5500 10150 5500
Wire Wire Line
	10150 5500 10150 4550
Wire Wire Line
	10150 4550 9950 4550
Wire Wire Line
	3700 4300 4550 4300
Wire Wire Line
	4550 4300 4550 3600
Wire Wire Line
	4550 3600 5500 3600
Wire Wire Line
	3700 4400 4600 4400
Wire Wire Line
	4600 4400 4600 3800
Wire Wire Line
	4600 3800 5500 3800
Wire Wire Line
	5500 3900 4650 3900
Wire Wire Line
	4650 3900 4650 4500
Wire Wire Line
	4650 4500 3700 4500
$EndSCHEMATC
