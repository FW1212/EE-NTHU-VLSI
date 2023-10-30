

****NAND gate****
.protect
.lib "./cic018.l" TT
.temp 25
.unprotect
.inc "nand2.spi"

.option 
+ unwrap
+ post
+ acout=0 runlvl=6
+ captab

****Main Circuit****
xnand VA VB VDD OUT GND nand2

V1 VDD GND 1.8
V2 VB GND PULSE(0 1.8 10n 0.1n 0.1n 14.9n 30n)
V3 VA GND PULSE(0 1.8 10n 0.1n 0.1n 24.9n 50n)
C1 OUT GND 0.3p

****Analysis****
.op
.tran 1ns 1us
.probe V(OUT)

.end