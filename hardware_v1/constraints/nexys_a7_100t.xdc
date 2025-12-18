#set_property -dict {PACKAGE_PIN A9 IOSTANDARD LVCMOS33} [get_ports usb_uart_rxd];
#set_property -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS33} [get_ports usb_uart_txd];
#create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} [get_ports {sys_clock}];
#set_false_path -from [get_ports usb_uart_rxd];
#set_false_path -to [get_ports usb_uart_txd];
## USB-UART Interface
set_property -dict {PACKAGE_PIN C4 IOSTANDARD LVCMOS33} [get_ports uart_rx]
set_property -dict {PACKAGE_PIN D4 IOSTANDARD LVCMOS33} [get_ports uart_tx]
#set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { sys_clock }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
set_false_path -from [get_ports uart_rx]
set_false_path -to [get_ports uart_tx]
set_property -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS33} [get_ports rstn]

#set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {sw[0]}]
#set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33} [get_ports {sw[1]}]
#set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {sw[2]}]
#set_property -dict {PACKAGE_PIN R15 IOSTANDARD LVCMOS33} [get_ports {sw[3]}]
#set_property -dict {PACKAGE_PIN R17 IOSTANDARD LVCMOS33} [get_ports {sw[4]}]
#set_property -dict {PACKAGE_PIN T18 IOSTANDARD LVCMOS33} [get_ports {sw[5]}]
#set_property -dict {PACKAGE_PIN U18 IOSTANDARD LVCMOS33} [get_ports {sw[6]}]
#set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS33} [get_ports {sw[7]}]
#set_property -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS18} [get_ports {sw[8]}]
#set_property -dict {PACKAGE_PIN U8 IOSTANDARD LVCMOS18} [get_ports {sw[9]}]
#set_property -dict {PACKAGE_PIN R16 IOSTANDARD LVCMOS33} [get_ports {sw[10]}]
#set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVCMOS33} [get_ports {sw[11]}]
#set_property -dict {PACKAGE_PIN H6 IOSTANDARD LVCMOS33} [get_ports {sw[12]}]
#set_property -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS33} [get_ports {sw[13]}]
#set_property -dict {PACKAGE_PIN U11 IOSTANDARD LVCMOS33} [get_ports {sw[14]}]
#set_property -dict {PACKAGE_PIN V10 IOSTANDARD LVCMOS33} [get_ports {sw[15]}]

#set_property -dict {PACKAGE_PIN T10 IOSTANDARD LVCMOS33} [get_ports {seg[0]}]
#set_property -dict {PACKAGE_PIN R10 IOSTANDARD LVCMOS33} [get_ports {seg[1]}]
#set_property -dict {PACKAGE_PIN K16 IOSTANDARD LVCMOS33} [get_ports {seg[2]}]
#set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {seg[3]}]
#set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS33} [get_ports {seg[4]}]
#set_property -dict {PACKAGE_PIN T11 IOSTANDARD LVCMOS33} [get_ports {seg[5]}]
#set_property -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS33} [get_ports {seg[6]}]
#set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { DP }]; #IO_L19N_T3_A21_VREF_15 Sch=dp
#set_property -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS33} [get_ports {an[0]}]
#set_property -dict {PACKAGE_PIN J18 IOSTANDARD LVCMOS33} [get_ports {an[1]}]
#set_property -dict {PACKAGE_PIN T9 IOSTANDARD LVCMOS33} [get_ports {an[2]}]
#set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {an[3]}]
#set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS33} [get_ports {an[4]}]
#set_property -dict {PACKAGE_PIN T14 IOSTANDARD LVCMOS33} [get_ports {an[5]}]
#set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports {an[6]}]
#set_property -dict {PACKAGE_PIN U13 IOSTANDARD LVCMOS33} [get_ports {an[7]}]
## This file is a general .xdc for the Nexys A7-100T
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project

# Clock signal
set_property -dict {PACKAGE_PIN E3 IOSTANDARD LVCMOS33} [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]


##Switches
#set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { SW[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
#set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { SW[1] }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
#set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { SW[2] }]; #IO_L6N_T0_D08_VREF_14 Sch=sw[2]
#set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { SW[3] }]; #IO_L13N_T2_MRCC_14 Sch=sw[3]
#set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { SW[4] }]; #IO_L12N_T1_MRCC_14 Sch=sw[4]
#set_property -dict { PACKAGE_PIN T18   IOSTANDARD LVCMOS33 } [get_ports { SW[5] }]; #IO_L7N_T1_D10_14 Sch=sw[5]
#set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { SW[6] }]; #IO_L17N_T2_A13_D29_14 Sch=sw[6]
#set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { SW[7] }]; #IO_L5N_T0_D07_14 Sch=sw[7]
#set_property -dict { PACKAGE_PIN T8    IOSTANDARD LVCMOS18 } [get_ports { SW[8] }]; #IO_L24N_T3_34 Sch=sw[8]
#set_property -dict { PACKAGE_PIN U8    IOSTANDARD LVCMOS18 } [get_ports { SW[9] }]; #IO_25_34 Sch=sw[9]
#set_property -dict { PACKAGE_PIN R16   IOSTANDARD LVCMOS33 } [get_ports { SW[10] }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=sw[10]
#set_property -dict { PACKAGE_PIN T13   IOSTANDARD LVCMOS33 } [get_ports { SW[11] }]; #IO_L23P_T3_A03_D19_14 Sch=sw[11]
#set_property -dict { PACKAGE_PIN H6    IOSTANDARD LVCMOS33 } [get_ports { SW[12] }]; #IO_L24P_T3_35 Sch=sw[12]
#set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { SW[13] }]; #IO_L20P_T3_A08_D24_14 Sch=sw[13]
#set_property -dict { PACKAGE_PIN U11   IOSTANDARD LVCMOS33 } [get_ports { SW[14] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=sw[14]
#set_property -dict { PACKAGE_PIN V10   IOSTANDARD LVCMOS33 } [get_ports { SW[15] }]; #IO_L21P_T3_DQS_14 Sch=sw[15]

# LEDs
set_property -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS33} [get_ports halted]
#set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { LED[1] }]; #IO_L24P_T3_RS1_15 Sch=led[1]
#set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { LED[2] }]; #IO_L17N_T2_A25_15 Sch=led[2]
#set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { LED[3] }]; #IO_L8P_T1_D11_14 Sch=led[3]
#set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { LED[4] }]; #IO_L7P_T1_D09_14 Sch=led[4]
#set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { LED[5] }]; #IO_L18N_T2_A11_D27_14 Sch=led[5]
#set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { LED[6] }]; #IO_L17P_T2_A14_D30_14 Sch=led[6]
#set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { LED[7] }]; #IO_L18P_T2_A12_D28_14 Sch=led[7]
#set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { LED[8] }]; #IO_L16N_T2_A15_D31_14 Sch=led[8]
#set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { LED[9] }]; #IO_L14N_T2_SRCC_14 Sch=led[9]
#set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { LED[10] }]; #IO_L22P_T3_A05_D21_14 Sch=led[10]
#set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { LED[11] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=led[11]
#set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { LED[12] }]; #IO_L16P_T2_CSI_B_14 Sch=led[12]
#set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { LED[13] }]; #IO_L22N_T3_A04_D20_14 Sch=led[13]
#set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { LED[14] }]; #IO_L20N_T3_A07_D23_14 Sch=led[14]
#set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { LED[15] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=led[15]

## RGB LEDs
#set_property -dict { PACKAGE_PIN R12   IOSTANDARD LVCMOS33 } [get_ports { LED16_B }]; #IO_L5P_T0_D06_14 Sch=led16_b
#set_property -dict { PACKAGE_PIN M16   IOSTANDARD LVCMOS33 } [get_ports { LED16_G }]; #IO_L10P_T1_D14_14 Sch=led16_g
#set_property -dict { PACKAGE_PIN N15   IOSTANDARD LVCMOS33 } [get_ports { LED16_R }]; #IO_L11P_T1_SRCC_14 Sch=led16_r
#set_property -dict { PACKAGE_PIN G14   IOSTANDARD LVCMOS33 } [get_ports { LED17_B }]; #IO_L15N_T2_DQS_ADV_B_15 Sch=led17_b
#set_property -dict { PACKAGE_PIN R11   IOSTANDARD LVCMOS33 } [get_ports { LED17_G }]; #IO_0_14 Sch=led17_g
#set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports { LED17_R }]; #IO_L11N_T1_SRCC_14 Sch=led17_r

##7 segment display
#set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { CA }]; #IO_L24N_T3_A00_D16_14 Sch=ca
#set_property -dict { PACKAGE_PIN R10   IOSTANDARD LVCMOS33 } [get_ports { CB }]; #IO_25_14 Sch=cb
#set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { CC }]; #IO_25_15 Sch=cc
#set_property -dict { PACKAGE_PIN K13   IOSTANDARD LVCMOS33 } [get_ports { CD }]; #IO_L17P_T2_A26_15 Sch=cd
#set_property -dict { PACKAGE_PIN P15   IOSTANDARD LVCMOS33 } [get_ports { CE }]; #IO_L13P_T2_MRCC_14 Sch=ce
#set_property -dict { PACKAGE_PIN T11   IOSTANDARD LVCMOS33 } [get_ports { CF }]; #IO_L19P_T3_A10_D26_14 Sch=cf
#set_property -dict { PACKAGE_PIN L18   IOSTANDARD LVCMOS33 } [get_ports { CG }]; #IO_L4P_T0_D04_14 Sch=cg
#set_property -dict { PACKAGE_PIN H15   IOSTANDARD LVCMOS33 } [get_ports { DP }]; #IO_L19N_T3_A21_VREF_15 Sch=dp
#set_property -dict { PACKAGE_PIN J17   IOSTANDARD LVCMOS33 } [get_ports { AN[0] }]; #IO_L23P_T3_FOE_B_15 Sch=an[0]
#set_property -dict { PACKAGE_PIN J18   IOSTANDARD LVCMOS33 } [get_ports { AN[1] }]; #IO_L23N_T3_FWE_B_15 Sch=an[1]
#set_property -dict { PACKAGE_PIN T9    IOSTANDARD LVCMOS33 } [get_ports { AN[2] }]; #IO_L24P_T3_A01_D17_14 Sch=an[2]
#set_property -dict { PACKAGE_PIN J14   IOSTANDARD LVCMOS33 } [get_ports { AN[3] }]; #IO_L19P_T3_A22_15 Sch=an[3]
#set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { AN[4] }]; #IO_L8N_T1_D12_14 Sch=an[4]
#set_property -dict { PACKAGE_PIN T14   IOSTANDARD LVCMOS33 } [get_ports { AN[5] }]; #IO_L14P_T2_SRCC_14 Sch=an[5]
#set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { AN[6] }]; #IO_L23P_T3_35 Sch=an[6]
#set_property -dict { PACKAGE_PIN U13   IOSTANDARD LVCMOS33 } [get_ports { AN[7] }]; #IO_L23N_T3_A02_D18_14 Sch=an[7]

##Buttons
#set_property -dict { PACKAGE_PIN C12   IOSTANDARD LVCMOS33 } [get_ports { CPU_RESETN }]; #IO_L3P_T0_DQS_AD1P_15 Sch=cpu_resetn
#set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports btnc]
#set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { BTNU }]; #IO_L4N_T0_D05_14 Sch=btnu
#set_property -dict { PACKAGE_PIN P17   IOSTANDARD LVCMOS33 } [get_ports { BTNL }]; #IO_L12P_T1_MRCC_14 Sch=btnl
#set_property -dict {PACKAGE_PIN M17 IOSTANDARD LVCMOS33} [get_ports btnr]
#set_property -dict { PACKAGE_PIN P18   IOSTANDARD LVCMOS33 } [get_ports { BTND }]; #IO_L9N_T1_DQS_D13_14 Sch=btnd


##Pmod Headers
##Pmod Header JA
#set_property -dict { PACKAGE_PIN C17   IOSTANDARD LVCMOS33 } [get_ports { JA[1] }]; #IO_L20N_T3_A19_15 Sch=ja[1]
#set_property -dict { PACKAGE_PIN D18   IOSTANDARD LVCMOS33 } [get_ports { JA[2] }]; #IO_L21N_T3_DQS_A18_15 Sch=ja[2]
#set_property -dict { PACKAGE_PIN E18   IOSTANDARD LVCMOS33 } [get_ports { JA[3] }]; #IO_L21P_T3_DQS_15 Sch=ja[3]
#set_property -dict { PACKAGE_PIN G17   IOSTANDARD LVCMOS33 } [get_ports { JA[4] }]; #IO_L18N_T2_A23_15 Sch=ja[4]
#set_property -dict { PACKAGE_PIN D17   IOSTANDARD LVCMOS33 } [get_ports { JA[7] }]; #IO_L16N_T2_A27_15 Sch=ja[7]
#set_property -dict { PACKAGE_PIN E17   IOSTANDARD LVCMOS33 } [get_ports { JA[8] }]; #IO_L16P_T2_A28_15 Sch=ja[8]
#set_property -dict { PACKAGE_PIN F18   IOSTANDARD LVCMOS33 } [get_ports { JA[9] }]; #IO_L22N_T3_A16_15 Sch=ja[9]
#set_property -dict { PACKAGE_PIN G18   IOSTANDARD LVCMOS33 } [get_ports { JA[10] }]; #IO_L22P_T3_A17_15 Sch=ja[10]

##Pmod Header JB
#set_property -dict { PACKAGE_PIN D14   IOSTANDARD LVCMOS33 } [get_ports { JB[1] }]; #IO_L1P_T0_AD0P_15 Sch=jb[1]
#set_property -dict { PACKAGE_PIN F16   IOSTANDARD LVCMOS33 } [get_ports { JB[2] }]; #IO_L14N_T2_SRCC_15 Sch=jb[2]
#set_property -dict { PACKAGE_PIN G16   IOSTANDARD LVCMOS33 } [get_ports { JB[3] }]; #IO_L13N_T2_MRCC_15 Sch=jb[3]
#set_property -dict { PACKAGE_PIN H14   IOSTANDARD LVCMOS33 } [get_ports { JB[4] }]; #IO_L15P_T2_DQS_15 Sch=jb[4]
#set_property -dict { PACKAGE_PIN E16   IOSTANDARD LVCMOS33 } [get_ports { JB[7] }]; #IO_L11N_T1_SRCC_15 Sch=jb[7]
#set_property -dict { PACKAGE_PIN F13   IOSTANDARD LVCMOS33 } [get_ports { JB[8] }]; #IO_L5P_T0_AD9P_15 Sch=jb[8]
#set_property -dict { PACKAGE_PIN G13   IOSTANDARD LVCMOS33 } [get_ports { JB[9] }]; #IO_0_15 Sch=jb[9]
#set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { JB[10] }]; #IO_L13P_T2_MRCC_15 Sch=jb[10]

##Pmod Header JC
#set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { JC[1] }]; #IO_L23N_T3_35 Sch=jc[1]
#set_property -dict { PACKAGE_PIN F6    IOSTANDARD LVCMOS33 } [get_ports { JC[2] }]; #IO_L19N_T3_VREF_35 Sch=jc[2]
#set_property -dict { PACKAGE_PIN J2    IOSTANDARD LVCMOS33 } [get_ports { JC[3] }]; #IO_L22N_T3_35 Sch=jc[3]
#set_property -dict { PACKAGE_PIN G6    IOSTANDARD LVCMOS33 } [get_ports { JC[4] }]; #IO_L19P_T3_35 Sch=jc[4]
#set_property -dict { PACKAGE_PIN E7    IOSTANDARD LVCMOS33 } [get_ports { JC[7] }]; #IO_L6P_T0_35 Sch=jc[7]
#set_property -dict { PACKAGE_PIN J3    IOSTANDARD LVCMOS33 } [get_ports { JC[8] }]; #IO_L22P_T3_35 Sch=jc[8]
#set_property -dict { PACKAGE_PIN J4    IOSTANDARD LVCMOS33 } [get_ports { JC[9] }]; #IO_L21P_T3_DQS_35 Sch=jc[9]
#set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { JC[10] }]; #IO_L5P_T0_AD13P_35 Sch=jc[10]

##Pmod Header JD
#set_property -dict { PACKAGE_PIN H4    IOSTANDARD LVCMOS33 } [get_ports { JD[1] }]; #IO_L21N_T3_DQS_35 Sch=jd[1]
#set_property -dict { PACKAGE_PIN H1    IOSTANDARD LVCMOS33 } [get_ports { JD[2] }]; #IO_L17P_T2_35 Sch=jd[2]
#set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { JD[3] }]; #IO_L17N_T2_35 Sch=jd[3]
#set_property -dict { PACKAGE_PIN G3    IOSTANDARD LVCMOS33 } [get_ports { JD[4] }]; #IO_L20N_T3_35 Sch=jd[4]
#set_property -dict { PACKAGE_PIN H2    IOSTANDARD LVCMOS33 } [get_ports { JD[7] }]; #IO_L15P_T2_DQS_35 Sch=jd[7]
#set_property -dict { PACKAGE_PIN G4    IOSTANDARD LVCMOS33 } [get_ports { JD[8] }]; #IO_L20P_T3_35 Sch=jd[8]
#set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { JD[9] }]; #IO_L15N_T2_DQS_35 Sch=jd[9]
#set_property -dict { PACKAGE_PIN F3    IOSTANDARD LVCMOS33 } [get_ports { JD[10] }]; #IO_L13N_T2_MRCC_35 Sch=jd[10]

##Pmod Header JXADC
#set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports { XA_N[1] }]; #IO_L9N_T1_DQS_AD3N_15 Sch=xa_n[1]
#set_property -dict { PACKAGE_PIN A13   IOSTANDARD LVCMOS33 } [get_ports { XA_P[1] }]; #IO_L9P_T1_DQS_AD3P_15 Sch=xa_p[1]
#set_property -dict { PACKAGE_PIN A16   IOSTANDARD LVCMOS33 } [get_ports { XA_N[2] }]; #IO_L8N_T1_AD10N_15 Sch=xa_n[2]
#set_property -dict { PACKAGE_PIN A15   IOSTANDARD LVCMOS33 } [get_ports { XA_P[2] }]; #IO_L8P_T1_AD10P_15 Sch=xa_p[2]
#set_property -dict { PACKAGE_PIN B17   IOSTANDARD LVCMOS33 } [get_ports { XA_N[3] }]; #IO_L7N_T1_AD2N_15 Sch=xa_n[3]
#set_property -dict { PACKAGE_PIN B16   IOSTANDARD LVCMOS33 } [get_ports { XA_P[3] }]; #IO_L7P_T1_AD2P_15 Sch=xa_p[3]
#set_property -dict { PACKAGE_PIN A18   IOSTANDARD LVCMOS33 } [get_ports { XA_N[4] }]; #IO_L10N_T1_AD11N_15 Sch=xa_n[4]
#set_property -dict { PACKAGE_PIN B18   IOSTANDARD LVCMOS33 } [get_ports { XA_P[4] }]; #IO_L10P_T1_AD11P_15 Sch=xa_p[4]

##VGA Connector
#set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { VGA_R[0] }]; #IO_L8N_T1_AD14N_35 Sch=vga_r[0]
#set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { VGA_R[1] }]; #IO_L7N_T1_AD6N_35 Sch=vga_r[1]
#set_property -dict { PACKAGE_PIN C5    IOSTANDARD LVCMOS33 } [get_ports { VGA_R[2] }]; #IO_L1N_T0_AD4N_35 Sch=vga_r[2]
#set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { VGA_R[3] }]; #IO_L8P_T1_AD14P_35 Sch=vga_r[3]
#set_property -dict { PACKAGE_PIN C6    IOSTANDARD LVCMOS33 } [get_ports { VGA_G[0] }]; #IO_L1P_T0_AD4P_35 Sch=vga_g[0]
#set_property -dict { PACKAGE_PIN A5    IOSTANDARD LVCMOS33 } [get_ports { VGA_G[1] }]; #IO_L3N_T0_DQS_AD5N_35 Sch=vga_g[1]
#set_property -dict { PACKAGE_PIN B6    IOSTANDARD LVCMOS33 } [get_ports { VGA_G[2] }]; #IO_L2N_T0_AD12N_35 Sch=vga_g[2]
#set_property -dict { PACKAGE_PIN A6    IOSTANDARD LVCMOS33 } [get_ports { VGA_G[3] }]; #IO_L3P_T0_DQS_AD5P_35 Sch=vga_g[3]
#set_property -dict { PACKAGE_PIN B7    IOSTANDARD LVCMOS33 } [get_ports { VGA_B[0] }]; #IO_L2P_T0_AD12P_35 Sch=vga_b[0]
#set_property -dict { PACKAGE_PIN C7    IOSTANDARD LVCMOS33 } [get_ports { VGA_B[1] }]; #IO_L4N_T0_35 Sch=vga_b[1]
#set_property -dict { PACKAGE_PIN D7    IOSTANDARD LVCMOS33 } [get_ports { VGA_B[2] }]; #IO_L6N_T0_VREF_35 Sch=vga_b[2]
#set_property -dict { PACKAGE_PIN D8    IOSTANDARD LVCMOS33 } [get_ports { VGA_B[3] }]; #IO_L4P_T0_35 Sch=vga_b[3]
#set_property -dict { PACKAGE_PIN B11   IOSTANDARD LVCMOS33 } [get_ports { VGA_HS }]; #IO_L4P_T0_15 Sch=vga_hs
#set_property -dict { PACKAGE_PIN B12   IOSTANDARD LVCMOS33 } [get_ports { VGA_VS }]; #IO_L3N_T0_DQS_AD1N_15 Sch=vga_vs

##Micro SD Connector
#set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { SD_RESET }]; #IO_L14P_T2_SRCC_35 Sch=sd_reset
#set_property -dict { PACKAGE_PIN A1    IOSTANDARD LVCMOS33 } [get_ports { SD_CD }]; #IO_L9N_T1_DQS_AD7N_35 Sch=sd_cd
#set_property -dict { PACKAGE_PIN B1    IOSTANDARD LVCMOS33 } [get_ports { SD_SCK }]; #IO_L9P_T1_DQS_AD7P_35 Sch=sd_sck
#set_property -dict { PACKAGE_PIN C1    IOSTANDARD LVCMOS33 } [get_ports { SD_CMD }]; #IO_L16N_T2_35 Sch=sd_cmd
#set_property -dict { PACKAGE_PIN C2    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[0] }]; #IO_L16P_T2_35 Sch=sd_dat[0]
#set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[1] }]; #IO_L18N_T2_35 Sch=sd_dat[1]
#set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[2] }]; #IO_L18P_T2_35 Sch=sd_dat[2]
#set_property -dict { PACKAGE_PIN D2    IOSTANDARD LVCMOS33 } [get_ports { SD_DAT[3] }]; #IO_L14N_T2_SRCC_35 Sch=sd_dat[3]

##Accelerometer
#set_property -dict { PACKAGE_PIN E15   IOSTANDARD LVCMOS33 } [get_ports { ACL_MISO }]; #IO_L11P_T1_SRCC_15 Sch=acl_miso
#set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { ACL_MOSI }]; #IO_L5N_T0_AD9N_15 Sch=acl_mosi
#set_property -dict { PACKAGE_PIN F15   IOSTANDARD LVCMOS33 } [get_ports { ACL_SCLK }]; #IO_L14P_T2_SRCC_15 Sch=acl_sclk
#set_property -dict { PACKAGE_PIN D15   IOSTANDARD LVCMOS33 } [get_ports { ACL_CSN }]; #IO_L12P_T1_MRCC_15 Sch=acl_csn
#set_property -dict { PACKAGE_PIN B13   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[1] }]; #IO_L2P_T0_AD8P_15 Sch=acl_int[1]
#set_property -dict { PACKAGE_PIN C16   IOSTANDARD LVCMOS33 } [get_ports { ACL_INT[2] }]; #IO_L20P_T3_A20_15 Sch=acl_int[2]

##Temperature Sensor
#set_property -dict { PACKAGE_PIN C14   IOSTANDARD LVCMOS33 } [get_ports { TMP_SCL }]; #IO_L1N_T0_AD0N_15 Sch=tmp_scl
#set_property -dict { PACKAGE_PIN C15   IOSTANDARD LVCMOS33 } [get_ports { TMP_SDA }]; #IO_L12N_T1_MRCC_15 Sch=tmp_sda
#set_property -dict { PACKAGE_PIN D13   IOSTANDARD LVCMOS33 } [get_ports { TMP_INT }]; #IO_L6N_T0_VREF_15 Sch=tmp_int
#set_property -dict { PACKAGE_PIN B14   IOSTANDARD LVCMOS33 } [get_ports { TMP_CT }]; #IO_L2N_T0_AD8N_15 Sch=tmp_ct

##Omnidirectional Microphone
#set_property -dict { PACKAGE_PIN J5    IOSTANDARD LVCMOS33 } [get_ports { M_CLK }]; #IO_25_35 Sch=m_clk
#set_property -dict { PACKAGE_PIN H5    IOSTANDARD LVCMOS33 } [get_ports { M_DATA }]; #IO_L24N_T3_35 Sch=m_data
#set_property -dict { PACKAGE_PIN F5    IOSTANDARD LVCMOS33 } [get_ports { M_LRSEL }]; #IO_0_35 Sch=m_lrsel

##PWM Audio Amplifier
#set_property -dict { PACKAGE_PIN A11   IOSTANDARD LVCMOS33 } [get_ports { AUD_PWM }]; #IO_L4N_T0_15 Sch=aud_pwm
#set_property -dict { PACKAGE_PIN D12   IOSTANDARD LVCMOS33 } [get_ports { AUD_SD }]; #IO_L6P_T0_15 Sch=aud_sd

##USB-RS232 Interface
#set_property -dict { PACKAGE_PIN C4    IOSTANDARD LVCMOS33 } [get_ports { UART_TXD_IN }]; #IO_L7P_T1_AD6P_35 Sch=uart_txd_in
#set_property -dict { PACKAGE_PIN D4    IOSTANDARD LVCMOS33 } [get_ports { UART_RXD_OUT }]; #IO_L11N_T1_SRCC_35 Sch=uart_rxd_out
#set_property -dict { PACKAGE_PIN D3    IOSTANDARD LVCMOS33 } [get_ports { UART_CTS }]; #IO_L12N_T1_MRCC_35 Sch=uart_cts
#set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { UART_RTS }]; #IO_L5N_T0_AD13N_35 Sch=uart_rts

##USB HID (PS/2)
#set_property -dict { PACKAGE_PIN F4    IOSTANDARD LVCMOS33 } [get_ports { PS2_CLK }]; #IO_L13P_T2_MRCC_35 Sch=ps2_clk
#set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { PS2_DATA }]; #IO_L10N_T1_AD15N_35 Sch=ps2_data

##SMSC Ethernet PHY
#set_property -dict { PACKAGE_PIN C9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDC }]; #IO_L11P_T1_SRCC_16 Sch=eth_mdc
#set_property -dict { PACKAGE_PIN A9    IOSTANDARD LVCMOS33 } [get_ports { ETH_MDIO }]; #IO_L14N_T2_SRCC_16 Sch=eth_mdio
#set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { ETH_RSTN }]; #IO_L10P_T1_AD15P_35 Sch=eth_rstn
#set_property -dict { PACKAGE_PIN D9    IOSTANDARD LVCMOS33 } [get_ports { ETH_CRSDV }]; #IO_L6N_T0_VREF_16 Sch=eth_crsdv
#set_property -dict { PACKAGE_PIN C10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXERR }]; #IO_L13N_T2_MRCC_16 Sch=eth_rxerr
#set_property -dict { PACKAGE_PIN C11   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[0] }]; #IO_L13P_T2_MRCC_16 Sch=eth_rxd[0]
#set_property -dict { PACKAGE_PIN D10   IOSTANDARD LVCMOS33 } [get_ports { ETH_RXD[1] }]; #IO_L19N_T3_VREF_16 Sch=eth_rxd[1]
#set_property -dict { PACKAGE_PIN B9    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXEN }]; #IO_L11N_T1_SRCC_16 Sch=eth_txen
#set_property -dict { PACKAGE_PIN A10   IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[0] }]; #IO_L14P_T2_SRCC_16 Sch=eth_txd[0]
#set_property -dict { PACKAGE_PIN A8    IOSTANDARD LVCMOS33 } [get_ports { ETH_TXD[1] }]; #IO_L12N_T1_MRCC_16 Sch=eth_txd[1]
#set_property -dict { PACKAGE_PIN D5    IOSTANDARD LVCMOS33 } [get_ports { ETH_REFCLK }]; #IO_L11P_T1_SRCC_35 Sch=eth_refclk
#set_property -dict { PACKAGE_PIN B8    IOSTANDARD LVCMOS33 } [get_ports { ETH_INTN }]; #IO_L12P_T1_MRCC_16 Sch=eth_intn

##Quad SPI Flash
#set_property -dict { PACKAGE_PIN K17   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[0] }]; #IO_L1P_T0_D00_MOSI_14 Sch=qspi_dq[0]
#set_property -dict { PACKAGE_PIN K18   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[1] }]; #IO_L1N_T0_D01_DIN_14 Sch=qspi_dq[1]
#set_property -dict { PACKAGE_PIN L14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[2] }]; #IO_L2P_T0_D02_14 Sch=qspi_dq[2]
#set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports { QSPI_DQ[3] }]; #IO_L2N_T0_D03_14 Sch=qspi_dq[3]
#set_property -dict { PACKAGE_PIN L13   IOSTANDARD LVCMOS33 } [get_ports { QSPI_CSN }]; #IO_L6P_T0_FCS_B_14 Sch=qspi_csn












connect_debug_port u_ila_0/probe6 [get_nets [list {data_write_data_sld_rom_table_dbg[0]} {data_write_data_sld_rom_table_dbg[1]} {data_write_data_sld_rom_table_dbg[2]} {data_write_data_sld_rom_table_dbg[3]} {data_write_data_sld_rom_table_dbg[4]} {data_write_data_sld_rom_table_dbg[5]} {data_write_data_sld_rom_table_dbg[6]} {data_write_data_sld_rom_table_dbg[7]} {data_write_data_sld_rom_table_dbg[8]} {data_write_data_sld_rom_table_dbg[9]} {data_write_data_sld_rom_table_dbg[10]} {data_write_data_sld_rom_table_dbg[11]} {data_write_data_sld_rom_table_dbg[12]} {data_write_data_sld_rom_table_dbg[13]} {data_write_data_sld_rom_table_dbg[14]} {data_write_data_sld_rom_table_dbg[15]} {data_write_data_sld_rom_table_dbg[16]} {data_write_data_sld_rom_table_dbg[17]} {data_write_data_sld_rom_table_dbg[18]} {data_write_data_sld_rom_table_dbg[19]} {data_write_data_sld_rom_table_dbg[20]} {data_write_data_sld_rom_table_dbg[21]} {data_write_data_sld_rom_table_dbg[22]} {data_write_data_sld_rom_table_dbg[23]} {data_write_data_sld_rom_table_dbg[24]} {data_write_data_sld_rom_table_dbg[25]} {data_write_data_sld_rom_table_dbg[26]} {data_write_data_sld_rom_table_dbg[27]} {data_write_data_sld_rom_table_dbg[28]} {data_write_data_sld_rom_table_dbg[29]} {data_write_data_sld_rom_table_dbg[30]} {data_write_data_sld_rom_table_dbg[31]}]]
connect_debug_port u_ila_0/probe8 [get_nets [list {sld_log_flat[0]} {sld_log_flat[1]} {sld_log_flat[2]} {sld_log_flat[3]} {sld_log_flat[4]} {sld_log_flat[5]} {sld_log_flat[6]} {sld_log_flat[7]} {sld_log_flat[8]} {sld_log_flat[9]} {sld_log_flat[10]} {sld_log_flat[11]} {sld_log_flat[12]} {sld_log_flat[13]} {sld_log_flat[14]} {sld_log_flat[15]} {sld_log_flat[16]} {sld_log_flat[17]} {sld_log_flat[18]} {sld_log_flat[19]} {sld_log_flat[20]} {sld_log_flat[21]} {sld_log_flat[22]} {sld_log_flat[23]} {sld_log_flat[24]} {sld_log_flat[25]} {sld_log_flat[26]} {sld_log_flat[27]} {sld_log_flat[28]} {sld_log_flat[29]} {sld_log_flat[30]} {sld_log_flat[31]} {sld_log_flat[32]} {sld_log_flat[33]} {sld_log_flat[34]} {sld_log_flat[35]} {sld_log_flat[36]} {sld_log_flat[37]} {sld_log_flat[38]} {sld_log_flat[39]} {sld_log_flat[40]} {sld_log_flat[41]} {sld_log_flat[42]} {sld_log_flat[43]} {sld_log_flat[44]} {sld_log_flat[45]} {sld_log_flat[46]} {sld_log_flat[47]} {sld_log_flat[48]} {sld_log_flat[49]} {sld_log_flat[50]} {sld_log_flat[51]} {sld_log_flat[52]} {sld_log_flat[53]} {sld_log_flat[54]} {sld_log_flat[55]} {sld_log_flat[56]} {sld_log_flat[57]} {sld_log_flat[58]} {sld_log_flat[59]} {sld_log_flat[60]} {sld_log_flat[61]} {sld_log_flat[62]} {sld_log_flat[63]} {sld_log_flat[64]} {sld_log_flat[65]} {sld_log_flat[66]} {sld_log_flat[67]} {sld_log_flat[68]} {sld_log_flat[69]} {sld_log_flat[70]} {sld_log_flat[71]} {sld_log_flat[72]} {sld_log_flat[73]} {sld_log_flat[74]} {sld_log_flat[75]} {sld_log_flat[76]} {sld_log_flat[77]} {sld_log_flat[78]} {sld_log_flat[79]} {sld_log_flat[80]} {sld_log_flat[81]} {sld_log_flat[82]} {sld_log_flat[83]} {sld_log_flat[84]} {sld_log_flat[85]} {sld_log_flat[86]} {sld_log_flat[87]} {sld_log_flat[88]} {sld_log_flat[89]} {sld_log_flat[90]} {sld_log_flat[91]} {sld_log_flat[92]} {sld_log_flat[93]} {sld_log_flat[94]} {sld_log_flat[95]} {sld_log_flat[96]} {sld_log_flat[97]} {sld_log_flat[98]} {sld_log_flat[99]} {sld_log_flat[100]} {sld_log_flat[101]} {sld_log_flat[102]} {sld_log_flat[103]} {sld_log_flat[104]} {sld_log_flat[105]} {sld_log_flat[106]} {sld_log_flat[107]} {sld_log_flat[108]} {sld_log_flat[109]} {sld_log_flat[110]} {sld_log_flat[111]} {sld_log_flat[112]} {sld_log_flat[113]} {sld_log_flat[114]} {sld_log_flat[115]} {sld_log_flat[116]} {sld_log_flat[117]} {sld_log_flat[118]} {sld_log_flat[119]} {sld_log_flat[120]} {sld_log_flat[121]} {sld_log_flat[122]} {sld_log_flat[123]} {sld_log_flat[124]} {sld_log_flat[125]} {sld_log_flat[126]} {sld_log_flat[127]} {sld_log_flat[128]} {sld_log_flat[129]} {sld_log_flat[130]} {sld_log_flat[131]} {sld_log_flat[132]} {sld_log_flat[133]} {sld_log_flat[134]} {sld_log_flat[135]} {sld_log_flat[136]} {sld_log_flat[137]} {sld_log_flat[138]} {sld_log_flat[139]} {sld_log_flat[140]} {sld_log_flat[141]} {sld_log_flat[142]} {sld_log_flat[143]} {sld_log_flat[144]} {sld_log_flat[145]} {sld_log_flat[146]} {sld_log_flat[147]} {sld_log_flat[148]} {sld_log_flat[149]} {sld_log_flat[150]} {sld_log_flat[151]} {sld_log_flat[152]} {sld_log_flat[153]} {sld_log_flat[154]} {sld_log_flat[155]} {sld_log_flat[156]} {sld_log_flat[157]} {sld_log_flat[158]} {sld_log_flat[159]} {sld_log_flat[160]} {sld_log_flat[161]} {sld_log_flat[162]} {sld_log_flat[163]} {sld_log_flat[164]} {sld_log_flat[165]} {sld_log_flat[166]} {sld_log_flat[167]} {sld_log_flat[168]} {sld_log_flat[169]} {sld_log_flat[170]} {sld_log_flat[171]} {sld_log_flat[172]} {sld_log_flat[173]} {sld_log_flat[174]} {sld_log_flat[175]} {sld_log_flat[176]} {sld_log_flat[177]} {sld_log_flat[178]} {sld_log_flat[179]} {sld_log_flat[180]} {sld_log_flat[181]} {sld_log_flat[182]} {sld_log_flat[183]} {sld_log_flat[184]} {sld_log_flat[185]} {sld_log_flat[186]} {sld_log_flat[187]} {sld_log_flat[188]} {sld_log_flat[189]} {sld_log_flat[190]} {sld_log_flat[191]} {sld_log_flat[192]} {sld_log_flat[193]} {sld_log_flat[194]} {sld_log_flat[195]} {sld_log_flat[196]} {sld_log_flat[197]} {sld_log_flat[198]} {sld_log_flat[199]} {sld_log_flat[200]} {sld_log_flat[201]} {sld_log_flat[202]} {sld_log_flat[203]} {sld_log_flat[204]} {sld_log_flat[205]} {sld_log_flat[206]} {sld_log_flat[207]} {sld_log_flat[208]} {sld_log_flat[209]} {sld_log_flat[210]} {sld_log_flat[211]} {sld_log_flat[212]} {sld_log_flat[213]} {sld_log_flat[214]} {sld_log_flat[215]} {sld_log_flat[216]} {sld_log_flat[217]} {sld_log_flat[218]} {sld_log_flat[219]} {sld_log_flat[220]} {sld_log_flat[221]} {sld_log_flat[222]} {sld_log_flat[223]} {sld_log_flat[224]} {sld_log_flat[225]} {sld_log_flat[226]} {sld_log_flat[227]} {sld_log_flat[228]} {sld_log_flat[229]} {sld_log_flat[230]} {sld_log_flat[231]} {sld_log_flat[232]} {sld_log_flat[233]} {sld_log_flat[234]} {sld_log_flat[235]} {sld_log_flat[236]} {sld_log_flat[237]} {sld_log_flat[238]} {sld_log_flat[239]} {sld_log_flat[240]} {sld_log_flat[241]} {sld_log_flat[242]} {sld_log_flat[243]} {sld_log_flat[244]} {sld_log_flat[245]} {sld_log_flat[246]} {sld_log_flat[247]} {sld_log_flat[248]} {sld_log_flat[249]} {sld_log_flat[250]} {sld_log_flat[251]} {sld_log_flat[252]} {sld_log_flat[253]} {sld_log_flat[254]} {sld_log_flat[255]}]]
connect_debug_port u_ila_0/probe10 [get_nets [list {state_log_wr_ptr[0]} {state_log_wr_ptr[1]} {state_log_wr_ptr[2]}]]
connect_debug_port u_ila_0/probe12 [get_nets [list {state_system_dbg[0]} {state_system_dbg[1]} {state_system_dbg[2]} {state_system_dbg[3]}]]
connect_debug_port u_ila_0/probe15 [get_nets [list {sld_log_wr_ptr[0]} {sld_log_wr_ptr[1]} {sld_log_wr_ptr[2]}]]
connect_debug_port u_ila_0/probe17 [get_nets [list {state_log_flat[0]} {state_log_flat[1]} {state_log_flat[2]} {state_log_flat[3]} {state_log_flat[4]} {state_log_flat[5]} {state_log_flat[6]} {state_log_flat[7]} {state_log_flat[8]} {state_log_flat[9]} {state_log_flat[10]} {state_log_flat[11]} {state_log_flat[12]} {state_log_flat[13]} {state_log_flat[14]} {state_log_flat[15]} {state_log_flat[16]} {state_log_flat[17]} {state_log_flat[18]} {state_log_flat[19]} {state_log_flat[20]} {state_log_flat[21]} {state_log_flat[22]} {state_log_flat[23]} {state_log_flat[24]} {state_log_flat[25]} {state_log_flat[26]} {state_log_flat[27]} {state_log_flat[28]} {state_log_flat[29]} {state_log_flat[30]} {state_log_flat[31]}]]
connect_debug_port u_ila_0/probe28 [get_nets [list data_write_enable_sld_rom_table_dbg]]
connect_debug_port u_ila_0/probe31 [get_nets [list sld_log_full]]
connect_debug_port u_ila_0/probe32 [get_nets [list state_log_full]]






create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 1 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 1024 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL false [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list clk_gen/inst/clk_out2]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 32 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {core/int_register_file/x5_dbg[0]} {core/int_register_file/x5_dbg[1]} {core/int_register_file/x5_dbg[2]} {core/int_register_file/x5_dbg[3]} {core/int_register_file/x5_dbg[4]} {core/int_register_file/x5_dbg[5]} {core/int_register_file/x5_dbg[6]} {core/int_register_file/x5_dbg[7]} {core/int_register_file/x5_dbg[8]} {core/int_register_file/x5_dbg[9]} {core/int_register_file/x5_dbg[10]} {core/int_register_file/x5_dbg[11]} {core/int_register_file/x5_dbg[12]} {core/int_register_file/x5_dbg[13]} {core/int_register_file/x5_dbg[14]} {core/int_register_file/x5_dbg[15]} {core/int_register_file/x5_dbg[16]} {core/int_register_file/x5_dbg[17]} {core/int_register_file/x5_dbg[18]} {core/int_register_file/x5_dbg[19]} {core/int_register_file/x5_dbg[20]} {core/int_register_file/x5_dbg[21]} {core/int_register_file/x5_dbg[22]} {core/int_register_file/x5_dbg[23]} {core/int_register_file/x5_dbg[24]} {core/int_register_file/x5_dbg[25]} {core/int_register_file/x5_dbg[26]} {core/int_register_file/x5_dbg[27]} {core/int_register_file/x5_dbg[28]} {core/int_register_file/x5_dbg[29]} {core/int_register_file/x5_dbg[30]} {core/int_register_file/x5_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 32 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {core/int_register_file/x6_dbg[0]} {core/int_register_file/x6_dbg[1]} {core/int_register_file/x6_dbg[2]} {core/int_register_file/x6_dbg[3]} {core/int_register_file/x6_dbg[4]} {core/int_register_file/x6_dbg[5]} {core/int_register_file/x6_dbg[6]} {core/int_register_file/x6_dbg[7]} {core/int_register_file/x6_dbg[8]} {core/int_register_file/x6_dbg[9]} {core/int_register_file/x6_dbg[10]} {core/int_register_file/x6_dbg[11]} {core/int_register_file/x6_dbg[12]} {core/int_register_file/x6_dbg[13]} {core/int_register_file/x6_dbg[14]} {core/int_register_file/x6_dbg[15]} {core/int_register_file/x6_dbg[16]} {core/int_register_file/x6_dbg[17]} {core/int_register_file/x6_dbg[18]} {core/int_register_file/x6_dbg[19]} {core/int_register_file/x6_dbg[20]} {core/int_register_file/x6_dbg[21]} {core/int_register_file/x6_dbg[22]} {core/int_register_file/x6_dbg[23]} {core/int_register_file/x6_dbg[24]} {core/int_register_file/x6_dbg[25]} {core/int_register_file/x6_dbg[26]} {core/int_register_file/x6_dbg[27]} {core/int_register_file/x6_dbg[28]} {core/int_register_file/x6_dbg[29]} {core/int_register_file/x6_dbg[30]} {core/int_register_file/x6_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 32 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {core/int_register_file/x7_dbg[0]} {core/int_register_file/x7_dbg[1]} {core/int_register_file/x7_dbg[2]} {core/int_register_file/x7_dbg[3]} {core/int_register_file/x7_dbg[4]} {core/int_register_file/x7_dbg[5]} {core/int_register_file/x7_dbg[6]} {core/int_register_file/x7_dbg[7]} {core/int_register_file/x7_dbg[8]} {core/int_register_file/x7_dbg[9]} {core/int_register_file/x7_dbg[10]} {core/int_register_file/x7_dbg[11]} {core/int_register_file/x7_dbg[12]} {core/int_register_file/x7_dbg[13]} {core/int_register_file/x7_dbg[14]} {core/int_register_file/x7_dbg[15]} {core/int_register_file/x7_dbg[16]} {core/int_register_file/x7_dbg[17]} {core/int_register_file/x7_dbg[18]} {core/int_register_file/x7_dbg[19]} {core/int_register_file/x7_dbg[20]} {core/int_register_file/x7_dbg[21]} {core/int_register_file/x7_dbg[22]} {core/int_register_file/x7_dbg[23]} {core/int_register_file/x7_dbg[24]} {core/int_register_file/x7_dbg[25]} {core/int_register_file/x7_dbg[26]} {core/int_register_file/x7_dbg[27]} {core/int_register_file/x7_dbg[28]} {core/int_register_file/x7_dbg[29]} {core/int_register_file/x7_dbg[30]} {core/int_register_file/x7_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 32 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {core/int_register_file/x10_dbg[0]} {core/int_register_file/x10_dbg[1]} {core/int_register_file/x10_dbg[2]} {core/int_register_file/x10_dbg[3]} {core/int_register_file/x10_dbg[4]} {core/int_register_file/x10_dbg[5]} {core/int_register_file/x10_dbg[6]} {core/int_register_file/x10_dbg[7]} {core/int_register_file/x10_dbg[8]} {core/int_register_file/x10_dbg[9]} {core/int_register_file/x10_dbg[10]} {core/int_register_file/x10_dbg[11]} {core/int_register_file/x10_dbg[12]} {core/int_register_file/x10_dbg[13]} {core/int_register_file/x10_dbg[14]} {core/int_register_file/x10_dbg[15]} {core/int_register_file/x10_dbg[16]} {core/int_register_file/x10_dbg[17]} {core/int_register_file/x10_dbg[18]} {core/int_register_file/x10_dbg[19]} {core/int_register_file/x10_dbg[20]} {core/int_register_file/x10_dbg[21]} {core/int_register_file/x10_dbg[22]} {core/int_register_file/x10_dbg[23]} {core/int_register_file/x10_dbg[24]} {core/int_register_file/x10_dbg[25]} {core/int_register_file/x10_dbg[26]} {core/int_register_file/x10_dbg[27]} {core/int_register_file/x10_dbg[28]} {core/int_register_file/x10_dbg[29]} {core/int_register_file/x10_dbg[30]} {core/int_register_file/x10_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 32 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {core/int_register_file/stackpointer_dbg[0]} {core/int_register_file/stackpointer_dbg[1]} {core/int_register_file/stackpointer_dbg[2]} {core/int_register_file/stackpointer_dbg[3]} {core/int_register_file/stackpointer_dbg[4]} {core/int_register_file/stackpointer_dbg[5]} {core/int_register_file/stackpointer_dbg[6]} {core/int_register_file/stackpointer_dbg[7]} {core/int_register_file/stackpointer_dbg[8]} {core/int_register_file/stackpointer_dbg[9]} {core/int_register_file/stackpointer_dbg[10]} {core/int_register_file/stackpointer_dbg[11]} {core/int_register_file/stackpointer_dbg[12]} {core/int_register_file/stackpointer_dbg[13]} {core/int_register_file/stackpointer_dbg[14]} {core/int_register_file/stackpointer_dbg[15]} {core/int_register_file/stackpointer_dbg[16]} {core/int_register_file/stackpointer_dbg[17]} {core/int_register_file/stackpointer_dbg[18]} {core/int_register_file/stackpointer_dbg[19]} {core/int_register_file/stackpointer_dbg[20]} {core/int_register_file/stackpointer_dbg[21]} {core/int_register_file/stackpointer_dbg[22]} {core/int_register_file/stackpointer_dbg[23]} {core/int_register_file/stackpointer_dbg[24]} {core/int_register_file/stackpointer_dbg[25]} {core/int_register_file/stackpointer_dbg[26]} {core/int_register_file/stackpointer_dbg[27]} {core/int_register_file/stackpointer_dbg[28]} {core/int_register_file/stackpointer_dbg[29]} {core/int_register_file/stackpointer_dbg[30]} {core/int_register_file/stackpointer_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 256 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {core/pc_log_flat[0]} {core/pc_log_flat[1]} {core/pc_log_flat[2]} {core/pc_log_flat[3]} {core/pc_log_flat[4]} {core/pc_log_flat[5]} {core/pc_log_flat[6]} {core/pc_log_flat[7]} {core/pc_log_flat[8]} {core/pc_log_flat[9]} {core/pc_log_flat[10]} {core/pc_log_flat[11]} {core/pc_log_flat[12]} {core/pc_log_flat[13]} {core/pc_log_flat[14]} {core/pc_log_flat[15]} {core/pc_log_flat[16]} {core/pc_log_flat[17]} {core/pc_log_flat[18]} {core/pc_log_flat[19]} {core/pc_log_flat[20]} {core/pc_log_flat[21]} {core/pc_log_flat[22]} {core/pc_log_flat[23]} {core/pc_log_flat[24]} {core/pc_log_flat[25]} {core/pc_log_flat[26]} {core/pc_log_flat[27]} {core/pc_log_flat[28]} {core/pc_log_flat[29]} {core/pc_log_flat[30]} {core/pc_log_flat[31]} {core/pc_log_flat[32]} {core/pc_log_flat[33]} {core/pc_log_flat[34]} {core/pc_log_flat[35]} {core/pc_log_flat[36]} {core/pc_log_flat[37]} {core/pc_log_flat[38]} {core/pc_log_flat[39]} {core/pc_log_flat[40]} {core/pc_log_flat[41]} {core/pc_log_flat[42]} {core/pc_log_flat[43]} {core/pc_log_flat[44]} {core/pc_log_flat[45]} {core/pc_log_flat[46]} {core/pc_log_flat[47]} {core/pc_log_flat[48]} {core/pc_log_flat[49]} {core/pc_log_flat[50]} {core/pc_log_flat[51]} {core/pc_log_flat[52]} {core/pc_log_flat[53]} {core/pc_log_flat[54]} {core/pc_log_flat[55]} {core/pc_log_flat[56]} {core/pc_log_flat[57]} {core/pc_log_flat[58]} {core/pc_log_flat[59]} {core/pc_log_flat[60]} {core/pc_log_flat[61]} {core/pc_log_flat[62]} {core/pc_log_flat[63]} {core/pc_log_flat[64]} {core/pc_log_flat[65]} {core/pc_log_flat[66]} {core/pc_log_flat[67]} {core/pc_log_flat[68]} {core/pc_log_flat[69]} {core/pc_log_flat[70]} {core/pc_log_flat[71]} {core/pc_log_flat[72]} {core/pc_log_flat[73]} {core/pc_log_flat[74]} {core/pc_log_flat[75]} {core/pc_log_flat[76]} {core/pc_log_flat[77]} {core/pc_log_flat[78]} {core/pc_log_flat[79]} {core/pc_log_flat[80]} {core/pc_log_flat[81]} {core/pc_log_flat[82]} {core/pc_log_flat[83]} {core/pc_log_flat[84]} {core/pc_log_flat[85]} {core/pc_log_flat[86]} {core/pc_log_flat[87]} {core/pc_log_flat[88]} {core/pc_log_flat[89]} {core/pc_log_flat[90]} {core/pc_log_flat[91]} {core/pc_log_flat[92]} {core/pc_log_flat[93]} {core/pc_log_flat[94]} {core/pc_log_flat[95]} {core/pc_log_flat[96]} {core/pc_log_flat[97]} {core/pc_log_flat[98]} {core/pc_log_flat[99]} {core/pc_log_flat[100]} {core/pc_log_flat[101]} {core/pc_log_flat[102]} {core/pc_log_flat[103]} {core/pc_log_flat[104]} {core/pc_log_flat[105]} {core/pc_log_flat[106]} {core/pc_log_flat[107]} {core/pc_log_flat[108]} {core/pc_log_flat[109]} {core/pc_log_flat[110]} {core/pc_log_flat[111]} {core/pc_log_flat[112]} {core/pc_log_flat[113]} {core/pc_log_flat[114]} {core/pc_log_flat[115]} {core/pc_log_flat[116]} {core/pc_log_flat[117]} {core/pc_log_flat[118]} {core/pc_log_flat[119]} {core/pc_log_flat[120]} {core/pc_log_flat[121]} {core/pc_log_flat[122]} {core/pc_log_flat[123]} {core/pc_log_flat[124]} {core/pc_log_flat[125]} {core/pc_log_flat[126]} {core/pc_log_flat[127]} {core/pc_log_flat[128]} {core/pc_log_flat[129]} {core/pc_log_flat[130]} {core/pc_log_flat[131]} {core/pc_log_flat[132]} {core/pc_log_flat[133]} {core/pc_log_flat[134]} {core/pc_log_flat[135]} {core/pc_log_flat[136]} {core/pc_log_flat[137]} {core/pc_log_flat[138]} {core/pc_log_flat[139]} {core/pc_log_flat[140]} {core/pc_log_flat[141]} {core/pc_log_flat[142]} {core/pc_log_flat[143]} {core/pc_log_flat[144]} {core/pc_log_flat[145]} {core/pc_log_flat[146]} {core/pc_log_flat[147]} {core/pc_log_flat[148]} {core/pc_log_flat[149]} {core/pc_log_flat[150]} {core/pc_log_flat[151]} {core/pc_log_flat[152]} {core/pc_log_flat[153]} {core/pc_log_flat[154]} {core/pc_log_flat[155]} {core/pc_log_flat[156]} {core/pc_log_flat[157]} {core/pc_log_flat[158]} {core/pc_log_flat[159]} {core/pc_log_flat[160]} {core/pc_log_flat[161]} {core/pc_log_flat[162]} {core/pc_log_flat[163]} {core/pc_log_flat[164]} {core/pc_log_flat[165]} {core/pc_log_flat[166]} {core/pc_log_flat[167]} {core/pc_log_flat[168]} {core/pc_log_flat[169]} {core/pc_log_flat[170]} {core/pc_log_flat[171]} {core/pc_log_flat[172]} {core/pc_log_flat[173]} {core/pc_log_flat[174]} {core/pc_log_flat[175]} {core/pc_log_flat[176]} {core/pc_log_flat[177]} {core/pc_log_flat[178]} {core/pc_log_flat[179]} {core/pc_log_flat[180]} {core/pc_log_flat[181]} {core/pc_log_flat[182]} {core/pc_log_flat[183]} {core/pc_log_flat[184]} {core/pc_log_flat[185]} {core/pc_log_flat[186]} {core/pc_log_flat[187]} {core/pc_log_flat[188]} {core/pc_log_flat[189]} {core/pc_log_flat[190]} {core/pc_log_flat[191]} {core/pc_log_flat[192]} {core/pc_log_flat[193]} {core/pc_log_flat[194]} {core/pc_log_flat[195]} {core/pc_log_flat[196]} {core/pc_log_flat[197]} {core/pc_log_flat[198]} {core/pc_log_flat[199]} {core/pc_log_flat[200]} {core/pc_log_flat[201]} {core/pc_log_flat[202]} {core/pc_log_flat[203]} {core/pc_log_flat[204]} {core/pc_log_flat[205]} {core/pc_log_flat[206]} {core/pc_log_flat[207]} {core/pc_log_flat[208]} {core/pc_log_flat[209]} {core/pc_log_flat[210]} {core/pc_log_flat[211]} {core/pc_log_flat[212]} {core/pc_log_flat[213]} {core/pc_log_flat[214]} {core/pc_log_flat[215]} {core/pc_log_flat[216]} {core/pc_log_flat[217]} {core/pc_log_flat[218]} {core/pc_log_flat[219]} {core/pc_log_flat[220]} {core/pc_log_flat[221]} {core/pc_log_flat[222]} {core/pc_log_flat[223]} {core/pc_log_flat[224]} {core/pc_log_flat[225]} {core/pc_log_flat[226]} {core/pc_log_flat[227]} {core/pc_log_flat[228]} {core/pc_log_flat[229]} {core/pc_log_flat[230]} {core/pc_log_flat[231]} {core/pc_log_flat[232]} {core/pc_log_flat[233]} {core/pc_log_flat[234]} {core/pc_log_flat[235]} {core/pc_log_flat[236]} {core/pc_log_flat[237]} {core/pc_log_flat[238]} {core/pc_log_flat[239]} {core/pc_log_flat[240]} {core/pc_log_flat[241]} {core/pc_log_flat[242]} {core/pc_log_flat[243]} {core/pc_log_flat[244]} {core/pc_log_flat[245]} {core/pc_log_flat[246]} {core/pc_log_flat[247]} {core/pc_log_flat[248]} {core/pc_log_flat[249]} {core/pc_log_flat[250]} {core/pc_log_flat[251]} {core/pc_log_flat[252]} {core/pc_log_flat[253]} {core/pc_log_flat[254]} {core/pc_log_flat[255]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 32 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {core/pc_dbg[0]} {core/pc_dbg[1]} {core/pc_dbg[2]} {core/pc_dbg[3]} {core/pc_dbg[4]} {core/pc_dbg[5]} {core/pc_dbg[6]} {core/pc_dbg[7]} {core/pc_dbg[8]} {core/pc_dbg[9]} {core/pc_dbg[10]} {core/pc_dbg[11]} {core/pc_dbg[12]} {core/pc_dbg[13]} {core/pc_dbg[14]} {core/pc_dbg[15]} {core/pc_dbg[16]} {core/pc_dbg[17]} {core/pc_dbg[18]} {core/pc_dbg[19]} {core/pc_dbg[20]} {core/pc_dbg[21]} {core/pc_dbg[22]} {core/pc_dbg[23]} {core/pc_dbg[24]} {core/pc_dbg[25]} {core/pc_dbg[26]} {core/pc_dbg[27]} {core/pc_dbg[28]} {core/pc_dbg[29]} {core/pc_dbg[30]} {core/pc_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 4 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {core/pc_log_wr_ptr[0]} {core/pc_log_wr_ptr[1]} {core/pc_log_wr_ptr[2]} {core/pc_log_wr_ptr[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 32 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {read_data_from_DDR_dbg[0]} {read_data_from_DDR_dbg[1]} {read_data_from_DDR_dbg[2]} {read_data_from_DDR_dbg[3]} {read_data_from_DDR_dbg[4]} {read_data_from_DDR_dbg[5]} {read_data_from_DDR_dbg[6]} {read_data_from_DDR_dbg[7]} {read_data_from_DDR_dbg[8]} {read_data_from_DDR_dbg[9]} {read_data_from_DDR_dbg[10]} {read_data_from_DDR_dbg[11]} {read_data_from_DDR_dbg[12]} {read_data_from_DDR_dbg[13]} {read_data_from_DDR_dbg[14]} {read_data_from_DDR_dbg[15]} {read_data_from_DDR_dbg[16]} {read_data_from_DDR_dbg[17]} {read_data_from_DDR_dbg[18]} {read_data_from_DDR_dbg[19]} {read_data_from_DDR_dbg[20]} {read_data_from_DDR_dbg[21]} {read_data_from_DDR_dbg[22]} {read_data_from_DDR_dbg[23]} {read_data_from_DDR_dbg[24]} {read_data_from_DDR_dbg[25]} {read_data_from_DDR_dbg[26]} {read_data_from_DDR_dbg[27]} {read_data_from_DDR_dbg[28]} {read_data_from_DDR_dbg[29]} {read_data_from_DDR_dbg[30]} {read_data_from_DDR_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 32 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {data_write_addr_DDR_dbg[0]} {data_write_addr_DDR_dbg[1]} {data_write_addr_DDR_dbg[2]} {data_write_addr_DDR_dbg[3]} {data_write_addr_DDR_dbg[4]} {data_write_addr_DDR_dbg[5]} {data_write_addr_DDR_dbg[6]} {data_write_addr_DDR_dbg[7]} {data_write_addr_DDR_dbg[8]} {data_write_addr_DDR_dbg[9]} {data_write_addr_DDR_dbg[10]} {data_write_addr_DDR_dbg[11]} {data_write_addr_DDR_dbg[12]} {data_write_addr_DDR_dbg[13]} {data_write_addr_DDR_dbg[14]} {data_write_addr_DDR_dbg[15]} {data_write_addr_DDR_dbg[16]} {data_write_addr_DDR_dbg[17]} {data_write_addr_DDR_dbg[18]} {data_write_addr_DDR_dbg[19]} {data_write_addr_DDR_dbg[20]} {data_write_addr_DDR_dbg[21]} {data_write_addr_DDR_dbg[22]} {data_write_addr_DDR_dbg[23]} {data_write_addr_DDR_dbg[24]} {data_write_addr_DDR_dbg[25]} {data_write_addr_DDR_dbg[26]} {data_write_addr_DDR_dbg[27]} {data_write_addr_DDR_dbg[28]} {data_write_addr_DDR_dbg[29]} {data_write_addr_DDR_dbg[30]} {data_write_addr_DDR_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {data_write_data_DDR_dbg[0]} {data_write_data_DDR_dbg[1]} {data_write_data_DDR_dbg[2]} {data_write_data_DDR_dbg[3]} {data_write_data_DDR_dbg[4]} {data_write_data_DDR_dbg[5]} {data_write_data_DDR_dbg[6]} {data_write_data_DDR_dbg[7]} {data_write_data_DDR_dbg[8]} {data_write_data_DDR_dbg[9]} {data_write_data_DDR_dbg[10]} {data_write_data_DDR_dbg[11]} {data_write_data_DDR_dbg[12]} {data_write_data_DDR_dbg[13]} {data_write_data_DDR_dbg[14]} {data_write_data_DDR_dbg[15]} {data_write_data_DDR_dbg[16]} {data_write_data_DDR_dbg[17]} {data_write_data_DDR_dbg[18]} {data_write_data_DDR_dbg[19]} {data_write_data_DDR_dbg[20]} {data_write_data_DDR_dbg[21]} {data_write_data_DDR_dbg[22]} {data_write_data_DDR_dbg[23]} {data_write_data_DDR_dbg[24]} {data_write_data_DDR_dbg[25]} {data_write_data_DDR_dbg[26]} {data_write_data_DDR_dbg[27]} {data_write_data_DDR_dbg[28]} {data_write_data_DDR_dbg[29]} {data_write_data_DDR_dbg[30]} {data_write_data_DDR_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 32 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list {ddr_read_count_dbg[0]} {ddr_read_count_dbg[1]} {ddr_read_count_dbg[2]} {ddr_read_count_dbg[3]} {ddr_read_count_dbg[4]} {ddr_read_count_dbg[5]} {ddr_read_count_dbg[6]} {ddr_read_count_dbg[7]} {ddr_read_count_dbg[8]} {ddr_read_count_dbg[9]} {ddr_read_count_dbg[10]} {ddr_read_count_dbg[11]} {ddr_read_count_dbg[12]} {ddr_read_count_dbg[13]} {ddr_read_count_dbg[14]} {ddr_read_count_dbg[15]} {ddr_read_count_dbg[16]} {ddr_read_count_dbg[17]} {ddr_read_count_dbg[18]} {ddr_read_count_dbg[19]} {ddr_read_count_dbg[20]} {ddr_read_count_dbg[21]} {ddr_read_count_dbg[22]} {ddr_read_count_dbg[23]} {ddr_read_count_dbg[24]} {ddr_read_count_dbg[25]} {ddr_read_count_dbg[26]} {ddr_read_count_dbg[27]} {ddr_read_count_dbg[28]} {ddr_read_count_dbg[29]} {ddr_read_count_dbg[30]} {ddr_read_count_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 32 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list {data_read_addr_DDR_dbg[0]} {data_read_addr_DDR_dbg[1]} {data_read_addr_DDR_dbg[2]} {data_read_addr_DDR_dbg[3]} {data_read_addr_DDR_dbg[4]} {data_read_addr_DDR_dbg[5]} {data_read_addr_DDR_dbg[6]} {data_read_addr_DDR_dbg[7]} {data_read_addr_DDR_dbg[8]} {data_read_addr_DDR_dbg[9]} {data_read_addr_DDR_dbg[10]} {data_read_addr_DDR_dbg[11]} {data_read_addr_DDR_dbg[12]} {data_read_addr_DDR_dbg[13]} {data_read_addr_DDR_dbg[14]} {data_read_addr_DDR_dbg[15]} {data_read_addr_DDR_dbg[16]} {data_read_addr_DDR_dbg[17]} {data_read_addr_DDR_dbg[18]} {data_read_addr_DDR_dbg[19]} {data_read_addr_DDR_dbg[20]} {data_read_addr_DDR_dbg[21]} {data_read_addr_DDR_dbg[22]} {data_read_addr_DDR_dbg[23]} {data_read_addr_DDR_dbg[24]} {data_read_addr_DDR_dbg[25]} {data_read_addr_DDR_dbg[26]} {data_read_addr_DDR_dbg[27]} {data_read_addr_DDR_dbg[28]} {data_read_addr_DDR_dbg[29]} {data_read_addr_DDR_dbg[30]} {data_read_addr_DDR_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 32 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list {ddr_write_count_dbg[0]} {ddr_write_count_dbg[1]} {ddr_write_count_dbg[2]} {ddr_write_count_dbg[3]} {ddr_write_count_dbg[4]} {ddr_write_count_dbg[5]} {ddr_write_count_dbg[6]} {ddr_write_count_dbg[7]} {ddr_write_count_dbg[8]} {ddr_write_count_dbg[9]} {ddr_write_count_dbg[10]} {ddr_write_count_dbg[11]} {ddr_write_count_dbg[12]} {ddr_write_count_dbg[13]} {ddr_write_count_dbg[14]} {ddr_write_count_dbg[15]} {ddr_write_count_dbg[16]} {ddr_write_count_dbg[17]} {ddr_write_count_dbg[18]} {ddr_write_count_dbg[19]} {ddr_write_count_dbg[20]} {ddr_write_count_dbg[21]} {ddr_write_count_dbg[22]} {ddr_write_count_dbg[23]} {ddr_write_count_dbg[24]} {ddr_write_count_dbg[25]} {ddr_write_count_dbg[26]} {ddr_write_count_dbg[27]} {ddr_write_count_dbg[28]} {ddr_write_count_dbg[29]} {ddr_write_count_dbg[30]} {ddr_write_count_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe14]
set_property port_width 8 [get_debug_ports u_ila_0/probe14]
connect_debug_port u_ila_0/probe14 [get_nets [list {uart_tx_data_dbg[0]} {uart_tx_data_dbg[1]} {uart_tx_data_dbg[2]} {uart_tx_data_dbg[3]} {uart_tx_data_dbg[4]} {uart_tx_data_dbg[5]} {uart_tx_data_dbg[6]} {uart_tx_data_dbg[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe15]
set_property port_width 4 [get_debug_ports u_ila_0/probe15]
connect_debug_port u_ila_0/probe15 [get_nets [list {uart_log_wr_ptr[0]} {uart_log_wr_ptr[1]} {uart_log_wr_ptr[2]} {uart_log_wr_ptr[3]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe16]
set_property port_width 32 [get_debug_ports u_ila_0/probe16]
connect_debug_port u_ila_0/probe16 [get_nets [list {uart_counter_dbg[0]} {uart_counter_dbg[1]} {uart_counter_dbg[2]} {uart_counter_dbg[3]} {uart_counter_dbg[4]} {uart_counter_dbg[5]} {uart_counter_dbg[6]} {uart_counter_dbg[7]} {uart_counter_dbg[8]} {uart_counter_dbg[9]} {uart_counter_dbg[10]} {uart_counter_dbg[11]} {uart_counter_dbg[12]} {uart_counter_dbg[13]} {uart_counter_dbg[14]} {uart_counter_dbg[15]} {uart_counter_dbg[16]} {uart_counter_dbg[17]} {uart_counter_dbg[18]} {uart_counter_dbg[19]} {uart_counter_dbg[20]} {uart_counter_dbg[21]} {uart_counter_dbg[22]} {uart_counter_dbg[23]} {uart_counter_dbg[24]} {uart_counter_dbg[25]} {uart_counter_dbg[26]} {uart_counter_dbg[27]} {uart_counter_dbg[28]} {uart_counter_dbg[29]} {uart_counter_dbg[30]} {uart_counter_dbg[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe17]
set_property port_width 128 [get_debug_ports u_ila_0/probe17]
connect_debug_port u_ila_0/probe17 [get_nets [list {uart_log_flat[0]} {uart_log_flat[1]} {uart_log_flat[2]} {uart_log_flat[3]} {uart_log_flat[4]} {uart_log_flat[5]} {uart_log_flat[6]} {uart_log_flat[7]} {uart_log_flat[8]} {uart_log_flat[9]} {uart_log_flat[10]} {uart_log_flat[11]} {uart_log_flat[12]} {uart_log_flat[13]} {uart_log_flat[14]} {uart_log_flat[15]} {uart_log_flat[16]} {uart_log_flat[17]} {uart_log_flat[18]} {uart_log_flat[19]} {uart_log_flat[20]} {uart_log_flat[21]} {uart_log_flat[22]} {uart_log_flat[23]} {uart_log_flat[24]} {uart_log_flat[25]} {uart_log_flat[26]} {uart_log_flat[27]} {uart_log_flat[28]} {uart_log_flat[29]} {uart_log_flat[30]} {uart_log_flat[31]} {uart_log_flat[32]} {uart_log_flat[33]} {uart_log_flat[34]} {uart_log_flat[35]} {uart_log_flat[36]} {uart_log_flat[37]} {uart_log_flat[38]} {uart_log_flat[39]} {uart_log_flat[40]} {uart_log_flat[41]} {uart_log_flat[42]} {uart_log_flat[43]} {uart_log_flat[44]} {uart_log_flat[45]} {uart_log_flat[46]} {uart_log_flat[47]} {uart_log_flat[48]} {uart_log_flat[49]} {uart_log_flat[50]} {uart_log_flat[51]} {uart_log_flat[52]} {uart_log_flat[53]} {uart_log_flat[54]} {uart_log_flat[55]} {uart_log_flat[56]} {uart_log_flat[57]} {uart_log_flat[58]} {uart_log_flat[59]} {uart_log_flat[60]} {uart_log_flat[61]} {uart_log_flat[62]} {uart_log_flat[63]} {uart_log_flat[64]} {uart_log_flat[65]} {uart_log_flat[66]} {uart_log_flat[67]} {uart_log_flat[68]} {uart_log_flat[69]} {uart_log_flat[70]} {uart_log_flat[71]} {uart_log_flat[72]} {uart_log_flat[73]} {uart_log_flat[74]} {uart_log_flat[75]} {uart_log_flat[76]} {uart_log_flat[77]} {uart_log_flat[78]} {uart_log_flat[79]} {uart_log_flat[80]} {uart_log_flat[81]} {uart_log_flat[82]} {uart_log_flat[83]} {uart_log_flat[84]} {uart_log_flat[85]} {uart_log_flat[86]} {uart_log_flat[87]} {uart_log_flat[88]} {uart_log_flat[89]} {uart_log_flat[90]} {uart_log_flat[91]} {uart_log_flat[92]} {uart_log_flat[93]} {uart_log_flat[94]} {uart_log_flat[95]} {uart_log_flat[96]} {uart_log_flat[97]} {uart_log_flat[98]} {uart_log_flat[99]} {uart_log_flat[100]} {uart_log_flat[101]} {uart_log_flat[102]} {uart_log_flat[103]} {uart_log_flat[104]} {uart_log_flat[105]} {uart_log_flat[106]} {uart_log_flat[107]} {uart_log_flat[108]} {uart_log_flat[109]} {uart_log_flat[110]} {uart_log_flat[111]} {uart_log_flat[112]} {uart_log_flat[113]} {uart_log_flat[114]} {uart_log_flat[115]} {uart_log_flat[116]} {uart_log_flat[117]} {uart_log_flat[118]} {uart_log_flat[119]} {uart_log_flat[120]} {uart_log_flat[121]} {uart_log_flat[122]} {uart_log_flat[123]} {uart_log_flat[124]} {uart_log_flat[125]} {uart_log_flat[126]} {uart_log_flat[127]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe18]
set_property port_width 1 [get_debug_ports u_ila_0/probe18]
connect_debug_port u_ila_0/probe18 [get_nets [list cpu_data_read_ready_DDR_dbg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe19]
set_property port_width 1 [get_debug_ports u_ila_0/probe19]
connect_debug_port u_ila_0/probe19 [get_nets [list data_mem_data_valid_DDR_dbg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe20]
set_property port_width 1 [get_debug_ports u_ila_0/probe20]
connect_debug_port u_ila_0/probe20 [get_nets [list data_mem_req_ready_DDR_dbg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe21]
set_property port_width 1 [get_debug_ports u_ila_0/probe21]
connect_debug_port u_ila_0/probe21 [get_nets [list data_write_enable_DDR_dbg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe22]
set_property port_width 1 [get_debug_ports u_ila_0/probe22]
connect_debug_port u_ila_0/probe22 [get_nets [list core/pc_log_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe23]
set_property port_width 1 [get_debug_ports u_ila_0/probe23]
connect_debug_port u_ila_0/probe23 [get_nets [list rstn_synced]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe24]
set_property port_width 1 [get_debug_ports u_ila_0/probe24]
connect_debug_port u_ila_0/probe24 [get_nets [list uart_log_full]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe25]
set_property port_width 1 [get_debug_ports u_ila_0/probe25]
connect_debug_port u_ila_0/probe25 [get_nets [list uart_tx_ready_dbg]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe26]
set_property port_width 1 [get_debug_ports u_ila_0/probe26]
connect_debug_port u_ila_0/probe26 [get_nets [list uart_tx_valid_dbg]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets cpu_clk]
