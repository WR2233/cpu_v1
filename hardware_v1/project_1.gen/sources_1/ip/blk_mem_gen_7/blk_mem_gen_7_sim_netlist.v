// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:37:03 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_7 -prefix
//               blk_mem_gen_7_ blk_mem_gen_5_sim_netlist.v
// Design      : blk_mem_gen_5
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_5,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_7
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [11:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [11:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [0:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [11:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [11:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [11:0]doutb;

  wire [11:0]addra;
  wire [11:0]addrb;
  wire clka;
  wire clkb;
  wire [11:0]dina;
  wire [11:0]dinb;
  wire [11:0]douta;
  wire [11:0]doutb;
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
  wire [11:0]NLW_U0_s_axi_rdata_UNCONNECTED;
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     7.645999 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_5.mem" *) 
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
  (* C_READ_WIDTH_A = "12" *) 
  (* C_READ_WIDTH_B = "12" *) 
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
  (* C_WRITE_WIDTH_A = "12" *) 
  (* C_WRITE_WIDTH_B = "12" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_7_blk_mem_gen_v8_4_4 U0
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
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[11:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 38816)
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
