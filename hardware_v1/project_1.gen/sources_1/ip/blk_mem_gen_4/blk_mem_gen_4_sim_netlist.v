// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:36:39 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_4 -prefix
//               blk_mem_gen_4_ blk_mem_gen_4_sim_netlist.v
// Design      : blk_mem_gen_4
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_4,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_4
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.2129 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_4.mem" *) 
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
  (* C_WRITE_WIDTH_A = "1" *) 
  (* C_WRITE_WIDTH_B = "1" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_4_blk_mem_gen_v8_4_4 U0
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19184)
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
