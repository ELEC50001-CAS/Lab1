*
* Basic Op Amp model for MCP6001 single-rail 1MHz GBP operation amplifier from MicroChip
* Author: Peter Cheung, 24 SEPT 2024    
* Version: 1.2 - remove .parameter for LTSpice
***
.subckt MCP6001 in+ in- V+ V- out
***
* input stage - RIN = 10T, CIN = 3p, Voffset = 4.5m
  R1 in+ in- 10T
  C1 in+ in- 3p
  Voffset in+ offset dc 4.5m
* gain stage - R2 = {AOL/(6.28*GBP*CPOLE)}, AOL = 400k, GBP = 1Meg, CPOLE = 1n
*              gm = 6.28*GBP*CPOLE, current limit IMAX = +/- 0.6mA
  G1 0 int_gain value={limit(0.00628*V(offset,in-),0.6m, -0.6m)}
  R2 int_gain 0 63.7Meg
  C2 int_gain 0 1n
* output stage - current limit to +/- 20mA, ROUT = 300 ohm
  G2 0 out value={limit(V(int_gain, 0)/300, 20m, -20m)}
  R3 out 0 300
* output voltage limited to V+ and V-
  D1 int_gain V+ Dlimit
  D2 V- int_gain Dlimit
  .model Dlimit D(Ron=0.0001 Roff=100G Vfwd=0)
.ends MCP6001

 