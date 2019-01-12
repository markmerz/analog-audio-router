EESchema Schematic File Version 4
LIBS:audiorouter-controller-cache
EELAYER 26 0
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
L MCU_Module:Arduino_Nano_v3.x A?
U 1 1 5C2DA6F8
P 4250 3400
F 0 "A?" H 4250 2314 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4250 2223 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4400 2450 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4250 2400 50  0001 C CNN
	1    4250 3400
	1    0    0    -1  
$EndComp
$Comp
L mylib:TF08E U?
U 1 1 5C2CD972
P 6350 3500
F 0 "U?" V 5675 3500 50  0000 C CNN
F 1 "TF08E" V 5766 3500 50  0000 C CNN
F 2 "" H 6600 3500 50  0001 C CNN
F 3 "" H 6600 3500 50  0001 C CNN
	1    6350 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 3050 5950 2150
Wire Wire Line
	5950 2150 4350 2150
Wire Wire Line
	4350 2150 4350 2400
Wire Wire Line
	6750 3050 6750 2250
Wire Wire Line
	6750 2250 4450 2250
Wire Wire Line
	4450 2250 4450 2400
Wire Wire Line
	5950 3150 5850 3150
Wire Wire Line
	5850 3150 5850 2050
Wire Wire Line
	5850 2050 3550 2050
Wire Wire Line
	3550 2050 3550 3000
Wire Wire Line
	3550 3000 3750 3000
Wire Wire Line
	3750 3100 3450 3100
Wire Wire Line
	3450 3100 3450 1950
Wire Wire Line
	3450 1950 5750 1950
Wire Wire Line
	5750 1950 5750 3250
Wire Wire Line
	5750 3250 5950 3250
Wire Wire Line
	5950 3350 5650 3350
Wire Wire Line
	5650 3350 5650 1850
Wire Wire Line
	5650 1850 3350 1850
Wire Wire Line
	3350 1850 3350 3200
Wire Wire Line
	3350 3200 3750 3200
NoConn ~ 3750 2800
NoConn ~ 3750 2900
NoConn ~ 4750 2800
NoConn ~ 4750 2900
NoConn ~ 4750 3200
NoConn ~ 4750 3400
NoConn ~ 4750 3500
NoConn ~ 4750 3600
NoConn ~ 4750 3700
NoConn ~ 4750 3800
NoConn ~ 4750 3900
NoConn ~ 4750 4000
NoConn ~ 4750 4100
NoConn ~ 5950 3450
NoConn ~ 5950 3550
NoConn ~ 5950 3650
NoConn ~ 5950 3750
NoConn ~ 5950 3850
NoConn ~ 5950 3950
NoConn ~ 6750 3450
NoConn ~ 6750 3550
NoConn ~ 6750 3650
NoConn ~ 6750 3750
NoConn ~ 6750 3850
NoConn ~ 6750 3950
NoConn ~ 3750 3300
NoConn ~ 3750 3400
NoConn ~ 3750 3500
NoConn ~ 3750 3600
NoConn ~ 3750 3700
NoConn ~ 3750 3800
NoConn ~ 3750 3900
NoConn ~ 3750 4000
NoConn ~ 3750 4100
$EndSCHEMATC
