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
L Mylib:6_pin_connector J1
U 1 1 611FFADD
P 6200 2750
F 0 "J1" H 6278 2351 50  0000 L CNN
F 1 "6_pin_connector" H 6278 2260 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 6200 2750 50  0001 C CNN
F 3 "" H 6200 2750 50  0001 C CNN
	1    6200 2750
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:DRV8835DSSR IC1
U 1 1 612014AA
P 4450 4100
F 0 "IC1" H 5450 4365 50  0000 C CNN
F 1 "DRV8835DSSR" H 5450 4274 50  0000 C CNN
F 2 "SamacSys_Parts:DRV8835DSSR" H 6300 4200 50  0001 L CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=26&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fdrv8835" H 6300 4100 50  0001 L CNN
F 4 "Motor / Motion / Ignition Controllers & Drivers 1.5A Low Vlt Stepper Motor" H 6300 4000 50  0001 L CNN "Description"
F 5 "0.8" H 6300 3900 50  0001 L CNN "Height"
F 6 "Texas Instruments" H 6300 3800 50  0001 L CNN "Manufacturer_Name"
F 7 "DRV8835DSSR" H 6300 3700 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "595-DRV8835DSSR" H 6300 3600 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Texas-Instruments/DRV8835DSSR?qs=UFc95S4Z4CYjBOyEmbTDlA%3D%3D" H 6300 3500 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 6300 3400 50  0001 L CNN "Arrow Part Number"
F 11 "" H 6300 3300 50  0001 L CNN "Arrow Price/Stock"
	1    4450 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2450 5650 2450
Wire Wire Line
	5550 2550 5650 2550
Wire Wire Line
	5550 2650 5650 2650
Wire Wire Line
	5550 2750 5650 2750
Wire Wire Line
	5550 2850 5650 2850
Wire Wire Line
	5550 2950 5650 2950
Text Label 5650 2450 2    50   ~ 0
1
Text Label 5650 2550 2    50   ~ 0
2
Text Label 5650 2650 2    50   ~ 0
3
Text Label 5650 2750 2    50   ~ 0
4
Text Label 5650 2850 2    50   ~ 0
5
Text Label 5650 2950 2    50   ~ 0
6
Wire Wire Line
	6050 2950 5950 2950
Wire Wire Line
	6050 3050 5950 3050
Wire Wire Line
	6050 3150 5950 3150
Wire Wire Line
	6050 3250 5950 3250
Wire Wire Line
	6050 3350 5950 3350
Wire Wire Line
	6050 3450 5950 3450
Text Label 5950 2950 0    50   ~ 0
1
Text Label 5950 3050 0    50   ~ 0
2
Text Label 5950 3150 0    50   ~ 0
3
Text Label 5950 3250 0    50   ~ 0
4
Text Label 5950 3350 0    50   ~ 0
5
Text Label 5950 3450 0    50   ~ 0
6
Wire Wire Line
	4450 4100 4150 4100
Text Label 4150 4100 0    50   ~ 0
VM
Wire Wire Line
	4450 4200 4150 4200
Wire Wire Line
	4450 4300 4150 4300
Wire Wire Line
	4450 4400 4150 4400
Wire Wire Line
	4450 4500 4150 4500
Wire Wire Line
	4450 4600 4150 4600
Wire Wire Line
	4450 4700 4150 4700
Wire Wire Line
	6450 4100 6750 4100
Wire Wire Line
	6450 4200 6750 4200
Wire Wire Line
	6450 4300 6750 4300
Wire Wire Line
	6450 4400 6600 4400
Wire Wire Line
	6450 4600 6750 4600
Text Label 4150 4200 0    50   ~ 0
A1
Text Label 4150 4300 0    50   ~ 0
A2
Text Label 4150 4400 0    50   ~ 0
B1
Text Label 4150 4500 0    50   ~ 0
B2
$Comp
L power:GND #PWR02
U 1 1 6120F3A3
P 4150 4600
F 0 "#PWR02" H 4150 4350 50  0001 C CNN
F 1 "GND" V 4155 4472 50  0000 R CNN
F 2 "" H 4150 4600 50  0001 C CNN
F 3 "" H 4150 4600 50  0001 C CNN
	1    4150 4600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 6120FC5C
P 6750 4600
F 0 "#PWR03" H 6750 4350 50  0001 C CNN
F 1 "GND" V 6755 4472 50  0000 R CNN
F 2 "" H 6750 4600 50  0001 C CNN
F 3 "" H 6750 4600 50  0001 C CNN
	1    6750 4600
	0    -1   -1   0   
$EndComp
Text Label 4150 4700 0    50   ~ 0
BIN2
Text Label 6750 4100 2    50   ~ 0
BIN1
Text Label 6750 4300 2    50   ~ 0
AIN1
Text Label 6750 4200 2    50   ~ 0
AIN2
$Comp
L power:VCC #PWR01
U 1 1 61211398
P 6750 4400
F 0 "#PWR01" H 6750 4250 50  0001 C CNN
F 1 "VCC" V 6765 4528 50  0000 L CNN
F 2 "" H 6750 4400 50  0001 C CNN
F 3 "" H 6750 4400 50  0001 C CNN
	1    6750 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	6450 4500 6600 4500
Wire Wire Line
	6600 4500 6600 4400
Connection ~ 6600 4400
Wire Wire Line
	6600 4400 6750 4400
$Comp
L Mylib:6_pin_connector J3
U 1 1 6121298A
P 4850 4950
F 0 "J3" H 4928 4551 50  0000 L CNN
F 1 "6_pin_connector" H 4928 4460 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 4850 4950 50  0001 C CNN
F 3 "" H 4850 4950 50  0001 C CNN
	1    4850 4950
	1    0    0    -1  
$EndComp
$Comp
L Mylib:6_pin_connector J4
U 1 1 61215795
P 6350 4950
F 0 "J4" H 6428 4551 50  0000 L CNN
F 1 "6_pin_connector" H 6428 4460 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 6350 4950 50  0001 C CNN
F 3 "" H 6350 4950 50  0001 C CNN
	1    6350 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 5150 4400 5150
Wire Wire Line
	4700 5250 4400 5250
Wire Wire Line
	4700 5350 4400 5350
Wire Wire Line
	4700 5450 4400 5450
Wire Wire Line
	4700 5550 4400 5550
Wire Wire Line
	4700 5650 4400 5650
Wire Wire Line
	6200 5150 5950 5150
Wire Wire Line
	6200 5250 5950 5250
Wire Wire Line
	6200 5350 5950 5350
Wire Wire Line
	6200 5450 5950 5450
Wire Wire Line
	6200 5550 5950 5550
Wire Wire Line
	6200 5650 5950 5650
Text Label 4400 5150 0    50   ~ 0
VM
Text Label 4400 5250 0    50   ~ 0
A1
Text Label 4400 5350 0    50   ~ 0
A2
Text Label 4400 5450 0    50   ~ 0
B1
Text Label 4400 5550 0    50   ~ 0
B2
$Comp
L power:GND #PWR05
U 1 1 612223BF
P 4400 5650
F 0 "#PWR05" H 4400 5400 50  0001 C CNN
F 1 "GND" V 4405 5522 50  0000 R CNN
F 2 "" H 4400 5650 50  0001 C CNN
F 3 "" H 4400 5650 50  0001 C CNN
	1    4400 5650
	0    1    1    0   
$EndComp
Text Label 5950 5250 0    50   ~ 0
BIN2
Text Label 5950 5150 0    50   ~ 0
BIN1
Text Label 5950 5350 0    50   ~ 0
AIN1
Text Label 5950 5450 0    50   ~ 0
AIN2
$Comp
L power:VCC #PWR04
U 1 1 61223D8D
P 5950 5550
F 0 "#PWR04" H 5950 5400 50  0001 C CNN
F 1 "VCC" V 5965 5677 50  0000 L CNN
F 2 "" H 5950 5550 50  0001 C CNN
F 3 "" H 5950 5550 50  0001 C CNN
	1    5950 5550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61224569
P 5950 5650
F 0 "#PWR06" H 5950 5400 50  0001 C CNN
F 1 "GND" V 5955 5522 50  0000 R CNN
F 2 "" H 5950 5650 50  0001 C CNN
F 3 "" H 5950 5650 50  0001 C CNN
	1    5950 5650
	0    1    1    0   
$EndComp
$Comp
L SamacSys_Parts:1734592-6 J2
U 1 1 61203DB2
P 4650 2450
F 0 "J2" H 5100 2715 50  0000 C CNN
F 1 "1734592-6" H 5100 2624 50  0000 C CNN
F 2 "SamacSys_Parts:17345926" H 5400 2550 50  0001 L CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1734592&DocType=Customer+Drawing&DocLang=English&DocFormat=pdf&PartCntxt=1-1734592-6" H 5400 2450 50  0001 L CNN
F 4 "FFC & FPC Connectors FPC CONN. 0.5MM PITCH B/C 6P" H 5400 2350 50  0001 L CNN "Description"
F 5 "2" H 5400 2250 50  0001 L CNN "Height"
F 6 "TE Connectivity" H 5400 2150 50  0001 L CNN "Manufacturer_Name"
F 7 "1734592-6" H 5400 2050 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "571-1734592-6" H 5400 1950 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/TE-Connectivity/1734592-6?qs=n3Ybsy482HHDh9IzLv%252BLHw%3D%3D" H 5400 1850 50  0001 L CNN "Mouser Price/Stock"
F 10 "1734592-6" H 5400 1750 50  0001 L CNN "Arrow Part Number"
F 11 "https://www.arrow.com/en/products/1734592-6/te-connectivity?region=nac" H 5400 1650 50  0001 L CNN "Arrow Price/Stock"
	1    4650 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61208DA9
P 4550 2450
F 0 "#PWR0101" H 4550 2200 50  0001 C CNN
F 1 "GND" V 4555 2322 50  0000 R CNN
F 2 "" H 4550 2450 50  0001 C CNN
F 3 "" H 4550 2450 50  0001 C CNN
	1    4550 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 2450 4600 2450
Wire Wire Line
	4600 2450 4600 2550
Wire Wire Line
	4600 2550 4650 2550
Connection ~ 4600 2450
Wire Wire Line
	4600 2450 4550 2450
$EndSCHEMATC
