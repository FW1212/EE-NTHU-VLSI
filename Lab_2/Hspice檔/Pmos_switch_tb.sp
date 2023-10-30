

.protect
.lib "./cic018.l" TT
.temp 25
.unprotect
.inc "Pmos.spi"

.option 
+ unwrap
+ post
+ acout=0 runlvl=6
+ captab

xPmos Vds Vgs Vss IV_curves_P

V1 Vds 0 -0.2
V2 Vgs 0 -0.9
V3 Vss 0 0

.op
.DC V2 -1.8 0 0.01
.end