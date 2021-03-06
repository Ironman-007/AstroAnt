EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "2021-09-15"
Rev ""
Comp "MIT Media Lab"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Mylib:Arducam_OV2640_module U1
U 1 1 6142D214
P 5550 2350
F 0 "U1" H 5500 2300 50  0000 L CNN
F 1 "Arducam_OV2640_module" H 5100 2200 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 5550 2350 50  0001 C CNN
F 3 "" H 5550 2350 50  0001 C CNN
	1    5550 2350
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:GRPB052VWVN-RC J1
U 1 1 6142F3DA
P 4500 4650
F 0 "J1" H 4850 4915 50  0000 C CNN
F 1 "GRPB052VWVN-RC" H 4850 4824 50  0000 C CNN
F 2 "SamacSys_Parts:HDRV10W50P127_2X5_635X340X430P" H 4700 4050 50  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sullins%20PDFs/GRPB_%20_2VWVN-RC%2010954-C.pdf" H 4700 3950 50  0001 L CNN
F 4 "CONN HEADER .050\" 10PS DL PCB AU" H 4700 3850 50  0001 L CNN "Description"
F 5 "4.3" H 4700 3750 50  0001 L CNN "Height"
F 6 "Sullins" H 4700 3650 50  0001 L CNN "Manufacturer_Name"
F 7 "GRPB052VWVN-RC" H 4700 3550 50  0001 L CNN "Manufacturer_Part_Number"
	1    4500 4650
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:GRPB052VWVN-RC J2
U 1 1 6143078C
P 6000 4650
F 0 "J2" H 6350 4915 50  0000 C CNN
F 1 "GRPB052VWVN-RC" H 6350 4824 50  0000 C CNN
F 2 "SamacSys_Parts:HDRV10W50P127_2X5_635X340X430P" H 6200 4050 50  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sullins%20PDFs/GRPB_%20_2VWVN-RC%2010954-C.pdf" H 6200 3950 50  0001 L CNN
F 4 "CONN HEADER .050\" 10PS DL PCB AU" H 6200 3850 50  0001 L CNN "Description"
F 5 "4.3" H 6200 3750 50  0001 L CNN "Height"
F 6 "Sullins" H 6200 3650 50  0001 L CNN "Manufacturer_Name"
F 7 "GRPB052VWVN-RC" H 6200 3550 50  0001 L CNN "Manufacturer_Part_Number"
	1    6000 4650
	1    0    0    -1  
$EndComp
NoConn ~ 6000 4650
NoConn ~ 6000 4750
NoConn ~ 6000 4850
NoConn ~ 6000 4950
NoConn ~ 6000 5050
NoConn ~ 6700 5050
NoConn ~ 6700 4950
NoConn ~ 6700 4850
NoConn ~ 6700 4750
NoConn ~ 6700 4650
Wire Wire Line
	5200 3750 5200 4050
Wire Wire Line
	5300 3750 5300 4050
Wire Wire Line
	5400 4050 5400 3750
Wire Wire Line
	5500 4050 5500 3750
Wire Wire Line
	5600 3850 5600 3750
Wire Wire Line
	5700 4050 5700 3750
Wire Wire Line
	5800 4050 5800 3750
Wire Wire Line
	5900 4050 5900 3750
Text Label 5900 4050 1    50   ~ 0
SCL
Text Label 5800 4050 1    50   ~ 0
SDA
Text Label 5500 4050 1    50   ~ 0
SCK
Text Label 5400 4050 1    50   ~ 0
MISO
Text Label 5300 4050 1    50   ~ 0
MOSI
Text Label 5200 4050 1    50   ~ 0
CS
$Comp
L power:GND #PWR0101
U 1 1 61436509
P 5600 3850
F 0 "#PWR0101" H 5600 3600 50  0001 C CNN
F 1 "GND" H 5605 3677 50  0000 C CNN
F 2 "" H 5600 3850 50  0001 C CNN
F 3 "" H 5600 3850 50  0001 C CNN
	1    5600 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0102
U 1 1 61437BF9
P 5700 4050
F 0 "#PWR0102" H 5700 3900 50  0001 C CNN
F 1 "+3.3V" H 5715 4223 50  0000 C CNN
F 2 "" H 5700 4050 50  0001 C CNN
F 3 "" H 5700 4050 50  0001 C CNN
	1    5700 4050
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 614382E2
P 6350 3050
F 0 "C1" H 6442 3096 50  0000 L CNN
F 1 "10uF" H 6442 3005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6350 3050 50  0001 C CNN
F 3 "~" H 6350 3050 50  0001 C CNN
	1    6350 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 61438CCB
P 6350 3250
F 0 "#PWR0103" H 6350 3000 50  0001 C CNN
F 1 "GND" H 6355 3077 50  0000 C CNN
F 2 "" H 6350 3250 50  0001 C CNN
F 3 "" H 6350 3250 50  0001 C CNN
	1    6350 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0104
U 1 1 614391F4
P 6350 2850
F 0 "#PWR0104" H 6350 2700 50  0001 C CNN
F 1 "+3.3V" H 6365 3023 50  0000 C CNN
F 2 "" H 6350 2850 50  0001 C CNN
F 3 "" H 6350 2850 50  0001 C CNN
	1    6350 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 2850 6350 2950
Wire Wire Line
	6350 3150 6350 3250
$Comp
L power:+3.3V #PWR0105
U 1 1 614413BB
P 5200 4650
F 0 "#PWR0105" H 5200 4500 50  0001 C CNN
F 1 "+3.3V" V 5215 4778 50  0000 L CNN
F 2 "" H 5200 4650 50  0001 C CNN
F 3 "" H 5200 4650 50  0001 C CNN
	1    5200 4650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 61441E81
P 5200 5050
F 0 "#PWR0106" H 5200 4800 50  0001 C CNN
F 1 "GND" V 5205 4922 50  0000 R CNN
F 2 "" H 5200 5050 50  0001 C CNN
F 3 "" H 5200 5050 50  0001 C CNN
	1    5200 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4200 4650 4500 4650
Wire Wire Line
	4200 4750 4500 4750
Wire Wire Line
	4200 4850 4500 4850
Wire Wire Line
	4200 4950 4500 4950
Wire Wire Line
	4200 5050 4500 5050
Wire Wire Line
	5500 4850 5200 4850
Text Label 4200 4750 0    50   ~ 0
SDA
Text Label 4200 4650 0    50   ~ 0
SCL
Text Label 4200 4850 0    50   ~ 0
SCK
Text Label 4200 5050 0    50   ~ 0
MISO
Text Label 4200 4950 0    50   ~ 0
MOSI
Text Label 5500 4850 2    50   ~ 0
CS
NoConn ~ 5200 4750
NoConn ~ 5200 4950
Text Notes 7250 7050 0    100  ~ 0
AstroAnt camera mudule board
$EndSCHEMATC
