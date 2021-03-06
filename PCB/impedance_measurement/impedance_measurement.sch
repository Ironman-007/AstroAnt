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
L AD5933YRSZ-REEL7:AD5933YRSZ-REEL7 U2
U 1 1 616764D5
P 3100 3500
F 0 "U2" H 3100 4467 50  0000 C CNN
F 1 "AD5933YRSZ-REEL7" H 3100 4376 50  0000 C CNN
F 2 "SOP65P780X200-16N" H 3100 3500 50  0001 L BNN
F 3 "" H 3100 3500 50  0001 L BNN
F 4 "Analog Devices" H 3100 3500 50  0001 L BNN "MANUFATURER"
F 5 "F" H 3100 3500 50  0001 L BNN "PARTREV"
F 6 "IPC-7351B" H 3100 3500 50  0001 L BNN "STANDARD"
	1    3100 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 616DB5DE
P 2300 3400
F 0 "R5" V 2220 3300 50  0000 C CNN
F 1 "20k" V 2220 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 2300 3400 50  0001 C CNN
F 3 "~" H 2300 3400 50  0001 C CNN
	1    2300 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 3400 2500 3400
Text Label 2000 3500 0    50   ~ 0
MCLK
Wire Wire Line
	2000 3200 2000 3400
Wire Wire Line
	2000 3200 2500 3200
Wire Wire Line
	2000 3400 2200 3400
Wire Wire Line
	2500 3700 2000 3700
Wire Wire Line
	2000 3800 2500 3800
Text Label 2000 3700 0    50   ~ 0
SCL
Text Label 2000 3800 0    50   ~ 0
SDA
Wire Wire Line
	3700 2800 3750 2800
Wire Wire Line
	3750 2800 3750 2750
Wire Wire Line
	4050 2900 4050 2250
Wire Wire Line
	4050 3000 4050 2900
Connection ~ 4050 2900
$Comp
L power:+3V0 #PWR0101
U 1 1 616DF2A2
P 4050 2200
F 0 "#PWR0101" H 4050 2050 50  0001 C CNN
F 1 "+3V0" H 4065 2373 50  0000 C CNN
F 2 "" H 4050 2200 50  0001 C CNN
F 3 "" H 4050 2200 50  0001 C CNN
	1    4050 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2900 4050 2900
Wire Wire Line
	3700 3000 4050 3000
$Comp
L power:GND #PWR0102
U 1 1 616E0D39
P 3750 4250
F 0 "#PWR0102" H 3750 4000 50  0001 C CNN
F 1 "GND" H 3755 4077 50  0000 C CNN
F 2 "" H 3750 4250 50  0001 C CNN
F 3 "" H 3750 4250 50  0001 C CNN
	1    3750 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4100 3750 4100
Wire Wire Line
	3750 4100 3750 4200
Wire Wire Line
	3700 4200 3750 4200
Connection ~ 3750 4200
Wire Wire Line
	3750 4200 3750 4250
$Comp
L power:GNDREF #PWR0103
U 1 1 616E185E
P 3800 4000
F 0 "#PWR0103" H 3800 3750 50  0001 C CNN
F 1 "GNDREF" V 3805 3872 50  0000 R CNN
F 2 "" H 3800 4000 50  0001 C CNN
F 3 "" H 3800 4000 50  0001 C CNN
	1    3800 4000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3700 4000 3800 4000
$Comp
L Device:C_Small C5
U 1 1 616E2B37
P 3900 3200
F 0 "C5" V 3840 3080 50  0000 C CNN
F 1 "47nF" V 3840 3340 50  0000 C CNN
F 2 "Capacitor_SMD:C_0402_1005Metric_Pad0.74x0.62mm_HandSolder" H 3900 3200 50  0001 C CNN
F 3 "~" H 3900 3200 50  0001 C CNN
	1    3900 3200
	0    1    1    0   
$EndComp
Wire Wire Line
	3700 3200 3800 3200
$Comp
L Device:R_Small R3
U 1 1 616E4168
P 4300 3050
F 0 "R3" V 4370 3050 50  0000 C CNN
F 1 "49.9k" V 4210 3050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 4300 3050 50  0001 C CNN
F 3 "~" H 4300 3050 50  0001 C CNN
	1    4300 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 3200 4300 3200
Wire Wire Line
	4300 3150 4300 3200
Connection ~ 4300 3200
Wire Wire Line
	4300 3200 4950 3200
Wire Wire Line
	4300 2950 4300 2900
Wire Wire Line
	4300 2900 4050 2900
$Comp
L AD8606ARZ:AD8606ARZ U1
U 1 1 616ECB30
P 5550 3400
F 0 "U1" H 5550 3967 50  0000 C CNN
F 1 "AD8606ARZ" H 5550 3876 50  0000 C CNN
F 2 "Mylib:SOIC127P600X175-8N" H 5050 3900 50  0001 L BNN
F 3 "" H 5550 3400 50  0001 L BNN
F 4 "IPC-7351B" H 6050 3950 50  0001 L BNN "STANDARD"
F 5 "5113" H 5400 4150 50  0001 L BNN "SNAPEDA_PACKAGE_ID"
F 6 "Rev. O" H 5400 4000 50  0001 L BNN "PARTREV"
F 7 "Analog Devices" H 5700 2850 50  0001 L BNN "MANUFACTURER"
	1    5550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3300 4600 3300
Wire Wire Line
	4600 3500 4950 3500
Wire Wire Line
	4600 3600 4900 3600
Text Label 4600 3300 0    50   ~ 0
SIG_OUT
Text Label 4600 3500 0    50   ~ 0
INB_P
Text Label 4600 3600 0    50   ~ 0
SIG_IN
$Comp
L power:+3V0 #PWR0104
U 1 1 616F3152
P 6200 3050
F 0 "#PWR0104" H 6200 2900 50  0001 C CNN
F 1 "+3V0" H 6215 3223 50  0000 C CNN
F 2 "" H 6200 3050 50  0001 C CNN
F 3 "" H 6200 3050 50  0001 C CNN
	1    6200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3100 6200 3100
Wire Wire Line
	6200 3100 6200 3050
Text Label 6500 3350 2    50   ~ 0
SIG_OUT
Wire Wire Line
	6500 3350 6150 3350
$Comp
L power:GND #PWR0105
U 1 1 616F4D23
P 6200 3750
F 0 "#PWR0105" H 6200 3500 50  0001 C CNN
F 1 "GND" H 6205 3577 50  0000 C CNN
F 2 "" H 6200 3750 50  0001 C CNN
F 3 "" H 6200 3750 50  0001 C CNN
	1    6200 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 3750 6200 3700
Wire Wire Line
	6200 3700 6150 3700
$Comp
L Device:R_Small R6
U 1 1 616F7294
P 6650 3450
F 0 "R6" V 6720 3450 50  0000 C CNN
F 1 "20K" V 6560 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 6650 3450 50  0001 C CNN
F 3 "~" H 6650 3450 50  0001 C CNN
	1    6650 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R8
U 1 1 616F8B88
P 5550 4050
F 0 "R8" V 5620 4050 50  0000 C CNN
F 1 "20K" V 5460 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad0.98x0.95mm_HandSolder" H 5550 4050 50  0001 C CNN
F 3 "~" H 5550 4050 50  0001 C CNN
	1    5550 4050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4900 3600 4900 4050
Wire Wire Line
	4900 4050 5450 4050
Connection ~ 4900 3600
Wire Wire Line
	4900 3600 4950 3600
Wire Wire Line
	5650 4050 6400 4050
Wire Wire Line
	6750 3450 6950 3450
Text Label 6950 3450 2    50   ~ 0
VIN
Wire Wire Line
	6150 3450 6400 3450
Wire Wire Line
	6400 3450 6400 4050
Wire Wire Line
	6400 3450 6550 3450
Connection ~ 6400 3450
$Comp
L Device:R_Small R1
U 1 1 61705A85
P 5000 2050
F 0 "R1" V 5070 2050 50  0000 C CNN
F 1 "49.9k" V 4910 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 5000 2050 50  0001 C CNN
F 3 "~" H 5000 2050 50  0001 C CNN
	1    5000 2050
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 61706587
P 5000 2350
F 0 "R2" V 5070 2350 50  0000 C CNN
F 1 "49.9k" V 4910 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 5000 2350 50  0001 C CNN
F 3 "~" H 5000 2350 50  0001 C CNN
	1    5000 2350
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 61706CCE
P 5000 2500
F 0 "#PWR0106" H 5000 2250 50  0001 C CNN
F 1 "GND" H 5005 2327 50  0000 C CNN
F 2 "" H 5000 2500 50  0001 C CNN
F 3 "" H 5000 2500 50  0001 C CNN
	1    5000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2500 5000 2450
Wire Wire Line
	5000 2250 5000 2200
$Comp
L power:+3V0 #PWR0107
U 1 1 6170A338
P 5000 1900
F 0 "#PWR0107" H 5000 1750 50  0001 C CNN
F 1 "+3V0" H 5015 2073 50  0000 C CNN
F 2 "" H 5000 1900 50  0001 C CNN
F 3 "" H 5000 1900 50  0001 C CNN
	1    5000 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 1900 5000 1950
Wire Wire Line
	5000 2200 5400 2200
Connection ~ 5000 2200
Wire Wire Line
	5000 2200 5000 2150
Text Label 5400 2200 2    50   ~ 0
INB_P
$Comp
L Mylib:ADP150 U3
U 1 1 617139B6
P 4700 4850
F 0 "U3" H 4700 4915 50  0000 C CNN
F 1 "ADP150AUJZ-3.0-R7" H 4700 4824 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 4700 4850 50  0001 C CNN
F 3 "" H 4700 4850 50  0001 C CNN
	1    4700 4850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0108
U 1 1 61717EB7
P 3750 5000
F 0 "#PWR0108" H 3750 4850 50  0001 C CNN
F 1 "+3.3V" H 3765 5173 50  0000 C CNN
F 2 "" H 3750 5000 50  0001 C CNN
F 3 "" H 3750 5000 50  0001 C CNN
	1    3750 5000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 617192F9
P 4700 5500
F 0 "#PWR0109" H 4700 5250 50  0001 C CNN
F 1 "GND" H 4705 5327 50  0000 C CNN
F 2 "" H 4700 5500 50  0001 C CNN
F 3 "" H 4700 5500 50  0001 C CNN
	1    4700 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5500 4700 5450
$Comp
L Device:C_Small C6
U 1 1 6171AD2B
P 3750 5200
F 0 "C6" H 3880 5130 50  0000 C CNN
F 1 "10uF" H 3870 5290 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3750 5200 50  0001 C CNN
F 3 "~" H 3750 5200 50  0001 C CNN
	1    3750 5200
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 6171C284
P 4050 5200
F 0 "C7" H 4160 5130 50  0000 C CNN
F 1 "0.1uF" H 4180 5290 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4050 5200 50  0001 C CNN
F 3 "~" H 4050 5200 50  0001 C CNN
	1    4050 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	3750 5000 3750 5050
Wire Wire Line
	4400 5050 4350 5050
Connection ~ 3750 5050
Wire Wire Line
	3750 5050 3750 5100
Wire Wire Line
	4050 5100 4050 5050
Connection ~ 4050 5050
Wire Wire Line
	4050 5050 3750 5050
Wire Wire Line
	4400 5150 4350 5150
Wire Wire Line
	4350 5150 4350 5050
Connection ~ 4350 5050
Wire Wire Line
	4350 5050 4050 5050
Wire Wire Line
	3750 5300 3750 5450
Wire Wire Line
	3750 5450 4050 5450
Wire Wire Line
	4050 5450 4050 5300
$Comp
L power:GND #PWR0110
U 1 1 6172068A
P 3750 5500
F 0 "#PWR0110" H 3750 5250 50  0001 C CNN
F 1 "GND" H 3755 5327 50  0000 C CNN
F 2 "" H 3750 5500 50  0001 C CNN
F 3 "" H 3750 5500 50  0001 C CNN
	1    3750 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 5500 3750 5450
Connection ~ 3750 5450
$Comp
L power:+3V0 #PWR0111
U 1 1 61725A2F
P 5300 5000
F 0 "#PWR0111" H 5300 4850 50  0001 C CNN
F 1 "+3V0" H 5315 5173 50  0000 C CNN
F 2 "" H 5300 5000 50  0001 C CNN
F 3 "" H 5300 5000 50  0001 C CNN
	1    5300 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 5050 5300 5050
Wire Wire Line
	5300 5050 5300 5000
NoConn ~ 5000 5150
$Comp
L Device:C_Small C8
U 1 1 6172A0EA
P 5300 5200
F 0 "C8" H 5430 5130 50  0000 C CNN
F 1 "10uF" H 5420 5290 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 5300 5200 50  0001 C CNN
F 3 "~" H 5300 5200 50  0001 C CNN
	1    5300 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	5300 5100 5300 5050
Connection ~ 5300 5050
$Comp
L power:GND #PWR0112
U 1 1 6172E088
P 5300 5500
F 0 "#PWR0112" H 5300 5250 50  0001 C CNN
F 1 "GND" H 5305 5327 50  0000 C CNN
F 2 "" H 5300 5500 50  0001 C CNN
F 3 "" H 5300 5500 50  0001 C CNN
	1    5300 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 5300 5300 5500
$Comp
L power:+3.3V #PWR0113
U 1 1 61741374
P 2750 1600
F 0 "#PWR0113" H 2750 1450 50  0001 C CNN
F 1 "+3.3V" V 2765 1728 50  0000 L CNN
F 2 "" H 2750 1600 50  0001 C CNN
F 3 "" H 2750 1600 50  0001 C CNN
	1    2750 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:Ferrite_Bead_Small FB1
U 1 1 61743578
P 2950 1600
F 0 "FB1" V 2805 1600 50  0000 C CNN
F 1 "Ferrite_Bead_Small" V 2804 1600 50  0001 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" V 2880 1600 50  0001 C CNN
F 3 "~" H 2950 1600 50  0001 C CNN
	1    2950 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 1600 2850 1600
$Comp
L power:VDD #PWR0114
U 1 1 61749AA6
P 3750 2750
F 0 "#PWR0114" H 3750 2600 50  0001 C CNN
F 1 "VDD" H 3765 2923 50  0000 C CNN
F 2 "" H 3750 2750 50  0001 C CNN
F 3 "" H 3750 2750 50  0001 C CNN
	1    3750 2750
	1    0    0    -1  
$EndComp
$Comp
L power:VDD #PWR0115
U 1 1 6174A9C0
P 3150 1600
F 0 "#PWR0115" H 3150 1450 50  0001 C CNN
F 1 "VDD" V 3165 1728 50  0000 L CNN
F 2 "" H 3150 1600 50  0001 C CNN
F 3 "" H 3150 1600 50  0001 C CNN
	1    3150 1600
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 61757654
P 4600 2450
F 0 "C4" H 4710 2380 50  0000 C CNN
F 1 "0.1uF" H 4730 2540 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 4600 2450 50  0001 C CNN
F 3 "~" H 4600 2450 50  0001 C CNN
	1    4600 2450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 6175CE4C
P 4600 2700
F 0 "#PWR0116" H 4600 2450 50  0001 C CNN
F 1 "GND" H 4605 2527 50  0000 C CNN
F 2 "" H 4600 2700 50  0001 C CNN
F 3 "" H 4600 2700 50  0001 C CNN
	1    4600 2700
	1    0    0    -1  
$EndComp
Connection ~ 4050 2250
Wire Wire Line
	4050 2250 4050 2200
Wire Wire Line
	4600 2250 4600 2350
Wire Wire Line
	3050 1600 3100 1600
Wire Wire Line
	3100 1750 3100 1800
Connection ~ 3100 1750
Wire Wire Line
	3400 1750 3400 1800
Wire Wire Line
	3100 1750 3400 1750
Wire Wire Line
	3100 2050 3100 2100
Connection ~ 3100 2050
Wire Wire Line
	3400 2050 3400 2000
Wire Wire Line
	3100 2050 3400 2050
Wire Wire Line
	3100 2000 3100 2050
$Comp
L power:GND #PWR0117
U 1 1 6179D81A
P 3100 2100
F 0 "#PWR0117" H 3100 1850 50  0001 C CNN
F 1 "GND" H 3105 1927 50  0000 C CNN
F 2 "" H 3100 2100 50  0001 C CNN
F 3 "" H 3100 2100 50  0001 C CNN
	1    3100 2100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 61796264
P 3400 1900
F 0 "C2" H 3510 1830 50  0000 C CNN
F 1 "10uF" H 3530 1990 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3400 1900 50  0001 C CNN
F 3 "~" H 3400 1900 50  0001 C CNN
	1    3400 1900
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 6179571A
P 3100 1900
F 0 "C1" H 3210 1830 50  0000 C CNN
F 1 "0.1uF" H 3230 1990 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 3100 1900 50  0001 C CNN
F 3 "~" H 3100 1900 50  0001 C CNN
	1    3100 1900
	-1   0    0    1   
$EndComp
Wire Wire Line
	3100 1600 3100 1750
Connection ~ 3100 1600
Wire Wire Line
	3100 1600 3150 1600
$Comp
L Device:R_Small R7
U 1 1 617E00AA
P 2300 3500
F 0 "R7" V 2220 3400 50  0001 C CNN
F 1 "NC" V 2400 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 2300 3500 50  0001 C CNN
F 3 "~" H 2300 3500 50  0001 C CNN
	1    2300 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 3500 2500 3500
Wire Wire Line
	2200 3500 2000 3500
Text Label 2100 3200 0    50   ~ 0
VIN
$Comp
L Mylib:RF_SMD J1
U 1 1 617F4417
P 10200 3000
F 0 "J1" H 10408 2868 50  0000 L CNN
F 1 "RF_SMD" H 10408 2777 50  0000 L CNN
F 2 "Mylib:RF_SMD" H 10200 3000 50  0001 C CNN
F 3 "" H 10200 3000 50  0001 C CNN
	1    10200 3000
	1    0    0    -1  
$EndComp
$Comp
L Mylib:RF_SMD J2
U 1 1 617F6C50
P 10200 3400
F 0 "J2" H 10408 3268 50  0000 L CNN
F 1 "RF_SMD" H 10408 3177 50  0000 L CNN
F 2 "Mylib:RF_SMD" H 10200 3400 50  0001 C CNN
F 3 "" H 10200 3400 50  0001 C CNN
	1    10200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10200 3150 9650 3150
Wire Wire Line
	9650 3550 10200 3550
Text Label 9650 3150 0    50   ~ 0
SIG_OUT_probe
Text Label 9650 3550 0    50   ~ 0
SIG_IN
Text Label 10200 3250 2    50   ~ 0
GND
Text Label 10200 3650 2    50   ~ 0
GND
$Comp
L SamacSys_Parts:20021321-00010C4LF J4
U 1 1 616E477E
P 6250 5000
F 0 "J4" H 6700 5265 50  0000 C CNN
F 1 "20021321-00010C4LF" H 6700 5174 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x05_P1.27mm_Vertical" H 7000 5100 50  0001 L CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/20021321.pdf" H 7000 5000 50  0001 L CNN
F 4 "Headers & Wire Housings 1.27x1.27mm BTB, Hdr Recept, SMT, 10 Pos" H 7000 4900 50  0001 L CNN "Description"
F 5 "4.75" H 7000 4800 50  0001 L CNN "Height"
F 6 "Amphenol" H 7000 4700 50  0001 L CNN "Manufacturer_Name"
F 7 "20021321-00010C4LF" H 7000 4600 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "649-202132100010C4LF" H 7000 4500 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Amphenol-FCI/20021321-00010C4LF?qs=iIVTEDlrHA08YH%252BkidUGUw%3D%3D" H 7000 4400 50  0001 L CNN "Mouser Price/Stock"
F 10 "20021321-00010C4LF" H 7000 4300 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/20021321-00010c4lf/amphenol-fci?region=europe" H 7000 4200 50  0001 L CNN "Arrow Price/Stock"
	1    6250 5000
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:20021321-00014C1LF J3
U 1 1 616F0997
P 7750 4850
F 0 "J3" H 8200 5115 50  0000 C CNN
F 1 "20021321-00014C1LF" H 8200 5024 50  0000 C CNN
F 2 "Connector_PinHeader_1.27mm:PinHeader_2x07_P1.27mm_Vertical" H 8500 4950 50  0001 L CNN
F 3 "https://4donline.ihs.com/images/VipMasterIC/IC/AFCI/AFCI-S-A0003555143/AFCI-S-A0003555143-1.pdf?hkey=EF798316E3902B6ED9A73243A3159BB0" H 8500 4850 50  0001 L CNN
F 4 "Headers & Wire Housings 20021321-00014C1LF-RECEPTACLE VT SMT" H 8500 4750 50  0001 L CNN "Description"
F 5 "4.75" H 8500 4650 50  0001 L CNN "Height"
F 6 "Amphenol" H 8500 4550 50  0001 L CNN "Manufacturer_Name"
F 7 "20021321-00014C1LF" H 8500 4450 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "649-20213210014C1LF" H 8500 4350 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Amphenol-FCI/20021321-00014C1LF?qs=fmpTyLOWOeyzBByVTT8pPA%3D%3D" H 8500 4250 50  0001 L CNN "Mouser Price/Stock"
F 10 "20021321-00014C1LF" H 8500 4150 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/20021321-00014c1lf/amphenol-fci?region=nac" H 8500 4050 50  0001 L CNN "Arrow Price/Stock"
	1    7750 4850
	1    0    0    -1  
$EndComp
NoConn ~ 6250 5000
NoConn ~ 6250 5100
NoConn ~ 6250 5200
NoConn ~ 7150 5400
NoConn ~ 7150 5300
NoConn ~ 7150 5200
NoConn ~ 7150 5100
Wire Wire Line
	6250 5400 6050 5400
Wire Wire Line
	6250 5300 6050 5300
Wire Wire Line
	7750 5450 7700 5450
$Comp
L power:+3.3V #PWR0118
U 1 1 6171F58F
P 7700 5450
F 0 "#PWR0118" H 7700 5300 50  0001 C CNN
F 1 "+3.3V" V 7700 5700 50  0000 C CNN
F 2 "" H 7700 5450 50  0001 C CNN
F 3 "" H 7700 5450 50  0001 C CNN
	1    7700 5450
	0    -1   -1   0   
$EndComp
NoConn ~ 7750 4950
NoConn ~ 7750 5150
NoConn ~ 7750 5250
NoConn ~ 7750 5350
NoConn ~ 7750 4850
NoConn ~ 8650 5150
NoConn ~ 8650 5250
NoConn ~ 8650 5350
Text Label 6050 5400 0    50   ~ 0
SCL
Text Label 6050 5300 0    50   ~ 0
SDA
NoConn ~ 7150 5000
$Comp
L Device:R_Small R9
U 1 1 61792B44
P 2550 4900
F 0 "R9" V 2590 5070 50  0000 C CNN
F 1 "0" V 2590 4760 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 2550 4900 50  0001 C CNN
F 3 "~" H 2550 4900 50  0001 C CNN
	1    2550 4900
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDREF #PWR0121
U 1 1 617A1B3A
P 2250 4900
F 0 "#PWR0121" H 2250 4650 50  0001 C CNN
F 1 "GNDREF" V 2255 4772 50  0000 R CNN
F 2 "" H 2250 4900 50  0001 C CNN
F 3 "" H 2250 4900 50  0001 C CNN
	1    2250 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 4900 2300 4900
$Comp
L Device:R_Small R10
U 1 1 617C2F74
P 2550 5050
F 0 "R10" V 2590 5220 50  0000 C CNN
F 1 "0" V 2590 4910 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 2550 5050 50  0001 C CNN
F 3 "~" H 2550 5050 50  0001 C CNN
	1    2550 5050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2300 4900 2300 5050
Connection ~ 2300 4900
Wire Wire Line
	2300 4900 2450 4900
Wire Wire Line
	2450 5050 2300 5050
Wire Wire Line
	2650 5050 2800 5050
Wire Wire Line
	2650 4900 2800 4900
$Comp
L power:GND #PWR0122
U 1 1 617952FF
P 2850 4900
F 0 "#PWR0122" H 2850 4650 50  0001 C CNN
F 1 "GND" V 2850 4700 50  0000 C CNN
F 2 "" H 2850 4900 50  0001 C CNN
F 3 "" H 2850 4900 50  0001 C CNN
	1    2850 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2800 5050 2800 4900
Connection ~ 2800 4900
Wire Wire Line
	2800 4900 2850 4900
$Comp
L power:GND #PWR0123
U 1 1 616E6EB2
P 4300 3500
F 0 "#PWR0123" H 4300 3250 50  0001 C CNN
F 1 "GND" H 4305 3327 50  0000 C CNN
F 2 "" H 4300 3500 50  0001 C CNN
F 3 "" H 4300 3500 50  0001 C CNN
	1    4300 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3250 4300 3200
Wire Wire Line
	4300 3500 4300 3450
$Comp
L Device:R_Small R4
U 1 1 616E5526
P 4300 3350
F 0 "R4" V 4370 3350 50  0000 C CNN
F 1 "49.9k" V 4210 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0402_1005Metric_Pad0.72x0.64mm_HandSolder" H 4300 3350 50  0001 C CNN
F 3 "~" H 4300 3350 50  0001 C CNN
	1    4300 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 2250 4600 2250
Wire Wire Line
	4600 2550 4600 2700
NoConn ~ 8650 4950
$Comp
L Device:C_Small C3
U 1 1 619708E0
P 6600 2600
F 0 "C3" H 6710 2530 50  0000 C CNN
F 1 "0.1uF" H 6730 2690 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 6600 2600 50  0001 C CNN
F 3 "~" H 6600 2600 50  0001 C CNN
	1    6600 2600
	-1   0    0    1   
$EndComp
$Comp
L power:+3V0 #PWR0124
U 1 1 61971A80
P 6600 2450
F 0 "#PWR0124" H 6600 2300 50  0001 C CNN
F 1 "+3V0" H 6615 2623 50  0000 C CNN
F 2 "" H 6600 2450 50  0001 C CNN
F 3 "" H 6600 2450 50  0001 C CNN
	1    6600 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2450 6600 2500
$Comp
L power:GND #PWR0125
U 1 1 61974D68
P 6600 2750
F 0 "#PWR0125" H 6600 2500 50  0001 C CNN
F 1 "GND" H 6605 2577 50  0000 C CNN
F 2 "" H 6600 2750 50  0001 C CNN
F 3 "" H 6600 2750 50  0001 C CNN
	1    6600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2750 6600 2700
NoConn ~ 8650 4850
Wire Wire Line
	8700 5450 8650 5450
$Comp
L SamacSys_Parts:ADG849YKSZ-REEL7 S1
U 1 1 619706CA
P 7750 3250
F 0 "S1" H 8250 3515 50  0000 C CNN
F 1 "ADG849YKSZ-REEL7" H 8250 3424 50  0000 C CNN
F 2 "SamacSys_Parts:SOT65P210X110-6N" H 8600 3350 50  0001 L CNN
F 3 "https://www.mouser.com/datasheet/2/609/ADG849-1502969.pdf" H 8600 3250 50  0001 L CNN
F 4 "Analog Switch ICs 1.8V to 5.5V 2:1 Mux/SPDT Switch I.C." H 8600 3150 50  0001 L CNN "Description"
F 5 "1.1" H 8600 3050 50  0001 L CNN "Height"
F 6 "Analog Devices" H 8600 2950 50  0001 L CNN "Manufacturer_Name"
F 7 "ADG849YKSZ-REEL7" H 8600 2850 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "584-ADG849YKSZ-R7" H 8600 2750 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Analog-Devices/ADG849YKSZ-REEL7?qs=BpaRKvA4VqGxD6eRnfFUIg%3D%3D" H 8600 2650 50  0001 L CNN "Mouser Price/Stock"
F 10 "ADG849YKSZ-REEL7" H 8600 2550 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/adg849yksz-reel7/analog-devices" H 8600 2450 50  0001 L CNN "Arrow Price/Stock"
	1    7750 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 3250 9350 3250
Text Label 9350 3250 2    50   ~ 0
SIG_OUT_probe
Wire Wire Line
	8750 3350 9350 3350
Text Label 9350 3350 2    50   ~ 0
SIG_OUT
Wire Wire Line
	7750 3250 7300 3250
Text Label 7300 3250 0    50   ~ 0
Cali_switch
$Comp
L Device:C_Small C9
U 1 1 619A4E28
P 7350 3700
F 0 "C9" H 7460 3630 50  0000 C CNN
F 1 "0.1uF" H 7480 3790 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric_Pad1.08x0.95mm_HandSolder" H 7350 3700 50  0001 C CNN
F 3 "~" H 7350 3700 50  0001 C CNN
	1    7350 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	7350 3500 7350 3550
Wire Wire Line
	7350 3550 7550 3550
Wire Wire Line
	7550 3550 7550 3350
Wire Wire Line
	7550 3350 7750 3350
Connection ~ 7350 3550
Wire Wire Line
	7350 3550 7350 3600
Wire Wire Line
	7750 3450 7650 3450
Wire Wire Line
	7650 3450 7650 3850
Wire Wire Line
	7650 3850 7350 3850
Wire Wire Line
	7350 3850 7350 3800
$Comp
L power:GND #PWR0126
U 1 1 619B7B75
P 7350 3900
F 0 "#PWR0126" H 7350 3650 50  0001 C CNN
F 1 "GND" H 7355 3727 50  0000 C CNN
F 2 "" H 7350 3900 50  0001 C CNN
F 3 "" H 7350 3900 50  0001 C CNN
	1    7350 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3900 7350 3850
Connection ~ 7350 3850
$Comp
L Device:R_Small R11
U 1 1 619C1F08
P 8900 3450
F 0 "R11" V 8960 3450 50  0000 C CNN
F 1 "100" V 8810 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" H 8900 3450 50  0001 C CNN
F 3 "~" H 8900 3450 50  0001 C CNN
	1    8900 3450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9000 3450 9350 3450
Text Label 9350 3450 2    50   ~ 0
SIG_IN
Wire Wire Line
	8750 3450 8800 3450
$Comp
L power:VDD #PWR0120
U 1 1 61A01B7C
P 7350 3500
F 0 "#PWR0120" H 7350 3350 50  0001 C CNN
F 1 "VDD" H 7250 3650 50  0000 L CNN
F 2 "" H 7350 3500 50  0001 C CNN
F 3 "" H 7350 3500 50  0001 C CNN
	1    7350 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 5050 7300 5050
Text Label 7300 5050 0    50   ~ 0
Cali_switch
NoConn ~ 8650 5050
$Comp
L power:GND #PWR?
U 1 1 61A60250
P 8700 5450
F 0 "#PWR?" H 8700 5200 50  0001 C CNN
F 1 "GND" V 8700 5250 50  0000 C CNN
F 2 "" H 8700 5450 50  0001 C CNN
F 3 "" H 8700 5450 50  0001 C CNN
	1    8700 5450
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
