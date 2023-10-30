

****Ring Oscillator Clk with Buffer and Capacitance****
.protect
.lib "./cic018.l" TT
.temp 25
.unprotect
.inc "Bclkgen.pex.spi"

.option 
+ unwrap
+ post
+ acout=0 runlvl=6
+ captab

****Main Circuit****
xclkgen trigger clkout GND VDD Bclkgen

V1 VDD GND 1.8
V2 trigger GND PULSE(0 1.8 10n 0.01n 0.01n 3.99n 8n)
C1 clkout GND 0.3p

****Analysis****
.op
.tran 1ns 1us
.probe V(clkout)

.end