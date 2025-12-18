// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:31:24 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0_fdiv -prefix
//               blk_mem_gen_0_fdiv_ blk_mem_gen_0_fdiv_sim_netlist.v
// Design      : blk_mem_gen_0_fdiv
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0_fdiv,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0_fdiv
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [35:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [35:0]douta;
  wire ena;
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
  wire [35:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [35:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.6924 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0_fdiv.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0_fdiv.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "36" *) 
  (* C_READ_WIDTH_B = "36" *) 
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
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "36" *) 
  (* C_WRITE_WIDTH_B = "36" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_fdiv_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[35:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[35:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27088)
`pragma protect data_block
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
6dwPSrTrvlYBND11gw==
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
