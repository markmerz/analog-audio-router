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
L audiorouter-controller-rescue:Arduino_Nano_v3.x-MCU_Module A1
U 1 1 5C2DA6F8
P 4250 3400
F 0 "A1" H 4100 2200 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4150 2100 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4400 2450 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4250 2400 50  0001 C CNN
	1    4250 3400
	1    0    0    -1  
$EndComp
NoConn ~ 3750 2800
NoConn ~ 3750 2900
NoConn ~ 4750 3200
NoConn ~ 4750 3500
NoConn ~ 4750 3600
NoConn ~ 4750 3700
NoConn ~ 4750 3800
NoConn ~ 4750 3900
NoConn ~ 4750 4000
NoConn ~ 4750 4100
NoConn ~ 3750 3300
NoConn ~ 3750 3400
NoConn ~ 3750 3600
NoConn ~ 3750 3700
NoConn ~ 3750 3800
NoConn ~ 3750 3900
NoConn ~ 3750 4000
NoConn ~ 3750 4100
$Comp
L Connector_Generic:Conn_02x07_Odd_Even J1
U 1 1 5C54A14B
P 2050 3250
F 0 "J1" H 2100 3767 50  0000 C CNN
F 1 "ToBoards" H 2100 3676 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x07_P2.54mm_Vertical" H 2050 3250 50  0001 C CNN
F 3 "~" H 2050 3250 50  0001 C CNN
	1    2050 3250
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5C54A22A
P 5150 2800
F 0 "JP1" H 5150 3035 50  0000 C CNN
F 1 "progEnable" H 5150 2944 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5150 2800 50  0001 C CNN
F 3 "~" H 5150 2800 50  0001 C CNN
	1    5150 2800
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x02 J2
U 1 1 5C54A306
P 3150 4100
F 0 "J2" H 3229 4092 50  0000 L CNN
F 1 "PowerIn" H 3229 4001 50  0000 L CNN
F 2 "TerminalBlock:TerminalBlock_Altech_AK300-2_P5.00mm" H 3150 4100 50  0001 C CNN
F 3 "~" H 3150 4100 50  0001 C CNN
	1    3150 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5C54A4DB
P 5650 2800
F 0 "C1" V 5905 2800 50  0000 C CNN
F 1 "10u" V 5814 2800 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D4.0mm_P1.50mm" H 5688 2650 50  0001 C CNN
F 3 "~" H 5650 2800 50  0001 C CNN
	1    5650 2800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5C54A5C7
P 5900 2900
F 0 "#PWR0101" H 5900 2650 50  0001 C CNN
F 1 "GND" H 5905 2727 50  0000 C CNN
F 2 "" H 5900 2900 50  0001 C CNN
F 3 "" H 5900 2900 50  0001 C CNN
	1    5900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2800 5500 2800
Wire Wire Line
	5800 2800 5900 2800
Wire Wire Line
	5900 2800 5900 2900
$Comp
L power:GND #PWR0102
U 1 1 5C54A6A4
P 2350 3550
F 0 "#PWR0102" H 2350 3300 50  0001 C CNN
F 1 "GND" V 2355 3422 50  0000 R CNN
F 2 "" H 2350 3550 50  0001 C CNN
F 3 "" H 2350 3550 50  0001 C CNN
	1    2350 3550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5C54A6E4
P 2950 4200
F 0 "#PWR0103" H 2950 3950 50  0001 C CNN
F 1 "GND" H 2955 4027 50  0000 C CNN
F 2 "" H 2950 4200 50  0001 C CNN
F 3 "" H 2950 4200 50  0001 C CNN
	1    2950 4200
	1    0    0    -1  
$EndComp
Text GLabel 2950 4100 0    50   UnSpc ~ 0
PowerIn
Text GLabel 1850 3550 0    50   UnSpc ~ 0
PowerIn
Text GLabel 4150 1900 1    50   UnSpc ~ 0
PowerIn
$Comp
L power:GND #PWR0104
U 1 1 5C54A74C
P 4350 4400
F 0 "#PWR0104" H 4350 4150 50  0001 C CNN
F 1 "GND" H 4355 4227 50  0000 C CNN
F 2 "" H 4350 4400 50  0001 C CNN
F 3 "" H 4350 4400 50  0001 C CNN
	1    4350 4400
	1    0    0    -1  
$EndComp
NoConn ~ 4250 4400
NoConn ~ 4450 2400
NoConn ~ 4350 2400
NoConn ~ 1850 2950
NoConn ~ 2350 2950
NoConn ~ 2350 3250
NoConn ~ 1850 3250
NoConn ~ 1850 3150
NoConn ~ 1850 3050
NoConn ~ 2350 3050
NoConn ~ 2350 3150
Text GLabel 1850 3450 0    50   Output ~ 0
SerialClock
Text GLabel 2350 3350 2    50   Output ~ 0
RClock
Text GLabel 1850 3350 0    50   Output ~ 0
SerialOut
Text GLabel 3750 3000 0    50   Output ~ 0
SerialClock
Text GLabel 3750 3100 0    50   Output ~ 0
RClock
Text GLabel 3750 3200 0    50   Output ~ 0
SerialOut
$Comp
L Mechanical:MountingHole H1
U 1 1 5C54AA8E
P 2050 1050
F 0 "H1" H 2150 1096 50  0000 L CNN
F 1 "MountingHole" H 2150 1005 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2050 1050 50  0001 C CNN
F 3 "~" H 2050 1050 50  0001 C CNN
	1    2050 1050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5C54AB34
P 2050 1350
F 0 "H2" H 2150 1396 50  0000 L CNN
F 1 "MountingHole" H 2150 1305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 2050 1350 50  0001 C CNN
F 3 "~" H 2050 1350 50  0001 C CNN
	1    2050 1350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5C54AB7F
P 3000 1050
F 0 "H3" H 3100 1096 50  0000 L CNN
F 1 "MountingHole" H 3100 1005 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 3000 1050 50  0001 C CNN
F 3 "~" H 3000 1050 50  0001 C CNN
	1    3000 1050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5C54ABDB
P 3000 1350
F 0 "H4" H 3100 1396 50  0000 L CNN
F 1 "MountingHole" H 3100 1305 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 3000 1350 50  0001 C CNN
F 3 "~" H 3000 1350 50  0001 C CNN
	1    3000 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2800 4950 2800
NoConn ~ 4750 2900
$Comp
L Device:D D1
U 1 1 5E5BB20F
P 4150 2150
F 0 "D1" V 4196 2071 50  0000 R CNN
F 1 "N4007" V 4105 2071 50  0000 R CNN
F 2 "Diode_THT:D_T-1_P2.54mm_Vertical_AnodeUp" H 4150 2150 50  0001 C CNN
F 3 "~" H 4150 2150 50  0001 C CNN
	1    4150 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4150 2400 4150 2350
Wire Wire Line
	4150 2000 4150 1900
$Comp
L Device:R R2
U 1 1 5E5BF7E7
P 3600 2350
F 0 "R2" V 3393 2350 50  0000 C CNN
F 1 "6.8k" V 3484 2350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" V 3530 2350 50  0001 C CNN
F 3 "~" H 3600 2350 50  0001 C CNN
	1    3600 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 5E5C12BB
P 3100 2350
F 0 "R1" V 2893 2350 50  0000 C CNN
F 1 "6.8k" V 2984 2350 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P2.54mm_Vertical" V 3030 2350 50  0001 C CNN
F 3 "~" H 3100 2350 50  0001 C CNN
	1    3100 2350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E5C1EB9
P 2900 2450
F 0 "#PWR01" H 2900 2200 50  0001 C CNN
F 1 "GND" H 2905 2277 50  0000 C CNN
F 2 "" H 2900 2450 50  0001 C CNN
F 3 "" H 2900 2450 50  0001 C CNN
	1    2900 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 2450 2900 2350
Wire Wire Line
	2900 2350 2950 2350
Wire Wire Line
	3250 2350 3350 2350
Wire Wire Line
	3750 2350 4150 2350
Connection ~ 4150 2350
Wire Wire Line
	4150 2350 4150 2300
Text GLabel 4900 3400 2    50   UnSpc ~ 0
PowerMeasure
Text GLabel 3350 2200 1    50   UnSpc ~ 0
PowerMeasure
Wire Wire Line
	3350 2200 3350 2350
Connection ~ 3350 2350
Wire Wire Line
	3350 2350 3450 2350
Wire Wire Line
	4900 3400 4750 3400
Text GLabel 2350 3450 2    50   Output ~ 0
OutputEnable
Text GLabel 3750 3500 0    50   Output ~ 0
OutputEnable
$EndSCHEMATC
