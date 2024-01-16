

****Final project pre sim****

.protect
.lib "cic018.l" SF
.temp 25
.unprotect

*.include "decoder.spi"
*.include "decoder2.spi"
*.include "frequency_divider.spi"
*.include "total.spi"
.include "total.pex.spi"


.option 
+ unwrap
+ post
+ acout=0 accurate=1 runlvl=6
+ captab

.parameter pw = 970p

****Main Circuit****
V1 VDD    GND  1.8
V2 clk_in GND  pulse   0  1.8   0n  "0.1*pw" "0.1*pw" "pw" "2.2*pw" 
V3 rst    GND  pulse 1.8    0  30n    0.01n    0.01n   10n    20u
V4 en     GND  pulse   0  1.8  50n    0.01n    0.01n  200n    20u

xtotal F_4_INV F_4 F_2 F_2_INV F_32_INV F_32 F_16 F_16_INV F_8 F_8_INV
+ F_64 F_64_INV EN CLK_IN RST GND VDD WL<5> WL<1> WL<7> WL<3> WL<4> WL<0> WL<6>
+ WL<2> BL<5> BL<1> BL<7> BL<3> BL<4> BL<0> BL<6> BL<2> / total

*xtotal GND VDD bl<0> bl<1> bl<2> bl<3> bl<4> bl<5> bl<6> bl<7> clk_in 
*+ en f_2 f_2_inv f_4 f_4_inv f_8 f_8_inv f_16 f_16_inv f_32 f_32_inv f_64 
*+ f_64_inv rst wl<0> wl<1> wl<2> wl<3> wl<4> wl<5> wl<6> wl<7> / total

*xfrequency_divider rst clk_in VDD GND f_2 f_4 f_8 f_16 f_32 f_64 f_2_inv f_4_inv f_8_inv f_16_inv f_32_inv f_64_inv / frequency_divider

*xdecoder1 en f_8 f_4 f_2 f_8_inv f_4_inv f_2_inv bl<0> bl<1> bl<2> bl<3> bl<4> bl<5> bl<6> bl<7> VDD GND / decoder_3to8_en

C12 bl<0> GND 0.1p
C13 bl<1> GND 0.1p
C14 bl<2> GND 0.1p
C15 bl<3> GND 0.1p
C16 bl<4> GND 0.1p
C17 bl<5> GND 0.1p
C18 bl<6> GND 0.1p
C19 bl<7> GND 0.1p

*xdecoder2 en f_64 f_32 f_16 f_64_inv f_32_inv f_16_inv wl<0> wl<1> wl<2> wl<3> wl<4> wl<5> wl<6> wl<7> VDD GND / decoder_3to8_en2

C20 wl<0> GND 0.1p
C21 wl<1> GND 0.1p
C22 wl<2> GND 0.1p
C23 wl<3> GND 0.1p
C24 wl<4> GND 0.1p
C25 wl<5> GND 0.1p
C26 wl<6> GND 0.1p
C27 wl<7> GND 0.1p


****Analysis****
.op
.tran "(1/1000)*2.2*pw" 250ns
.meas tran average_power AVG power from 100n to "100n + 140.8*pw"
.probe 
+ V(f_2)   V(f_4)   V(f_8)   V(f_16)  V(f_32)  V(f_64)
+ V(bl<0>) V(bl<1>) V(bl<2>) V(bl<3>) V(bl<4>) V(bl<5>) V(bl<6>) V(bl<7>)
+ V(wl<0>) V(wl<1>) V(wl<2>) V(wl<3>) V(wl<4>) V(wl<5>) V(wl<6>) V(wl<7>)

*.alter 
*.protect
*.lib "./cic018.l" TT
*.unprotect

*.alter
*.protect
*.lib "./cic018.l" FF
*.unprotect

*.alter 
*.protect
*.lib "./cic018.l" FS
*.unprotect

*.alter 
*.protect
*.lib "./cic018.l" SF
*.unprotect

.end
