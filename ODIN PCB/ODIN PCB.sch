EESchema Schematic File Version 2
LIBS:ODIN PCB-rescue
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ODIN PCB-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "28 aug 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R-RESCUE-ODIN_PCB R1
U 1 1 53B9DB77
P 4800 5100
F 0 "R1" V 4880 5100 40  0000 C CNN
F 1 "10k" V 4807 5101 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4730 5100 30  0000 C CNN
F 3 "~" H 4800 5100 30  0000 C CNN
	1    4800 5100
	-1   0    0    1   
$EndComp
$Comp
L MICRO-SD SD1
U 1 1 53B9E078
P 4250 6200
F 0 "SD1" H 4150 6200 60  0000 C CNN
F 1 "MICRO-SD" H 4150 6450 60  0000 C CNN
F 2 "" H 4250 6200 60  0000 C CNN
F 3 "" H 4250 6200 60  0000 C CNN
	1    4250 6200
	1    0    0    -1  
$EndComp
$Comp
L ARDUINO_PROMINI APM1
U 1 1 53B9F9FD
P 6600 4850
F 0 "APM1" H 6600 4850 60  0000 C CNN
F 1 "ARDUINO_PROMINI" H 6650 5350 60  0000 C CNN
F 2 "~" H 6600 4850 60  0000 C CNN
F 3 "" H 6600 4850 60  0000 C CNN
	1    6600 4850
	1    0    0    -1  
$EndComp
$Comp
L ANALOG3 A31
U 1 1 53B9FA1B
P 8650 5100
F 0 "A31" H 8300 5350 60  0000 C CNN
F 1 "ANALOG3" H 8200 5550 60  0000 C CNN
F 2 "Sockets_MOLEX_KK-System:Socket_MOLEX-KK-RM2-54mm_Lock_3pin_straight" H 8650 5100 60  0000 C CNN
F 3 "~" H 8650 5100 60  0000 C CNN
	1    8650 5100
	-1   0    0    1   
$EndComp
$Comp
L 5MMRGBLED GUS1
U 1 1 53B9FB1C
P 3700 4000
F 0 "GUS1" H 3700 4050 60  0000 C CNN
F 1 "5MMRGBLED" H 3700 4000 60  0000 C CNN
F 2 "LEDs:LED-RGB-5MM_Common_Cathode" H 3700 4000 60  0000 C CNN
F 3 "" H 3700 4000 60  0000 C CNN
	1    3700 4000
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-ODIN_PCB R2
U 1 1 53B9FB76
P 4700 3850
F 0 "R2" V 4780 3850 40  0000 C CNN
F 1 "270" V 4707 3851 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4630 3850 30  0000 C CNN
F 3 "~" H 4700 3850 30  0000 C CNN
	1    4700 3850
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-ODIN_PCB R3
U 1 1 53B9FB96
P 4700 4150
F 0 "R3" V 4780 4150 40  0000 C CNN
F 1 "270" V 4707 4151 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4630 4150 30  0000 C CNN
F 3 "~" H 4700 4150 30  0000 C CNN
	1    4700 4150
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-ODIN_PCB R4
U 1 1 53B9FB9C
P 4700 4300
F 0 "R4" V 4780 4300 40  0000 C CNN
F 1 "270" V 4707 4301 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 4630 4300 30  0000 C CNN
F 3 "~" H 4700 4300 30  0000 C CNN
	1    4700 4300
	0    -1   -1   0   
$EndComp
$Comp
L RTC Chr1
U 1 1 53BA039A
P 8200 3250
F 0 "Chr1" H 8200 3000 60  0000 C CNN
F 1 "RTC" H 8200 3600 60  0000 C CNN
F 2 "Sockets_MOLEX_KK-System:Socket_MOLEX-KK-RM2-54mm_Lock_5pin_straight" H 8200 3250 60  0000 C CNN
F 3 "~" H 8200 3250 60  0000 C CNN
	1    8200 3250
	1    0    0    -1  
$EndComp
$Comp
L Power2 P1
U 1 1 53BCC847
P 1900 5950
F 0 "P1" V 1850 5950 40  0000 C CNN
F 1 "POWER2" V 1950 5950 40  0000 C CNN
F 2 "Sockets_MOLEX_KK-System:Socket_MOLEX-KK-RM2-54mm_Lock_2pin_straight" H 1900 5950 60  0000 C CNN
F 3 "~" H 1900 5950 60  0000 C CNN
	1    1900 5950
	0    -1   -1   0   
$EndComp
$Comp
L DHT22 T&H1
U 1 1 53BCCC6C
P 4000 5250
F 0 "T&H1" H 4450 5200 60  0000 C CNN
F 1 "DHT22" H 4450 5450 60  0000 C CNN
F 2 "Sockets_MOLEX_KK-System:Socket_MOLEX-KK-RM2-54mm_Lock_3pin_straight" H 4000 5250 60  0000 C CNN
F 3 "~" H 4000 5250 60  0000 C CNN
	1    4000 5250
	-1   0    0    1   
$EndComp
$Comp
L ANALOG2 A21
U 1 1 53BCCEF1
P 8800 4850
F 0 "A21" H 8500 4850 60  0000 C CNN
F 1 "ANALOG2" H 8500 5000 60  0000 C CNN
F 2 "Sockets_MOLEX_KK-System:Socket_MOLEX-KK-RM2-54mm_Lock_3pin_straight" H 8950 4850 60  0000 C CNN
F 3 "~" H 8950 4850 60  0000 C CNN
	1    8800 4850
	-1   0    0    1   
$EndComp
Text Label 4950 5350 0    60   ~ 0
D7
Text Label 5800 5150 0    60   ~ 0
D9
Text Label 2000 6450 1    60   ~ 0
GND
Text Label 1800 6450 1    60   ~ 0
VCC
Text Label 4900 4850 0    60   ~ 0
VCC
Text Label 7550 5050 0    60   ~ 0
A0
Text Label 5800 4650 0    60   ~ 0
D4
Text Label 5800 4450 0    60   ~ 0
D2
Text Label 5050 3850 0    60   ~ 0
D4
Text Label 5800 4550 0    60   ~ 0
SQW
Text Label 5050 4150 0    60   ~ 0
D5
Text Label 5800 4750 0    60   ~ 0
D5
Text Label 5050 4300 0    60   ~ 0
D6
Text Label 5800 4850 0    60   ~ 0
D6
Text Label 5000 4000 0    60   ~ 0
GND
Text Label 5800 4950 0    60   ~ 0
D7
Text Label 4450 5350 0    60   ~ 0
GND
Text Label 5800 5250 0    60   ~ 0
CS
Text Label 4950 5900 0    60   ~ 0
CS
Text Label 4950 6000 0    60   ~ 0
DI
Text Label 5800 5350 0    60   ~ 0
DI
Text Label 4950 6100 0    60   ~ 0
DO
Text Label 5800 5450 0    60   ~ 0
DO
Text Label 5800 5550 0    60   ~ 0
CLK
Text Label 4900 6200 0    60   ~ 0
CLK
Text Label 4900 6300 0    60   ~ 0
GND
Text Label 4900 6500 0    60   ~ 0
VCC
Text Label 5800 5050 0    60   ~ 0
D8
Text Label 7400 3300 0    60   ~ 0
SQW
Text Label 8900 3000 0    60   ~ 0
GND
Text Label 8900 3150 0    60   ~ 0
VCC
Text Label 8900 3300 0    60   ~ 0
SCL
Text Label 7500 5450 0    60   ~ 0
SDA
Text Label 8900 3450 0    60   ~ 0
SDA
Text Label 7500 5550 0    60   ~ 0
SCL
Text Label 7550 5350 0    60   ~ 0
A3
Text Label 8100 5300 0    60   ~ 0
A3
Text Label 8100 5450 0    60   ~ 0
GND
Text Label 8100 5600 0    60   ~ 0
VCC
Text Label 7550 5250 0    60   ~ 0
A2
Text Label 8100 4750 0    60   ~ 0
A2
Text Label 8100 4900 0    60   ~ 0
GND
Text Label 8100 5050 0    60   ~ 0
VCC
Text Label 7550 5150 0    60   ~ 0
A1
Text Label 7500 4550 0    60   ~ 0
CTS
Text Label 5800 4150 0    60   ~ 0
D1
Text Label 5800 4050 0    60   ~ 0
D0
Text Label 7500 4450 0    60   ~ 0
DTR
Text Label 7500 4250 0    60   ~ 0
GND
Text Label 7500 4150 0    60   ~ 0
VCC
Wire Wire Line
	4600 4850 5050 4850
Connection ~ 4800 4850
Connection ~ 4800 5350
Wire Wire Line
	4350 5200 4600 5200
Wire Wire Line
	4600 5200 4600 4850
Wire Wire Line
	4450 3850 4300 3850
Wire Wire Line
	4300 4150 4450 4150
Wire Wire Line
	4450 4300 4300 4300
Wire Wire Line
	6000 5150 5800 5150
Wire Wire Line
	4350 5500 4800 5500
Wire Wire Line
	4800 5500 4800 5350
Wire Wire Line
	4800 5350 5050 5350
Wire Wire Line
	2000 6300 2000 6450
Wire Wire Line
	1800 6300 1800 6450
Wire Wire Line
	7300 5050 7650 5050
Wire Wire Line
	6000 4650 5800 4650
Wire Wire Line
	6000 4450 5800 4450
Wire Wire Line
	4950 3850 5150 3850
Wire Wire Line
	6000 4550 5800 4550
Wire Wire Line
	4950 4150 5150 4150
Wire Wire Line
	6000 4750 5800 4750
Wire Wire Line
	4950 4300 5150 4300
Wire Wire Line
	6000 4850 5800 4850
Wire Wire Line
	4300 4000 5150 4000
Wire Wire Line
	6000 4950 5800 4950
Wire Wire Line
	4350 5350 4600 5350
Wire Wire Line
	6000 5250 5800 5250
Wire Wire Line
	4800 5900 5050 5900
Wire Wire Line
	4800 6000 5050 6000
Wire Wire Line
	6000 5350 5800 5350
Wire Wire Line
	4800 6100 5050 6100
Wire Wire Line
	6000 5450 5800 5450
Wire Wire Line
	6000 5550 5800 5550
Wire Wire Line
	4800 6200 5050 6200
Wire Wire Line
	4800 6300 5050 6300
Wire Wire Line
	4800 6500 5050 6500
Wire Wire Line
	6000 5050 5800 5050
Wire Wire Line
	7600 3300 7400 3300
Wire Wire Line
	8800 3000 9050 3000
Wire Wire Line
	8800 3150 9050 3150
Wire Wire Line
	8800 3300 9050 3300
Wire Wire Line
	7300 5450 7650 5450
Wire Wire Line
	8800 3450 9050 3450
Wire Wire Line
	7300 5550 7650 5550
Wire Wire Line
	7300 5350 7650 5350
Wire Wire Line
	8350 5300 8100 5300
Wire Wire Line
	8350 5450 8100 5450
Wire Wire Line
	8350 5600 8100 5600
Wire Wire Line
	7300 5250 7650 5250
Wire Wire Line
	8350 5050 8100 5050
Wire Wire Line
	8350 4900 8100 4900
Wire Wire Line
	8350 4750 8100 4750
Wire Wire Line
	7300 5150 7650 5150
Wire Wire Line
	7300 4550 7650 4550
Wire Wire Line
	6000 4150 5800 4150
Wire Wire Line
	6000 4050 5800 4050
Wire Wire Line
	7300 4450 7650 4450
Wire Wire Line
	7300 4250 7650 4250
Wire Wire Line
	7300 4150 7650 4150
$Comp
L R-RESCUE-ODIN_PCB R5
U 1 1 56A19A6E
P 7600 3050
F 0 "R5" V 7680 3050 40  0000 C CNN
F 1 "10k" V 7607 3051 40  0000 C CNN
F 2 "Resistors_ThroughHole:Resistor_Horizontal_RM10mm" V 7530 3050 30  0000 C CNN
F 3 "~" H 7600 3050 30  0000 C CNN
	1    7600 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 2800 7600 2650
Text Label 7600 2750 0    60   ~ 0
VCC
$Comp
L CONN_01X04 Con1
U 1 1 56A19CF8
P 4100 2950
F 0 "Con1" H 4100 3200 50  0000 C CNN
F 1 "PMS1003" V 4200 2950 50  0000 C CNN
F 2 "Sockets_MOLEX_KK-System:Socket_MOLEX-KK-RM2-54mm_Lock_4pin_straight" H 4100 2950 50  0000 C CNN
F 3 "" H 4100 2950 50  0000 C CNN
	1    4100 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4300 2800 4550 2800
Wire Wire Line
	4300 2900 4550 2900
Wire Wire Line
	4300 3000 4550 3000
Wire Wire Line
	4300 3100 4550 3100
Text Label 4500 2800 0    60   ~ 0
GND
Text Label 4500 2900 0    60   ~ 0
VCC
Text Label 4500 3000 0    60   ~ 0
D1
Text Label 4550 3100 0    60   ~ 0
D8
$EndSCHEMATC
