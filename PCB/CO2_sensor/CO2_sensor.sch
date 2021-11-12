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
L SamacSys_Parts:SCD41-D-R2 IC1
U 1 1 618DA917
P 3400 3500
F 0 "IC1" H 4350 4050 50  0000 L CNN
F 1 "SCD41-D-R2" H 4250 2500 50  0000 L CNN
F 2 "SamacSys_Parts:SCD41DR2" H 4550 4000 50  0001 L CNN
F 3 "https://cz.mouser.com/datasheet/2/682/Sensirion_CO2_Sensors_SCD4x_Datasheet-2010009.pdf" H 4550 3900 50  0001 L CNN
F 4 "Air Quality Sensor CO2 Sensor 2.5V/3.3V/5V 20-Pin SMD EP" H 4550 3800 50  0001 L CNN "Description"
F 5 "6.8" H 4550 3700 50  0001 L CNN "Height"
F 6 "Sensirion" H 4550 3600 50  0001 L CNN "Manufacturer_Name"
F 7 "SCD41-D-R2" H 4550 3500 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "403-SCD41-D-R2" H 4550 3400 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Sensirion/SCD41-D-R2?qs=HBWAp0VN4Ri4o7ei4T3s0g%3D%3D" H 4550 3300 50  0001 L CNN "Mouser Price/Stock"
F 10 "SCD41-D-R2" H 4550 3200 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/scd41-d-r2/sensirion-ag?region=nac" H 4550 3100 50  0001 L CNN "Arrow Price/Stock"
	1    3400 3500
	1    0    0    -1  
$EndComp
NoConn ~ 3400 3500
NoConn ~ 3400 3600
NoConn ~ 3400 3700
NoConn ~ 3400 3800
NoConn ~ 3400 3900
NoConn ~ 4700 3900
NoConn ~ 4700 3800
NoConn ~ 4700 3700
NoConn ~ 4700 3600
NoConn ~ 4700 3500
NoConn ~ 4300 2800
NoConn ~ 4200 2800
NoConn ~ 4100 2800
NoConn ~ 4000 4600
$Comp
L power:GND #PWR0101
U 1 1 618DF2C4
P 3800 4650
F 0 "#PWR0101" H 3800 4400 50  0001 C CNN
F 1 "GND" H 3805 4477 50  0000 C CNN
F 2 "" H 3800 4650 50  0001 C CNN
F 3 "" H 3800 4650 50  0001 C CNN
	1    3800 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 618DFEE2
P 3800 2700
F 0 "#PWR0102" H 3800 2450 50  0001 C CNN
F 1 "GND" H 3805 2527 50  0000 C CNN
F 2 "" H 3800 2700 50  0001 C CNN
F 3 "" H 3800 2700 50  0001 C CNN
	1    3800 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3800 2700 3800 2750
Wire Wire Line
	3900 2800 3900 2750
Wire Wire Line
	3900 2750 3800 2750
Connection ~ 3800 2750
Wire Wire Line
	3800 2750 3800 2800
$Comp
L power:+3.3V #PWR0103
U 1 1 618E1BF8
P 4000 2700
F 0 "#PWR0103" H 4000 2550 50  0001 C CNN
F 1 "+3.3V" H 4015 2873 50  0000 C CNN
F 2 "" H 4000 2700 50  0001 C CNN
F 3 "" H 4000 2700 50  0001 C CNN
	1    4000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2700 4000 2800
$Comp
L power:+3.3V #PWR0104
U 1 1 618E2729
P 3900 4900
F 0 "#PWR0104" H 3900 4750 50  0001 C CNN
F 1 "+3.3V" H 3915 5073 50  0000 C CNN
F 2 "" H 3900 4900 50  0001 C CNN
F 3 "" H 3900 4900 50  0001 C CNN
	1    3900 4900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3900 4600 3900 4900
Wire Wire Line
	3800 4650 3800 4600
Wire Wire Line
	4100 4600 4100 4700
Wire Wire Line
	4200 4600 4200 4950
Text Label 4100 5250 1    50   ~ 0
SCL
Text Label 4200 5250 1    50   ~ 0
SDA
$Comp
L power:+3.3V #PWR0105
U 1 1 618E629C
P 5100 3450
F 0 "#PWR0105" H 5100 3300 50  0001 C CNN
F 1 "+3.3V" H 5115 3623 50  0000 C CNN
F 2 "" H 5100 3450 50  0001 C CNN
F 3 "" H 5100 3450 50  0001 C CNN
	1    5100 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 618E6BF7
P 5100 3650
F 0 "C1" H 5192 3696 50  0000 L CNN
F 1 "10uF" H 5192 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5100 3650 50  0001 C CNN
F 3 "~" H 5100 3650 50  0001 C CNN
	1    5100 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 618E721E
P 5100 3850
F 0 "#PWR0106" H 5100 3600 50  0001 C CNN
F 1 "GND" H 5105 3677 50  0000 C CNN
F 2 "" H 5100 3850 50  0001 C CNN
F 3 "" H 5100 3850 50  0001 C CNN
	1    5100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3550 5100 3500
Wire Wire Line
	5100 3750 5100 3800
$Comp
L Device:C_Small C2
U 1 1 618E8225
P 5500 3650
F 0 "C2" H 5592 3696 50  0000 L CNN
F 1 "0.1uF" H 5592 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5500 3650 50  0001 C CNN
F 3 "~" H 5500 3650 50  0001 C CNN
	1    5500 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3550 5500 3500
Wire Wire Line
	5100 3500 5500 3500
Connection ~ 5100 3500
Wire Wire Line
	5100 3500 5100 3450
Wire Wire Line
	5500 3750 5500 3800
Wire Wire Line
	5500 3800 5100 3800
Connection ~ 5100 3800
Wire Wire Line
	5100 3800 5100 3850
$Comp
L Device:R_Small R3
U 1 1 618F1AA8
P 4450 4950
F 0 "R3" V 4380 4900 50  0000 L CNN
F 1 "10k" V 4520 4880 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 4450 4950 50  0001 C CNN
F 3 "~" H 4450 4950 50  0001 C CNN
	1    4450 4950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 618F1E7E
P 4450 4700
F 0 "R2" V 4380 4650 50  0000 L CNN
F 1 "10k" V 4520 4630 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 4450 4700 50  0001 C CNN
F 3 "~" H 4450 4700 50  0001 C CNN
	1    4450 4700
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR0107
U 1 1 618F3416
P 4650 4700
F 0 "#PWR0107" H 4650 4550 50  0001 C CNN
F 1 "+3.3V" H 4665 4873 50  0000 C CNN
F 2 "" H 4650 4700 50  0001 C CNN
F 3 "" H 4650 4700 50  0001 C CNN
	1    4650 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	4550 4700 4600 4700
Wire Wire Line
	4550 4950 4600 4950
Wire Wire Line
	4600 4950 4600 4700
Connection ~ 4600 4700
Wire Wire Line
	4600 4700 4650 4700
Wire Wire Line
	4350 4700 4100 4700
Connection ~ 4100 4700
Wire Wire Line
	4100 4700 4100 5250
Wire Wire Line
	4350 4950 4200 4950
Connection ~ 4200 4950
Wire Wire Line
	4200 4950 4200 5250
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:20021121-00010C4LF J1
U 1 1 61909C7E
P 7450 3650
F 0 "J1" H 7450 4075 50  0000 C CNN
F 1 "20021121-00010C4LF" H 7450 3984 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_2x5_P1.27mm" H 7650 3850 60  0001 L CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/20021121.pdf" H 7650 3950 60  0001 L CNN
F 4 "609-3695-1-ND" H 7650 4050 60  0001 L CNN "Digi-Key_PN"
F 5 "20021121-00010C4LF" H 7650 4150 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 7650 4250 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 7650 4350 60  0001 L CNN "Family"
F 8 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/20021121.pdf" H 7650 4450 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/amphenol-icc-fci/20021121-00010C4LF/609-3695-1-ND/2209147" H 7650 4550 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER SMD 10POS 1.27MM" H 7650 4650 60  0001 L CNN "Description"
F 11 "Amphenol ICC (FCI)" H 7650 4750 60  0001 L CNN "Manufacturer"
F 12 "Active" H 7650 4850 60  0001 L CNN "Status"
	1    7450 3650
	1    0    0    -1  
$EndComp
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:20021121-00010C4LF J2
U 1 1 6190C23F
P 8450 3650
F 0 "J2" H 8450 4075 50  0000 C CNN
F 1 "20021121-00010C4LF" H 8450 3984 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_2x5_P1.27mm" H 8650 3850 60  0001 L CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/20021121.pdf" H 8650 3950 60  0001 L CNN
F 4 "609-3695-1-ND" H 8650 4050 60  0001 L CNN "Digi-Key_PN"
F 5 "20021121-00010C4LF" H 8650 4150 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 8650 4250 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 8650 4350 60  0001 L CNN "Family"
F 8 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/20021121.pdf" H 8650 4450 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/amphenol-icc-fci/20021121-00010C4LF/609-3695-1-ND/2209147" H 8650 4550 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER SMD 10POS 1.27MM" H 8650 4650 60  0001 L CNN "Description"
F 11 "Amphenol ICC (FCI)" H 8650 4750 60  0001 L CNN "Manufacturer"
F 12 "Active" H 8650 4850 60  0001 L CNN "Status"
	1    8450 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D1
U 1 1 61913F4D
P 6500 3700
F 0 "D1" V 6539 3582 50  0000 R CNN
F 1 "LED" V 6448 3582 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 6500 3700 50  0001 C CNN
F 3 "~" H 6500 3700 50  0001 C CNN
	1    6500 3700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 61915074
P 6500 3400
F 0 "R1" H 6350 3350 50  0000 L CNN
F 1 "4.99k" H 6250 3500 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 6500 3400 50  0001 C CNN
F 3 "~" H 6500 3400 50  0001 C CNN
	1    6500 3400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 6191606B
P 6500 3900
F 0 "#PWR0108" H 6500 3650 50  0001 C CNN
F 1 "GND" H 6505 3727 50  0000 C CNN
F 2 "" H 6500 3900 50  0001 C CNN
F 3 "" H 6500 3900 50  0001 C CNN
	1    6500 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0109
U 1 1 619170D9
P 6500 3250
F 0 "#PWR0109" H 6500 3100 50  0001 C CNN
F 1 "+3.3V" H 6515 3423 50  0000 C CNN
F 2 "" H 6500 3250 50  0001 C CNN
F 3 "" H 6500 3250 50  0001 C CNN
	1    6500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3250 6500 3300
Wire Wire Line
	6500 3500 6500 3550
Wire Wire Line
	6500 3850 6500 3900
NoConn ~ 7250 3450
NoConn ~ 7250 3550
NoConn ~ 7250 3650
NoConn ~ 7250 3750
NoConn ~ 7250 3850
NoConn ~ 7650 3850
NoConn ~ 7650 3750
NoConn ~ 7650 3650
NoConn ~ 7650 3550
NoConn ~ 7650 3450
$Comp
L power:+3.3V #PWR0110
U 1 1 61931C90
P 8200 3450
F 0 "#PWR0110" H 8200 3300 50  0001 C CNN
F 1 "+3.3V" V 8215 3578 50  0000 L CNN
F 2 "" H 8200 3450 50  0001 C CNN
F 3 "" H 8200 3450 50  0001 C CNN
	1    8200 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8250 3450 8200 3450
$Comp
L power:GND #PWR0111
U 1 1 61933189
P 8200 3850
F 0 "#PWR0111" H 8200 3600 50  0001 C CNN
F 1 "GND" V 8205 3722 50  0000 R CNN
F 2 "" H 8200 3850 50  0001 C CNN
F 3 "" H 8200 3850 50  0001 C CNN
	1    8200 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	8250 3850 8200 3850
Text Label 8850 3450 2    50   ~ 0
SCL
Text Label 8850 3550 2    50   ~ 0
SDA
Wire Wire Line
	8650 3450 8850 3450
Wire Wire Line
	8850 3550 8650 3550
NoConn ~ 8250 3550
NoConn ~ 8250 3650
NoConn ~ 8250 3750
NoConn ~ 8650 3650
NoConn ~ 8650 3750
NoConn ~ 8650 3850
$Comp
L Device:C_Small C3
U 1 1 61963420
P 5900 3650
F 0 "C3" H 5992 3696 50  0000 L CNN
F 1 "0.1uF" H 5992 3605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5900 3650 50  0001 C CNN
F 3 "~" H 5900 3650 50  0001 C CNN
	1    5900 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3500 5900 3500
Wire Wire Line
	5900 3500 5900 3550
Connection ~ 5500 3500
Wire Wire Line
	5900 3750 5900 3800
Wire Wire Line
	5900 3800 5500 3800
Connection ~ 5500 3800
$EndSCHEMATC
