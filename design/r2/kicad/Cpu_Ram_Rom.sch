EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 20914 11524
encoding utf-8
Sheet 2 5
Title "ROSCO_M68K GENERAL PURPOSE MC68010 COMPUTER"
Date "2021-10-08"
Rev "2.0"
Comp "The Really Old-School Company Limited"
Comment1 "OSHWA UK000006 (https://certification.oshwa.org/uk000006.html)"
Comment2 "See https://github.com/roscopeco/rosco_m68k/blob/master/LICENCE.hardware.txt"
Comment3 "Open Source Hardware licenced under CERN Open Hardware Licence"
Comment4 "Copyright 2019-2021 Ross Bamford and Contributors"
$EndDescr
Wire Wire Line
	4050 5400 3450 5400
Wire Wire Line
	12250 6950 11950 6950
Wire Wire Line
	3450 5300 4050 5300
Wire Wire Line
	12250 6850 11950 6850
Wire Wire Line
	3450 5200 4050 5200
Wire Wire Line
	12250 6750 11950 6750
Wire Wire Line
	3450 5100 4050 5100
Wire Wire Line
	12250 6650 11950 6650
Wire Wire Line
	3450 5000 4050 5000
Wire Wire Line
	12250 6550 11950 6550
Wire Wire Line
	3450 4900 4050 4900
Wire Wire Line
	12250 6450 11950 6450
Wire Wire Line
	3450 4800 4050 4800
Wire Wire Line
	12250 6350 11950 6350
Wire Wire Line
	3450 4700 4050 4700
Wire Wire Line
	12250 6250 11950 6250
Wire Wire Line
	3450 4600 4050 4600
Wire Wire Line
	12250 3250 11950 3250
Wire Wire Line
	3450 4500 4050 4500
Wire Wire Line
	12250 3150 11950 3150
Wire Wire Line
	3450 4400 4050 4400
Wire Wire Line
	12250 3050 11950 3050
Wire Wire Line
	3450 4300 4050 4300
Wire Wire Line
	12250 2950 11950 2950
Wire Wire Line
	3450 4200 4050 4200
Wire Wire Line
	12250 2850 11950 2850
Wire Wire Line
	3450 4100 4050 4100
Wire Wire Line
	12250 2750 11950 2750
Wire Wire Line
	3450 4000 4050 4000
Wire Wire Line
	12250 2650 11950 2650
Wire Wire Line
	3450 3900 4050 3900
Wire Wire Line
	12250 2550 11950 2550
Wire Wire Line
	6150 5400 5350 5400
Wire Wire Line
	6150 5300 5350 5300
Wire Wire Line
	6150 5200 5350 5200
Wire Wire Line
	6150 5100 5350 5100
Wire Wire Line
	6150 4900 5350 4900
Wire Wire Line
	6150 4800 5350 4800
Wire Wire Line
	6150 4700 5350 4700
Wire Wire Line
	6150 4600 5350 4600
Wire Wire Line
	6150 4500 5350 4500
Wire Wire Line
	6150 4400 5350 4400
Wire Wire Line
	6150 4300 5350 4300
Wire Wire Line
	6150 4200 5350 4200
Wire Wire Line
	6150 4100 5350 4100
Wire Wire Line
	6150 4000 5350 4000
Wire Wire Line
	6150 3900 5350 3900
Wire Wire Line
	6150 3800 5350 3800
Wire Wire Line
	6150 3700 5350 3700
Wire Wire Line
	6150 3600 5350 3600
Wire Wire Line
	6150 3500 5350 3500
Wire Wire Line
	6150 3400 5350 3400
Wire Wire Line
	6150 3300 5350 3300
Wire Wire Line
	6150 3200 5350 3200
Wire Wire Line
	6150 5000 5350 5000
Text GLabel 4050 3200 0    47   Input ~ 0
IPL2
Text GLabel 4050 3100 0    47   Input ~ 0
IPL1
Text GLabel 4050 3000 0    47   Input ~ 0
IPL0
Text GLabel 4050 2800 0    47   Input ~ 0
DTACK
Text GLabel 4050 2600 0    47   Output ~ 0
BGACK
Text GLabel 4050 2500 0    47   Input ~ 0
BR
Text GLabel 4050 2000 0    47   BiDi ~ 0
RESET
Text GLabel 4050 1900 0    47   Output ~ 0
BERR
Text GLabel 4050 1700 0    47   Input ~ 0
CLK
Text GLabel 5350 3000 2    47   Output ~ 0
LDS
Text GLabel 5350 2900 2    47   Output ~ 0
UDS
Text GLabel 5350 2800 2    47   Output ~ 0
RW
Text GLabel 17550 2850 0    47   Input ~ 0
RW
Text GLabel 17550 6550 0    47   Input ~ 0
RW
Text GLabel 5350 2700 2    47   Output ~ 0
AS
Text GLabel 5350 2500 2    47   Output ~ 0
BG
Text GLabel 5350 1900 2    47   Output ~ 0
FC2
Text GLabel 5350 1800 2    47   Output ~ 0
FC1
Text GLabel 5350 1700 2    47   Output ~ 0
FC0
Wire Wire Line
	10550 6250 8700 6250
Wire Wire Line
	10550 2550 8700 2550
Wire Wire Line
	8700 6250 8700 6650
Connection ~ 8700 2550
Connection ~ 8700 6250
Wire Wire Line
	14700 1250 14700 2450
Wire Wire Line
	14700 2450 14700 5050
Wire Wire Line
	14700 5050 14700 5850
Wire Wire Line
	14700 5850 14700 6150
Wire Wire Line
	14700 6150 17550 6150
Wire Wire Line
	17550 2450 14700 2450
Connection ~ 14700 2450
Connection ~ 14700 5850
Connection ~ 14700 5050
Wire Wire Line
	10550 8550 9000 8550
Wire Wire Line
	9000 2850 10550 2850
Wire Wire Line
	10550 6550 9000 6550
Connection ~ 9000 8550
Connection ~ 9000 5150
Connection ~ 9000 6550
Wire Wire Line
	15000 8750 15000 5850
Wire Wire Line
	15000 5850 15000 5050
Wire Wire Line
	15000 5050 17550 5050
Wire Wire Line
	17550 8750 15000 8750
Connection ~ 15000 8750
Connection ~ 15000 5850
Connection ~ 15000 5050
Text GLabel 10550 2750 0    47   Input ~ 0
ODDROMSEL
Wire Wire Line
	17550 2750 14300 2750
Wire Wire Line
	14300 2750 14300 1750
Wire Wire Line
	14300 2750 14300 6450
Wire Wire Line
	14300 6450 17550 6450
Text GLabel 14300 1750 1    70   Input ~ 0
RAMOE
Connection ~ 14300 2750
Text GLabel 17550 2650 0    47   Input ~ 0
ODDRAMSEL
Text GLabel 17550 6350 0    47   Input ~ 0
EVENRAMSEL
Text GLabel 4050 2100 0    47   BiDi ~ 0
HALT
Entry Wire Line
	6150 5400 6250 5300
Entry Wire Line
	6150 5300 6250 5200
Entry Wire Line
	6150 5200 6250 5100
Entry Wire Line
	6150 5100 6250 5000
Entry Wire Line
	6150 4900 6250 4800
Entry Wire Line
	6150 4800 6250 4700
Entry Wire Line
	6150 4700 6250 4600
Entry Wire Line
	6150 4600 6250 4500
Entry Wire Line
	6150 4500 6250 4400
Entry Wire Line
	6150 4400 6250 4300
Entry Wire Line
	6150 4300 6250 4200
Entry Wire Line
	6150 4200 6250 4100
Entry Wire Line
	6150 4100 6250 4000
Entry Wire Line
	6150 4000 6250 3900
Entry Wire Line
	6150 3900 6250 3800
Entry Wire Line
	6150 3800 6250 3700
Entry Wire Line
	6150 3700 6250 3600
Entry Wire Line
	6150 3600 6250 3500
Entry Wire Line
	6150 3500 6250 3400
Entry Wire Line
	6150 3400 6250 3300
Entry Wire Line
	6150 3300 6250 3200
Entry Wire Line
	6150 3200 6250 3100
Entry Wire Line
	6150 5000 6250 4900
$Comp
L rosco_m68k-eagle-import:MC68000P IC1
U 1 1 8B1E8DB7
P 4750 3500
AR Path="/8B1E8DB7" Ref="IC1"  Part="1" 
AR Path="/5E53B4B8/8B1E8DB7" Ref="IC1"  Part="1" 
F 0 "IC1" H 4250 5425 59  0000 L BNN
F 1 "MC68010P10" H 4250 1400 59  0001 L BNN
F 2 "rosco_m68k:DIL64" H 4750 3500 50  0001 C CNN
F 3 "" H 4750 3500 50  0001 C CNN
	1    4750 3500
	1    0    0    -1  
$EndComp
$Comp
L rosco_m68k-eagle-import:C2,5-3 C8
U 1 1 7D0E483A
P 14800 5850
AR Path="/7D0E483A" Ref="C8"  Part="1" 
AR Path="/5E53B4B8/7D0E483A" Ref="C6"  Part="1" 
F 0 "C6" V 14960 5765 59  0000 L BNN
F 1 "100nF" V 14700 5650 59  0000 L BNN
F 2 "rosco_m68k:C2.5-3" H 14800 5850 50  0001 C CNN
F 3 "" H 14800 5850 50  0001 C CNN
	1    14800 5850
	0    -1   -1   0   
$EndComp
$Comp
L rosco_m68k-eagle-import:C2,5-3 C7
U 1 1 A6F2A611
P 14800 5050
AR Path="/A6F2A611" Ref="C7"  Part="1" 
AR Path="/5E53B4B8/A6F2A611" Ref="C5"  Part="1" 
F 0 "C5" V 14960 4965 59  0000 L BNN
F 1 "100nF" V 14700 4850 59  0000 L BNN
F 2 "rosco_m68k:C2.5-3" H 14800 5050 50  0001 C CNN
F 3 "" H 14800 5050 50  0001 C CNN
	1    14800 5050
	0    -1   -1   0   
$EndComp
Text Notes 11450 4950 0    59   ~ 0
ODD
Text Notes 18450 5150 0    59   ~ 0
ODD
Text Notes 11450 8650 0    59   ~ 0
EVEN
Text Notes 18450 8850 0    59   ~ 0
EVEN
Text Label 3750 3900 0    50   ~ 0
D0
Text Label 3750 4000 0    50   ~ 0
D1
Text Label 3750 4100 0    50   ~ 0
D2
Text Label 3750 4200 0    50   ~ 0
D3
Text Label 3750 4300 0    50   ~ 0
D4
Text Label 3750 4400 0    50   ~ 0
D5
Text Label 3750 4500 0    50   ~ 0
D6
Text Label 3750 4600 0    50   ~ 0
D7
Text Label 3750 4700 0    50   ~ 0
D8
Text Label 3750 4800 0    50   ~ 0
D9
Text Label 3750 4900 0    50   ~ 0
D10
Text Label 3750 5000 0    50   ~ 0
D11
Text Label 3750 5100 0    50   ~ 0
D12
Text Label 3750 5200 0    50   ~ 0
D13
Text Label 3750 5300 0    50   ~ 0
D14
Text Label 3750 5400 0    50   ~ 0
D15
Entry Wire Line
	3350 3800 3450 3900
Entry Wire Line
	3350 3900 3450 4000
Entry Wire Line
	3350 4000 3450 4100
Entry Wire Line
	3350 4100 3450 4200
Entry Wire Line
	3350 4200 3450 4300
Entry Wire Line
	3350 4300 3450 4400
Entry Wire Line
	3350 4400 3450 4500
Entry Wire Line
	3350 4500 3450 4600
Entry Wire Line
	3350 4600 3450 4700
Entry Wire Line
	3350 4700 3450 4800
Entry Wire Line
	3350 4800 3450 4900
Entry Wire Line
	3350 4900 3450 5000
Entry Wire Line
	3350 5000 3450 5100
Entry Wire Line
	3350 5100 3450 5200
Entry Wire Line
	3350 5200 3450 5300
Entry Wire Line
	3350 5300 3450 5400
Wire Bus Line
	3350 3650 3200 3650
Text HLabel 3200 3650 0    50   Input ~ 0
D[0..15]
Text Label 12050 2550 0    50   ~ 0
D0
Text Label 12050 2650 0    50   ~ 0
D1
Text Label 12050 2750 0    50   ~ 0
D2
Text Label 12050 2850 0    50   ~ 0
D3
Text Label 12050 2950 0    50   ~ 0
D4
Text Label 12050 3050 0    50   ~ 0
D5
Text Label 12050 3150 0    50   ~ 0
D6
Text Label 12050 3250 0    50   ~ 0
D7
Text Label 12050 6250 0    50   ~ 0
D8
Text Label 12050 6350 0    50   ~ 0
D9
Text Label 12050 6450 0    50   ~ 0
D10
Text Label 12050 6550 0    50   ~ 0
D11
Text Label 12050 6650 0    50   ~ 0
D12
Text Label 12050 6750 0    50   ~ 0
D13
Text Label 12050 6850 0    50   ~ 0
D14
Text Label 12050 6950 0    50   ~ 0
D15
Entry Wire Line
	12350 2450 12250 2550
Entry Wire Line
	12350 2550 12250 2650
Entry Wire Line
	12350 2650 12250 2750
Entry Wire Line
	12350 2750 12250 2850
Entry Wire Line
	12350 2850 12250 2950
Entry Wire Line
	12350 2950 12250 3050
Entry Wire Line
	12350 3050 12250 3150
Entry Wire Line
	12350 3150 12250 3250
Wire Bus Line
	12350 2300 12450 2300
Text HLabel 12450 2300 2    50   Input ~ 0
D[0..15]
Text HLabel 12450 6000 2    50   Input ~ 0
D[0..15]
Entry Wire Line
	12350 6150 12250 6250
Entry Wire Line
	12350 6250 12250 6350
Entry Wire Line
	12350 6350 12250 6450
Entry Wire Line
	12350 6450 12250 6550
Entry Wire Line
	12350 6550 12250 6650
Entry Wire Line
	12350 6650 12250 6750
Entry Wire Line
	12350 6750 12250 6850
Entry Wire Line
	12350 6850 12250 6950
Wire Bus Line
	12350 6000 12450 6000
Wire Wire Line
	19250 3150 18950 3150
Wire Wire Line
	19250 3050 18950 3050
Wire Wire Line
	19250 2950 18950 2950
Wire Wire Line
	19250 2850 18950 2850
Wire Wire Line
	19250 2750 18950 2750
Wire Wire Line
	19250 2650 18950 2650
Wire Wire Line
	19250 2550 18950 2550
Wire Wire Line
	19250 2450 18950 2450
Text Label 19050 2450 0    50   ~ 0
D0
Text Label 19050 2550 0    50   ~ 0
D1
Text Label 19050 2650 0    50   ~ 0
D2
Text Label 19050 2750 0    50   ~ 0
D3
Text Label 19050 2850 0    50   ~ 0
D4
Text Label 19050 2950 0    50   ~ 0
D5
Text Label 19050 3050 0    50   ~ 0
D6
Text Label 19050 3150 0    50   ~ 0
D7
Entry Wire Line
	19350 2350 19250 2450
Entry Wire Line
	19350 2450 19250 2550
Entry Wire Line
	19350 2550 19250 2650
Entry Wire Line
	19350 2650 19250 2750
Entry Wire Line
	19350 2750 19250 2850
Entry Wire Line
	19350 2850 19250 2950
Entry Wire Line
	19350 2950 19250 3050
Entry Wire Line
	19350 3050 19250 3150
Wire Bus Line
	19350 2200 19450 2200
Text HLabel 19450 2200 2    50   Input ~ 0
D[0..15]
Wire Wire Line
	19250 6850 18950 6850
Wire Wire Line
	19250 6750 18950 6750
Wire Wire Line
	19250 6650 18950 6650
Wire Wire Line
	19250 6550 18950 6550
Wire Wire Line
	19250 6450 18950 6450
Wire Wire Line
	19250 6350 18950 6350
Wire Wire Line
	19250 6250 18950 6250
Wire Wire Line
	19250 6150 18950 6150
Text Label 19050 6150 0    50   ~ 0
D8
Text Label 19050 6250 0    50   ~ 0
D9
Text Label 19050 6350 0    50   ~ 0
D10
Text Label 19050 6450 0    50   ~ 0
D11
Text Label 19050 6550 0    50   ~ 0
D12
Text Label 19050 6650 0    50   ~ 0
D13
Text Label 19050 6750 0    50   ~ 0
D14
Text Label 19050 6850 0    50   ~ 0
D15
Text HLabel 19450 5900 2    50   Input ~ 0
D[0..15]
Entry Wire Line
	19350 6050 19250 6150
Entry Wire Line
	19350 6150 19250 6250
Entry Wire Line
	19350 6250 19250 6350
Entry Wire Line
	19350 6350 19250 6450
Entry Wire Line
	19350 6450 19250 6550
Entry Wire Line
	19350 6550 19250 6650
Entry Wire Line
	19350 6650 19250 6750
Entry Wire Line
	19350 6750 19250 6850
Wire Bus Line
	19350 5900 19450 5900
Text Label 5500 3200 0    50   ~ 0
A1
Text Label 5500 3300 0    50   ~ 0
A2
Text Label 5500 3400 0    50   ~ 0
A3
Text Label 5500 3500 0    50   ~ 0
A4
Text Label 5500 3600 0    50   ~ 0
A5
Text Label 5500 3700 0    50   ~ 0
A6
Text Label 5500 3800 0    50   ~ 0
A7
Text Label 5500 3900 0    50   ~ 0
A8
Text Label 5500 4000 0    50   ~ 0
A9
Text Label 5500 4100 0    50   ~ 0
A10
Text Label 5500 4200 0    50   ~ 0
A11
Text Label 5500 4300 0    50   ~ 0
A12
Text Label 5500 4400 0    50   ~ 0
A13
Text Label 5500 4500 0    50   ~ 0
A14
Text Label 5500 4600 0    50   ~ 0
A15
Text Label 5500 4700 0    50   ~ 0
A16
Text Label 5500 4800 0    50   ~ 0
A17
Text Label 5500 4900 0    50   ~ 0
A18
Text Label 5500 5000 0    50   ~ 0
A19
Text Label 5500 5100 0    50   ~ 0
A20
Text Label 5500 5200 0    50   ~ 0
A21
Text Label 5500 5300 0    50   ~ 0
A22
Text Label 5500 5400 0    50   ~ 0
A23
Text HLabel 6400 3000 2    50   Input ~ 0
A[1..23]
Wire Bus Line
	6400 3000 6250 3000
Entry Wire Line
	9750 8050 9650 7950
Entry Wire Line
	9750 7950 9650 7850
Entry Wire Line
	9750 7850 9650 7750
Entry Wire Line
	9750 7750 9650 7650
Entry Wire Line
	9750 7650 9650 7550
Entry Wire Line
	9750 7550 9650 7450
Entry Wire Line
	9750 7450 9650 7350
Entry Wire Line
	9750 7350 9650 7250
Entry Wire Line
	9750 7250 9650 7150
Entry Wire Line
	9750 7150 9650 7050
Entry Wire Line
	9750 7050 9650 6950
Entry Wire Line
	9750 6950 9650 6850
Entry Wire Line
	9750 6850 9650 6750
Text HLabel 9550 6000 0    50   Input ~ 0
A[1..23]
Entry Wire Line
	15900 8450 15800 8350
Entry Wire Line
	15900 8350 15800 8250
Entry Wire Line
	15900 8250 15800 8150
Entry Wire Line
	15900 8150 15800 8050
Entry Wire Line
	15900 8050 15800 7950
Entry Wire Line
	15900 7950 15800 7850
Entry Wire Line
	15900 7850 15800 7750
Entry Wire Line
	15900 7750 15800 7650
Entry Wire Line
	15900 7650 15800 7550
Entry Wire Line
	15900 7550 15800 7450
Entry Wire Line
	15900 7450 15800 7350
Entry Wire Line
	15900 7350 15800 7250
Entry Wire Line
	15900 7250 15800 7150
Entry Wire Line
	15900 7150 15800 7050
Entry Wire Line
	15900 7050 15800 6950
Entry Wire Line
	15900 6950 15800 6850
Entry Wire Line
	15900 6850 15800 6750
Entry Wire Line
	15900 6750 15800 6650
Entry Wire Line
	15900 8550 15800 8450
Text Label 16200 6750 2    50   ~ 0
A1
Text Label 16200 6850 2    50   ~ 0
A2
Text Label 16200 6950 2    50   ~ 0
A3
Text Label 16200 7050 2    50   ~ 0
A4
Text Label 16200 7150 2    50   ~ 0
A5
Text Label 16200 7250 2    50   ~ 0
A6
Text Label 16200 7350 2    50   ~ 0
A7
Text Label 16200 7450 2    50   ~ 0
A8
Text Label 16200 7550 2    50   ~ 0
A9
Text Label 16200 7650 2    50   ~ 0
A10
Text Label 16200 7750 2    50   ~ 0
A11
Text Label 16200 7850 2    50   ~ 0
A12
Text Label 16200 7950 2    50   ~ 0
A13
Text Label 16200 8050 2    50   ~ 0
A14
Text Label 16200 8150 2    50   ~ 0
A15
Text Label 16200 8250 2    50   ~ 0
A16
Text Label 16200 8350 2    50   ~ 0
A17
Text Label 16200 8450 2    50   ~ 0
A18
Text Label 16200 8550 2    50   ~ 0
A19
Text HLabel 15650 6550 0    50   Input ~ 0
A[1..23]
Wire Bus Line
	15650 6550 15800 6550
Wire Wire Line
	9000 8550 9000 6550
Text Label 9950 8050 2    50   ~ 0
A13
Text Label 9950 7950 2    50   ~ 0
A12
Text Label 9950 7850 2    50   ~ 0
A11
Text Label 9950 7750 2    50   ~ 0
A10
Text Label 9950 7650 2    50   ~ 0
A9
Text Label 9950 7550 2    50   ~ 0
A8
Text Label 9950 7450 2    50   ~ 0
A7
Text Label 9950 7350 2    50   ~ 0
A6
Text Label 9950 7250 2    50   ~ 0
A5
Text Label 9950 7150 2    50   ~ 0
A4
Text Label 9950 7050 2    50   ~ 0
A3
Text Label 9950 6950 2    50   ~ 0
A2
Text Label 9950 6850 2    50   ~ 0
A1
Wire Wire Line
	9750 6850 10550 6850
Wire Wire Line
	9750 6950 10550 6950
Wire Wire Line
	9750 7050 10550 7050
Wire Wire Line
	9750 7150 10550 7150
Wire Wire Line
	9750 7250 10550 7250
Wire Wire Line
	9750 7350 10550 7350
Wire Wire Line
	9750 7450 10550 7450
Wire Wire Line
	9750 7550 10550 7550
Wire Wire Line
	9750 7650 10550 7650
Wire Wire Line
	9750 7750 10550 7750
Wire Wire Line
	9750 7850 10550 7850
Wire Wire Line
	9750 7950 10550 7950
Wire Wire Line
	9750 8050 10550 8050
Text Label 16200 3050 2    50   ~ 0
A1
Text Label 16200 3150 2    50   ~ 0
A2
Text Label 16200 3250 2    50   ~ 0
A3
Text Label 16200 3350 2    50   ~ 0
A4
Text Label 16200 3450 2    50   ~ 0
A5
Text Label 16200 3550 2    50   ~ 0
A6
Text Label 16200 3650 2    50   ~ 0
A7
Text Label 16200 3750 2    50   ~ 0
A8
Text Label 16200 3850 2    50   ~ 0
A9
Text Label 16200 3950 2    50   ~ 0
A10
Text Label 16200 4050 2    50   ~ 0
A11
Text Label 16200 4150 2    50   ~ 0
A12
Text Label 16200 4250 2    50   ~ 0
A13
Text Label 16200 4350 2    50   ~ 0
A14
Text Label 16200 4450 2    50   ~ 0
A15
Text Label 16200 4550 2    50   ~ 0
A16
Text Label 16200 4650 2    50   ~ 0
A17
Text Label 16200 4750 2    50   ~ 0
A18
Text Label 16200 4850 2    50   ~ 0
A19
Entry Wire Line
	9750 4350 9650 4250
Entry Wire Line
	9750 4250 9650 4150
Entry Wire Line
	9750 4150 9650 4050
Entry Wire Line
	9750 4050 9650 3950
Entry Wire Line
	9750 3950 9650 3850
Entry Wire Line
	9750 3850 9650 3750
Entry Wire Line
	9750 3750 9650 3650
Entry Wire Line
	9750 3650 9650 3550
Entry Wire Line
	9750 3550 9650 3450
Entry Wire Line
	9750 3450 9650 3350
Entry Wire Line
	9750 3350 9650 3250
Entry Wire Line
	9750 3250 9650 3150
Entry Wire Line
	9750 3150 9650 3050
Text HLabel 9450 2350 0    50   Input ~ 0
A[1..23]
Text Label 9950 4350 2    50   ~ 0
A13
Text Label 9950 4250 2    50   ~ 0
A12
Text Label 9950 4150 2    50   ~ 0
A11
Text Label 9950 4050 2    50   ~ 0
A10
Text Label 9950 3950 2    50   ~ 0
A9
Text Label 9950 3850 2    50   ~ 0
A8
Text Label 9950 3750 2    50   ~ 0
A7
Text Label 9950 3650 2    50   ~ 0
A6
Text Label 9950 3550 2    50   ~ 0
A5
Text Label 9950 3450 2    50   ~ 0
A4
Text Label 9950 3350 2    50   ~ 0
A3
Text Label 9950 3250 2    50   ~ 0
A2
Text Label 9950 3150 2    50   ~ 0
A1
Wire Wire Line
	9750 3150 10550 3150
Wire Wire Line
	9750 3250 10550 3250
Wire Wire Line
	9750 3350 10550 3350
Wire Wire Line
	9750 3450 10550 3450
Wire Wire Line
	9750 3550 10550 3550
Wire Wire Line
	9750 3650 10550 3650
Wire Wire Line
	9750 3750 10550 3750
Wire Wire Line
	9750 3850 10550 3850
Wire Wire Line
	9750 3950 10550 3950
Wire Wire Line
	9750 4050 10550 4050
Wire Wire Line
	9750 4150 10550 4150
Wire Wire Line
	9750 4250 10550 4250
Wire Wire Line
	9750 4350 10550 4350
$Comp
L power:VCC #PWR0103
U 1 1 5E933FE2
P 14700 1250
F 0 "#PWR0103" H 14700 1100 50  0001 C CNN
F 1 "VCC" H 14717 1423 50  0000 C CNN
F 2 "" H 14700 1250 50  0001 C CNN
F 3 "" H 14700 1250 50  0001 C CNN
	1    14700 1250
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5E971BE5
P 8700 1250
F 0 "#PWR0104" H 8700 1100 50  0001 C CNN
F 1 "VCC" H 8717 1423 50  0000 C CNN
F 2 "" H 8700 1250 50  0001 C CNN
F 3 "" H 8700 1250 50  0001 C CNN
	1    8700 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 2550 8700 1250
Wire Wire Line
	9000 5150 9000 4850
Connection ~ 9000 6000
Wire Wire Line
	9000 6000 9000 5150
Wire Wire Line
	9000 6550 9000 6000
$Comp
L rosco_m68k-eagle-import:C2,5-3 C5
U 1 1 E602F468
P 8800 5150
AR Path="/E602F468" Ref="C5"  Part="1" 
AR Path="/5E53B4B8/E602F468" Ref="C3"  Part="1" 
F 0 "C3" V 8960 5065 59  0000 L BNN
F 1 "100nF" V 8700 4950 59  0000 L BNN
F 2 "rosco_m68k:C2.5-3" H 8800 5150 50  0001 C CNN
F 3 "" H 8800 5150 50  0001 C CNN
	1    8800 5150
	0    -1   -1   0   
$EndComp
$Comp
L rosco_m68k-eagle-import:C2,5-3 C6
U 1 1 E176B0C6
P 8800 6000
AR Path="/E176B0C6" Ref="C6"  Part="1" 
AR Path="/5E53B4B8/E176B0C6" Ref="C4"  Part="1" 
F 0 "C4" V 8960 5915 59  0000 L BNN
F 1 "100nF" V 8700 5800 59  0000 L BNN
F 2 "rosco_m68k:C2.5-3" H 8800 6000 50  0001 C CNN
F 3 "" H 8800 6000 50  0001 C CNN
	1    8800 6000
	0    -1   -1   0   
$EndComp
Connection ~ 8700 5150
Connection ~ 8700 6000
Wire Wire Line
	8700 6250 8700 6000
Wire Wire Line
	8700 6000 8700 5150
$Comp
L power:GND #PWR0106
U 1 1 5ED1852C
P 9000 9250
F 0 "#PWR0106" H 9000 9000 50  0001 C CNN
F 1 "GND" H 9005 9077 50  0000 C CNN
F 2 "" H 9000 9250 50  0001 C CNN
F 3 "" H 9000 9250 50  0001 C CNN
	1    9000 9250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 8550 9000 9250
Wire Wire Line
	8700 2550 8700 2950
Wire Bus Line
	9450 2350 9650 2350
Text GLabel 10550 6450 0    47   Input ~ 0
EVENROMSEL
Wire Wire Line
	10550 2950 8700 2950
Connection ~ 8700 2950
Wire Wire Line
	8700 2950 8700 5150
Wire Bus Line
	9650 6000 9550 6000
Wire Wire Line
	10550 6650 8700 6650
Wire Wire Line
	10550 4850 9000 4850
Connection ~ 9000 4850
$Comp
L power:GND #PWR0107
U 1 1 5EF394DC
P 15000 9250
F 0 "#PWR0107" H 15000 9000 50  0001 C CNN
F 1 "GND" H 15005 9077 50  0000 C CNN
F 2 "" H 15000 9250 50  0001 C CNN
F 3 "" H 15000 9250 50  0001 C CNN
	1    15000 9250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 4850 9000 2850
Wire Wire Line
	15900 4850 17550 4850
Wire Wire Line
	15900 3050 17550 3050
Wire Wire Line
	15900 3150 17550 3150
Wire Wire Line
	15900 3250 17550 3250
Wire Wire Line
	15900 3350 17550 3350
Wire Wire Line
	15900 3450 17550 3450
Wire Wire Line
	15900 3550 17550 3550
Wire Wire Line
	15900 3650 17550 3650
Wire Wire Line
	15900 3750 17550 3750
Wire Wire Line
	15900 3850 17550 3850
Wire Wire Line
	15900 3950 17550 3950
Wire Wire Line
	15900 4050 17550 4050
Wire Wire Line
	15900 4150 17550 4150
Wire Wire Line
	15900 4250 17550 4250
Wire Wire Line
	15900 4350 17550 4350
Wire Wire Line
	15900 4450 17550 4450
Wire Wire Line
	15900 4550 17550 4550
Wire Wire Line
	15900 4650 17550 4650
Wire Wire Line
	15900 4750 17550 4750
Wire Bus Line
	15300 2850 15800 2850
Text HLabel 15300 2850 0    50   Input ~ 0
A[1..23]
Entry Wire Line
	15900 4850 15800 4750
Entry Wire Line
	15900 3050 15800 2950
Entry Wire Line
	15900 3150 15800 3050
Entry Wire Line
	15900 3250 15800 3150
Entry Wire Line
	15900 3350 15800 3250
Entry Wire Line
	15900 3450 15800 3350
Entry Wire Line
	15900 3550 15800 3450
Entry Wire Line
	15900 3650 15800 3550
Entry Wire Line
	15900 3750 15800 3650
Entry Wire Line
	15900 3850 15800 3750
Entry Wire Line
	15900 3950 15800 3850
Entry Wire Line
	15900 4050 15800 3950
Entry Wire Line
	15900 4150 15800 4050
Entry Wire Line
	15900 4250 15800 4150
Entry Wire Line
	15900 4350 15800 4250
Entry Wire Line
	15900 4450 15800 4350
Entry Wire Line
	15900 4550 15800 4450
Entry Wire Line
	15900 4650 15800 4550
Entry Wire Line
	15900 4750 15800 4650
Wire Wire Line
	15900 6750 17550 6750
Wire Wire Line
	15900 6850 17550 6850
Wire Wire Line
	15900 6950 17550 6950
Wire Wire Line
	15900 7050 17550 7050
Wire Wire Line
	15900 7150 17550 7150
Wire Wire Line
	15900 7250 17550 7250
Wire Wire Line
	15900 7350 17550 7350
Wire Wire Line
	15900 7450 17550 7450
Wire Wire Line
	15900 7550 17550 7550
Wire Wire Line
	15900 7650 17550 7650
Wire Wire Line
	15900 7750 17550 7750
Wire Wire Line
	15900 7850 17550 7850
Wire Wire Line
	15900 7950 17550 7950
Wire Wire Line
	15900 8050 17550 8050
Wire Wire Line
	15900 8150 17550 8150
Wire Wire Line
	15900 8250 17550 8250
Wire Wire Line
	15900 8350 17550 8350
Wire Wire Line
	15900 8450 17550 8450
Wire Wire Line
	15900 8550 17550 8550
$Comp
L rosco_m68k-eagle-import:AS6C4008-55PCN U3
U 1 1 5FE46869
P 18250 3650
F 0 "U3" H 18250 5258 69  0000 C CNN
F 1 "AS6C4008-55PCN" H 18250 5138 69  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_LongPads" H 18250 3650 50  0001 C CNN
F 3 "" H 18250 3650 50  0001 C CNN
	1    18250 3650
	1    0    0    -1  
$EndComp
$Comp
L rosco_m68k-eagle-import:AS6C4008-55PCN U4
U 1 1 5FE4AB28
P 18250 7350
F 0 "U4" H 18250 8958 69  0000 C CNN
F 1 "AS6C4008-55PCN" H 18250 8838 69  0000 C CNN
F 2 "Package_DIP:DIP-32_W15.24mm_LongPads" H 18250 7350 50  0001 C CNN
F 3 "" H 18250 7350 50  0001 C CNN
	1    18250 7350
	1    0    0    -1  
$EndComp
Text GLabel 4050 2300 0    47   Input ~ 0
VPA
Text GLabel 5350 2300 2    47   Output ~ 0
VMA
Text GLabel 5350 2200 2    47   Output ~ 0
E
Text Label 9800 4550 0    50   ~ 0
A14
Text Label 9800 4650 0    50   ~ 0
A15
Entry Wire Line
	9650 4550 9750 4650
Entry Wire Line
	9650 4450 9750 4550
Wire Wire Line
	9750 4550 10550 4550
Wire Wire Line
	9750 4650 10550 4650
Entry Wire Line
	9650 8250 9750 8350
Entry Wire Line
	9650 8150 9750 8250
Wire Wire Line
	10550 8250 9750 8250
Wire Wire Line
	10550 8350 9750 8350
Text Label 9800 8250 0    50   ~ 0
A14
Text Label 9800 8350 0    50   ~ 0
A15
$Comp
L rosco_m68k-eagle-import:AT28C256-15PU U1
U 1 1 5ECEE814
P 11250 3550
F 0 "U1" H 11250 4958 69  0000 C CNN
F 1 "AT28C256-15PU" H 11250 4838 69  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 11250 3550 50  0001 C CNN
F 3 "" H 11250 3550 50  0001 C CNN
	1    11250 3550
	1    0    0    -1  
$EndComp
$Comp
L rosco_m68k-eagle-import:AT28C256-15PU U2
U 1 1 5ECF0092
P 11250 7250
F 0 "U2" H 11250 8658 69  0000 C CNN
F 1 "AT28C256-15PU" H 11250 8538 69  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm_LongPads" H 11250 7250 50  0001 C CNN
F 3 "" H 11250 7250 50  0001 C CNN
	1    11250 7250
	1    0    0    -1  
$EndComp
Text Notes 4250 5700 0    98   ~ 0
MC68010P10
Text Notes 10800 5500 0    50   ~ 0
AT28C64B or AT28C256
Wire Wire Line
	15000 8750 15000 9250
Wire Bus Line
	19350 5900 19350 6750
Wire Bus Line
	19350 2200 19350 3050
Wire Bus Line
	12350 6000 12350 6850
Wire Bus Line
	12350 2300 12350 3150
Wire Bus Line
	9650 2350 9650 4550
Wire Bus Line
	9650 6000 9650 8250
Wire Bus Line
	15800 2850 15800 4750
Wire Bus Line
	3350 3650 3350 5300
Wire Bus Line
	6250 3000 6250 5300
Wire Bus Line
	15800 6550 15800 8450
$EndSCHEMATC
