***************************************************
*  SPICE MACRO MODEL FOR AP431i VOLTAGE REFERENCE
*  CREATED BY: Peter Cheung, Imperial College London
*  VERSION: 1.0
*  DATE 29 SEP 2024
*****************************************************
.SUBCKT AP431i REF CATHODE ANODE
I1 ANODE vref 1m
R2 vref ANODE 2.5k
R1 ANODE REF 1.25Meg
R3 N2 N3 0.1
D1 CATHODE N1 DMOD1
D2 ANODE CATHODE DMOD1
E1 ANODE N3 REF vref 750
V1 N2 N1 1.4
.model DMOD1 D (Ron=1m Roff=1meg vfwd=1m vrev=40)
.end