

****Inverter****
.protect
.lib "./cic018.l" TT
.temp 25
.unprotect
.inc "inv.pex.spi"

.option 
+ unwrap
+ post
+ acout=0 runlvl=6
+ captab

****Main Circuit****
xinverter IN OUT VSS VDD inv

V1 VDD GND 1.8
V2 VSS GND 0
V3 IN GND PULSE(0 1.8 10n 0.1n 0.1n 99.9n 200n)
C1 OUT GND 0.3p

****Analysis****
.op
.tran 1ns 1us
.probe V(OUT)

.end