// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:39:23 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_9 -prefix
//               blk_mem_gen_9_ blk_mem_gen_9_sim_netlist.v
// Design      : blk_mem_gen_9
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_9,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_9
   (clka,
    ena,
    wea,
    addra,
    dina,
    clkb,
    enb,
    addrb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [0:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [0:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [0:0]dina;
  wire [0:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [0:0]NLW_U0_douta_UNCONNECTED;
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [0:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "12" *) 
  (* C_ADDRB_WIDTH = "12" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "1" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.0694 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "1" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_9.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "1" *) 
  (* C_READ_WIDTH_B = "1" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "NO_CHANGE" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "1" *) 
  (* C_WRITE_WIDTH_B = "1" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_9_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(1'b0),
        .douta(NLW_U0_douta_UNCONNECTED[0]),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[11:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[11:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata(1'b0),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2020.2"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
QGLtnqZzRetDH6gCWT4Js6wuLlZfrNx/VJp3sfR2NF+cxypO5AxN0oDKLJJtmdrtE/ueNDg+Qf7Z
TqBNRojORA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
B6Ger3hRvfjHkaJ+W8639Kl3TzC9TogLuklOXEiMNdc4Im+DjEUzxb3DKlzu0VW3zxZqjJ3+wsW/
LnRmPCESi5Y9eRJaLFXg79EMfoj4X+nTdHAP6yCfltBADKegZ12gpnB/8ey5yn2KA74LUtPC7jna
iyjqSfsWLGnz6UdXzwk=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
BX+DxgMPRyZbYojCUR9Sk8Lq+3ZigBz4yMFHQkmurfdfDzyTPJCE827eGiPyTenK1QPVhEtf9g06
0BFXq/0COPuU1BWJwdkz1c4dE6/exDwhvEh+hPx3vRY6z8fDEf6aGVIXrHDvrmddehe7yMSIpo+k
aXHR06EEdfHCFY4TggYwhcJVXjkE+ApsVuyfmEfPmYjo8hCWyQyBsUWIOY03q1+MvUjjsmTwgs9g
fh5MY9ToaLfoJxPKdCpsqrBX4LJ+VDGFlAqIcqHTE2jCmPiToZAFXB7fzf1wDjFCBlJyFVDBGi0i
m+CouLSb7X1mvVhdDZgNrZDJMV688Bu3o54vew==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
DaIU/Ddc8USbZ2mURzujJDWDH1JbHl5tFVOOQ2aVaUPIA71yyE38OXVLEtF8rNmujYH30nEeQ+FV
LVJ16aaHw+iiuaqorTM3K5KLohVlN+WlcEtSXHuPNHjw8ddqtzpaX7pH1zqZH+YmfCL5oaNLqDH4
rkBnUl0/Gm/hzSwKjYhXGQFYQ+gGP99OjXakzrAqZzp/Iq4gt+Z5902/JV9thd/isHQImJ0QyK8M
EKM579iPAfXGes2mbiNYHcvDmSPYmW1zlhOE++N1EKeea7j/msnKeyhlC+hGE4Xfn4TVvqgQexCT
rp/wS/MosY6WH1aKFQlFH2hEppA7KXUaQlvG+w==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
XmWoAt4X8hrCJ5yTyug4ajJW5UhfkLNibzjihWzZ4Cr9hQSvWZoTc8rjGsLPbz6Le+/9iI5KxecS
eR0wiAO+G2IkwhZgVBeZdKoFnlnTVAyLjk9wMAFXNyJZM6b1NDbfXlPcUsC6JePvPlwwdWknkSsC
r3KvgkWAS+O3xvRmaNw=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Hw3Y+rShKrXiUViyNU1/O2qv6TgheLHBnFMj1i9MUGrHYqh9pLfLYUgWR7S2vj4jv4S+Ks0BpP4p
dKEqVAFmTCfQNEUHaVcFPkOHgig6L4mhLY6HUUKJoRgiQepgLi/W3V+ZZPQSQFkB3CU4MsJzhXvR
yLcpDriZy8cnAHD87Zi5DrNGBzj3kigJeM0du6lCQbxtF5aEdoaNP+YTnIFtcqYhoYnswQlYt0sV
HKgFA8VzqzL5WYnpH7+1IKmFkJBHkyqHCa9wPK0qCKnxkuDj70YzPVqQ+cocdKU+/gNdpCOdZlci
F2HTxrgfrXndJru3TiDqu4UavqAe0MNuFp3t0w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XPVggoWL6aXz+MpODTOZhEUQDa0vfEnUDaYeEHXm2vGyqKJujN2c/FFAFBeBYdJATLsIsQ+BqoPc
pBbcFYXDBfOtFIW2dH6Y1OoD65KyJ/hAq8coa21kFgq4hFat5vzZ2iIfkCpTUr4vDZO7Xne8cZO9
WsHffoTCt5rS59wWm2b8I5R8Eh2TUbQg3RCyrcnD66cvcEnlXe1CNMQ4/loVJpA4IBinBf820Wjc
vw2fZbGI0jXC+ACSHOviH63Xwmn+aRV5Ppkup7IYoon/ieKapRQeASu3TTY37xSBXiInSdtMTzJ6
+4GfO4eSHVriCk/sWbuTBzfRzoSShrnHjzz5LA==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2020_08", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L78XuiswVcgO2gtebzL7SA9BC/jJGAM0v6S9pzmyqL+QYzRneiYeGyDmsW33jEVVSTuNjTXkBLY7
yTOKQruatwe4V0OLi6174saSAmPgerSV1GyLP7KhmusLV/N61avC9TPam+tekhKeE0tds4EnJ3et
4JdLh+SE4Z4pcuqCjB5MFneIYKKWDx7siU6oesAQtoSJOesfMchX63MhOjOHFP/ch+1gHv3T45hg
IGF7V7TrdREVE4f9631tlVJ1o2Dypsmo/76Itz5WCGlTMjAnWXN8IXxKN+PZ3dyt1wjrZm2P/td+
xiGszFnSLrRvw/HferwtSmRx8q0fiHZ88roGTw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kDX5kq2QEe25429T6vQqBCFvV1McKTJRYfK99ymVNK2GGvGLXSzgwJHwB2fj9rM0wme3zYYY0vQR
x+9F4L7KLlOVY6qY3LB59uDzyXBI3mMZaS905HXHJkdZHWtQWpfHhl27LqL+8FSluaD6F+KFfYOV
CwIOVuCIp/XjxFXpNBik7YiPt4kHOlDA97IXNLnYUn/g1csGqeNWce4UTne50ggWvLYGbTFGmTjT
N67TpUiGRVRCSv8Tax72GWFIMFZk3Tlp68ZUSQEybZMWX1U9XdMdtxfvNGhf8mi5jQJ2SupSzKu4
T/+53IN9T8aLePAiGBKKG1ZBj4y1ZyYA7XYvjw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19168)
`pragma protect data_block
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
/OTqzXbpHSFG4ngw6RMMQw==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
