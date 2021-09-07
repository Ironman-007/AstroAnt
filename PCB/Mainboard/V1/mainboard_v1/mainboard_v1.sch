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
L power:GND #PWR0101
U 1 1 610A0FF9
P 4300 4400
F 0 "#PWR0101" H 4300 4150 50  0001 C CNN
F 1 "GND" V 4305 4272 50  0000 R CNN
F 2 "" H 4300 4400 50  0001 C CNN
F 3 "" H 4300 4400 50  0001 C CNN
	1    4300 4400
	0    -1   1    0   
$EndComp
Wire Wire Line
	4250 1600 4550 1600
Text Label 4550 1600 2    50   ~ 0
SWDCLK
Text Label 4550 1700 2    50   ~ 0
SWDIO
Wire Wire Line
	4250 4400 4300 4400
Wire Wire Line
	4550 1700 4250 1700
Wire Wire Line
	1400 1000 1650 1000
Wire Wire Line
	1650 1000 1650 1200
Wire Wire Line
	1650 1200 2050 1200
Wire Wire Line
	1400 1300 2050 1300
Wire Wire Line
	2050 1400 1700 1400
Wire Wire Line
	2050 1500 1700 1500
Wire Wire Line
	2050 1600 1700 1600
Wire Wire Line
	2050 1700 1700 1700
Wire Wire Line
	2050 1800 1700 1800
Wire Wire Line
	2050 1900 1700 1900
Wire Wire Line
	2050 2000 1700 2000
Wire Wire Line
	2050 2700 1700 2700
Wire Wire Line
	2050 3200 1700 3200
Wire Wire Line
	2050 4300 1700 4300
Wire Wire Line
	4250 3700 4550 3700
Wire Wire Line
	4250 3600 4550 3600
Wire Wire Line
	4250 3500 4550 3500
Wire Wire Line
	2050 2600 1700 2600
Wire Wire Line
	2050 2800 1700 2800
Wire Wire Line
	4250 3200 4550 3200
Wire Wire Line
	4250 3100 4550 3100
Wire Wire Line
	4250 3000 4550 3000
Wire Wire Line
	4250 2800 4550 2800
Wire Wire Line
	4250 2700 4550 2700
Wire Wire Line
	4250 2600 4550 2600
$Comp
L power:+3.3V #PWR0104
U 1 1 610D5F62
P 5100 900
F 0 "#PWR0104" H 5100 750 50  0001 C CNN
F 1 "+3.3V" H 5100 1050 50  0000 C CNN
F 2 "" H 5100 900 50  0001 C CNN
F 3 "" H 5100 900 50  0001 C CNN
	1    5100 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 610DFA9A
P 4800 1400
F 0 "C2" H 4700 1300 50  0000 C CNN
F 1 "10uF" H 4650 1500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4800 1400 50  0001 C CNN
F 3 "~" H 4800 1400 50  0001 C CNN
	1    4800 1400
	-1   0    0    1   
$EndComp
$Comp
L Device:L_Small L1
U 1 1 610E3BBE
P 4500 1000
F 0 "L1" V 4450 910 50  0000 C CNN
F 1 "10uH" V 4450 1110 50  0000 C CNN
F 2 "Inductor_SMD:L_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4500 1000 50  0001 C CNN
F 3 "~" H 4500 1000 50  0001 C CNN
	1    4500 1000
	0    1    1    0   
$EndComp
Wire Wire Line
	4800 1300 4800 1200
Text Label 1700 3000 0    50   ~ 0
~RESET
$Comp
L Connector:USB_B_Micro J2
U 1 1 61106452
P 1000 6700
F 0 "J2" H 1057 7167 50  0000 C CNN
F 1 "USB_B_Micro" H 1057 7076 50  0000 C CNN
F 2 "Connector_USB:USB_Micro-B_Amphenol_10104110_Horizontal" H 1150 6650 50  0001 C CNN
F 3 "~" H 1150 6650 50  0001 C CNN
	1    1000 6700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 6110A8BE
P 900 7200
F 0 "#PWR0107" H 900 6950 50  0001 C CNN
F 1 "GND" H 905 7027 50  0000 C CNN
F 2 "" H 900 7200 50  0001 C CNN
F 3 "" H 900 7200 50  0001 C CNN
	1    900  7200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	900  7200 900  7150
Wire Wire Line
	900  7150 1000 7150
Wire Wire Line
	1000 7150 1000 7100
Connection ~ 900  7150
Wire Wire Line
	900  7150 900  7100
NoConn ~ 1300 6900
Wire Wire Line
	1300 6700 1600 6700
Wire Wire Line
	1300 6800 1600 6800
Wire Wire Line
	1300 6500 1500 6500
Wire Wire Line
	1500 6500 1500 6450
Text Label 1600 6700 2    50   ~ 0
USB+
Text Label 1600 6800 2    50   ~ 0
USB-
$Comp
L power:VBUS #PWR0108
U 1 1 6111499E
P 1500 6450
F 0 "#PWR0108" H 1500 6300 50  0001 C CNN
F 1 "VBUS" H 1515 6623 50  0000 C CNN
F 2 "" H 1500 6450 50  0001 C CNN
F 3 "" H 1500 6450 50  0001 C CNN
	1    1500 6450
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR0109
U 1 1 611153F4
P 1850 6850
F 0 "#PWR0109" H 1850 6700 50  0001 C CNN
F 1 "VBUS" H 1865 7023 50  0000 C CNN
F 2 "" H 1850 6850 50  0001 C CNN
F 3 "" H 1850 6850 50  0001 C CNN
	1    1850 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 6900 1850 6850
$Comp
L Regulator_Linear:AP2112K-3.3 U4
U 1 1 6113B43C
P 6050 5900
F 0 "U4" H 6050 6242 50  0000 C CNN
F 1 "AP2112K-3.3" H 6050 6151 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 6050 6225 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 6050 6000 50  0001 C CNN
	1    6050 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 61142727
P 6050 6300
F 0 "#PWR0111" H 6050 6050 50  0001 C CNN
F 1 "GND" H 6055 6127 50  0000 C CNN
F 2 "" H 6050 6300 50  0001 C CNN
F 3 "" H 6050 6300 50  0001 C CNN
	1    6050 6300
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6050 6300 6050 6250
Wire Wire Line
	6350 5800 6400 5800
Wire Wire Line
	6400 5800 6400 5750
$Comp
L power:+3.3V #PWR0112
U 1 1 61146D40
P 6400 5750
F 0 "#PWR0112" H 6400 5600 50  0001 C CNN
F 1 "+3.3V" H 6415 5923 50  0000 C CNN
F 2 "" H 6400 5750 50  0001 C CNN
F 3 "" H 6400 5750 50  0001 C CNN
	1    6400 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 5800 5550 5800
Wire Wire Line
	5750 5900 5550 5900
Wire Wire Line
	5550 5900 5550 5800
$Comp
L Device:C_Small C10
U 1 1 6114BD75
P 6400 5950
F 0 "C10" H 6300 5850 50  0000 C CNN
F 1 "10uF" H 6250 6050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6400 5950 50  0001 C CNN
F 3 "~" H 6400 5950 50  0001 C CNN
	1    6400 5950
	-1   0    0    1   
$EndComp
Wire Wire Line
	6400 5850 6400 5800
Connection ~ 6400 5800
Wire Wire Line
	6050 6250 6400 6250
Wire Wire Line
	6400 6250 6400 6050
Connection ~ 6050 6250
Wire Wire Line
	6050 6250 6050 6200
$Comp
L Device:C_Small C11
U 1 1 6115E271
P 5550 6050
F 0 "C11" H 5650 5950 50  0000 C CNN
F 1 "0.1uF" H 5700 6150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5550 6050 50  0001 C CNN
F 3 "~" H 5550 6050 50  0001 C CNN
	1    5550 6050
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 5950 5550 5900
Connection ~ 5550 5900
Wire Wire Line
	5550 6150 5550 6250
Wire Wire Line
	5550 6250 6050 6250
$Comp
L Switch:SW_SPDT SW1
U 1 1 611AB11B
P 4700 5700
F 0 "SW1" H 4700 6000 50  0000 C CNN
F 1 "SW_SPDT" H 4700 5900 50  0000 C CNN
F 2 "Button_Switch_SMD:SW_SPDT_PCM12" H 4700 5700 50  0001 C CNN
F 3 "~" H 4700 5700 50  0001 C CNN
	1    4700 5700
	1    0    0    -1  
$EndComp
Connection ~ 5550 5800
NoConn ~ 4900 5600
$Comp
L power:VPP #PWR0117
U 1 1 611B5E24
P 4450 5700
F 0 "#PWR0117" H 4450 5550 50  0001 C CNN
F 1 "VPP" V 4465 5827 50  0000 L CNN
F 2 "" H 4450 5700 50  0001 C CNN
F 3 "" H 4450 5700 50  0001 C CNN
	1    4450 5700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4450 5700 4500 5700
$Comp
L Device:R_Small R1
U 1 1 611C6859
P 2800 4850
F 0 "R1" V 2700 4850 50  0000 C CNN
F 1 "100k" V 2900 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 2800 4850 50  0001 C CNN
F 3 "~" H 2800 4850 50  0001 C CNN
	1    2800 4850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 611C9E4C
P 3400 4850
F 0 "R2" V 3300 4850 50  0000 C CNN
F 1 "100k" V 3500 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 3400 4850 50  0001 C CNN
F 3 "~" H 3400 4850 50  0001 C CNN
	1    3400 4850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 611CB665
P 3600 4850
F 0 "#PWR0118" H 3600 4600 50  0001 C CNN
F 1 "GND" V 3605 4722 50  0000 R CNN
F 2 "" H 3600 4850 50  0001 C CNN
F 3 "" H 3600 4850 50  0001 C CNN
	1    3600 4850
	0    -1   1    0   
$EndComp
$Comp
L power:VPP #PWR0119
U 1 1 611CD057
P 2600 4850
F 0 "#PWR0119" H 2600 4700 50  0001 C CNN
F 1 "VPP" V 2615 4977 50  0000 L CNN
F 2 "" H 2600 4850 50  0001 C CNN
F 3 "" H 2600 4850 50  0001 C CNN
	1    2600 4850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2600 4850 2700 4850
Wire Wire Line
	2900 4850 3300 4850
Wire Wire Line
	3500 4850 3600 4850
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J1
U 1 1 611EF028
P 2050 6200
F 0 "J1" V 1825 6208 50  0000 C CNN
F 1 "22-23-2021" V 1916 6208 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_1x02_P1.27mm_Vertical" H 2250 6400 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 2250 6500 60  0001 L CNN
F 4 "WM4200-ND" H 2250 6600 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 2250 6700 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 2250 6800 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 2250 6900 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 2250 7000 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 2250 7100 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 2250 7200 60  0001 L CNN "Description"
F 11 "Molex" H 2250 7300 60  0001 L CNN "Manufacturer"
F 12 "Active" H 2250 7400 60  0001 L CNN "Status"
	1    2050 6200
	0    1    1    0   
$EndComp
$Comp
L power:VPP #PWR0120
U 1 1 611F5447
P 2250 6200
F 0 "#PWR0120" H 2250 6050 50  0001 C CNN
F 1 "VPP" V 2265 6328 50  0000 L CNN
F 2 "" H 2250 6200 50  0001 C CNN
F 3 "" H 2250 6200 50  0001 C CNN
	1    2250 6200
	0    1    1    0   
$EndComp
Wire Wire Line
	2150 6200 2250 6200
$Comp
L power:GND #PWR0121
U 1 1 611FA929
P 2250 6300
F 0 "#PWR0121" H 2250 6050 50  0001 C CNN
F 1 "GND" V 2255 6172 50  0000 R CNN
F 2 "" H 2250 6300 50  0001 C CNN
F 3 "" H 2250 6300 50  0001 C CNN
	1    2250 6300
	0    -1   1    0   
$EndComp
Wire Wire Line
	2250 6300 2150 6300
$Comp
L Device:LED D3
U 1 1 61242DE4
P 5550 5300
F 0 "D3" V 5497 5380 50  0000 L CNN
F 1 "LED" V 5588 5380 50  0000 L CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5550 5300 50  0001 C CNN
F 3 "~" H 5550 5300 50  0001 C CNN
	1    5550 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	5550 5700 5550 5800
$Comp
L Device:R_Small R5
U 1 1 6124B72D
P 5550 5600
F 0 "R5" V 5450 5600 50  0000 C CNN
F 1 "1k" V 5650 5600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 5550 5600 50  0001 C CNN
F 3 "~" H 5550 5600 50  0001 C CNN
	1    5550 5600
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 5500 5550 5450
$Comp
L power:GND #PWR0122
U 1 1 6124FD6B
P 5550 5100
F 0 "#PWR0122" H 5550 4850 50  0001 C CNN
F 1 "GND" H 5555 4927 50  0000 C CNN
F 2 "" H 5550 5100 50  0001 C CNN
F 3 "" H 5550 5100 50  0001 C CNN
	1    5550 5100
	1    0    0    1   
$EndComp
Wire Wire Line
	5550 5150 5550 5100
$Comp
L Device:LED D1
U 1 1 61257DE5
P 3250 5200
F 0 "D1" H 3250 5100 50  0000 C CNN
F 1 "LED" H 3250 5300 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3250 5200 50  0001 C CNN
F 3 "~" H 3250 5200 50  0001 C CNN
	1    3250 5200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 6125FEB8
P 3500 5200
F 0 "#PWR0123" H 3500 4950 50  0001 C CNN
F 1 "GND" V 3505 5072 50  0000 R CNN
F 2 "" H 3500 5200 50  0001 C CNN
F 3 "" H 3500 5200 50  0001 C CNN
	1    3500 5200
	0    -1   1    0   
$EndComp
Wire Wire Line
	3500 5200 3400 5200
$Comp
L Device:R_Small R3
U 1 1 612630BC
P 2900 5200
F 0 "R3" V 2800 5200 50  0000 C CNN
F 1 "1k" V 3000 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 2900 5200 50  0001 C CNN
F 3 "~" H 2900 5200 50  0001 C CNN
	1    2900 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 5200 3100 5200
Wire Wire Line
	2800 5200 2550 5200
$Comp
L Device:LED D2
U 1 1 61274AC0
P 3250 5550
F 0 "D2" H 3250 5450 50  0000 C CNN
F 1 "LED" H 3250 5650 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 3250 5550 50  0001 C CNN
F 3 "~" H 3250 5550 50  0001 C CNN
	1    3250 5550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 61274AC6
P 3500 5550
F 0 "#PWR0124" H 3500 5300 50  0001 C CNN
F 1 "GND" V 3505 5422 50  0000 R CNN
F 2 "" H 3500 5550 50  0001 C CNN
F 3 "" H 3500 5550 50  0001 C CNN
	1    3500 5550
	0    -1   1    0   
$EndComp
Wire Wire Line
	3500 5550 3400 5550
$Comp
L Device:R_Small R4
U 1 1 61274ACD
P 2900 5550
F 0 "R4" V 2800 5550 50  0000 C CNN
F 1 "1k" V 3000 5550 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 2900 5550 50  0001 C CNN
F 3 "~" H 2900 5550 50  0001 C CNN
	1    2900 5550
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 5550 3100 5550
Wire Wire Line
	2800 5550 2550 5550
Text Label 2550 5200 0    50   ~ 0
LED1
Text Label 2550 5550 0    50   ~ 0
LED2
Text Label 4550 3600 2    50   ~ 0
D10
Text Label 1700 2400 0    50   ~ 0
SDA
Text Label 1700 2300 0    50   ~ 0
SCL
Text Label 1700 2700 0    50   ~ 0
MISO
Text Label 1700 2500 0    50   ~ 0
MOSI
$Comp
L MDBT50Q-1MV2:MDBT50Q-1MV2 U1
U 1 1 61134557
P 3150 2700
F 0 "U1" H 3150 4667 50  0000 C CNN
F 1 "MDBT50Q-1MV2" H 3150 4576 50  0000 C CNN
F 2 "Mylib:XCVR_MDBT50Q-1MV2" H 3150 2700 50  0001 L BNN
F 3 "" H 3150 2700 50  0001 L BNN
F 4 "2.05mm" H 3150 2700 50  0001 L BNN "MAXIMUM_PACKAGE_HIEGHT"
F 5 "RAYTAC" H 3150 2700 50  0001 L BNN "MANUFACTURER"
F 6 "H" H 3150 2700 50  0001 L BNN "PARTREV"
F 7 "Manufacturer Recommendations" H 3150 2700 50  0001 L BNN "STANDARD"
	1    3150 2700
	1    0    0    -1  
$EndComp
NoConn ~ 2050 2100
Wire Wire Line
	4600 2000 5000 2000
Wire Wire Line
	4600 2100 5000 2100
Text Label 5000 2000 2    50   ~ 0
USB+
Text Label 5000 2100 2    50   ~ 0
USB-
$Comp
L Device:R_Small R8
U 1 1 6124EC9D
P 4500 2000
F 0 "R8" V 4450 1830 50  0000 C CNN
F 1 "27" V 4460 2130 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 4500 2000 50  0001 C CNN
F 3 "~" H 4500 2000 50  0001 C CNN
	1    4500 2000
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R9
U 1 1 6124FCE2
P 4500 2100
F 0 "R9" V 4460 1930 50  0000 C CNN
F 1 "27" V 4460 2230 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 4500 2100 50  0001 C CNN
F 3 "~" H 4500 2100 50  0001 C CNN
	1    4500 2100
	0    1    1    0   
$EndComp
Wire Wire Line
	4400 2000 4250 2000
Wire Wire Line
	4250 2100 4400 2100
Wire Wire Line
	5100 900  5100 1000
$Comp
L power:VBUS #PWR0105
U 1 1 612D2610
P 4350 1300
F 0 "#PWR0105" H 4350 1150 50  0001 C CNN
F 1 "VBUS" V 4350 1520 50  0000 C CNN
F 2 "" H 4350 1300 50  0001 C CNN
F 3 "" H 4350 1300 50  0001 C CNN
	1    4350 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 1300 4250 1300
Wire Wire Line
	2050 2500 1700 2500
Text Label 1700 2600 0    50   ~ 0
SCK
Wire Wire Line
	4250 2900 4550 2900
Wire Wire Line
	4250 3300 4550 3300
Wire Wire Line
	4250 3400 4550 3400
Wire Wire Line
	4250 4100 4550 4100
Wire Wire Line
	4250 4000 4550 4000
Wire Wire Line
	4250 3900 4550 3900
Wire Wire Line
	1700 4100 2050 4100
Wire Wire Line
	1700 4000 2050 4000
Wire Wire Line
	2050 4200 1700 4200
Wire Wire Line
	1700 3900 2050 3900
Wire Wire Line
	1700 3800 2050 3800
Wire Wire Line
	1700 3700 2050 3700
Wire Wire Line
	1700 3600 2050 3600
Wire Wire Line
	1700 3500 2050 3500
Wire Wire Line
	1700 3400 2050 3400
Wire Wire Line
	1700 3100 2050 3100
Wire Wire Line
	1700 3300 2050 3300
Wire Wire Line
	1700 2900 2050 2900
Wire Wire Line
	1700 2400 2050 2400
Wire Wire Line
	1700 2300 2050 2300
$Comp
L MPU6050:MPU6050 U5
U 1 1 614DE35B
P 9200 2150
F 0 "U5" H 9200 3417 50  0000 C CNN
F 1 "MPU6050" H 9200 3326 50  0000 C CNN
F 2 "Mylib:IC_MPU6050" H 9200 2150 50  0001 L BNN
F 3 "" H 9200 2150 50  0001 L BNN
F 4 "0.95 mm" H 9200 2150 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
F 5 "TDK InvenSense" H 9200 2150 50  0001 L BNN "MANUFACTURER"
F 6 "3.4" H 9200 2150 50  0001 L BNN "PARTREV"
F 7 "Manufacturer Recommendations" H 9200 2150 50  0001 L BNN "STANDARD"
	1    9200 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 614E9B30
P 10200 3250
F 0 "#PWR0125" H 10200 3000 50  0001 C CNN
F 1 "GND" V 10205 3122 50  0000 R CNN
F 2 "" H 10200 3250 50  0001 C CNN
F 3 "" H 10200 3250 50  0001 C CNN
	1    10200 3250
	0    -1   1    0   
$EndComp
Wire Wire Line
	10100 3250 10150 3250
Wire Wire Line
	10100 3150 10150 3150
Wire Wire Line
	10150 3150 10150 3250
Connection ~ 10150 3250
Wire Wire Line
	10150 3250 10200 3250
$Comp
L power:GND #PWR0126
U 1 1 61502F07
P 8200 1750
F 0 "#PWR0126" H 8200 1500 50  0001 C CNN
F 1 "GND" V 8205 1622 50  0000 R CNN
F 2 "" H 8200 1750 50  0001 C CNN
F 3 "" H 8200 1750 50  0001 C CNN
	1    8200 1750
	0    1    -1   0   
$EndComp
Wire Wire Line
	8300 1750 8250 1750
NoConn ~ 8300 1450
Wire Wire Line
	8300 1550 8250 1550
Wire Wire Line
	8250 1550 8250 1750
Connection ~ 8250 1750
Wire Wire Line
	8250 1750 8200 1750
Text Label 8100 1950 0    50   ~ 0
SCL
Text Label 8100 2050 0    50   ~ 0
SDA
Wire Wire Line
	10100 1150 10150 1150
Wire Wire Line
	10100 1250 10150 1250
Wire Wire Line
	10150 1250 10150 1150
Connection ~ 10150 950 
Wire Wire Line
	10150 900  10150 950 
Wire Wire Line
	10500 950  10500 1250
Wire Wire Line
	10450 950  10500 950 
Wire Wire Line
	10150 1250 10250 1250
Wire Wire Line
	10150 950  10150 1150
Wire Wire Line
	10250 950  10150 950 
$Comp
L Device:C_Small C1
U 1 1 61544CF1
P 10350 950
F 0 "C1" V 10300 840 50  0000 C CNN
F 1 "0.1uF" V 10300 1090 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10350 950 50  0001 C CNN
F 3 "~" H 10350 950 50  0001 C CNN
	1    10350 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	10450 1250 10500 1250
$Comp
L power:GND #PWR0127
U 1 1 6152C47E
P 10600 950
F 0 "#PWR0127" H 10600 700 50  0001 C CNN
F 1 "GND" V 10600 750 50  0000 C CNN
F 2 "" H 10600 950 50  0001 C CNN
F 3 "" H 10600 950 50  0001 C CNN
	1    10600 950 
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 6152C478
P 10350 1250
F 0 "C3" V 10300 1140 50  0000 C CNN
F 1 "10000pF" V 10410 1460 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10350 1250 50  0001 C CNN
F 3 "~" H 10350 1250 50  0001 C CNN
	1    10350 1250
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0128
U 1 1 615261BA
P 10150 900
F 0 "#PWR0128" H 10150 750 50  0001 C CNN
F 1 "+3.3V" H 10150 1050 50  0000 C CNN
F 2 "" H 10150 900 50  0001 C CNN
F 3 "" H 10150 900 50  0001 C CNN
	1    10150 900 
	1    0    0    -1  
$EndComp
Connection ~ 10150 1150
Connection ~ 10150 1250
Wire Wire Line
	10100 1450 10500 1450
Text Label 10500 1450 2    50   ~ 0
INT_IMU
Wire Wire Line
	10600 950  10500 950 
Connection ~ 10500 950 
$Comp
L Device:C_Small C4
U 1 1 6159F04D
P 10300 1650
F 0 "C4" V 10250 1530 50  0000 C CNN
F 1 "0.1uF" V 10250 1790 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10300 1650 50  0001 C CNN
F 3 "~" H 10300 1650 50  0001 C CNN
	1    10300 1650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 615A6A1E
P 10700 1650
F 0 "#PWR0129" H 10700 1400 50  0001 C CNN
F 1 "GND" V 10700 1450 50  0000 C CNN
F 2 "" H 10700 1650 50  0001 C CNN
F 3 "" H 10700 1650 50  0001 C CNN
	1    10700 1650
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 615AF6D3
P 10300 1850
F 0 "C7" V 10250 1730 50  0000 C CNN
F 1 "2200pF" V 10250 2030 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 10300 1850 50  0001 C CNN
F 3 "~" H 10300 1850 50  0001 C CNN
	1    10300 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 1750 10100 1850
Wire Wire Line
	10650 1850 10650 1650
Connection ~ 10650 1650
Wire Wire Line
	10650 1650 10700 1650
Wire Wire Line
	10100 1650 10200 1650
Wire Wire Line
	10100 1850 10200 1850
Wire Wire Line
	10400 1650 10650 1650
Wire Wire Line
	10400 1850 10650 1850
NoConn ~ 10100 1950
NoConn ~ 10100 2050
NoConn ~ 10100 2250
NoConn ~ 10100 2650
NoConn ~ 8300 2250
NoConn ~ 8300 2350
NoConn ~ 8300 2450
NoConn ~ 8300 2550
NoConn ~ 8300 2650
NoConn ~ 8300 2750
NoConn ~ 8300 2850
NoConn ~ 8300 2950
$Comp
L Device:C_Small C12
U 1 1 6183D1B1
P 7750 4750
F 0 "C12" V 7700 4600 50  0000 C CNN
F 1 "0.1uF" V 7700 4890 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 7750 4750 50  0001 C CNN
F 3 "~" H 7750 4750 50  0001 C CNN
	1    7750 4750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 6183D1B7
P 8000 4750
F 0 "#PWR0135" H 8000 4500 50  0001 C CNN
F 1 "GND" V 8000 4550 50  0000 C CNN
F 2 "" H 8000 4750 50  0001 C CNN
F 3 "" H 8000 4750 50  0001 C CNN
	1    8000 4750
	0    -1   1    0   
$EndComp
Wire Wire Line
	8000 4750 7850 4750
$Comp
L Mechanical:MountingHole H3
U 1 1 61487D0A
P 9000 6100
F 0 "H3" H 9100 6146 50  0000 L CNN
F 1 "M2" H 9100 6055 50  0000 L CNN
F 2 "Mylib:mounthole_1.8mm" H 9000 6100 50  0001 C CNN
F 3 "~" H 9000 6100 50  0001 C CNN
	1    9000 6100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 614823BA
P 8500 6100
F 0 "H2" H 8600 6146 50  0000 L CNN
F 1 "M2" H 8600 6055 50  0000 L CNN
F 2 "Mylib:mounthole_1.8mm" H 8500 6100 50  0001 C CNN
F 3 "~" H 8500 6100 50  0001 C CNN
	1    8500 6100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 614800C7
P 8000 6100
F 0 "H1" H 8100 6146 50  0000 L CNN
F 1 "M2" H 8100 6055 50  0000 L CNN
F 2 "Mylib:mounthole_1.8mm" H 8000 6100 50  0001 C CNN
F 3 "~" H 8000 6100 50  0001 C CNN
	1    8000 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 5800 5050 5800
Wire Wire Line
	5050 5950 5050 5800
Connection ~ 5050 5800
Wire Wire Line
	5050 6450 5050 6550
$Comp
L M50-3100545:M50-3100545 J5
U 1 1 611A8C86
P 6400 1400
F 0 "J5" H 6400 1867 50  0000 C CNN
F 1 "20021321-00010C4LF" H 6400 1776 50  0000 C CNN
F 2 "SnapEDA Library:HARWIN_M50-3100545" H 6400 1400 50  0001 L BNN
F 3 "" H 6400 1400 50  0001 L BNN
F 4 "08.01.13" H 6400 1400 50  0001 L BNN "PARTREV"
F 5 "Harwin Inc." H 6400 1400 50  0001 L BNN "MANUFACTURER"
F 6 "Manufacturer Recommendations" H 6400 1400 50  0001 L BNN "STANDARD"
F 7 "4.85 mm" H 6400 1400 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
	1    6400 1400
	1    0    0    -1  
$EndComp
$Comp
L M50-3100545:M50-3100545 J7
U 1 1 611C028D
P 6400 2350
F 0 "J7" H 6400 2817 50  0000 C CNN
F 1 "20021321-00010C4LF" H 6400 2726 50  0000 C CNN
F 2 "SnapEDA Library:HARWIN_M50-3100545" H 6400 2350 50  0001 L BNN
F 3 "" H 6400 2350 50  0001 L BNN
F 4 "08.01.13" H 6400 2350 50  0001 L BNN "PARTREV"
F 5 "Harwin Inc." H 6400 2350 50  0001 L BNN "MANUFACTURER"
F 6 "Manufacturer Recommendations" H 6400 2350 50  0001 L BNN "STANDARD"
F 7 "4.85 mm" H 6400 2350 50  0001 L BNN "MAXIMUM_PACKAGE_HEIGHT"
	1    6400 2350
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:1734592-6 J8
U 1 1 613C9BA7
P 9450 5150
F 0 "J8" H 9900 5415 50  0000 C CNN
F 1 "1734592-6" H 9900 5324 50  0000 C CNN
F 2 "SamacSys_Parts:17345926" H 10200 5250 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1734592&DocType=Customer+Drawing&DocLang=English&DocFormat=pdf&PartCntxt=1-1734592-6" H 10200 5150 50  0001 L CNN
F 4 "FFC & FPC Connectors FPC CONN. 0.5MM PITCH B/C 6P" H 10200 5050 50  0001 L CNN "Description"
F 5 "2" H 10200 4950 50  0001 L CNN "Height"
F 6 "TE Connectivity" H 10200 4850 50  0001 L CNN "Manufacturer_Name"
F 7 "1734592-6" H 10200 4750 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "571-1734592-6" H 10200 4650 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/TE-Connectivity/1734592-6?qs=n3Ybsy482HHDh9IzLv%252BLHw%3D%3D" H 10200 4550 50  0001 L CNN "Mouser Price/Stock"
F 10 "1734592-6" H 10200 4450 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1734592-6/te-connectivity?region=nac" H 10200 4350 50  0001 L CNN "Arrow Price/Stock"
	1    9450 5150
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:1734592-6 J3
U 1 1 613C9F96
P 9450 3950
F 0 "J3" H 9900 4215 50  0000 C CNN
F 1 "1734592-6" H 9900 4124 50  0000 C CNN
F 2 "SamacSys_Parts:17345926" H 10200 4050 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1734592&DocType=Customer+Drawing&DocLang=English&DocFormat=pdf&PartCntxt=1-1734592-6" H 10200 3950 50  0001 L CNN
F 4 "FFC & FPC Connectors FPC CONN. 0.5MM PITCH B/C 6P" H 10200 3850 50  0001 L CNN "Description"
F 5 "2" H 10200 3750 50  0001 L CNN "Height"
F 6 "TE Connectivity" H 10200 3650 50  0001 L CNN "Manufacturer_Name"
F 7 "1734592-6" H 10200 3550 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "571-1734592-6" H 10200 3450 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/TE-Connectivity/1734592-6?qs=n3Ybsy482HHDh9IzLv%252BLHw%3D%3D" H 10200 3350 50  0001 L CNN "Mouser Price/Stock"
F 10 "1734592-6" H 10200 3250 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1734592-6/te-connectivity?region=nac" H 10200 3150 50  0001 L CNN "Arrow Price/Stock"
	1    9450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4250 1200 4800 1200
Wire Wire Line
	4400 1000 4250 1000
Connection ~ 4800 1200
$Comp
L Device:C_Small C14
U 1 1 613980B1
P 5100 1400
F 0 "C14" H 5000 1300 50  0000 C CNN
F 1 "10uF" H 4950 1500 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5100 1400 50  0001 C CNN
F 3 "~" H 5100 1400 50  0001 C CNN
	1    5100 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 1300 5100 1200
Wire Wire Line
	5100 1200 4800 1200
Wire Wire Line
	5100 1550 5100 1500
Wire Wire Line
	4800 1500 4800 1550
$Comp
L power:GND #PWR0106
U 1 1 610E0127
P 4800 1600
F 0 "#PWR0106" H 4800 1350 50  0001 C CNN
F 1 "GND" H 4800 1450 50  0000 C CNN
F 2 "" H 4800 1600 50  0001 C CNN
F 3 "" H 4800 1600 50  0001 C CNN
	1    4800 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 1550 4800 1550
Connection ~ 4800 1550
Wire Wire Line
	4800 1550 4800 1600
Wire Wire Line
	4600 1000 5100 1000
Wire Wire Line
	4250 1100 5100 1100
Wire Wire Line
	5100 1100 5100 1000
Connection ~ 5100 1000
Wire Wire Line
	5100 1200 5100 1100
Connection ~ 5100 1200
Connection ~ 5100 1100
$Comp
L power:VBUS #PWR01
U 1 1 6142F3A8
P 4150 700
F 0 "#PWR01" H 4150 550 50  0001 C CNN
F 1 "VBUS" V 4150 910 50  0000 C CNN
F 2 "" H 4150 700 50  0001 C CNN
F 3 "" H 4150 700 50  0001 C CNN
	1    4150 700 
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C15
U 1 1 6142F3AE
P 4300 700
F 0 "C15" V 4250 590 50  0000 C CNN
F 1 "10uF" V 4250 830 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4300 700 50  0001 C CNN
F 3 "~" H 4300 700 50  0001 C CNN
	1    4300 700 
	0    1    1    0   
$EndComp
Wire Wire Line
	4200 700  4150 700 
Wire Wire Line
	4400 700  4500 700 
$Comp
L power:GND #PWR02
U 1 1 6142F3B6
P 4500 700
F 0 "#PWR02" H 4500 450 50  0001 C CNN
F 1 "GND" V 4500 500 50  0000 C CNN
F 2 "" H 4500 700 50  0001 C CNN
F 3 "" H 4500 700 50  0001 C CNN
	1    4500 700 
	0    -1   1    0   
$EndComp
Wire Wire Line
	5900 1200 5650 1200
Wire Wire Line
	5900 1300 5650 1300
Wire Wire Line
	5900 1400 5650 1400
Wire Wire Line
	5900 1500 5650 1500
Wire Wire Line
	5650 1600 5900 1600
Wire Wire Line
	6900 1200 6950 1200
Wire Wire Line
	7150 1300 6900 1300
Wire Wire Line
	7150 1400 6900 1400
Wire Wire Line
	7150 1500 6900 1500
Wire Wire Line
	6950 1600 6900 1600
Wire Wire Line
	7150 2150 6900 2150
Wire Wire Line
	7150 2250 6900 2250
Wire Wire Line
	7150 2350 6900 2350
Wire Wire Line
	7150 2450 6900 2450
Wire Wire Line
	7150 2550 6900 2550
Wire Wire Line
	5650 2250 5900 2250
Wire Wire Line
	5650 2350 5900 2350
Wire Wire Line
	5650 2450 5900 2450
Wire Wire Line
	5850 2550 5900 2550
$Comp
L power:GND #PWR0139
U 1 1 618940BF
P 9350 3950
F 0 "#PWR0139" H 9350 3700 50  0001 C CNN
F 1 "GND" V 9350 3750 50  0000 C CNN
F 2 "" H 9350 3950 50  0001 C CNN
F 3 "" H 9350 3950 50  0001 C CNN
	1    9350 3950
	0    1    -1   0   
$EndComp
Wire Wire Line
	9350 3950 9400 3950
Wire Wire Line
	9450 4050 9400 4050
Wire Wire Line
	9400 4050 9400 3950
Connection ~ 9400 3950
Wire Wire Line
	9400 3950 9450 3950
$Comp
L power:GND #PWR0140
U 1 1 618BB5EA
P 9350 5150
F 0 "#PWR0140" H 9350 4900 50  0001 C CNN
F 1 "GND" V 9350 4950 50  0000 C CNN
F 2 "" H 9350 5150 50  0001 C CNN
F 3 "" H 9350 5150 50  0001 C CNN
	1    9350 5150
	0    1    -1   0   
$EndComp
Wire Wire Line
	9350 5150 9400 5150
Wire Wire Line
	9450 5250 9400 5250
Wire Wire Line
	9400 5250 9400 5150
Connection ~ 9400 5150
Wire Wire Line
	9400 5150 9450 5150
Wire Wire Line
	10750 5350 10350 5350
Wire Wire Line
	10750 5450 10350 5450
Wire Wire Line
	10750 4250 10350 4250
Wire Wire Line
	10750 4150 10350 4150
Wire Wire Line
	5250 3600 5200 3600
$Comp
L power:GND #PWR0142
U 1 1 61CBCBEF
P 4000 6300
F 0 "#PWR0142" H 4000 6050 50  0001 C CNN
F 1 "GND" V 4000 6100 50  0000 C CNN
F 2 "" H 4000 6300 50  0001 C CNN
F 3 "" H 4000 6300 50  0001 C CNN
	1    4000 6300
	0    -1   1    0   
$EndComp
Wire Wire Line
	3900 6300 4000 6300
$Comp
L Device:C_Small C16
U 1 1 61CBCBE7
P 3800 6300
F 0 "C16" V 3750 6170 50  0000 C CNN
F 1 "10uF" V 3750 6440 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3800 6300 50  0001 C CNN
F 3 "~" H 3800 6300 50  0001 C CNN
	1    3800 6300
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R7
U 1 1 61172B5F
P 3750 6750
F 0 "R7" V 3650 6750 50  0000 C CNN
F 1 "1k" V 3850 6750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 3750 6750 50  0001 C CNN
F 3 "~" H 3750 6750 50  0001 C CNN
	1    3750 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 6750 4250 6750
Wire Wire Line
	4300 6700 4300 6750
$Comp
L power:VBUS #PWR0116
U 1 1 611800C4
P 4300 6700
F 0 "#PWR0116" H 4300 6550 50  0001 C CNN
F 1 "VBUS" H 4315 6873 50  0000 C CNN
F 2 "" H 4300 6700 50  0001 C CNN
F 3 "" H 4300 6700 50  0001 C CNN
	1    4300 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6400 3150 6450
$Comp
L power:VBUS #PWR0115
U 1 1 6117D02A
P 3150 6400
F 0 "#PWR0115" H 3150 6250 50  0001 C CNN
F 1 "VBUS" H 3165 6573 50  0000 C CNN
F 2 "" H 3150 6400 50  0001 C CNN
F 3 "" H 3150 6400 50  0001 C CNN
	1    3150 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 6750 3850 6750
$Comp
L Device:LED D4
U 1 1 611757E2
P 4100 6750
F 0 "D4" H 4093 6967 50  0000 C CNN
F 1 "LED" H 4093 6876 50  0000 C CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 4100 6750 50  0001 C CNN
F 3 "~" H 4100 6750 50  0001 C CNN
	1    4100 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 6750 3650 6750
Wire Wire Line
	3150 7100 3150 7050
Connection ~ 3150 7100
Wire Wire Line
	2350 7100 3150 7100
Wire Wire Line
	2350 6750 2350 7100
Wire Wire Line
	2450 6750 2350 6750
Wire Wire Line
	2750 6750 2650 6750
$Comp
L Device:R_Small R6
U 1 1 6116C65C
P 2550 6750
F 0 "R6" V 2450 6750 50  0000 C CNN
F 1 "4.99k" V 2650 6750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 2550 6750 50  0001 C CNN
F 3 "~" H 2550 6750 50  0001 C CNN
	1    2550 6750
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 6650 3600 6650
$Comp
L power:VPP #PWR0114
U 1 1 61168EDF
P 3600 6200
F 0 "#PWR0114" H 3600 6050 50  0001 C CNN
F 1 "VPP" H 3615 6373 50  0000 C CNN
F 2 "" H 3600 6200 50  0001 C CNN
F 3 "" H 3600 6200 50  0001 C CNN
	1    3600 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 7150 3150 7100
$Comp
L power:GND #PWR0113
U 1 1 61166166
P 3150 7150
F 0 "#PWR0113" H 3150 6900 50  0001 C CNN
F 1 "GND" H 3155 6977 50  0000 C CNN
F 2 "" H 3150 7150 50  0001 C CNN
F 3 "" H 3150 7150 50  0001 C CNN
	1    3150 7150
	-1   0    0    -1  
$EndComp
$Comp
L dk_PMIC-Battery-Chargers:MCP73831T-2ACI_OT U3
U 1 1 61164074
P 3150 6650
F 0 "U3" H 2900 6850 60  0000 C CNN
F 1 "MCP73831T-2ACI_OT" H 3750 6250 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 3350 6850 60  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 3350 6950 60  0001 L CNN
F 4 "MCP73831T-2ACI/OTCT-ND" H 3350 7050 60  0001 L CNN "Digi-Key_PN"
F 5 "MCP73831T-2ACI/OT" H 3350 7150 60  0001 L CNN "MPN"
F 6 "Integrated Circuits (ICs)" H 3350 7250 60  0001 L CNN "Category"
F 7 "PMIC - Battery Chargers" H 3350 7350 60  0001 L CNN "Family"
F 8 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 3350 7450 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/microchip-technology/MCP73831T-2ACI-OT/MCP73831T-2ACI-OTCT-ND/1979802" H 3350 7550 60  0001 L CNN "DK_Detail_Page"
F 10 "IC CONTROLLR LI-ION 4.2V SOT23-5" H 3350 7650 60  0001 L CNN "Description"
F 11 "Microchip Technology" H 3350 7750 60  0001 L CNN "Manufacturer"
F 12 "Active" H 3350 7850 60  0001 L CNN "Status"
	1    3150 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 6650 3600 6300
Wire Wire Line
	3600 6300 3700 6300
Connection ~ 3600 6300
Wire Wire Line
	3600 6300 3600 6200
$Comp
L power:GND #PWR0130
U 1 1 61439E22
P 7150 5300
F 0 "#PWR0130" H 7150 5050 50  0001 C CNN
F 1 "GND" V 7150 5100 50  0000 C CNN
F 2 "" H 7150 5300 50  0001 C CNN
F 3 "" H 7150 5300 50  0001 C CNN
	1    7150 5300
	0    1    -1   0   
$EndComp
Wire Wire Line
	8600 5200 8300 5200
Wire Wire Line
	8600 5400 8300 5400
Wire Wire Line
	7200 5300 7150 5300
Text Label 8600 5200 2    50   ~ 0
M2_O1
Text Label 8600 5400 2    50   ~ 0
M2_O2
Text Label 5650 1600 0    50   ~ 0
SCL
Text Label 5650 1400 0    50   ~ 0
SCK
Text Label 5650 1500 0    50   ~ 0
SDA
Text Label 5650 1300 0    50   ~ 0
MOSI
Text Label 5650 1200 0    50   ~ 0
MISO
Text Label 1700 4000 0    50   ~ 0
A3
Text Label 7150 1500 2    50   ~ 0
A1
NoConn ~ 4550 3000
NoConn ~ 4550 3200
NoConn ~ 4550 3300
NoConn ~ 4550 3100
NoConn ~ 4550 2900
NoConn ~ 4550 2700
NoConn ~ 4550 2800
$Comp
L dk_Crystals:ECS-_327-12_5-34B-TR XTAL1
U 1 1 610AD917
P 1400 1150
F 0 "XTAL1" V 1300 1170 50  0000 L CNN
F 1 "32.768KHz" V 1500 1180 50  0000 L CNN
F 2 "SamacSys_Parts:ECS32712512TR" H 1600 1350 60  0001 L CNN
F 3 "http://www.ecsxtal.com/store/pdf/ecx-31b.pdf" H 1600 1450 60  0001 L CNN
F 4 "XC1617CT-ND" H 1600 1550 60  0001 L CNN "Digi-Key_PN"
F 5 "ECS-.327-12.5-34B-TR" H 1600 1650 60  0001 L CNN "MPN"
F 6 "Crystals, Oscillators, Resonators" H 1600 1750 60  0001 L CNN "Category"
F 7 "Crystals" H 1600 1850 60  0001 L CNN "Family"
F 8 "http://www.ecsxtal.com/store/pdf/ecx-31b.pdf" H 1600 1950 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/ecs-inc/ECS-.327-12.5-34B-TR/XC1617CT-ND/1693786" H 1600 2050 60  0001 L CNN "DK_Detail_Page"
F 10 "CRYSTAL 32.7680KHZ 12.5PF SMD" H 1600 2150 60  0001 L CNN "Description"
F 11 "ECS Inc." H 1600 2250 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1600 2350 60  0001 L CNN "Status"
	1    1400 1150
	0    1    1    0   
$EndComp
Connection ~ 1400 1000
Connection ~ 1400 1300
$Comp
L power:GND #PWR0103
U 1 1 610B8A0C
P 950 1300
F 0 "#PWR0103" H 950 1050 50  0001 C CNN
F 1 "GND" V 955 1172 50  0000 R CNN
F 2 "" H 950 1300 50  0001 C CNN
F 3 "" H 950 1300 50  0001 C CNN
	1    950  1300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 610B7672
P 950 1000
F 0 "#PWR0102" H 950 750 50  0001 C CNN
F 1 "GND" V 955 872 50  0000 R CNN
F 2 "" H 950 1000 50  0001 C CNN
F 3 "" H 950 1000 50  0001 C CNN
	1    950  1000
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 1300 950  1300
Wire Wire Line
	1050 1000 950  1000
Wire Wire Line
	1250 1300 1400 1300
Wire Wire Line
	1250 1000 1400 1000
$Comp
L Device:C_Small C6
U 1 1 610B3E8A
P 1150 1300
F 0 "C6" V 1200 1210 50  0000 C CNN
F 1 "22PF" V 1200 1440 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 1150 1300 50  0001 C CNN
F 3 "~" H 1150 1300 50  0001 C CNN
	1    1150 1300
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C5
U 1 1 610B2B36
P 1150 1000
F 0 "C5" V 1100 910 50  0000 C CNN
F 1 "22PF" V 1100 1140 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 1150 1000 50  0001 C CNN
F 3 "~" H 1150 1000 50  0001 C CNN
	1    1150 1000
	0    1    1    0   
$EndComp
Text Label 1700 3800 0    50   ~ 0
D9
Text Label 1700 1600 0    50   ~ 0
A0
Text Label 1700 1700 0    50   ~ 0
A1
Text Label 1700 1800 0    50   ~ 0
D11
Text Label 1700 1900 0    50   ~ 0
D6
Text Label 1700 2000 0    50   ~ 0
D12
NoConn ~ 1700 2800
NoConn ~ 1700 2900
NoConn ~ 1700 3100
NoConn ~ 1700 3300
NoConn ~ 1700 3200
NoConn ~ 1700 3500
NoConn ~ 1700 3400
Text Label 1700 3600 0    50   ~ 0
RXD
Text Label 4550 2600 2    50   ~ 0
SWO
Text Label 1700 3700 0    50   ~ 0
TXD
Text Label 4550 3400 2    50   ~ 0
D5
Text Label 4550 3500 2    50   ~ 0
D13
Text Label 1700 1500 0    50   ~ 0
A5
$Comp
L Regulator_Linear:AP2112K-3.3 U7
U 1 1 61447496
P 6050 7000
F 0 "U7" H 6050 7342 50  0000 C CNN
F 1 "AP2112K-3.3" H 6050 7251 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5_HandSoldering" H 6050 7325 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/AP2112.pdf" H 6050 7100 50  0001 C CNN
	1    6050 7000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 6144749C
P 6050 7400
F 0 "#PWR0132" H 6050 7150 50  0001 C CNN
F 1 "GND" H 6055 7227 50  0000 C CNN
F 2 "" H 6050 7400 50  0001 C CNN
F 3 "" H 6050 7400 50  0001 C CNN
	1    6050 7400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6050 7400 6050 7350
Wire Wire Line
	6350 6900 6400 6900
Wire Wire Line
	6400 6900 6400 6850
Wire Wire Line
	5750 6900 5550 6900
Wire Wire Line
	5750 7000 5550 7000
Wire Wire Line
	5550 7000 5550 6900
$Comp
L Device:C_Small C17
U 1 1 614474AE
P 6400 7050
F 0 "C17" H 6300 6950 50  0000 C CNN
F 1 "10uF" H 6250 7150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6400 7050 50  0001 C CNN
F 3 "~" H 6400 7050 50  0001 C CNN
	1    6400 7050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6400 6950 6400 6900
Connection ~ 6400 6900
Wire Wire Line
	6050 7350 6400 7350
Wire Wire Line
	6400 7350 6400 7150
Connection ~ 6050 7350
Wire Wire Line
	6050 7350 6050 7300
$Comp
L Device:C_Small C18
U 1 1 614474BA
P 5550 7150
F 0 "C18" H 5650 7050 50  0000 C CNN
F 1 "0.1uF" H 5700 7250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5550 7150 50  0001 C CNN
F 3 "~" H 5550 7150 50  0001 C CNN
	1    5550 7150
	-1   0    0    1   
$EndComp
Wire Wire Line
	5550 7050 5550 7000
Connection ~ 5550 7000
Wire Wire Line
	5550 7250 5550 7350
Wire Wire Line
	5550 7350 6050 7350
Connection ~ 5550 6900
Wire Wire Line
	7550 3550 7650 3550
Text Label 8600 4200 2    50   ~ 0
M1_O2
Text Label 8600 4000 2    50   ~ 0
M1_O1
Text Label 6800 4200 0    50   ~ 0
M1_IN2
Text Label 6800 4000 0    50   ~ 0
M1_IN1
Wire Wire Line
	8600 4200 8300 4200
Wire Wire Line
	8600 4000 8300 4000
Wire Wire Line
	6800 4200 7200 4200
Wire Wire Line
	6800 4000 7200 4000
Wire Wire Line
	8000 3550 7850 3550
$Comp
L power:GND #PWR0134
U 1 1 6183137F
P 8000 3550
F 0 "#PWR0134" H 8000 3300 50  0001 C CNN
F 1 "GND" V 8000 3350 50  0000 C CNN
F 2 "" H 8000 3550 50  0001 C CNN
F 3 "" H 8000 3550 50  0001 C CNN
	1    8000 3550
	0    -1   1    0   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 61826B33
P 7750 3550
F 0 "C8" V 7700 3440 50  0000 C CNN
F 1 "0.1uF" V 7700 3690 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 7750 3550 50  0001 C CNN
F 3 "~" H 7750 3550 50  0001 C CNN
	1    7750 3550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 615A28A2
P 5050 6550
F 0 "#PWR0136" H 5050 6300 50  0001 C CNN
F 1 "GND" H 5055 6377 50  0000 C CNN
F 2 "" H 5050 6550 50  0001 C CNN
F 3 "" H 5050 6550 50  0001 C CNN
	1    5050 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5050 5800 5200 5800
Wire Wire Line
	5550 6900 5200 6900
Connection ~ 5200 5800
Wire Wire Line
	5200 5800 5550 5800
$Comp
L power:VCC #PWR0137
U 1 1 615E6C25
P 6400 6850
F 0 "#PWR0137" H 6400 6700 50  0001 C CNN
F 1 "VCC" H 6415 7023 50  0000 C CNN
F 2 "" H 6400 6850 50  0001 C CNN
F 3 "" H 6400 6850 50  0001 C CNN
	1    6400 6850
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0143
U 1 1 615E92CF
P 8550 5300
F 0 "#PWR0143" H 8550 5150 50  0001 C CNN
F 1 "VCC" V 8550 5500 50  0000 C CNN
F 2 "" H 8550 5300 50  0001 C CNN
F 3 "" H 8550 5300 50  0001 C CNN
	1    8550 5300
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0144
U 1 1 61630A92
P 8550 4100
F 0 "#PWR0144" H 8550 3950 50  0001 C CNN
F 1 "VCC" V 8550 4300 50  0000 C CNN
F 2 "" H 8550 4100 50  0001 C CNN
F 3 "" H 8550 4100 50  0001 C CNN
	1    8550 4100
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 6900 5200 5800
$Comp
L power:GND #PWR0110
U 1 1 6111C83C
P 1850 7450
F 0 "#PWR0110" H 1850 7200 50  0001 C CNN
F 1 "GND" H 1855 7277 50  0000 C CNN
F 2 "" H 1850 7450 50  0001 C CNN
F 3 "" H 1850 7450 50  0001 C CNN
	1    1850 7450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1850 7400 1850 7450
$Comp
L SamacSys_Parts:TAJP106K010RNJ C9
U 1 1 6182B0EF
P 5050 5950
F 0 "C9" V 5250 5650 50  0000 L CNN
F 1 "TAJP106K010RNJ" V 5400 5500 50  0000 L CNN
F 2 "SamacSys_Parts:CAPPM2014X170N" H 5400 6000 50  0001 L CNN
F 3 "http://datasheets.avx.com/TAJ.pdf" H 5400 5900 50  0001 L CNN
F 4 "Tantalum Capacitors - Solid SMD 10V 10uF 10%" H 5400 5800 50  0001 L CNN "Description"
F 5 "1.7" H 5400 5700 50  0001 L CNN "Height"
F 6 "AVX" H 5400 5600 50  0001 L CNN "Manufacturer_Name"
F 7 "TAJP106K010RNJ" H 5400 5500 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "581-TAJP106K010RNJ" H 5400 5400 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/AVX/TAJP106K010RNJ?qs=vQJa%252BfcOt8MTne6Zr4ogJg%3D%3D" H 5400 5300 50  0001 L CNN "Mouser Price/Stock"
F 10 "TAJP106K010RNJ" H 5400 5200 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/tajp106k010rnj/avx?region=nac" H 5400 5100 50  0001 L CNN "Arrow Price/Stock"
	1    5050 5950
	0    1    1    0   
$EndComp
$Comp
L SamacSys_Parts:TAJP106K010RNJ C13
U 1 1 61832437
P 1850 6900
F 0 "C13" V 2050 6600 50  0000 L CNN
F 1 "TAJP106K010RNJ" V 2200 6200 50  0000 L CNN
F 2 "SamacSys_Parts:CAPPM2014X170N" H 2200 6950 50  0001 L CNN
F 3 "http://datasheets.avx.com/TAJ.pdf" H 2200 6850 50  0001 L CNN
F 4 "Tantalum Capacitors - Solid SMD 10V 10uF 10%" H 2200 6750 50  0001 L CNN "Description"
F 5 "1.7" H 2200 6650 50  0001 L CNN "Height"
F 6 "AVX" H 2200 6550 50  0001 L CNN "Manufacturer_Name"
F 7 "TAJP106K010RNJ" H 2200 6450 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "581-TAJP106K010RNJ" H 2200 6350 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/AVX/TAJP106K010RNJ?qs=vQJa%252BfcOt8MTne6Zr4ogJg%3D%3D" H 2200 6250 50  0001 L CNN "Mouser Price/Stock"
F 10 "TAJP106K010RNJ" H 2200 6150 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/tajp106k010rnj/avx?region=nac" H 2200 6050 50  0001 L CNN "Arrow Price/Stock"
	1    1850 6900
	0    1    1    0   
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:22-23-2021 J4
U 1 1 618C1D2C
P 6600 3050
F 0 "J4" V 6500 3000 50  0000 C CNN
F 1 "22-23-2021" V 6800 3050 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x01_P1.27mm_Vertical" H 6800 3250 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 6800 3350 60  0001 L CNN
F 4 "WM4200-ND" H 6800 3450 60  0001 L CNN "Digi-Key_PN"
F 5 "22-23-2021" H 6800 3550 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 6800 3650 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 6800 3750 60  0001 L CNN "Family"
F 8 "https://media.digikey.com/pdf/Data%20Sheets/Molex%20PDFs/A-6373-N_Series_Dwg_2010-12-03.pdf" H 6800 3850 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/22-23-2021/WM4200-ND/26667" H 6800 3950 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 2POS 2.54MM" H 6800 4050 60  0001 L CNN "Description"
F 11 "Molex" H 6800 4150 60  0001 L CNN "Manufacturer"
F 12 "Active" H 6800 4250 60  0001 L CNN "Status"
	1    6600 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 3050 7000 3050
Wire Wire Line
	6700 3150 7000 3150
Text Label 7000 3050 2    50   ~ 0
SWDCLK
Text Label 7000 3150 2    50   ~ 0
SWDIO
Text Label 3050 4850 0    50   ~ 0
A0
Text Label 1700 4200 0    50   ~ 0
LED1
Text Label 1700 3900 0    50   ~ 0
LED2
$Comp
L Device:R_Small R10
U 1 1 61983A4D
P 7850 1950
F 0 "R10" V 7800 1780 50  0000 C CNN
F 1 "10k" V 7810 2100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 7850 1950 50  0001 C CNN
F 3 "~" H 7850 1950 50  0001 C CNN
	1    7850 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R11
U 1 1 619846D6
P 7850 2050
F 0 "R11" V 7800 1880 50  0000 C CNN
F 1 "10k" V 7810 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 7850 2050 50  0001 C CNN
F 3 "~" H 7850 2050 50  0001 C CNN
	1    7850 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 1950 8300 1950
Wire Wire Line
	7950 2050 8300 2050
$Comp
L power:+3.3V #PWR0133
U 1 1 619CE99C
P 7550 1900
F 0 "#PWR0133" H 7550 1750 50  0001 C CNN
F 1 "+3.3V" H 7550 2050 50  0000 C CNN
F 2 "" H 7550 1900 50  0001 C CNN
F 3 "" H 7550 1900 50  0001 C CNN
	1    7550 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 1900 7550 1950
Wire Wire Line
	7550 2050 7750 2050
Wire Wire Line
	7750 1950 7550 1950
Connection ~ 7550 1950
Wire Wire Line
	7550 1950 7550 2050
$Comp
L power:+3.3V #PWR0145
U 1 1 61A174C0
P 5200 3600
F 0 "#PWR0145" H 5200 3450 50  0001 C CNN
F 1 "+3.3V" V 5200 3850 50  0000 C CNN
F 2 "" H 5200 3600 50  0001 C CNN
F 3 "" H 5200 3600 50  0001 C CNN
	1    5200 3600
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR0146
U 1 1 61A3A387
P 6950 1600
F 0 "#PWR0146" H 6950 1450 50  0001 C CNN
F 1 "+3.3V" V 6950 1850 50  0000 C CNN
F 2 "" H 6950 1600 50  0001 C CNN
F 3 "" H 6950 1600 50  0001 C CNN
	1    6950 1600
	0    1    1    0   
$EndComp
Text Label 4550 3900 2    50   ~ 0
M1_IN1
Text Label 4550 4100 2    50   ~ 0
M1_IN2
$Comp
L SamacSys_Parts:MP6513GJ-Z IC1
U 1 1 6125B5B5
P 7200 4000
F 0 "IC1" H 7750 4265 50  0000 C CNN
F 1 "MP6513GJ-Z" H 7750 4174 50  0000 C CNN
F 2 "SamacSys_Parts:SOT95P280X100-6N" H 8150 4100 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/277/MP6513_r1.0-1384349.pdf" H 8150 4000 50  0001 L CNN
F 4 "Power Switch ICs - Power Distribution 2.5V-21V 0.8A Half Bridge Motor Driver" H 8150 3900 50  0001 L CNN "Description"
F 5 "1" H 8150 3800 50  0001 L CNN "Height"
F 6 "Monolithic Power Systems (MPS)" H 8150 3700 50  0001 L CNN "Manufacturer_Name"
F 7 "MP6513GJ-Z" H 8150 3600 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "946-MP6513GJ-Z" H 8150 3500 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Monolithic-Power-Systems-MPS/MP6513GJ-Z?qs=FfNbArp%252BdljFzTtslD%252B1UQ%3D%3D" H 8150 3400 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 8150 3300 50  0001 L CNN "Arrow Part Number"
F 11 "" H 8150 3200 50  0001 L CNN "Arrow Price/Stock"
	1    7200 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4100 8550 4100
$Comp
L power:GND #PWR0131
U 1 1 613131C5
P 7150 4100
F 0 "#PWR0131" H 7150 3850 50  0001 C CNN
F 1 "GND" V 7150 3900 50  0000 C CNN
F 2 "" H 7150 4100 50  0001 C CNN
F 3 "" H 7150 4100 50  0001 C CNN
	1    7150 4100
	0    1    -1   0   
$EndComp
Wire Wire Line
	7150 4100 7200 4100
$Comp
L power:VCC #PWR0138
U 1 1 613B5375
P 7550 3550
F 0 "#PWR0138" H 7550 3400 50  0001 C CNN
F 1 "VCC" V 7550 3750 50  0000 C CNN
F 2 "" H 7550 3550 50  0001 C CNN
F 3 "" H 7550 3550 50  0001 C CNN
	1    7550 3550
	0    -1   -1   0   
$EndComp
$Comp
L SamacSys_Parts:MP6513GJ-Z IC2
U 1 1 6142AEAC
P 7200 5200
F 0 "IC2" H 7750 5465 50  0000 C CNN
F 1 "MP6513GJ-Z" H 7750 5374 50  0000 C CNN
F 2 "SamacSys_Parts:SOT95P280X100-6N" H 8150 5300 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/277/MP6513_r1.0-1384349.pdf" H 8150 5200 50  0001 L CNN
F 4 "Power Switch ICs - Power Distribution 2.5V-21V 0.8A Half Bridge Motor Driver" H 8150 5100 50  0001 L CNN "Description"
F 5 "1" H 8150 5000 50  0001 L CNN "Height"
F 6 "Monolithic Power Systems (MPS)" H 8150 4900 50  0001 L CNN "Manufacturer_Name"
F 7 "MP6513GJ-Z" H 8150 4800 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "946-MP6513GJ-Z" H 8150 4700 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Monolithic-Power-Systems-MPS/MP6513GJ-Z?qs=FfNbArp%252BdljFzTtslD%252B1UQ%3D%3D" H 8150 4600 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 8150 4500 50  0001 L CNN "Arrow Part Number"
F 11 "" H 8150 4400 50  0001 L CNN "Arrow Price/Stock"
	1    7200 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 5300 8550 5300
$Comp
L power:VCC #PWR0141
U 1 1 6157B053
P 7550 4750
F 0 "#PWR0141" H 7550 4600 50  0001 C CNN
F 1 "VCC" V 7550 4950 50  0000 C CNN
F 2 "" H 7550 4750 50  0001 C CNN
F 3 "" H 7550 4750 50  0001 C CNN
	1    7550 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7550 4750 7650 4750
Text Label 5650 2450 0    50   ~ 0
A1
Text Label 7150 2550 2    50   ~ 0
SCL
Text Label 7150 2450 2    50   ~ 0
SDA
$Comp
L power:+3.3V #PWR0147
U 1 1 612C22B9
P 5850 2550
F 0 "#PWR0147" H 5850 2400 50  0001 C CNN
F 1 "+3.3V" V 5850 2800 50  0000 C CNN
F 2 "" H 5850 2550 50  0001 C CNN
F 3 "" H 5850 2550 50  0001 C CNN
	1    5850 2550
	0    -1   -1   0   
$EndComp
Text Label 7150 2350 2    50   ~ 0
SCK
$Comp
L SamacSys_Parts:20021321-00014C1LF J6
U 1 1 6142B6B6
P 5250 3600
F 0 "J6" H 5700 3865 50  0000 C CNN
F 1 "20021321-00014C1LF" H 5700 3774 50  0000 C CNN
F 2 "SamacSys_Parts:2002132100014C1LF" H 6000 3700 50  0001 L CNN
F 3 "https://4donline.ihs.com/images/VipMasterIC/IC/AFCI/AFCI-S-A0003555143/AFCI-S-A0003555143-1.pdf?hkey=EF798316E3902B6ED9A73243A3159BB0" H 6000 3600 50  0001 L CNN
F 4 "Headers & Wire Housings 20021321-00014C1LF-RECEPTACLE VT SMT" H 6000 3500 50  0001 L CNN "Description"
F 5 "4.75" H 6000 3400 50  0001 L CNN "Height"
F 6 "Amphenol" H 6000 3300 50  0001 L CNN "Manufacturer_Name"
F 7 "20021321-00014C1LF" H 6000 3200 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "649-20213210014C1LF" H 6000 3100 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Amphenol-FCI/20021321-00014C1LF?qs=fmpTyLOWOeyzBByVTT8pPA%3D%3D" H 6000 3000 50  0001 L CNN "Mouser Price/Stock"
F 10 "20021321-00014C1LF" H 6000 2900 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/20021321-00014c1lf/amphenol-fci?region=nac" H 6000 2800 50  0001 L CNN "Arrow Price/Stock"
	1    5250 3600
	1    0    0    -1  
$EndComp
$Comp
L power:VPP #PWR0148
U 1 1 614AAEA5
P 5200 4200
F 0 "#PWR0148" H 5200 4050 50  0001 C CNN
F 1 "VPP" V 5215 4327 50  0000 L CNN
F 2 "" H 5200 4200 50  0001 C CNN
F 3 "" H 5200 4200 50  0001 C CNN
	1    5200 4200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5200 4200 5250 4200
$Comp
L power:GND #PWR0149
U 1 1 614CC6B3
P 6200 4200
F 0 "#PWR0149" H 6200 3950 50  0001 C CNN
F 1 "GND" V 6200 4000 50  0000 C CNN
F 2 "" H 6200 4200 50  0001 C CNN
F 3 "" H 6200 4200 50  0001 C CNN
	1    6200 4200
	0    -1   1    0   
$EndComp
Wire Wire Line
	6200 4200 6150 4200
$Comp
L power:GND #PWR0150
U 1 1 614E06E6
P 6200 3600
F 0 "#PWR0150" H 6200 3350 50  0001 C CNN
F 1 "GND" V 6200 3400 50  0000 C CNN
F 2 "" H 6200 3600 50  0001 C CNN
F 3 "" H 6200 3600 50  0001 C CNN
	1    6200 3600
	0    -1   1    0   
$EndComp
Wire Wire Line
	6200 3600 6150 3600
Wire Wire Line
	5250 3700 4850 3700
Wire Wire Line
	4850 3800 5250 3800
Wire Wire Line
	4850 3900 5250 3900
Wire Wire Line
	4850 4000 5250 4000
Wire Wire Line
	4850 4100 5250 4100
Wire Wire Line
	6500 3700 6150 3700
Wire Wire Line
	6500 3800 6150 3800
Wire Wire Line
	6500 3900 6150 3900
Wire Wire Line
	6500 4000 6150 4000
Wire Wire Line
	6500 4100 6150 4100
Wire Wire Line
	6800 5400 7200 5400
Text Label 6800 5400 0    50   ~ 0
M2_IN2
Wire Wire Line
	6800 5200 7200 5200
Text Label 6800 5200 0    50   ~ 0
M2_IN1
$Comp
L Mylib:1_pin_sig J9
U 1 1 612B7892
P 1100 4750
F 0 "J9" H 1228 4655 50  0000 L CNN
F 1 "1_pin_sig" H 1228 4610 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1100 4750 50  0001 C CNN
F 3 "" H 1100 4750 50  0001 C CNN
	1    1100 4750
	1    0    0    -1  
$EndComp
$Comp
L Mylib:1_pin_sig J11
U 1 1 612BB617
P 1100 4950
F 0 "J11" H 1228 4855 50  0000 L CNN
F 1 "1_pin_sig" H 1228 4810 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1100 4950 50  0001 C CNN
F 3 "" H 1100 4950 50  0001 C CNN
	1    1100 4950
	1    0    0    -1  
$EndComp
$Comp
L Mylib:1_pin_sig J13
U 1 1 612BBB42
P 1100 5150
F 0 "J13" H 1228 5055 50  0000 L CNN
F 1 "1_pin_sig" H 1228 5010 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1100 5150 50  0001 C CNN
F 3 "" H 1100 5150 50  0001 C CNN
	1    1100 5150
	1    0    0    -1  
$EndComp
$Comp
L Mylib:1_pin_sig J10
U 1 1 612BC867
P 1850 4750
F 0 "J10" H 1978 4655 50  0000 L CNN
F 1 "1_pin_sig" H 1978 4610 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1850 4750 50  0001 C CNN
F 3 "" H 1850 4750 50  0001 C CNN
	1    1850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 4850 650  4850
Wire Wire Line
	950  5050 1000 5050
Wire Wire Line
	650  5250 1000 5250
Wire Wire Line
	1500 4850 1750 4850
Text Label 650  4650 0    50   ~ 0
~RESET
$Comp
L Mylib:1_pin_sig J12
U 1 1 61379D27
P 1850 4950
F 0 "J12" H 1978 4855 50  0000 L CNN
F 1 "1_pin_sig" H 1978 4810 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1850 4950 50  0001 C CNN
F 3 "" H 1850 4950 50  0001 C CNN
	1    1850 4950
	1    0    0    -1  
$EndComp
$Comp
L Mylib:1_pin_sig J14
U 1 1 6137A330
P 1850 5150
F 0 "J14" H 1978 5055 50  0000 L CNN
F 1 "1_pin_sig" H 1978 5010 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1850 5150 50  0001 C CNN
F 3 "" H 1850 5150 50  0001 C CNN
	1    1850 5150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0151
U 1 1 613AE3F9
P 950 5050
F 0 "#PWR0151" H 950 4900 50  0001 C CNN
F 1 "+3.3V" V 950 5300 50  0000 C CNN
F 2 "" H 950 5050 50  0001 C CNN
F 3 "" H 950 5050 50  0001 C CNN
	1    950  5050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 613C8CF4
P 1700 5250
F 0 "#PWR0152" H 1700 5000 50  0001 C CNN
F 1 "GND" V 1705 5122 50  0000 R CNN
F 2 "" H 1700 5250 50  0001 C CNN
F 3 "" H 1700 5250 50  0001 C CNN
	1    1700 5250
	0    1    -1   0   
$EndComp
Wire Wire Line
	1700 5250 1750 5250
$Comp
L Mylib:1_pin_sig J15
U 1 1 613E2FA8
P 1100 5350
F 0 "J15" H 1228 5255 50  0000 L CNN
F 1 "1_pin_sig" H 1228 5210 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1100 5350 50  0001 C CNN
F 3 "" H 1100 5350 50  0001 C CNN
	1    1100 5350
	1    0    0    -1  
$EndComp
$Comp
L Mylib:1_pin_sig J16
U 1 1 613E361E
P 1850 5350
F 0 "J16" H 1978 5255 50  0000 L CNN
F 1 "1_pin_sig" H 1978 5210 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1850 5350 50  0001 C CNN
F 3 "" H 1850 5350 50  0001 C CNN
	1    1850 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5450 650  5450
$Comp
L Mylib:1_pin_sig J17
U 1 1 614640AA
P 1100 4550
F 0 "J17" H 1228 4455 50  0000 L CNN
F 1 "1_pin_sig" H 1228 4410 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1100 4550 50  0001 C CNN
F 3 "" H 1100 4550 50  0001 C CNN
	1    1100 4550
	1    0    0    -1  
$EndComp
$Comp
L Mylib:1_pin_sig J18
U 1 1 6146467E
P 1850 4550
F 0 "J18" H 1978 4455 50  0000 L CNN
F 1 "1_pin_sig" H 1978 4410 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1850 4550 50  0001 C CNN
F 3 "" H 1850 4550 50  0001 C CNN
	1    1850 4550
	1    0    0    -1  
$EndComp
$Comp
L Mylib:1_pin_sig J20
U 1 1 61465773
P 5100 5650
F 0 "J20" H 5228 5555 50  0000 L CNN
F 1 "1_pin_sig" H 5228 5510 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 5100 5650 50  0001 C CNN
F 3 "" H 5100 5650 50  0001 C CNN
	1    5100 5650
	0    -1   -1   0   
$EndComp
$Comp
L Mylib:1_pin_sig J19
U 1 1 61465E30
P 1100 5550
F 0 "J19" H 1228 5455 50  0000 L CNN
F 1 "1_pin_sig" H 1228 5410 50  0001 L CNN
F 2 "Mylib:1.27mm_pin_hole" H 1100 5550 50  0001 C CNN
F 3 "" H 1100 5550 50  0001 C CNN
	1    1100 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3000 2050 3000
$Comp
L power:GND #PWR0153
U 1 1 615982ED
P 1000 3000
F 0 "#PWR0153" H 1000 2750 50  0001 C CNN
F 1 "GND" V 1005 2872 50  0000 R CNN
F 2 "" H 1000 3000 50  0001 C CNN
F 3 "" H 1000 3000 50  0001 C CNN
	1    1000 3000
	0    1    -1   0   
$EndComp
Wire Wire Line
	1000 3000 1100 3000
$Comp
L dk_Tactile-Switches:B3U-1000P S1
U 1 1 615B8773
P 1300 3000
F 0 "S1" H 1300 3297 60  0000 C CNN
F 1 "B3U-1000P" H 1300 3191 60  0000 C CNN
F 2 "digikey-footprints:Switch_Tactile_SMD_B3U-1000P" H 1500 3200 60  0001 L CNN
F 3 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 1500 3300 60  0001 L CNN
F 4 "SW1020CT-ND" H 1500 3400 60  0001 L CNN "Digi-Key_PN"
F 5 "B3U-1000P" H 1500 3500 60  0001 L CNN "MPN"
F 6 "Switches" H 1500 3600 60  0001 L CNN "Category"
F 7 "Tactile Switches" H 1500 3700 60  0001 L CNN "Family"
F 8 "https://omronfs.omron.com/en_US/ecb/products/pdf/en-b3u.pdf" H 1500 3800 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/omron-electronics-inc-emc-div/B3U-1000P/SW1020CT-ND/1534357" H 1500 3900 60  0001 L CNN "DK_Detail_Page"
F 10 "SWITCH TACTILE SPST-NO 0.05A 12V" H 1500 4000 60  0001 L CNN "Description"
F 11 "Omron Electronics Inc-EMC Div" H 1500 4100 60  0001 L CNN "Manufacturer"
F 12 "Active" H 1500 4200 60  0001 L CNN "Status"
	1    1300 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	650  4650 1000 4650
Text Label 6500 4000 2    50   ~ 0
MOSI
Text Label 6500 3900 2    50   ~ 0
SCK
Text Label 6500 4100 2    50   ~ 0
MISO
Text Label 6500 3700 2    50   ~ 0
SCL
Text Label 6500 3800 2    50   ~ 0
SDA
Text Label 4850 4000 0    50   ~ 0
D5
Text Label 4850 4100 0    50   ~ 0
D13
Text Label 4850 3800 0    50   ~ 0
D6
Text Label 4850 3900 0    50   ~ 0
D12
Text Label 4850 3700 0    50   ~ 0
A3
Text Label 7150 2150 2    50   ~ 0
MISO
Wire Wire Line
	5850 2150 5900 2150
Text Label 7150 2250 2    50   ~ 0
MOSI
$Comp
L power:GND #PWR0154
U 1 1 6187A4E5
P 5850 2150
F 0 "#PWR0154" H 5850 1900 50  0001 C CNN
F 1 "GND" V 5855 2022 50  0000 R CNN
F 2 "" H 5850 2150 50  0001 C CNN
F 3 "" H 5850 2150 50  0001 C CNN
	1    5850 2150
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0155
U 1 1 6187AE86
P 6950 1200
F 0 "#PWR0155" H 6950 950 50  0001 C CNN
F 1 "GND" V 6955 1072 50  0000 R CNN
F 2 "" H 6950 1200 50  0001 C CNN
F 3 "" H 6950 1200 50  0001 C CNN
	1    6950 1200
	0    -1   1    0   
$EndComp
Wire Wire Line
	650  5650 1000 5650
Wire Wire Line
	4250 3800 4550 3800
Text Label 4550 3700 2    50   ~ 0
GP0
Text Label 4550 3800 2    50   ~ 0
GP1
Text Label 4550 4000 2    50   ~ 0
GP3
Text Label 1500 4650 0    50   ~ 0
GP0
Text Label 1700 1400 0    50   ~ 0
GP2
Text Label 650  5650 0    50   ~ 0
GP2
Wire Wire Line
	1500 4650 1750 4650
Wire Wire Line
	1500 5050 1750 5050
Wire Wire Line
	1500 5450 1750 5450
NoConn ~ 1500 5450
Wire Wire Line
	5200 5750 5200 5800
Text Label 650  5450 0    50   ~ 0
SWO
NoConn ~ 1500 4850
NoConn ~ 1500 5050
NoConn ~ 650  5250
NoConn ~ 2050 2200
Text Label 5650 2350 0    50   ~ 0
D6
Text Label 5650 2250 0    50   ~ 0
D13
Text Label 7150 1400 2    50   ~ 0
D6
Text Label 7150 1300 2    50   ~ 0
D13
Text Label 650  4850 0    50   ~ 0
A5
$Comp
L power:GND #PWR0156
U 1 1 61C6E7D1
P 10400 4050
F 0 "#PWR0156" H 10400 3800 50  0001 C CNN
F 1 "GND" V 10400 3850 50  0000 C CNN
F 2 "" H 10400 4050 50  0001 C CNN
F 3 "" H 10400 4050 50  0001 C CNN
	1    10400 4050
	0    -1   1    0   
$EndComp
Text Label 10750 4250 2    50   ~ 0
MOTOR1_A
Text Label 10750 4150 2    50   ~ 0
MOTOR1_B
$Comp
L power:VCC #PWR0157
U 1 1 61D0C464
P 10400 5550
F 0 "#PWR0157" H 10400 5400 50  0001 C CNN
F 1 "VCC" V 10400 5750 50  0000 C CNN
F 2 "" H 10400 5550 50  0001 C CNN
F 3 "" H 10400 5550 50  0001 C CNN
	1    10400 5550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0158
U 1 1 61D407FD
P 10400 5250
F 0 "#PWR0158" H 10400 5000 50  0001 C CNN
F 1 "GND" V 10400 5050 50  0000 C CNN
F 2 "" H 10400 5250 50  0001 C CNN
F 3 "" H 10400 5250 50  0001 C CNN
	1    10400 5250
	0    -1   1    0   
$EndComp
Wire Wire Line
	10350 5250 10400 5250
Wire Wire Line
	10350 4350 10400 4350
$Comp
L power:VCC #PWR0159
U 1 1 61E16D5F
P 10400 4350
F 0 "#PWR0159" H 10400 4200 50  0001 C CNN
F 1 "VCC" V 10400 4550 50  0000 C CNN
F 2 "" H 10400 4350 50  0001 C CNN
F 3 "" H 10400 4350 50  0001 C CNN
	1    10400 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	10350 4050 10400 4050
Wire Wire Line
	10350 4450 10750 4450
Wire Wire Line
	10350 3950 10750 3950
Wire Wire Line
	10400 5550 10350 5550
Wire Wire Line
	10350 5150 10750 5150
Wire Wire Line
	10350 5650 10750 5650
Text Label 10750 4450 2    50   ~ 0
M1_O1
Text Label 10750 3950 2    50   ~ 0
M1_O2
Text Label 10750 5650 2    50   ~ 0
M2_O1
Text Label 10750 5150 2    50   ~ 0
M2_O2
Text Label 1700 4100 0    50   ~ 0
MOTOR1_A
Text Label 1700 4300 0    50   ~ 0
MOTOR1_B
Text Label 10750 5450 2    50   ~ 0
D5
Text Label 10750 5350 2    50   ~ 0
D13
NoConn ~ 10100 2350
$EndSCHEMATC
