// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:37:03 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_5 -prefix
//               blk_mem_gen_5_ blk_mem_gen_5_sim_netlist.v
// Design      : blk_mem_gen_5
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_5,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_5
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
  blk_mem_gen_5_blk_mem_gen_v8_4_4 U0
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
