// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:31:24 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0_finv -prefix
//               blk_mem_gen_0_finv_ blk_mem_gen_0_fdiv_sim_netlist.v
// Design      : blk_mem_gen_0_fdiv
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0_fdiv,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0_finv
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
  blk_mem_gen_0_finv_blk_mem_gen_v8_4_4 U0
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
nGFlHDICUTacn7zTXA==
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
