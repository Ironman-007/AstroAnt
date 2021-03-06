EESchema Schematic File Version 4
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
L Mylib:Adafruit_Feather_nRF52840 U1
U 1 1 6186709E
P 5500 1850
F 0 "U1" H 5500 1865 50  0000 C CNN
F 1 "Adafruit_Feather_nRF52840" H 5500 1774 50  0000 C CNN
F 2 "Mylib:Adafruit_feather_nRF52840" H 5500 1850 50  0001 C CNN
F 3 "" H 5500 1850 50  0001 C CNN
	1    5500 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Female J1
U 1 1 6186C1C7
P 4500 2600
F 0 "J1" V 4650 2600 50  0000 C CNN
F 1 "Conn_01x12_Female" V 4550 2600 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x12_P2.54mm_Vertical" H 4500 2600 50  0001 C CNN
F 3 "~" H 4500 2600 50  0001 C CNN
	1    4500 2600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x16_Female J2
U 1 1 6186DCE3
P 6500 2900
F 0 "J2" V 6650 2900 50  0000 C CNN
F 1 "Conn_01x16_Female" V 6550 2900 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Vertical" H 6500 2900 50  0001 C CNN
F 3 "~" H 6500 2900 50  0001 C CNN
	1    6500 2900
	1    0    0    1   
$EndComp
Wire Wire Line
	4700 2100 5000 2100
Wire Wire Line
	4700 2200 5000 2200
Wire Wire Line
	4700 2300 5000 2300
Wire Wire Line
	4700 2400 5000 2400
Wire Wire Line
	4700 2500 5000 2500
Wire Wire Line
	4700 2600 5000 2600
Wire Wire Line
	4700 2700 5000 2700
Wire Wire Line
	5000 2800 4700 2800
Wire Wire Line
	4700 2900 5000 2900
Wire Wire Line
	5000 3000 4700 3000
Wire Wire Line
	4700 3100 5000 3100
Wire Wire Line
	5000 3200 4700 3200
Wire Wire Line
	6000 3600 6300 3600
Wire Wire Line
	6000 3500 6300 3500
Wire Wire Line
	6000 3400 6300 3400
Wire Wire Line
	6000 3300 6300 3300
Wire Wire Line
	6000 3200 6300 3200
Wire Wire Line
	6000 3100 6300 3100
Wire Wire Line
	6000 3000 6300 3000
Wire Wire Line
	6000 2900 6300 2900
Wire Wire Line
	6000 2800 6300 2800
Wire Wire Line
	6000 2700 6300 2700
Wire Wire Line
	6000 2600 6300 2600
Wire Wire Line
	6000 2500 6300 2500
Wire Wire Line
	6000 2400 6300 2400
Wire Wire Line
	6000 2300 6300 2300
Wire Wire Line
	6000 2200 6300 2200
Wire Wire Line
	6000 2100 6300 2100
Text Label 4750 2100 0    50   ~ 0
SDA
Text Label 4750 2200 0    50   ~ 0
SCL
Text Label 4750 2300 0    50   ~ 0
D5
Text Label 4750 2400 0    50   ~ 0
D6
Text Label 4750 2500 0    50   ~ 0
D9
Text Label 4750 2600 0    50   ~ 0
D10
Text Label 4750 2700 0    50   ~ 0
D11
Text Label 4750 2800 0    50   ~ 0
D12
Text Label 4750 2900 0    50   ~ 0
D13
Text Label 4750 3000 0    50   ~ 0
USB
Text Label 4750 3100 0    50   ~ 0
En
Text Label 4750 3200 0    50   ~ 0
Bat
Text Label 6100 2100 0    50   ~ 0
D2
Text Label 6100 2200 0    50   ~ 0
TX
Text Label 6100 2300 0    50   ~ 0
RX
Text Label 6100 2400 0    50   ~ 0
MI
Text Label 6100 2500 0    50   ~ 0
MO
Text Label 6100 2600 0    50   ~ 0
SCK
Text Label 6100 2700 0    50   ~ 0
A5
Text Label 6100 2800 0    50   ~ 0
A4
Text Label 6100 2900 0    50   ~ 0
A3
Text Label 6100 3000 0    50   ~ 0
A2
Text Label 6100 3100 0    50   ~ 0
A1
Text Label 6100 3200 0    50   ~ 0
A0
Text Label 6100 3300 0    50   ~ 0
GND
Text Label 6100 3400 0    50   ~ 0
Aref
Text Label 6100 3500 0    50   ~ 0
3V
Text Label 6100 3600 0    50   ~ 0
Rst
$Comp
L Connector:Conn_01x16_Female J3
U 1 1 6189BA4A
P 5550 4300
F 0 "J3" V 5700 4300 50  0000 C CNN
F 1 "Conn_01x16_Female" V 5600 4300 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x16_P2.54mm_Horizontal" H 5550 4300 50  0001 C CNN
F 3 "~" H 5550 4300 50  0001 C CNN
	1    5550 4300
	0    1    1    0   
$EndComp
Text Label 5350 3900 3    50   ~ 0
D5
Wire Wire Line
	4750 3900 4750 4100
Wire Wire Line
	4850 3900 4850 4100
Wire Wire Line
	4950 3900 4950 4100
Wire Wire Line
	5050 3900 5050 4100
Wire Wire Line
	5150 3900 5150 4100
Wire Wire Line
	5250 3900 5250 4100
Wire Wire Line
	5350 3900 5350 4100
Wire Wire Line
	5450 3900 5450 4100
Wire Wire Line
	5550 3900 5550 4100
Wire Wire Line
	5650 3900 5650 4100
Wire Wire Line
	5750 3900 5750 4100
Wire Wire Line
	5850 3900 5850 4100
Wire Wire Line
	5950 3900 5950 4100
Wire Wire Line
	6050 3900 6050 4100
Wire Wire Line
	6150 3900 6150 4100
Wire Wire Line
	6250 3900 6250 4100
Text Label 5250 3900 3    50   ~ 0
D6
Text Label 5150 3900 3    50   ~ 0
D9
Text Label 5050 3900 3    50   ~ 0
D10
Text Label 4950 3900 3    50   ~ 0
D11
Text Label 4850 3900 3    50   ~ 0
D12
Text Label 4750 3900 3    50   ~ 0
D13
Text Label 6250 3900 3    50   ~ 0
GND
Text Label 6150 3900 3    50   ~ 0
3V
Text Label 6050 3900 3    50   ~ 0
A0
Text Label 5950 3900 3    50   ~ 0
A1
Text Label 5850 3900 3    50   ~ 0
A2
Text Label 5750 3900 3    50   ~ 0
A3
Text Label 5650 3900 3    50   ~ 0
A4
Text Label 5550 3900 3    50   ~ 0
A5
Text Label 5450 3900 3    50   ~ 0
D2
$Comp
L Mechanical:MountingHole H1
U 1 1 618F32F7
P 4500 5000
F 0 "H1" H 4600 5046 50  0000 L CNN
F 1 "MountingHole" H 4600 4955 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 4500 5000 50  0001 C CNN
F 3 "~" H 4500 5000 50  0001 C CNN
	1    4500 5000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 618F43FA
P 4500 5250
F 0 "H2" H 4600 5296 50  0000 L CNN
F 1 "MountingHole" H 4600 5205 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 4500 5250 50  0001 C CNN
F 3 "~" H 4500 5250 50  0001 C CNN
	1    4500 5250
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 618F4ACD
P 4500 5500
F 0 "H3" H 4600 5546 50  0000 L CNN
F 1 "MountingHole" H 4600 5455 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 4500 5500 50  0001 C CNN
F 3 "~" H 4500 5500 50  0001 C CNN
	1    4500 5500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 618F4FF5
P 4500 5750
F 0 "H4" H 4600 5796 50  0000 L CNN
F 1 "MountingHole" H 4600 5705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.2mm_M2" H 4500 5750 50  0001 C CNN
F 3 "~" H 4500 5750 50  0001 C CNN
	1    4500 5750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
