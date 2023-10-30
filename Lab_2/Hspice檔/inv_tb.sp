

****Inverter****
.protect
.lib "./cic018.l" TT
.temp 25
.unprotect
.inc "inv.spi"

.option 
+ unwrap
+ post
+ acout=0 runlvl=6
+ captab

****Main Circuit****
xinverter IN OUT VDD VSS inv

V1 VDD GND 1.8
V2 VSS GND 0
V3 IN GND PULSE(0 1.8 10n 0.1n 0.1n 99.9n 200n)
C1 OUT GND 0.3p

****Analysis****
.op
.tran 1ns 1us
.probe V(OUT)

.meas tran T_in_rise_1 trig AT=0 targ V(IN) VAL=0.9 RISE=1
.meas tran T_in_rise_2 trig AT 0 targ V(IN) VAL=0.9 RISE=2
.meas tran T_in_rise_3 trig AT 0 targ V(IN) VAL=0.9 RISE=3
.meas tran T_in_fall_1 trig AT 0 targ V(IN) VAL=0.9 FALL=1
.meas tran T_in_fall_2 trig AT 0 targ V(IN) VAL=0.9 FALL=2
.meas tran T_in_fall_3 trig AT 0 targ V(IN) VAL=0.9 FALL=3

.meas tran T_out_rise_1 trig AT=0 targ V(OUT) VAL=0.9 RISE=1
.meas tran T_out_rise_2 trig AT 0 targ V(OUT) VAL=0.9 RISE=2
.meas tran T_out_rise_3 trig AT 0 targ V(OUT) VAL=0.9 RISE=3
.meas tran T_out_fall_1 trig AT 0 targ V(OUT) VAL=0.9 FALL=1
.meas tran T_out_fall_2 trig AT 0 targ V(OUT) VAL=0.9 FALL=2
.meas tran T_out_fall_3 trig AT 0 targ V(OUT) VAL=0.9 FALL=3

.end