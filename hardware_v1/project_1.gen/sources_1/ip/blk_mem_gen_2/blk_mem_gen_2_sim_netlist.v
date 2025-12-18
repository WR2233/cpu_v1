// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:35:56 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_2 -prefix
//               blk_mem_gen_2_ blk_mem_gen_2_sim_netlist.v
// Design      : blk_mem_gen_2
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_2,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_2
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
  (* C_INIT_FILE = "blk_mem_gen_2.mem" *) 
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
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
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
  blk_mem_gen_2_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 38640)
`pragma protect data_block
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
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
