EESchema Schematic File Version 4
LIBS:Kicad-Midi2CV-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "MIDI to CV"
Date "2018-12-26"
Rev "Rev A2"
Comp "Promesoft"
Comment1 "Johansen Engineering"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5C1C06D8
P 4550 4200
F 0 "A1" H 4550 3114 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 4150 3200 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 4700 3250 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 4550 3200 50  0001 C CNN
	1    4550 4200
	1    0    0    -1  
$EndComp
$Comp
L Isolator:EL814 U2
U 1 1 5C1C075E
P 2000 3750
F 0 "U2" H 2000 4075 50  0000 C CNN
F 1 "EL814" H 2000 3984 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm_LongPads" H 1800 3550 50  0001 L CIN
F 3 "http://www.everlight.com/file/ProductFile/EL814.pdf" H 2025 3750 50  0001 L CNN
	1    2000 3750
	1    0    0    -1  
$EndComp
$Comp
L MMBT2222A:MMBT2222A Q2
U 1 1 5C1C0AF7
P 2750 3850
F 0 "Q2" H 2891 3896 50  0000 L CNN
F 1 "MMBT2222A" H 2891 3805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2750 3850 50  0001 L BNN
F 3 "Unavailable" H 2750 3850 50  0001 L BNN
F 4 "None" H 2750 3850 50  0001 L BNN "Field4"
F 5 "ON" H 2750 3850 50  0001 L BNN "Field5"
F 6 "MMBT2222A" H 2750 3850 50  0001 L BNN "Field7"
F 7 "TO-236-3 Taitron" H 2750 3850 50  0001 L BNN "Field8"
	1    2750 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector:DIN-5 J7
U 1 1 5C1C0BCC
P 1000 3750
F 0 "J7" H 1000 3476 50  0000 C CNN
F 1 "MIDI IN" H 1000 3385 50  0000 C CNN
F 2 "w_conn_av:din-5" H 1000 3750 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 1000 3750 50  0001 C CNN
	1    1000 3750
	1    0    0    -1  
$EndComp
$Comp
L Analog_DAC:MCP4728 U3
U 1 1 5C1C0F59
P 6950 5750
F 0 "U3" H 6950 6228 50  0000 C CNN
F 1 "MCP4728" H 6950 6137 50  0000 C CNN
F 2 "Package_SO:MSOP-10_3x3mm_P0.5mm" H 6950 5150 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/22187E.pdf" H 6950 6000 50  0001 C CNN
	1    6950 5750
	1    0    0    -1  
$EndComp
$Comp
L aj_adc_dac:MCP4725module IC2
U 1 1 5C1C16C6
P 6950 4350
F 0 "IC2" H 7250 4650 60  0000 L CNN
F 1 "MCP4725module" H 7100 4050 60  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 6950 4350 50  0001 C CNN
F 3 "" H 6950 4350 50  0001 C CNN
	1    6950 4350
	1    0    0    -1  
$EndComp
$Comp
L aj_adc_dac:MCP4725module IC1
U 1 1 5C1C326B
P 6950 3300
F 0 "IC1" H 7250 3600 60  0000 L CNN
F 1 "MCP4725module" H 7100 3000 60  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x06_P2.54mm_Vertical" H 6950 3300 50  0001 C CNN
F 3 "" H 6950 3300 50  0001 C CNN
	1    6950 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2950 6100 3200
Wire Wire Line
	6200 2650 6200 2600
Wire Wire Line
	6200 2600 6100 2600
Wire Wire Line
	6100 2600 6100 2650
Connection ~ 6100 4250
Wire Wire Line
	6100 4250 6400 4250
Wire Wire Line
	5750 4250 6100 4250
Wire Wire Line
	5750 5750 6350 5750
Wire Wire Line
	5650 5650 6350 5650
Wire Wire Line
	4050 4900 4050 5850
Wire Wire Line
	3950 4800 3950 5950
Wire Wire Line
	3950 4800 4050 4800
$Comp
L Device:LED D1
U 1 1 5C1CEEC6
P 1100 5100
F 0 "D1" H 1091 5316 50  0000 C CNN
F 1 "LED1" H 1091 5225 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm_Horizontal_O6.35mm_Z6.0mm" H 1100 5100 50  0001 C CNN
F 3 "~" H 1100 5100 50  0001 C CNN
	1    1100 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D2
U 1 1 5C1CEF6A
P 1100 5400
F 0 "D2" H 1091 5616 50  0000 C CNN
F 1 "LED2" H 1091 5525 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm_Horizontal_O6.35mm_Z6.0mm" H 1100 5400 50  0001 C CNN
F 3 "~" H 1100 5400 50  0001 C CNN
	1    1100 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D3
U 1 1 5C1CF002
P 1100 5750
F 0 "D3" H 1091 5966 50  0000 C CNN
F 1 "LED3" H 1091 5875 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm_Horizontal_O6.35mm_Z6.0mm" H 1100 5750 50  0001 C CNN
F 3 "~" H 1100 5750 50  0001 C CNN
	1    1100 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D4
U 1 1 5C1CF008
P 1100 6050
F 0 "D4" H 1091 6266 50  0000 C CNN
F 1 "LED4" H 1091 6175 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm_Horizontal_O6.35mm_Z6.0mm" H 1100 6050 50  0001 C CNN
F 3 "~" H 1100 6050 50  0001 C CNN
	1    1100 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R18
U 1 1 5C1CFAFB
P 1550 5100
F 0 "R18" V 1343 5100 50  0000 C CNN
F 1 "680R" V 1434 5100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1480 5100 50  0001 C CNN
F 3 "~" H 1550 5100 50  0001 C CNN
	1    1550 5100
	0    1    1    0   
$EndComp
$Comp
L Device:R R19
U 1 1 5C1CFC0E
P 1550 5400
F 0 "R19" V 1343 5400 50  0000 C CNN
F 1 "680R" V 1434 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1480 5400 50  0001 C CNN
F 3 "~" H 1550 5400 50  0001 C CNN
	1    1550 5400
	0    1    1    0   
$EndComp
$Comp
L Device:R R20
U 1 1 5C1CFC52
P 1550 5750
F 0 "R20" V 1343 5750 50  0000 C CNN
F 1 "680R" V 1434 5750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1480 5750 50  0001 C CNN
F 3 "~" H 1550 5750 50  0001 C CNN
	1    1550 5750
	0    1    1    0   
$EndComp
$Comp
L Device:R R21
U 1 1 5C1CFCA2
P 1550 6050
F 0 "R21" V 1343 6050 50  0000 C CNN
F 1 "680R" V 1434 6050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1480 6050 50  0001 C CNN
F 3 "~" H 1550 6050 50  0001 C CNN
	1    1550 6050
	0    1    1    0   
$EndComp
$Comp
L Device:R R14
U 1 1 5C1CFCF0
P 1500 3650
F 0 "R14" V 1293 3650 50  0000 C CNN
F 1 "220R" V 1384 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 3650 50  0001 C CNN
F 3 "~" H 1500 3650 50  0001 C CNN
	1    1500 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 5100 1250 5100
Wire Wire Line
	1400 5400 1250 5400
Wire Wire Line
	1400 5750 1250 5750
Wire Wire Line
	1400 6050 1250 6050
$Comp
L power:GND #PWR017
U 1 1 5C1D9DC0
P 6950 6250
F 0 "#PWR017" H 6950 6000 50  0001 C CNN
F 1 "GND" H 6955 6077 50  0000 C CNN
F 2 "" H 6950 6250 50  0001 C CNN
F 3 "" H 6950 6250 50  0001 C CNN
	1    6950 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  5100 750  5100
Wire Wire Line
	750  5100 750  5400
Wire Wire Line
	950  5400 750  5400
Connection ~ 750  5400
Wire Wire Line
	750  5400 750  5750
Wire Wire Line
	950  5750 750  5750
Connection ~ 750  5750
Wire Wire Line
	750  5750 750  6050
Wire Wire Line
	950  6050 750  6050
Connection ~ 750  6050
$Comp
L Device:R R13
U 1 1 5C1DFF32
P 2850 3400
F 0 "R13" H 2780 3354 50  0000 R CNN
F 1 "1k" H 2780 3445 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2780 3400 50  0001 C CNN
F 3 "~" H 2850 3400 50  0001 C CNN
	1    2850 3400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R15
U 1 1 5C1E3615
P 2500 4100
F 0 "R15" H 2430 4054 50  0000 R CNN
F 1 "1k" H 2430 4145 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 4100 50  0001 C CNN
F 3 "~" H 2500 4100 50  0001 C CNN
	1    2500 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 3850 2500 3850
Wire Wire Line
	2500 3950 2500 3850
Connection ~ 2500 3850
Wire Wire Line
	2500 3850 2650 3850
$Comp
L Device:R R11
U 1 1 5C1E9F2A
P 6100 2800
F 0 "R11" H 6250 2900 50  0000 R CNN
F 1 "8k2" H 6300 2800 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6030 2800 50  0001 C CNN
F 3 "~" H 6100 2800 50  0001 C CNN
	1    6100 2800
	-1   0    0    1   
$EndComp
$Comp
L Device:R R12
U 1 1 5C1E9FAC
P 6200 2800
F 0 "R12" H 6100 2900 50  0000 R CNN
F 1 "8k2" H 6100 2800 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6130 2800 50  0001 C CNN
F 3 "~" H 6200 2800 50  0001 C CNN
	1    6200 2800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6400 3200 6100 3200
Wire Wire Line
	6400 3300 6200 3300
Wire Wire Line
	6200 3300 6200 4350
Connection ~ 6200 4350
Wire Wire Line
	6200 4350 6400 4350
Wire Wire Line
	5650 4350 6200 4350
Wire Wire Line
	6400 3450 6400 3700
Wire Wire Line
	7650 2950 7650 4000
Wire Wire Line
	7650 4000 6950 4000
Wire Wire Line
	6950 2950 7650 2950
Wire Wire Line
	7650 4000 7650 5450
Wire Wire Line
	6950 5450 7650 5450
Connection ~ 7650 4000
Connection ~ 7650 2950
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 5C21A17B
P 5750 2750
F 0 "J4" H 5850 2850 50  0000 L CNN
F 1 "Conn_01x04" H 5550 3000 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 5750 2750 50  0001 C CNN
F 3 "~" H 5750 2750 50  0001 C CNN
	1    5750 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5C2240E9
P 5550 3000
F 0 "#PWR010" H 5550 2750 50  0001 C CNN
F 1 "GND" H 5555 2827 50  0000 C CNN
F 2 "" H 5550 3000 50  0001 C CNN
F 3 "" H 5550 3000 50  0001 C CNN
	1    5550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 2950 5550 3000
Connection ~ 6100 3200
Wire Wire Line
	6100 3200 6100 4250
Wire Wire Line
	6200 2950 6200 3300
Connection ~ 6200 3300
Wire Wire Line
	6100 2450 6100 2600
Connection ~ 6100 2600
$Comp
L Device:C C2
U 1 1 5C22F1AA
P 2250 1100
F 0 "C2" H 2365 1146 50  0000 L CNN
F 1 "100n" H 2365 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2288 950 50  0001 C CNN
F 3 "~" H 2250 1100 50  0001 C CNN
	1    2250 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5C22F286
P 1850 1100
F 0 "C1" H 1968 1146 50  0000 L CNN
F 1 "100uF" H 1968 1055 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 1888 950 50  0001 C CNN
F 3 "~" H 1850 1100 50  0001 C CNN
	1    1850 1100
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack J1
U 1 1 5C22F3A0
P 1000 1100
F 0 "J1" H 1055 1425 50  0000 C CNN
F 1 "Vin 7-12v" H 1055 1334 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_CUI_PJ-063AH_Horizontal" H 1050 1060 50  0001 C CNN
F 3 "~" H 1050 1060 50  0001 C CNN
	1    1000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 1000 1300 950 
Connection ~ 1850 950 
Wire Wire Line
	1300 1200 1300 1250
Wire Wire Line
	1300 1250 1850 1250
Connection ~ 1850 1250
Wire Wire Line
	1850 1250 2250 1250
Wire Notes Line
	5950 2150 5950 6500
Wire Notes Line
	5950 6500 8150 6500
Wire Notes Line
	8150 6500 8150 2150
Wire Notes Line
	8150 2150 5950 2150
Wire Notes Line
	600  4650 3350 4650
Wire Notes Line
	3350 4650 3350 3050
Wire Notes Line
	3350 3050 600  3050
Wire Notes Line
	600  3050 600  4650
Wire Notes Line
	3350 1450 3350 700 
Wire Notes Line
	3350 700  600  700 
Wire Notes Line
	600  700  600  1450
Wire Notes Line
	600  1450 3350 1450
Wire Wire Line
	1650 3650 1700 3650
Wire Wire Line
	1300 3850 1700 3850
Wire Wire Line
	1300 3650 1350 3650
$Comp
L Device:C C6
U 1 1 5C289E13
P 2350 7400
F 0 "C6" H 2465 7446 50  0000 L CNN
F 1 "10n" H 2465 7355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2388 7250 50  0001 C CNN
F 3 "~" H 2350 7400 50  0001 C CNN
	1    2350 7400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5C289F13
P 2700 7450
F 0 "C7" H 2815 7496 50  0000 L CNN
F 1 "10n" H 2815 7405 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2738 7300 50  0001 C CNN
F 3 "~" H 2700 7450 50  0001 C CNN
	1    2700 7450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR02
U 1 1 5C2979FB
P 1850 950
F 0 "#PWR02" H 1850 800 50  0001 C CNN
F 1 "VCC" H 1867 1123 50  0000 C CNN
F 2 "" H 1850 950 50  0001 C CNN
F 3 "" H 1850 950 50  0001 C CNN
	1    1850 950 
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 5C297A7B
P 2250 950
F 0 "#FLG01" H 2250 1025 50  0001 C CNN
F 1 "PWR_FLAG" H 2250 1124 50  0000 C CNN
F 2 "" H 2250 950 50  0001 C CNN
F 3 "~" H 2250 950 50  0001 C CNN
	1    2250 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 2450 7650 2450
Wire Wire Line
	7650 2450 7650 2950
Connection ~ 6100 2450
$Comp
L power:+5V #PWR07
U 1 1 5C29C771
P 4750 2400
F 0 "#PWR07" H 4750 2250 50  0001 C CNN
F 1 "+5V" H 4700 2300 50  0000 C CNN
F 2 "" H 4750 2400 50  0001 C CNN
F 3 "" H 4750 2400 50  0001 C CNN
	1    4750 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2850 4850 2850
Wire Wire Line
	4650 2850 4650 3200
Wire Wire Line
	4450 2650 4450 3200
$Comp
L power:GND #PWR03
U 1 1 5C293067
P 2250 1250
F 0 "#PWR03" H 2250 1000 50  0001 C CNN
F 1 "GND" H 2255 1077 50  0000 C CNN
F 2 "" H 2250 1250 50  0001 C CNN
F 3 "" H 2250 1250 50  0001 C CNN
	1    2250 1250
	1    0    0    -1  
$EndComp
Connection ~ 2250 1250
$Comp
L Device:C C3
U 1 1 5C2930C9
P 2850 1100
F 0 "C3" H 2965 1146 50  0000 L CNN
F 1 "100n" H 2965 1055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2888 950 50  0001 C CNN
F 3 "~" H 2850 1100 50  0001 C CNN
	1    2850 1100
	-1   0    0    1   
$EndComp
Connection ~ 5550 2950
$Comp
L Device:C C4
U 1 1 5C29D34F
P 5000 2950
F 0 "C4" H 5115 2996 50  0000 L CNN
F 1 "C" H 5115 2905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5038 2800 50  0001 C CNN
F 3 "~" H 5000 2950 50  0001 C CNN
	1    5000 2950
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR09
U 1 1 5C2A7BAB
P 4450 2650
F 0 "#PWR09" H 4450 2500 50  0001 C CNN
F 1 "VCC" H 4467 2823 50  0000 C CNN
F 2 "" H 4450 2650 50  0001 C CNN
F 3 "" H 4450 2650 50  0001 C CNN
	1    4450 2650
	1    0    0    -1  
$EndComp
Connection ~ 4450 2650
Wire Wire Line
	1300 950  1850 950 
Connection ~ 2250 950 
Wire Wire Line
	1850 950  2250 950 
$Comp
L Device:R R3
U 1 1 5C2B290D
P 2500 950
F 0 "R3" V 2293 950 50  0000 C CNN
F 1 "10M" V 2384 950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 950 50  0001 C CNN
F 3 "~" H 2500 950 50  0001 C CNN
	1    2500 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	2250 950  2350 950 
$Comp
L power:+5V #PWR01
U 1 1 5C2B7B92
P 2850 900
F 0 "#PWR01" H 2850 750 50  0001 C CNN
F 1 "+5V" H 2800 800 50  0000 C CNN
F 2 "" H 2850 900 50  0001 C CNN
F 3 "" H 2850 900 50  0001 C CNN
	1    2850 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 950  2850 950 
Wire Wire Line
	2850 950  2850 900 
Connection ~ 2850 950 
Wire Wire Line
	2250 1250 2550 1250
Wire Wire Line
	4750 2750 4750 3200
Wire Wire Line
	4850 2950 4850 2850
Connection ~ 4850 2850
$Comp
L Connector:AudioJack2 J5
U 1 1 5C2C7CBB
P 9600 2900
F 0 "J5" H 9367 2971 50  0000 R CNN
F 1 "CV1" H 9367 2880 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 2900 50  0001 C CNN
F 3 "~" H 9600 2900 50  0001 C CNN
F 4 "CV1 Out" H 9600 2900 50  0001 C CNN "Function"
	1    9600 2900
	-1   0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2 J6
U 1 1 5C2C7E1B
P 9600 3350
F 0 "J6" H 9367 3421 50  0000 R CNN
F 1 "CV2" H 9367 3330 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 3350 50  0001 C CNN
F 3 "~" H 9600 3350 50  0001 C CNN
F 4 "CV2 out" H 9600 3350 50  0001 C CNN "Function"
	1    9600 3350
	-1   0    0    -1  
$EndComp
Text GLabel 3950 4200 0    50   Input ~ 0
Gate1
Text GLabel 3950 4300 0    50   Input ~ 0
Gate2
Text GLabel 5350 4200 2    50   Input ~ 0
Btn
Text GLabel 3950 4700 0    50   Input ~ 0
LED-sel2
Wire Wire Line
	3950 4700 4050 4700
Wire Wire Line
	4050 4600 3950 4600
Wire Wire Line
	3950 4300 4050 4300
Wire Wire Line
	4050 4200 3950 4200
Text GLabel 3950 3800 0    50   Input ~ 0
LED1
Text GLabel 3950 3900 0    50   Input ~ 0
LED2
Text GLabel 3950 4000 0    50   Input ~ 0
LED3
Text GLabel 3950 4100 0    50   Input ~ 0
LED4
Wire Wire Line
	3950 4100 4050 4100
Wire Wire Line
	4050 4000 3950 4000
Wire Wire Line
	3950 3900 4050 3900
Wire Wire Line
	4050 3800 3950 3800
Text GLabel 4050 7100 2    50   Input ~ 0
Btn
Text GLabel 2400 6350 2    50   Input ~ 0
LED-sel
Text GLabel 2400 5100 2    50   Input ~ 0
LED1
Text GLabel 2400 5400 2    50   Input ~ 0
LED2
Text GLabel 2400 5750 2    50   Input ~ 0
LED3
Text GLabel 2400 6050 2    50   Input ~ 0
LED4
$Comp
L power:GND #PWR013
U 1 1 5C300B4F
P 2850 4300
F 0 "#PWR013" H 2850 4050 50  0001 C CNN
F 1 "GND" H 2855 4127 50  0000 C CNN
F 2 "" H 2850 4300 50  0001 C CNN
F 3 "" H 2850 4300 50  0001 C CNN
	1    2850 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D5
U 1 1 5C30AA34
P 1100 6350
F 0 "D5" H 1091 6566 50  0000 C CNN
F 1 "LEDset1" H 1091 6475 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm_Horizontal_O6.35mm_Z6.0mm" H 1100 6350 50  0001 C CNN
F 3 "~" H 1100 6350 50  0001 C CNN
	1    1100 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R22
U 1 1 5C30AA3A
P 1550 6350
F 0 "R22" V 1343 6350 50  0000 C CNN
F 1 "680R" V 1434 6350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1480 6350 50  0001 C CNN
F 3 "~" H 1550 6350 50  0001 C CNN
	1    1550 6350
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 6350 1250 6350
$Comp
L power:GND #PWR019
U 1 1 5C30AA42
P 750 7550
F 0 "#PWR019" H 750 7300 50  0001 C CNN
F 1 "GND" H 755 7377 50  0000 C CNN
F 2 "" H 750 7550 50  0001 C CNN
F 3 "" H 750 7550 50  0001 C CNN
	1    750  7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6350 2400 6350
Wire Wire Line
	1700 6050 2400 6050
Wire Wire Line
	1700 5750 2400 5750
Wire Wire Line
	1700 5400 2400 5400
Wire Wire Line
	1700 5100 2400 5100
Text GLabel 7900 5650 2    50   Input ~ 0
CV1
Text GLabel 7900 5750 2    50   Input ~ 0
CV2
Text GLabel 7900 5850 2    50   Input ~ 0
CV3
Text GLabel 7900 5950 2    50   Input ~ 0
CV4
Wire Wire Line
	7700 5750 7900 5750
Wire Wire Line
	7550 5850 7900 5850
Wire Wire Line
	7550 5950 7900 5950
Text GLabel 9100 4650 0    50   Input ~ 0
Gate1
Text GLabel 9100 5100 0    50   Input ~ 0
Gate2
Text GLabel 5750 1200 0    50   Input ~ 0
CV1
Text GLabel 8800 1200 0    50   Input ~ 0
CV2
Text GLabel 9050 3800 0    50   Input ~ 0
CV3
Text GLabel 9050 4200 0    50   Input ~ 0
CV4
Wire Wire Line
	2850 3150 2850 3250
Wire Wire Line
	4750 2400 4750 2450
Connection ~ 4750 2750
Connection ~ 4750 2450
Wire Wire Line
	4750 2450 4750 2750
$Comp
L power:+5V #PWR011
U 1 1 5C3B3E91
P 2850 3150
F 0 "#PWR011" H 2850 3000 50  0001 C CNN
F 1 "+5V" H 2800 3050 50  0000 C CNN
F 2 "" H 2850 3150 50  0001 C CNN
F 3 "" H 2850 3150 50  0001 C CNN
	1    2850 3150
	1    0    0    -1  
$EndComp
Connection ~ 2850 3150
Text Label 3550 3600 0    50   ~ 0
RX
Text GLabel 3950 4400 0    50   Input ~ 0
Gate3
Text GLabel 3950 4500 0    50   Input ~ 0
Gate4
Wire Wire Line
	3950 4400 4050 4400
Wire Wire Line
	3950 4500 4050 4500
Text Label 4050 5850 0    50   ~ 0
LDAC
Text Label 4050 5950 0    50   ~ 0
RDY-BSY
Text Label 5450 4700 0    50   ~ 0
SCL
Text Label 5450 4600 0    50   ~ 0
SDA
$Comp
L Device:R R24
U 1 1 5C3D162F
P 3650 7100
F 0 "R24" V 3443 7100 50  0000 C CNN
F 1 "10k" V 3534 7100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3580 7100 50  0001 C CNN
F 3 "~" H 3650 7100 50  0001 C CNN
	1    3650 7100
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 5C3D16CF
P 3900 7250
F 0 "C5" H 4015 7296 50  0000 L CNN
F 1 "10n" H 4015 7205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3938 7100 50  0001 C CNN
F 3 "~" H 3900 7250 50  0001 C CNN
	1    3900 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 4250 5750 4600
Wire Wire Line
	5650 4350 5650 4700
Wire Wire Line
	4050 5850 6350 5850
Wire Wire Line
	3950 5950 6350 5950
Wire Wire Line
	5050 4700 5650 4700
Connection ~ 5650 4700
Wire Wire Line
	5650 4700 5650 5650
Wire Wire Line
	5050 4600 5750 4600
Connection ~ 5750 4600
Wire Wire Line
	5750 4600 5750 5750
Wire Wire Line
	750  6050 750  6350
Text GLabel 2400 6600 2    50   Input ~ 0
LED-sel2
$Comp
L Device:LED D6
U 1 1 5C41F470
P 1100 6600
F 0 "D6" H 1091 6816 50  0000 C CNN
F 1 "LEDset2" H 1091 6725 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm_Horizontal_O6.35mm_Z6.0mm" H 1100 6600 50  0001 C CNN
F 3 "~" H 1100 6600 50  0001 C CNN
	1    1100 6600
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 5C41F476
P 1550 6600
F 0 "R23" V 1343 6600 50  0000 C CNN
F 1 "680R" V 1434 6600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1480 6600 50  0001 C CNN
F 3 "~" H 1550 6600 50  0001 C CNN
	1    1550 6600
	0    1    1    0   
$EndComp
Wire Wire Line
	1400 6600 1250 6600
Wire Wire Line
	1700 6600 2400 6600
Wire Wire Line
	950  6350 750  6350
Connection ~ 750  6350
Wire Wire Line
	750  6350 750  6600
Wire Wire Line
	950  6600 750  6600
Connection ~ 750  6600
Text GLabel 3950 4600 0    50   Input ~ 0
LED-sel
Wire Wire Line
	5050 4200 5350 4200
Text GLabel 5350 4300 2    50   Input ~ 0
A1
Text GLabel 5350 4400 2    50   Input ~ 0
A2
Text GLabel 2150 7100 0    50   Input ~ 0
A1
Wire Wire Line
	5050 4300 5350 4300
Wire Wire Line
	5050 4400 5350 4400
Text GLabel 5350 4500 2    50   Input ~ 0
A3
Wire Wire Line
	5350 4500 5050 4500
Text GLabel 8550 2250 0    50   Input ~ 0
A3
Text GLabel 9100 5550 0    50   Input ~ 0
Gate3
Text GLabel 9100 5950 0    50   Input ~ 0
Gate4
Wire Wire Line
	5150 2950 5550 2950
Wire Wire Line
	4850 2850 5550 2850
Wire Wire Line
	4750 2750 5550 2750
Wire Wire Line
	4450 2650 5550 2650
Wire Notes Line
	600  4800 600  7750
Wire Notes Line
	600  4800 3050 4800
Wire Notes Line
	3050 4800 3050 6750
Wire Notes Line
	4600 7750 4600 6750
Wire Notes Line
	600  7750 4600 7750
Wire Notes Line
	600  6750 4600 6750
$Comp
L Connector:AudioJack2 J8
U 1 1 5C5280BE
P 9600 3800
F 0 "J8" H 9367 3871 50  0000 R CNN
F 1 "CV3" H 9367 3780 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 3800 50  0001 C CNN
F 3 "~" H 9600 3800 50  0001 C CNN
	1    9600 3800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2 J9
U 1 1 5C528138
P 9600 4200
F 0 "J9" H 9367 4271 50  0000 R CNN
F 1 "CV4" H 9367 4180 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 4200 50  0001 C CNN
F 3 "~" H 9600 4200 50  0001 C CNN
	1    9600 4200
	-1   0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2 J10
U 1 1 5C528256
P 9600 4650
F 0 "J10" H 9367 4721 50  0000 R CNN
F 1 "Gate1" H 9367 4630 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 4650 50  0001 C CNN
F 3 "~" H 9600 4650 50  0001 C CNN
	1    9600 4650
	-1   0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2 J11
U 1 1 5C52825C
P 9600 5100
F 0 "J11" H 9367 5171 50  0000 R CNN
F 1 "Gate2" H 9367 5080 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 5100 50  0001 C CNN
F 3 "~" H 9600 5100 50  0001 C CNN
	1    9600 5100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2 J12
U 1 1 5C528262
P 9600 5550
F 0 "J12" H 9367 5621 50  0000 R CNN
F 1 "Gate3" H 9367 5530 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 5550 50  0001 C CNN
F 3 "~" H 9600 5550 50  0001 C CNN
	1    9600 5550
	-1   0    0    -1  
$EndComp
$Comp
L Connector:AudioJack2 J13
U 1 1 5C528268
P 9600 5950
F 0 "J13" H 9367 6021 50  0000 R CNN
F 1 "Gate4" H 9367 5930 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 5950 50  0001 C CNN
F 3 "~" H 9600 5950 50  0001 C CNN
	1    9600 5950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9050 2900 9400 2900
Wire Wire Line
	9100 5950 9400 5950
Wire Wire Line
	9100 5550 9400 5550
Wire Wire Line
	9100 5100 9400 5100
Wire Wire Line
	9100 4650 9400 4650
Wire Wire Line
	9050 4200 9400 4200
Wire Wire Line
	9050 3800 9400 3800
Wire Wire Line
	9050 3350 9400 3350
$Comp
L Connector:AudioJack2 J3
U 1 1 5C59B839
P 9600 2250
F 0 "J3" H 9367 2321 50  0000 R CNN
F 1 "CV in" H 9367 2230 50  0000 R CNN
F 2 "Connector_Audio:AudioJack3StereoNarrow-PJ-321" H 9600 2250 50  0001 C CNN
F 3 "~" H 9600 2250 50  0001 C CNN
F 4 "VC input" H 9600 2250 50  0001 C CNN "Function"
	1    9600 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9400 2150 9250 2150
Wire Wire Line
	9250 2800 9400 2800
Wire Wire Line
	9400 3250 9250 3250
Connection ~ 9250 2800
Wire Wire Line
	9400 3700 9250 3700
Connection ~ 9250 3250
Wire Wire Line
	9400 4100 9250 4100
Connection ~ 9250 3700
Wire Wire Line
	9400 4550 9250 4550
Connection ~ 9250 4100
Wire Wire Line
	9400 5000 9250 5000
Connection ~ 9250 4550
Wire Wire Line
	9400 5450 9250 5450
Connection ~ 9250 5000
Wire Wire Line
	9400 5850 9250 5850
Connection ~ 9250 5450
Wire Wire Line
	9250 6050 9250 5850
Connection ~ 9250 5850
$Comp
L power:GND #PWR016
U 1 1 5C641C43
P 9250 6050
F 0 "#PWR016" H 9250 5800 50  0001 C CNN
F 1 "GND" H 9255 5877 50  0000 C CNN
F 2 "" H 9250 6050 50  0001 C CNN
F 3 "" H 9250 6050 50  0001 C CNN
	1    9250 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4750 6950 4750
Wire Wire Line
	7500 3200 7700 3200
Wire Wire Line
	6400 3700 6950 3700
Wire Wire Line
	6950 3700 6950 3650
Wire Wire Line
	6950 3750 6950 3700
Connection ~ 6950 3700
Wire Wire Line
	7500 4250 7600 4250
Wire Wire Line
	7600 4250 7600 4700
Wire Wire Line
	7600 5650 7900 5650
Wire Wire Line
	6950 4700 6950 4750
Wire Wire Line
	7550 5650 7600 5650
Connection ~ 7600 5650
Wire Wire Line
	6950 6150 6950 6250
Wire Wire Line
	7550 5750 7700 5750
Connection ~ 7700 5750
Wire Wire Line
	4750 2450 6100 2450
Wire Wire Line
	6400 4500 6400 4750
$Comp
L power:GND #PWR012
U 1 1 5C1D9E7D
P 6950 3750
F 0 "#PWR012" H 6950 3500 50  0001 C CNN
F 1 "GND" H 6955 3577 50  0000 C CNN
F 2 "" H 6950 3750 50  0001 C CNN
F 3 "" H 6950 3750 50  0001 C CNN
	1    6950 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5C7020DF
P 6950 4800
F 0 "#PWR014" H 6950 4550 50  0001 C CNN
F 1 "GND" H 6955 4627 50  0000 C CNN
F 2 "" H 6950 4800 50  0001 C CNN
F 3 "" H 6950 4800 50  0001 C CNN
	1    6950 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4800 6950 4750
Connection ~ 6950 4750
$Comp
L Connector:DIN-5 J2
U 1 1 5C70CA21
P 1000 2150
F 0 "J2" H 1000 1876 50  0000 C CNN
F 1 "MIDI OUT" H 1000 1785 50  0000 C CNN
F 2 "w_conn_av:din-5" H 1000 2150 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 1000 2150 50  0001 C CNN
	1    1000 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5C70CA27
P 1500 2050
F 0 "R7" V 1293 2050 50  0000 C CNN
F 1 "220R" V 1384 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 1430 2050 50  0001 C CNN
F 3 "~" H 1500 2050 50  0001 C CNN
	1    1500 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	1300 2250 1700 2250
Wire Wire Line
	1300 2050 1350 2050
Text Notes 650  3200 0    79   ~ 16
MIDI IN
Text Notes 2300 4950 0    79   ~ 0
LED Signals
Text Notes 3600 7700 0    79   ~ 0
Encoder Control
Text Notes 6050 2300 0    79   ~ 16
I2C DAC
$Comp
L Device:R R16
U 1 1 5C717B18
P 7700 4250
F 0 "R16" H 7630 4204 50  0000 R CNN
F 1 "0R" H 7630 4295 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7630 4250 50  0001 C CNN
F 3 "~" H 7700 4250 50  0001 C CNN
	1    7700 4250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R17
U 1 1 5C717C4A
P 7600 4850
F 0 "R17" H 7530 4804 50  0000 R CNN
F 1 "0R" H 7530 4895 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 7530 4850 50  0001 C CNN
F 3 "~" H 7600 4850 50  0001 C CNN
	1    7600 4850
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 5000 7600 5650
Wire Wire Line
	7700 4400 7700 5750
Wire Wire Line
	7700 3200 7700 4100
$Comp
L Amplifier_Operational:TL072 U1
U 1 1 5C723CF4
P 6650 1300
F 0 "U1" H 6650 1667 50  0000 C CNN
F 1 "TL072" H 6650 1576 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 6650 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 6650 1300 50  0001 C CNN
	1    6650 1300
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL072 U1
U 2 1 5C723E70
P 9850 1300
F 0 "U1" H 9850 1667 50  0000 C CNN
F 1 "TL072" H 9850 1576 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 9850 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 9850 1300 50  0001 C CNN
	2    9850 1300
	1    0    0    -1  
$EndComp
Text GLabel 10500 1300 2    50   Input ~ 0
CV2Gain
Text GLabel 9050 3350 0    50   Input ~ 0
CV2Gain
Text GLabel 9050 2900 0    50   Input ~ 0
CV1Gain
Text GLabel 7300 1300 2    50   Input ~ 0
CV1Gain
$Comp
L Device:R R5
U 1 1 5C724D75
P 9300 1200
F 0 "R5" V 9093 1200 50  0000 C CNN
F 1 "10k" V 9184 1200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9230 1200 50  0001 C CNN
F 3 "~" H 9300 1200 50  0001 C CNN
	1    9300 1200
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5C72506D
P 6100 1200
F 0 "R4" V 5893 1200 50  0000 C CNN
F 1 "10k" V 5984 1200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6030 1200 50  0001 C CNN
F 3 "~" H 6100 1200 50  0001 C CNN
	1    6100 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	5750 1200 5950 1200
Wire Wire Line
	6250 1200 6300 1200
Wire Wire Line
	8800 1200 9150 1200
Wire Wire Line
	9450 1200 9500 1200
Wire Wire Line
	6950 1300 7100 1300
Wire Wire Line
	10150 1300 10300 1300
$Comp
L power:GND #PWR05
U 1 1 5C77390F
P 6250 1500
F 0 "#PWR05" H 6250 1250 50  0001 C CNN
F 1 "GND" H 6255 1327 50  0000 C CNN
F 2 "" H 6250 1500 50  0001 C CNN
F 3 "" H 6250 1500 50  0001 C CNN
	1    6250 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5C773988
P 9450 1450
F 0 "#PWR04" H 9450 1200 50  0001 C CNN
F 1 "GND" H 9455 1277 50  0000 C CNN
F 2 "" H 9450 1450 50  0001 C CNN
F 3 "" H 9450 1450 50  0001 C CNN
	1    9450 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 1450 9450 1400
Wire Wire Line
	9450 1400 9550 1400
Wire Wire Line
	6350 1400 6250 1400
Wire Wire Line
	6250 1400 6250 1500
$Comp
L Device:R R1
U 1 1 5C78B0A1
P 6500 750
F 0 "R1" V 6293 750 50  0000 C CNN
F 1 "10k" V 6384 750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 6430 750 50  0001 C CNN
F 3 "~" H 6500 750 50  0001 C CNN
	1    6500 750 
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5C78B13F
P 9700 750
F 0 "R2" V 9493 750 50  0000 C CNN
F 1 "10k" V 9584 750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 9630 750 50  0001 C CNN
F 3 "~" H 9700 750 50  0001 C CNN
	1    9700 750 
	0    1    1    0   
$EndComp
Wire Wire Line
	9550 750  9500 750 
Wire Wire Line
	9500 750  9500 1200
Connection ~ 9500 1200
Wire Wire Line
	9500 1200 9550 1200
Wire Wire Line
	6350 750  6300 750 
Wire Wire Line
	6300 750  6300 1200
Connection ~ 6300 1200
Wire Wire Line
	6300 1200 6350 1200
$Comp
L Device:R_POT RV1
U 1 1 5C7A3722
P 7100 1000
F 0 "RV1" H 7030 1046 50  0000 R CNN
F 1 "10k" H 7030 955 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK097_Single_Horizontal" H 7100 1000 50  0001 C CNN
F 3 "~" H 7100 1000 50  0001 C CNN
	1    7100 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV2
U 1 1 5C7A37D8
P 10300 1000
F 0 "RV2" H 10230 1046 50  0000 R CNN
F 1 "10k" H 10230 955 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK097_Single_Horizontal" H 10300 1000 50  0001 C CNN
F 3 "~" H 10300 1000 50  0001 C CNN
	1    10300 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 850  10300 750 
Wire Wire Line
	10300 750  9850 750 
Wire Wire Line
	10300 1150 10300 1200
Connection ~ 10300 1300
Wire Wire Line
	10300 1300 10500 1300
Wire Wire Line
	6650 750  7100 750 
Wire Wire Line
	7100 750  7100 850 
Wire Wire Line
	7100 1150 7100 1200
Connection ~ 7100 1300
Wire Wire Line
	7100 1300 7300 1300
Wire Wire Line
	7250 1000 7250 1200
Wire Wire Line
	7250 1200 7100 1200
Connection ~ 7100 1200
Wire Wire Line
	7100 1200 7100 1300
Wire Wire Line
	10450 1000 10450 1200
Wire Wire Line
	10450 1200 10300 1200
Connection ~ 10300 1200
Wire Wire Line
	10300 1200 10300 1300
$Comp
L MMBT2222A:MMBT2222A Q1
U 1 1 5C800CB0
P 2250 2250
F 0 "Q1" H 2391 2296 50  0000 L CNN
F 1 "MMBT2222A" H 2391 2205 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 2250 2250 50  0001 L BNN
F 3 "Unavailable" H 2250 2250 50  0001 L BNN
F 4 "None" H 2250 2250 50  0001 L BNN "Field4"
F 5 "ON" H 2250 2250 50  0001 L BNN "Field5"
F 6 "MMBT2222A" H 2250 2250 50  0001 L BNN "Field7"
F 7 "TO-236-3 Taitron" H 2250 2250 50  0001 L BNN "Field8"
	1    2250 2250
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5C800E88
P 2150 1850
F 0 "R6" H 2080 1804 50  0000 R CNN
F 1 "1k" H 2080 1895 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2080 1850 50  0001 C CNN
F 3 "~" H 2150 1850 50  0001 C CNN
	1    2150 1850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R9
U 1 1 5C800F7E
P 2500 2450
F 0 "R9" H 2430 2404 50  0000 R CNN
F 1 "1k" H 2430 2495 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2430 2450 50  0001 C CNN
F 3 "~" H 2500 2450 50  0001 C CNN
	1    2500 2450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5C801040
P 2500 2650
F 0 "#PWR08" H 2500 2400 50  0001 C CNN
F 1 "GND" H 2505 2477 50  0000 C CNN
F 2 "" H 2500 2650 50  0001 C CNN
F 3 "" H 2500 2650 50  0001 C CNN
	1    2500 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5C8010C7
P 2150 1650
F 0 "#PWR06" H 2150 1500 50  0001 C CNN
F 1 "+5V" H 2100 1550 50  0000 C CNN
F 2 "" H 2150 1650 50  0001 C CNN
F 3 "" H 2150 1650 50  0001 C CNN
	1    2150 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4250 2500 4300
Wire Wire Line
	2500 4300 2850 4300
Wire Wire Line
	2850 4050 2850 4300
Connection ~ 2850 4300
Wire Wire Line
	2300 3650 2500 3650
Wire Wire Line
	2500 3150 2500 3650
Wire Wire Line
	2500 3150 2850 3150
Wire Wire Line
	4050 3700 3950 3700
Wire Wire Line
	3950 3700 3950 2250
Wire Wire Line
	2500 2600 2500 2650
Wire Wire Line
	2500 2300 2500 2250
Wire Wire Line
	2500 2250 2350 2250
Wire Wire Line
	2500 2650 2150 2650
Wire Wire Line
	2150 2650 2150 2450
Connection ~ 2500 2650
Wire Wire Line
	1700 2250 1700 2650
Wire Wire Line
	1700 2650 2150 2650
Connection ~ 2150 2650
Wire Wire Line
	1650 2050 2150 2050
Wire Wire Line
	2150 2000 2150 2050
Connection ~ 2150 2050
Wire Wire Line
	2150 1700 2150 1650
Wire Wire Line
	3950 2250 2500 2250
Connection ~ 2500 2250
Text Label 3600 2250 0    50   ~ 0
TX
Text Label 2350 3850 0    50   ~ 0
MIDI-IN
Text Label 1750 2050 0    50   ~ 0
MIDI-OUT
Wire Wire Line
	2850 3550 2850 3600
Wire Wire Line
	4050 3600 2850 3600
Connection ~ 2850 3600
Wire Wire Line
	2850 3600 2850 3650
Wire Wire Line
	4550 5200 4600 5200
$Comp
L power:GND #PWR015
U 1 1 5C912A2F
P 4600 5300
F 0 "#PWR015" H 4600 5050 50  0001 C CNN
F 1 "GND" H 4605 5127 50  0000 C CNN
F 2 "" H 4600 5300 50  0001 C CNN
F 3 "" H 4600 5300 50  0001 C CNN
	1    4600 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 5300 4600 5200
Connection ~ 4600 5200
Wire Wire Line
	4600 5200 4650 5200
$Comp
L Device:R R8
U 1 1 5C272108
P 9000 2250
F 0 "R8" V 8793 2250 50  0000 C CNN
F 1 "10k" V 8884 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8930 2250 50  0001 C CNN
F 3 "~" H 9000 2250 50  0001 C CNN
	1    9000 2250
	0    1    1    0   
$EndComp
$Comp
L Device:R R10
U 1 1 5C27224E
P 8800 2450
F 0 "R10" H 8700 2550 50  0000 R CNN
F 1 "10k" H 8700 2450 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 8730 2450 50  0001 C CNN
F 3 "~" H 8800 2450 50  0001 C CNN
	1    8800 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	8550 2250 8800 2250
Wire Wire Line
	9150 2250 9400 2250
Wire Wire Line
	8800 2300 8800 2250
Connection ~ 8800 2250
Wire Wire Line
	8800 2250 8850 2250
Wire Wire Line
	8800 2600 8800 2800
Wire Wire Line
	8800 2800 9250 2800
$Comp
L Module:KY40_Rotary_Encoder_Module SW1
U 1 1 5C2F84DB
P 3100 7200
F 0 "SW1" H 3100 7567 50  0000 C CNN
F 1 "KY40_Rotary_Encoder_Module" H 3100 7476 50  0000 C CNN
F 2 "Rotary_Encoder:KY-40-rotary-encoder-board" H 2950 7360 50  0001 C CNN
F 3 "" H 3100 7460 50  0001 C CNN
	1    3100 7200
	1    0    0    -1  
$EndComp
Text GLabel 2150 7300 0    50   Input ~ 0
A2
Wire Wire Line
	2150 7300 2700 7300
Connection ~ 2700 7300
Wire Wire Line
	2700 7300 2800 7300
Wire Wire Line
	3400 7300 3400 7600
Wire Wire Line
	3400 7600 2700 7600
Connection ~ 2700 7600
Wire Wire Line
	750  6600 750  7400
Wire Wire Line
	750  7400 1150 7400
Wire Wire Line
	1150 7400 1150 7600
Wire Wire Line
	1150 7600 2350 7600
Connection ~ 750  7400
Wire Wire Line
	750  7400 750  7550
$Comp
L power:+5V #PWR018
U 1 1 5C380C3C
P 2700 7150
F 0 "#PWR018" H 2700 7000 50  0001 C CNN
F 1 "+5V" H 2650 7050 50  0000 C CNN
F 2 "" H 2700 7150 50  0001 C CNN
F 3 "" H 2700 7150 50  0001 C CNN
	1    2700 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 7150 2700 7200
Wire Wire Line
	2700 7200 2800 7200
Wire Wire Line
	3400 7100 3500 7100
Wire Wire Line
	3800 7100 3900 7100
Wire Wire Line
	4050 7100 3900 7100
Connection ~ 3900 7100
Wire Wire Line
	3900 7400 3900 7600
Wire Wire Line
	3900 7600 3400 7600
Connection ~ 3400 7600
Wire Wire Line
	2350 7550 2350 7600
Connection ~ 2350 7600
Wire Wire Line
	2350 7250 2350 7100
Connection ~ 2350 7100
Wire Wire Line
	2350 7100 2150 7100
Wire Wire Line
	2350 7100 2800 7100
Wire Wire Line
	2350 7600 2700 7600
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 5C3F858C
P 2550 1250
F 0 "#FLG0101" H 2550 1325 50  0001 C CNN
F 1 "PWR_FLAG" H 2550 1424 50  0000 C CNN
F 2 "" H 2550 1250 50  0001 C CNN
F 3 "~" H 2550 1250 50  0001 C CNN
	1    2550 1250
	-1   0    0    1   
$EndComp
Connection ~ 2550 1250
Wire Wire Line
	2550 1250 2850 1250
Wire Wire Line
	9250 2800 9250 3250
Wire Wire Line
	9250 2150 9250 2800
Wire Wire Line
	9250 3250 9250 3700
Wire Wire Line
	9250 3700 9250 4100
Wire Wire Line
	9250 4100 9250 4550
Wire Wire Line
	9250 4550 9250 5000
Wire Wire Line
	9250 5000 9250 5450
Wire Wire Line
	9250 5450 9250 5850
$Comp
L Amplifier_Operational:TL072 U?
U 3 1 5C3F991F
P 3800 1100
F 0 "U?" H 3800 1467 50  0000 C CNN
F 1 "TL072" H 3800 1376 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 3800 1100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 3800 1100 50  0001 C CNN
	3    3800 1100
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5C408D76
P 4050 950
F 0 "C?" H 4000 1150 50  0000 L CNN
F 1 "100uF 16v" H 3900 1250 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4088 800 50  0001 C CNN
F 3 "~" H 4050 950 50  0001 C CNN
	1    4050 950 
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5C408F16
P 4050 1250
F 0 "C?" H 4150 1150 50  0000 L CNN
F 1 "100uF 16v" H 3900 1000 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4088 1100 50  0001 C CNN
F 3 "~" H 4050 1250 50  0001 C CNN
	1    4050 1250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5C409296
P 3850 1100
F 0 "#PWR?" H 3850 850 50  0001 C CNN
F 1 "GND" H 3855 927 50  0000 C CNN
F 2 "" H 3850 1100 50  0001 C CNN
F 3 "" H 3850 1100 50  0001 C CNN
	1    3850 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 1100 4050 1100
Connection ~ 4050 1100
Wire Wire Line
	3700 1400 4050 1400
Wire Wire Line
	3700 800  4050 800 
$Comp
L Device:C C?
U 1 1 5C4377A2
P 4450 950
F 0 "C?" H 4500 850 50  0000 L CNN
F 1 "100n" H 4400 750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4488 800 50  0001 C CNN
F 3 "~" H 4450 950 50  0001 C CNN
	1    4450 950 
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5C43785E
P 4450 1250
F 0 "C?" H 4350 1400 50  0000 L CNN
F 1 "100n" H 4350 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 4488 1100 50  0001 C CNN
F 3 "~" H 4450 1250 50  0001 C CNN
	1    4450 1250
	-1   0    0    1   
$EndComp
Wire Wire Line
	4050 1100 4450 1100
Connection ~ 4450 1100
Wire Wire Line
	4050 800  4450 800 
Connection ~ 4050 800 
Wire Wire Line
	4050 1400 4450 1400
Connection ~ 4050 1400
$EndSCHEMATC
