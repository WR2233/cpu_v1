// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:31:48 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0 -prefix
//               blk_mem_gen_0_ blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    enb,
    web,
    addrb,
    dinb,
    doutb);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [0:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [11:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [12:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [12:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [12:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [12:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [12:0]dina;
  wire [12:0]dinb;
  wire [12:0]douta;
  wire [12:0]doutb;
  wire ena;
  wire enb;
  wire [0:0]wea;
  wire [0:0]web;
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
  wire [11:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [11:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [12:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_COUNT_36K_BRAM = "1" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     7.700399 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "4096" *) 
  (* C_READ_DEPTH_B = "4096" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "13" *) 
  (* C_READ_WIDTH_B = "13" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "NONE" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "4096" *) 
  (* C_WRITE_DEPTH_B = "4096" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "13" *) 
  (* C_WRITE_WIDTH_B = "13" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb(addrb),
        .clka(clka),
        .clkb(clkb),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[12:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 38656)
`pragma protect data_block
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
EGwFhzbXZny9iA==
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
