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
L SamacSys_Parts:ZTP-135SR U1
U 1 1 613AE4BF
P 3150 3950
F 0 "U1" H 3400 4100 50  0000 C CNN
F 1 "ZTP-135SR" H 4550 4100 50  0000 C CNN
F 2 "Mylib:TO-46-4" H 5100 4050 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/2/ZTP-135SR.pdf" H 5100 3950 50  0001 L CNN
F 4 "Infrared Detectors TO-46, 1.3mV Thermopile IR Sensor" H 5100 3850 50  0001 L CNN "Description"
F 5 "3" H 5100 3750 50  0001 L CNN "Height"
F 6 "Amphenol" H 5100 3650 50  0001 L CNN "Manufacturer_Name"
F 7 "ZTP-135SR" H 5100 3550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "527-ZTP-135SR" H 5100 3450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Amphenol-Advanced-Sensors/ZTP-135SR?qs=gBjjYPXQNsSufRFKxVRDeQ%3D%3D" H 5100 3350 50  0001 L CNN "Mouser Price/Stock"
F 10 "ZTP-135SR" H 5100 3250 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/ztp-135sr/amphenol?region=nac" H 5100 3150 50  0001 L CNN "Arrow Price/Stock"
	1    3150 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 613B8D36
P 5350 3000
F 0 "#PWR0101" H 5350 2750 50  0001 C CNN
F 1 "GND" V 5355 2872 50  0000 R CNN
F 2 "" H 5350 3000 50  0001 C CNN
F 3 "" H 5350 3000 50  0001 C CNN
	1    5350 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 3000 5450 3000
$Comp
L power:+3.3V #PWR0102
U 1 1 613B98EF
P 5350 3400
F 0 "#PWR0102" H 5350 3250 50  0001 C CNN
F 1 "+3.3V" V 5365 3528 50  0000 L CNN
F 2 "" H 5350 3400 50  0001 C CNN
F 3 "" H 5350 3400 50  0001 C CNN
	1    5350 3400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 3400 5450 3400
Wire Wire Line
	5450 3300 5050 3300
Text Label 5050 3300 0    50   ~ 0
Temp_A
$Comp
L power:GND #PWR0103
U 1 1 613BBF37
P 5150 4050
F 0 "#PWR0103" H 5150 3800 50  0001 C CNN
F 1 "GND" V 5155 3922 50  0000 R CNN
F 2 "" H 5150 4050 50  0001 C CNN
F 3 "" H 5150 4050 50  0001 C CNN
	1    5150 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 4050 5000 4050
Wire Wire Line
	3150 3950 3050 3950
$Comp
L SamacSys_Parts:LMP91051MTX_NOPB IC1
U 1 1 613C2C2B
P 6350 3950
F 0 "IC1" H 6950 4215 50  0000 C CNN
F 1 "LMP91051MTX_NOPB" H 6950 4124 50  0000 C CNN
F 2 "SamacSys_Parts:SOP65P640X120-14N" H 7400 4050 50  0001 L CNN
F 3 "http://www.ti.com/lit/gpn/lmp91051" H 7400 3950 50  0001 L CNN
F 4 "Configurable AFE for (NDIR) Sensing Applications" H 7400 3850 50  0001 L CNN "Description"
F 5 "1.2" H 7400 3750 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 7400 3650 50  0001 L CNN "Manufacturer_Name"
F 7 "LMP91051MTX/NOPB" H 7400 3550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "595-LMP91051MTX/NOPB" H 7400 3450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/LMP91051MTX-NOPB?qs=FBI%252BX3tnPf2yvrsn%252B8tM6Q%3D%3D" H 7400 3350 50  0001 L CNN "Mouser Price/Stock"
F 10 "LMP91051MTX/NOPB" H 7400 3250 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/lmp91051mtxnopb/texas-instruments" H 7400 3150 50  0001 L CNN "Arrow Price/Stock"
	1    6350 3950
	1    0    0    -1  
$EndComp
Text Label 2600 3950 0    50   ~ 0
Thermistor
NoConn ~ 6350 4550
NoConn ~ 7550 4550
$Comp
L power:+3.3V #PWR0104
U 1 1 613D5133
P 7650 3650
F 0 "#PWR0104" H 7650 3500 50  0001 C CNN
F 1 "+3.3V" H 7665 3823 50  0000 C CNN
F 2 "" H 7650 3650 50  0001 C CNN
F 3 "" H 7650 3650 50  0001 C CNN
	1    7650 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3950 7650 3950
Wire Wire Line
	7650 3950 7650 3700
Wire Wire Line
	7550 4050 7650 4050
Wire Wire Line
	7650 4050 7650 3950
Connection ~ 7650 3950
$Comp
L Device:C_Small C2
U 1 1 613D7D04
P 8200 3850
F 0 "C2" H 8108 3804 50  0000 R CNN
F 1 "0.01uF" H 8108 3895 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 8200 3850 50  0001 C CNN
F 3 "~" H 8200 3850 50  0001 C CNN
	1    8200 3850
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 613D9E16
P 7850 3850
F 0 "C1" H 7758 3804 50  0000 R CNN
F 1 "1uF" H 7758 3895 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 7850 3850 50  0001 C CNN
F 3 "~" H 7850 3850 50  0001 C CNN
	1    7850 3850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 613E0698
P 8200 4050
F 0 "#PWR0105" H 8200 3800 50  0001 C CNN
F 1 "GND" H 8205 3877 50  0000 C CNN
F 2 "" H 8200 4050 50  0001 C CNN
F 3 "" H 8200 4050 50  0001 C CNN
	1    8200 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8200 4050 8200 4000
Wire Wire Line
	7850 3950 7850 4000
Wire Wire Line
	7850 4000 8200 4000
Connection ~ 8200 4000
Wire Wire Line
	8200 4000 8200 3950
Wire Wire Line
	8200 3750 8200 3700
Wire Wire Line
	8200 3700 7850 3700
Wire Wire Line
	7850 3700 7850 3750
Wire Wire Line
	7650 3700 7850 3700
Connection ~ 7650 3700
Wire Wire Line
	7650 3700 7650 3650
Connection ~ 7850 3700
Wire Wire Line
	7550 4150 7850 4150
Wire Wire Line
	7550 4250 7850 4250
Wire Wire Line
	7550 4350 7850 4350
Text Label 7850 4150 2    50   ~ 0
MOSI
Text Label 7850 4250 2    50   ~ 0
SCLK
Text Label 7850 4350 2    50   ~ 0
SPICS
Wire Wire Line
	7550 4450 7850 4450
$Comp
L Device:C_Small C6
U 1 1 613E9715
P 7250 5250
F 0 "C6" H 7342 5296 50  0000 L CNN
F 1 "6800pF" H 7342 5205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 7250 5250 50  0001 C CNN
F 3 "~" H 7250 5250 50  0001 C CNN
	1    7250 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 613EC6F5
P 7050 5050
F 0 "R3" V 6854 5050 50  0000 C CNN
F 1 "160k" V 6945 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 7050 5050 50  0001 C CNN
F 3 "~" H 7050 5050 50  0001 C CNN
	1    7050 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 5050 7250 5050
Wire Wire Line
	7250 5050 7250 5150
Wire Wire Line
	7250 5050 7600 5050
Connection ~ 7250 5050
Wire Wire Line
	6950 5050 6750 5050
Text Label 6200 4250 0    50   ~ 0
A0
Text Label 6200 4350 0    50   ~ 0
A1
Text Label 6750 5050 0    50   ~ 0
A0
Text Label 7600 5050 2    50   ~ 0
A1
Wire Wire Line
	7250 5350 7250 5450
Text Label 4200 4350 0    50   ~ 0
CMOUT
Text Label 7250 5450 0    50   ~ 0
CMOUT
Wire Wire Line
	6200 4250 6350 4250
Wire Wire Line
	6200 4350 6350 4350
$Comp
L power:GND #PWR0106
U 1 1 6139D06D
P 6300 4450
F 0 "#PWR0106" H 6300 4200 50  0001 C CNN
F 1 "GND" V 6300 4250 50  0000 C CNN
F 2 "" H 6300 4450 50  0001 C CNN
F 3 "" H 6300 4450 50  0001 C CNN
	1    6300 4450
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 4450 6350 4450
$Comp
L Device:R_Small R1
U 1 1 613A1A47
P 3050 3700
F 0 "R1" H 3150 3750 50  0000 C CNN
F 1 "100k" H 3200 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 3050 3700 50  0001 C CNN
F 3 "~" H 3050 3700 50  0001 C CNN
	1    3050 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3800 3050 3950
Connection ~ 3050 3950
Wire Wire Line
	3050 3950 2600 3950
Wire Wire Line
	3050 3600 3050 3550
NoConn ~ 6350 4050
$Comp
L Device:C_Small C3
U 1 1 613B3308
P 5550 4150
F 0 "C3" H 5458 4104 50  0000 R CNN
F 1 "0.01uF" H 5458 4195 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 5550 4150 50  0001 C CNN
F 3 "~" H 5550 4150 50  0001 C CNN
	1    5550 4150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 4050 5550 3950
Wire Wire Line
	5550 4250 5550 4350
Wire Wire Line
	5550 4350 5950 4350
Wire Wire Line
	3150 4050 3050 4050
$Comp
L Device:C_Small C4
U 1 1 613BBBBF
P 3050 4550
F 0 "C4" H 2958 4504 50  0000 R CNN
F 1 "0.01uF" H 2958 4595 50  0000 R CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 3050 4550 50  0001 C CNN
F 3 "~" H 3050 4550 50  0001 C CNN
	1    3050 4550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 613BE2EA
P 3050 4750
F 0 "#PWR0108" H 3050 4500 50  0001 C CNN
F 1 "GND" H 3055 4577 50  0000 C CNN
F 2 "" H 3050 4750 50  0001 C CNN
F 3 "" H 3050 4750 50  0001 C CNN
	1    3050 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 4750 3050 4650
Text Label 8400 4450 2    50   ~ 0
Temp_A
$Comp
L Device:R_Small R2
U 1 1 613C0C15
P 7950 4450
F 0 "R2" V 7880 4450 50  0000 C CNN
F 1 "160k" V 8020 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 7950 4450 50  0001 C CNN
F 3 "~" H 7950 4450 50  0001 C CNN
	1    7950 4450
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C5
U 1 1 613C18B2
P 8150 4650
F 0 "C5" H 8242 4696 50  0000 L CNN
F 1 "1uF" H 8242 4605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 8150 4650 50  0001 C CNN
F 3 "~" H 8150 4650 50  0001 C CNN
	1    8150 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8050 4450 8150 4450
Wire Wire Line
	8150 4550 8150 4450
Connection ~ 8150 4450
Wire Wire Line
	8150 4450 8400 4450
$Comp
L power:GND #PWR0109
U 1 1 613C546F
P 8150 4850
F 0 "#PWR0109" H 8150 4600 50  0001 C CNN
F 1 "GND" H 8155 4677 50  0000 C CNN
F 2 "" H 8150 4850 50  0001 C CNN
F 3 "" H 8150 4850 50  0001 C CNN
	1    8150 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4850 8150 4750
Wire Wire Line
	5550 3950 6350 3950
Wire Wire Line
	5950 4150 5950 4350
Wire Wire Line
	5950 4150 6350 4150
Wire Wire Line
	3050 4050 3050 4350
Wire Wire Line
	5550 4350 3050 4350
Connection ~ 5550 4350
Connection ~ 3050 4350
Wire Wire Line
	3050 4350 3050 4450
Wire Wire Line
	5550 3950 5000 3950
Connection ~ 5550 3950
$Comp
L SamacSys_Parts:GRPB052VWVN-RC J1
U 1 1 613B2C5D
P 5450 3000
F 0 "J1" H 5800 3250 50  0000 C CNN
F 1 "GRPB052VWVN-RC" H 5800 3150 50  0000 C CNN
F 2 "SamacSys_Parts:HDRV10W50P127_2X5_635X340X430P" H 6200 3100 50  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sullins%20PDFs/GRPB_%20_2VWVN-RC%2010954-C.pdf" H 6200 3000 50  0001 L CNN
F 4 "CONN HEADER .050\" 10PS DL PCB AU" H 6200 2900 50  0001 L CNN "Description"
F 5 "4.3" H 6200 2800 50  0001 L CNN "Height"
F 6 "Sullins" H 6200 2700 50  0001 L CNN "Manufacturer_Name"
F 7 "GRPB052VWVN-RC" H 6200 2600 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "" H 6200 2500 50  0001 L CNN "Mouser Part Number"
F 9 "" H 6200 2400 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6200 2300 50  0001 L CNN "Arrow Part Number"
F 11 "" H 6200 2200 50  0001 L CNN "Arrow Price/Stock"
	1    5450 3000
	1    0    0    -1  
$EndComp
NoConn ~ 6150 3000
Wire Wire Line
	6150 3100 6500 3100
Wire Wire Line
	6150 3200 6500 3200
Text Label 6500 3100 2    50   ~ 0
MOSI
Text Label 5050 3200 0    50   ~ 0
SPICS
Text Label 6500 3200 2    50   ~ 0
SCLK
NoConn ~ 5450 3100
Wire Wire Line
	5450 3200 5050 3200
NoConn ~ 6150 3300
NoConn ~ 6150 3400
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 6145EE66
P 5000 5000
F 0 "#FLG0101" H 5000 5075 50  0001 C CNN
F 1 "PWR_FLAG" H 5000 5173 50  0000 C CNN
F 2 "" H 5000 5000 50  0001 C CNN
F 3 "~" H 5000 5000 50  0001 C CNN
	1    5000 5000
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 6145F9CA
P 5500 5000
F 0 "#FLG0102" H 5500 5075 50  0001 C CNN
F 1 "PWR_FLAG" H 5500 5173 50  0000 C CNN
F 2 "" H 5500 5000 50  0001 C CNN
F 3 "~" H 5500 5000 50  0001 C CNN
	1    5500 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 6145FFBA
P 5500 5000
F 0 "#PWR0110" H 5500 4750 50  0001 C CNN
F 1 "GND" H 5500 4850 50  0000 C CNN
F 2 "" H 5500 5000 50  0001 C CNN
F 3 "" H 5500 5000 50  0001 C CNN
	1    5500 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 613A3695
P 3050 3550
F 0 "#PWR0107" H 3050 3400 50  0001 C CNN
F 1 "+3.3V" H 2900 3700 50  0000 L CNN
F 2 "" H 3050 3550 50  0001 C CNN
F 3 "" H 3050 3550 50  0001 C CNN
	1    3050 3550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0111
U 1 1 6146287B
P 5000 5000
F 0 "#PWR0111" H 5000 4850 50  0001 C CNN
F 1 "+3.3V" H 4850 5150 50  0000 L CNN
F 2 "" H 5000 5000 50  0001 C CNN
F 3 "" H 5000 5000 50  0001 C CNN
	1    5000 5000
	-1   0    0    1   
$EndComp
$EndSCHEMATC
