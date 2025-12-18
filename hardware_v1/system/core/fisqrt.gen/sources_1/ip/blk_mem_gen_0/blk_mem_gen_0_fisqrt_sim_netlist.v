// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Thu Dec  4 07:34:43 2025
// Host        : DESKTOP-P7MFFPS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_0_fisqrt -prefix
//               blk_mem_gen_0_fisqrt_ blk_mem_gen_0_fisqrt_sim_netlist.v
// Design      : blk_mem_gen_0_fisqrt
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0_fisqrt,blk_mem_gen_v8_4_4,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0_fisqrt
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [10:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [35:0]douta;

  wire [10:0]addra;
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
  wire [10:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [10:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [35:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "11" *) 
  (* C_ADDRB_WIDTH = "11" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     4.9543 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0_fisqrt.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_0_fisqrt.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
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
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "36" *) 
  (* C_WRITE_WIDTH_B = "36" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_fisqrt_blk_mem_gen_v8_4_4 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[10:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[10:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 44736)
`pragma protect data_block
az/OVxF1iNnjgE0Ue2Kmt26024IJ6Xq26G5CcTyc/vkAE4h6z9SmoLE0zJI9EAhPvAqBRT4ZGZR/
42GEe6T9CiDO2TUJSKHGb3GSStpPis5Ww7rByaWUHWLkWLcdwHf5IYUdDGqmUTZ8P8eOa9Cj7jhQ
cOh3jN/ekQN+tTFisFFCZCIuA6t8QELt9ly5XdHOJbsLBnDfGCEOwmIyBr88sUBWdHJAyNabapb2
Q4VgEBUSkmjQvNHVkUmtIw0fJBHL9gtbbv+QKHDDoT2ucRuBrzq2FeyXwA6VG2seUHnurtl7t5Tp
P+PmdeaUNrlVn99fkwEW5NYY66rJh8MLwCKE0Azj7vSUKxzPu9co+Q8BuX3c+6Gv/8HxD7W98TsC
mVfU6Q6hcVF0C3rYD/Kl/5MZS4Xjuvd2z22lmQwvQ4i3ex5YwNN/+Cm+lb03a1t5OfqOYW5YR8/v
Qn61TK1SHitOUH8z7HgGiCiQU/2zkNxnb9bqUCW/slvtPxadZ/L4xg6zT+sOCgBdnk3vjytirEIE
pqjEa7vBqDehErcguy2QT5329L3g8e99BBHRuaMTSizVuTZF9RbvBM0QRDmdv5qe1+flSEY3p2w0
uzPKO7KPkgtmb68FeGrGTXZB5nOdhmnOy22QZrtbVTfDWrampDIJGZey/aUD2AjFaXwcDH2la4tQ
BHijkURbzKJBM+Nbi/ft2kTdPusrONv5JNRjXBL7D0rl1keawPmSQpioGx6deQFRqfJV4tWcDtJN
bldeRvrCPe7npsLST5hBTrxQxhpui9MZ6JQ8oIx2Pxt+yGP/AhLybcIVKtSUnbDGbU8lXseZE6/Y
n0EPXO9MLw4hBIokBO7MnXab3Od0YAWdPKW5z3dx5ziflY+0w1Z/HQY7IL6kdlM79KPE1hDdv5gV
bAAPcVs8thTrygvwv5ugaO0KOrfh6l52//XuNoCCLipSPfDbnVEcrdCWqXY8nRDQq9IWa7wtcapV
YypHV3132H4qjteL+bT2EJlbOg41Y6kYSuQ/7COkWVPgNBqF7cBQ70sawI9/beh5T89fY4RWdhr4
naGrbSA7Wrc8Gol7rbaYbqL9fGcgYuHYrETeNK8d46fahHT6j71pPHZNgaej3L0f8dxi3QnDPC7j
PWHOLDLw+sLKaNno/6KAvbJtBgDmn36nn+LNiZ+obsi1iGgR6Z/oYV5swR38RLMLwBgCzq2LCwvd
7dy7lHyuiGK2ETMwvT+SiUDND8rppq5EWek+r0vUMra/4u0dPmluztSSoWPlPPlv/U1JBD7Q3yY2
s9jS0TX9QjJzwLm0XvdKjZPKzYsp/Gpabq5Gtrn8RzO74KA1SRVEdO7vklA4eOJAKPZ//KVDS7hG
RUUOnS5e3dPd32sLxZnFnVeP1Ioxp+rp29/mznCi7iBzQiJH1Vx2v6CQIiqQPhJ7eDqrTBhY3+/r
OT04E03yFmzYDbB+ikzIX+QHWSpIHfzpS8IeNkY/AwR72mOl8mcSLtDlPyyzPJyJeulZhLhhv+Zp
67jo2IjwW13Zin6K8N8anV6H+FjyayJ5fTj0JAxh/Hz8NfjS3iJNtNXrAqggSLYqEqV5zf7Zm1YX
6v3NeUsa9W+yXSPvP+qW+ZU2EvK864Ksl4JJS3p8t4QUNY1G4fpwyE2u/h+pB+R3ihcr4ecsL3/u
CNGnvYfufauIQV5+s2UdRo4bSVZOOpFvPLPhLFSTKnTbCGGOMOkEvscAykMiP87ZEK8eys7ptzSE
tB8fYo2D6Aklw689I7+GQqCxlkkaIPVsz+0/l5bBtJOqKUK1R7hbdu9GquVGIBRCCJ7/78zNPV/C
TI7kUqY/ShBIJTGUSN9jO4NHxJGz7MMMANHf+EC87tGl+XVXLw1sh/gcCA4K0A8kTDXqsYfonQLR
KPv0KiUzOMNNWY12GKDbB3x8sXe6kaCjTCBYDUceCEkJCcODTXTmZM7XN+c5gMqe1/0XKE8OJN8k
mbryABR3zF8pEnMyJpT1zJIYl/6j5SlOngBGu3drav2C6wyYy0C8kAYDLnPqHIXUPUAYbgeWposq
xRasuAl8k7//Eh/uw5Ym6WmZg1T/C84nzmZhk9+SKczJiiU9r409bXso5LIqp4pXKE4p2lNzeXwC
if0e6ex0g//o/n3PwHagtIBZ6uzD08q2cudpjkzAYJ/Zgos5zbpg5HTd+TuGF2ksT42fZitoV87v
HAxuMuYrXGjdTtO8Jre1iiNU3s8A3i68p6WtSRdu7S9wbhmRBJAxdSis3rVG8FK/2iNyoyImikQT
vXil5y88ErkAXpqK3Cyln13Yt2yf3JbRiFVH7o6WWXJWsvr3jyvipnRRA5PAfkFdBm0SszQtFyHm
DMRRyXwSG1ObOUHKAPgOWf4Q66ElXMddTa5Wp4rVMgJj06JukAdxny+hbjm19+3vSQ848xSnfCr1
55PPk0/ZoyAeN94opmi4Gsfe1bgCN/Iz1zytmnpThhZXPvrdfwYW7iOSvAsv4BowpryOEztBhZ4f
USS1FbajSOH8UC4Uemc5v2PHa7+9k+nOgQux4qvXklrxRcBtkVKf/YxbAGgGWsaRFcOh+DCjGUv1
OeHDmCnEYZGxbc/xDrhyfOADI16Za2VzQz0hhjCBJ/REZu03fic1ufsLgnglEpsL8HDafKO6NaEk
YguMG0F+NuQP0JTqwJOy+kQmz0D22sINghJReP1u6MIyTtVj3V/LCj1w+zbvXYqx3AqTKNm5XgSH
j46pCgz43FTzNbhRNuW1v3tcmjKeYrW9iIPy7GqdUlFrawbzYC4iPskKH8Ej9jQRrp/i9IOsoRjp
qmqNOGIa3UAg/bLN66su/iAJ2ovnw9JtPJFJRM40/skWL6UyBiRkCLUdt/GUlDAcH/2dWc5nFt6F
m3QZrm+ymUIbRxxcDbNVYwy4MwOyzzzVK6NHREkb2djOeplJ3FvZ0T/+kinzr/6gEHGJQLPT0fJO
G9F+DrvUOn2NUBG4Fin9kglP4yPdubJGbIcjlymaikOgTGT89qdwqHBbi/3DMjkvSvmq3q72eH9/
dEzzagPAdzI/OEa3fPPytehBb8qMS4G1VMwCcvZ8LtVgJB44zVa06Pbie/fJ9O+SDT3u/FV87Hc8
gPk9l6kI38l+ITLaSJW5sQ4vLvrlNI5/NphYIJUAn65Wou63kmwNfeasvNwt0Fzw9HTH4+ARb9nE
bhMhg6PfS3nSth0e0Gh+cGI9X4RrM9S3HpUO0AeuX9CVrLRufPOye5Nac7LzdTlztmvMW+GtSIcF
384cSYdIpZhrf8ePmCSLsVVLsDBVL4+phPVjtVgP2nrcK6Dt1rMEq5TYHOG1ySP6mjfKtPpjn2bA
Ti6EQGZTC90ei4TlTYgk5JKCnLqmRAPZtE6Tdx6umFozcM+eoDJVfS9dgBNNf/o9zWTgo7598/qm
H46onV0BCDddKJVAiobv+jzK/MXjkSVfTJuO7me+4P3x/0bKchc8Wj4jTXDTsycXP6TSr+efqVgv
DJlaJ/jy4eqXN/YpVN6N1zs8ka6G2bowwBHzPRqXOMZu6xKkGZqgS6xaVMK1TLChFsGch8Sa8SUA
qjuZq1wKKUuAFreE//sIJP73WKWR4JrPc0cGehGv2KHN7XpaasL+j91pNbpcTfiuwq52vVoUGzSf
msgKUg7esRoUbpXssFfx8La6JFdfPgp9cl/Qy6f0k+jNdUtXU7C8ibLeSlFFomwfo6KRQuRxzLmW
uC/GXB9gm7qm/CGn11w3FpzYSQvORsO6+4fTaQKiZit9zUtP15F53g1NnkGOTLm3bJrrguab2/mL
Q2DK0Fu9ioIONXLqooNYdZZol97kCuOyBzwmf//c/n4MSwLpxPV+FcOid2YME8OvoapDVEx0Be2i
Jhnur3n7SzvRqfvjrfYPu2AAeoNvnDRGGNGHJRzQz0m9q1KGpNlxT3sDVyk3VEvKatMlYpvAk6Cy
xb5hb4MgtNrK1eNQ92dtoXApGt8kWjznyNiojANlaAdbeQkMjkOkYS0NM7uhRX3zbbmsJ/gdYVxD
lcmbAU9bJBtfVY0GfsY2c1d1Z5ogWHGCuw2pl6dlluRcwPy/0MGfPc0uzmhNUXTVb1JVZxfwXahh
z+868OaLdhJpsdiTOLjYQTi8lUFpj97jXmRK7GZJ10wBn5ZkHWMHF6AmxAiegFhWrMFacmwWWapI
DnP72Gy9mrZwxs8ssDFuAnjH0hOCjlrls16SLILcXdQ8mMLoq8uBajjiEMW5Y6OlzVBE/OJ89tfQ
5jTQiwNDNKYzwrHG07niWCPTqLc2wPotK+lqFf1E2PnRpoAuncSZQx180HSI8WqEX+Vn6Wmlchdd
gkSOi+maD2Wox0S+SXsYBey3LpOMPHDDtteLKTz7emKybQY18HrKGaU+F26XNcn1Pnu2j5/Ujptk
6f0bsnN09Ik8oBMm6v5zEsGYQyKnm6FeC5+SrLVdkktyJfOd65yX9IviOex7vE1RUXFkiXUhTSTj
kAxH63B/oQeEqnMocZHnTzJ28CcG854FP8am+H2EVRccwkA7jQGZ+vRgzRp0jYBtDlc6/+EetVio
S498IDzgsut7SOiSNSeo4lZofcGhICmg8aYystFJzHgvkI3FiXDpRZnPWvc/c/XV3IXAS5xt1z5I
GUbnrJirrCqEnTdJAJXomELgi0/TEuHTuBVv02FYdkPgMcmGvM215hu0oWaxnJJW/xU6pGcz4/HC
DC5UPjGeC/e+m7b1NYOQjKGijFFcpOquUzrDkCpImvAeuBMpBR0WYCxRiv7+oavcuU6J1d3ytsTE
RXM0iNg5f6FRKzapo8oE+2cFL+QwWsNjrJFoP8MhByMrCpvQwGnM3QeqznRmQu+bkEMk0Qzse0fu
/o7MmX2AWzL0sAGGO1uFwBywqFteZzCIul+pTAL0W7GoIatUvM6qiGHacxAjy5xvBYPD9HRtSlUg
YUZuRESKg2pzYSVAyA4syuZms/zBi0LwdZGg6cllaWIFVabodZNBbbE95kReW149PWJI3VOnpdhM
wh9ba1oMrLn585ux1lsYMalwfnVaBJ05Fr06nvwSLvLnr9bGOOdRd8XrkJFhOzQfp0Bv9mqtdMgI
LQzNQ8SOgWbKQYJXlt7iROBw/v3Z5/Ip0WcBAFpbaB8QhzMcz329sKKiFc37IiSz435UebAKika1
120kkFb9D7Lg7+KLVXUcb52u6i/5ZF/WkEwEWDaay5ikxipybIOD9q300uGIVs5W57Tpv7rv11Z+
WbQ4uLOCSVvrKTxo1tl4juWylHHy1jtVia8mUcRIGmB7n7diSp210fv2/6YT7aj3npfmgQyPyJox
/qKHkQMIupFzDrBSzplpRbyaij++bQbt0LxplkYYpxJj+jQov8QIiJrwUxXIw/zf5UxoYY8NhqqE
GdYO/bsQmtpFzIM/5bGHIVnI0fGF/PlVRa5XQO2PqbNjJBwq/GsDbXj/YqrKB/x31MKFH7nIqXtZ
Yt5tEOO5bBidxnWcQyEe2+3PGLB9DcLQBLiTpG6/iDEQH3yp/R6IyI6ma3CzDmBBkcQ2QMRQ3NX6
AW7Yl7c//ZmfmRKEJqrG5bapVxJHY6oMXYpLtbEu92yydSJh7IfTkxew2J5DV6TgDRoEVOqJMyaW
QIMwUPTfSsbIT2U4gIE3nghUMtgwe8BpCSuIr/dqFJfbmBkfESVX1jqJwqFJdYSIxOHgQl6X2iV2
QIp8wYDCQrgZa8wdSGXcCApMpSd+lT231bSV7n1m3vxP1FTOfym1Axse4gg01kkf6qPZLo/lMf5b
V9rIW+MoLTytt81uRTaSdE2X9cDzT4QH4L3nEk7irNaTcfi733YBS6TrOD8DPfsp0nXX9bYz6LlG
MrP88yhA2MIk8xVQE/lZsSiut2c4LnRZDG6XV+CWVHiYgNnPQ7Aalt/JyKPwh/zbCoXltcnKcXIz
HtzxmcPuvpwHIZgIufsoU68IZiOiWPvTZ+ad0pqbuQ1/puG4EYr4xy8p0mBUoDERc3wIWUjVKMjs
JTaI0wZZXSRiwSxdKMSK/XPfcs2Tjfy/FviRFuc7Uu9QSoCXfCKBbKL1A3QUp7fKdUFdqMrSn9TH
jyX11iNd+6y5b580Wk1VdIJD8PeF+PPd62gcYL/efPbff53tookbtvSI48PTaLkx0C1GjRHZBnY3
Jryba0hnwtd6QO6IRfXgz/uC6e/s0baCcWMzOIiu8Vz6fV4+7JOUSXvRKoctlUIKqZB2G1t7g99L
kh7XvxL171JShoTBXwcLVHcAqoSUfWTcxblYhQejWFiYePMmKdNKw8jZ49oobpfPhEr11Z1N5g/Y
lyRDd70Io47s/sYnOe74Jhgfm13UezigsHTFS3d1EBm3oMcEw5nHPQ52uSU67cdShL7hVSS6QY3p
dYj8P/+0SwD4UlOdTdLv/bQR8aolaiof3fKUHFcv/jODb+wPcOzJwK5gsn7uciNh2nvYevamfvk8
zLes6glarJPkTEqp1x3+dEMIrUWPCmjFUzjkYUwhH2Lw5ZNC5XXVeioZc+58evi5hCY1i0j2fgC1
9GA3w0Z30gzmTY9SNYZny6MWQyp+XbROaUwHAnPlwtd/XI2PPK6ItQHMPpnZpkib6PI99RReJpsW
cKFEvqWKMU9ONznaneVDGaMpbLQ7Z5jjMWV0rw/q+CTAcSFdtWJyRZMcijnGyxcmqoe8PZ7vgE1T
56raP8nXP0TGAAtLHhNesRTwZvgfM46DGaUUqG8EQ1BV3Rbb9cEkWvRxDVNTyg7fVccbcZYsl5LN
3QWqlzpeFpc6LT+7rCeKLTzQhL0ZxXo+jMzVwbzvvKVbC4KLACDUxCoo8NfAJbD/SilTUB5T5IbQ
dOOAEPQ3t/lUhj93P7XIp19gRU9AoeXRZ9EaV3eSwNI2hVyWFjMgcc1tvdR9NMhayCXd+1cHrQWw
OxRIXq8oWDX534pzsLeyRJRtcgFoD/DV6SiQlpf5OOPZGXiWPr+C5uqWVS5E0H5CRGYQUt+nC0r1
jkKwAJESo+b808G1CMwPkWcRukusCTFqojhLj3IDI3TSjXFi7snQx6NYTcGCUZlSk8fhfw6r5xCI
DgdPRViqgQ1PXZYuYYEXjFCBlMmMNrKmbZ2STqpGxpuR2RiYDOHH3GoWEa38Ss4hsEfPw8y4ShBD
lFZ8WXMiq9KK2HQHUPFeLKoWQbiUJzt+3wo6xgPnAF9fa+wDTbAGJWSKk9dyVHE0FXZdkJTUpYbY
hc/UFbHBY82ufS8jOQ/CRuW/G0bTmFJuPDkadrrZiNw6EonYzqX2TMFtyozKGzYTcQvH1P37YM+7
Jd4lfe90cmjG6ec084iNg8ItY42i1UNqB7q62/+qALKcJSvRQ0ez3YJTaolKlY+EZGatIQG60LCo
xC22Mx29hY/2MBNK9sc8x9VUJNBF5apCAsE8fe+dBuFnc4/k84Av0kIDJnRUlAB5aldAubQUWXs1
8ew74BmO8hE060sN50+aeu6jnR2Mk+GzfCsMjA+BeGh25mj4WzauuSWrJWkbaAt6WxB4NOLDAbgA
q1AfA8H93qF34/2xh6vKXHr84m3HOxYGn4h0cde4B89LwmpKBfwbXED5nv+mx1V7H+i9V8rQm0Jg
fK1YwoYjXuPjjEcRceQ8Ff0UEZB7b+JWamw25ts7Y6+1S/bvuEAk1A47B/3TKdTYQ2BDil411jDO
6Qoqi6lORE9Vk0Pcwj0/DINdnutXWCDRGMcaXC9MmJLyy5Nx8sTTOUKLD5/J+bXsA8bhhV1iR6sW
DCCRslda4/8qS4a9D68ul2TKRG8lbhJIiUl1IEgX8NqiY//RoVrnpyFGPHzHMMbCc6TlGAV0p0az
j6KSjVI7faXDE8Y2u9IqAFsWBr16uX+AWH9OeZ1nS+N0VLiuM9qQFkAVHwxRL4mZDOehzaHdm7VD
TpxdGOCrmcsgC8fiyJFAzE79tQizXP4lC1EXP/SLU79EI7dUqgx2MOXGQCqqd/V70lvBCPx+8PXp
Hdi5AZAy+Su0phwU/QY5434LK6EVrQmCUpVlUvE21x1LYrBI+zmYITV+fVOj1BDoz+bSy0pVCoAr
ukS/nxkCa5XZ+2gi/zCoEwC5KahYGgxjBhFK2qDL2l3wSGipoySLHdyPAjWbtR354viizrKO1gIW
gHInMjt2VMDFi89Acl8M9NMSgZfiRXbPhJZ2fTY8vkiQ56wZzc4ZL6glc6+aqWvQvvWIj/0d4GKl
B1kj6eniqootN1qz9KMUNvaDmOr3XzvO/w6Ddb7YsbA/zPUn50SdSLZsl9cCdr9E/LqYgZbx/3Iq
O3caMWxIpiF0xeGnajWayLmGOMyqi2npxtm6yLjT8X0NsJZem1t1m4w7VLYpQCczR5cAJthjMTyb
YIcocYI2dC+c5pvb7DTtWBXauHnVM5anisM0zJ80pdI0+VVJ2bccZk2WaTzX8Rtr40rQZikoKOfg
Z4Rnxi+QcsoTsIvZco2oBzUC6Oh3b3ZGzm4YwMbC6m9eJM1HL4/skxASJQ3yJPs7WLL13tWDq3iY
/+lv+IV5121kQTZBOdXV8ifxpNPajCAJhDRcLpwEhf05cVTwj9s5YZM7nKIbDCKsvs2+mblHjZhP
erb7zEN/d2a73598UkYnul0DqjB2VK/eg0EMo10xzoNmBdjDdKFJEVaq77wEi7DYBBW0WeFos8mK
TJ6D4f/o+4u67xZMBJR5b38dH+b3a0Fbs7/mSSXmRxZUcOjX1Q9g26a3TMmFcZ7XtDoBpc5SZLi7
FlHe6b9y9QdiIfd0JyZwljysgjILuFqRhZlL0VLhFJr4MZdFTgbRrPl2X0V//oMq9brnQF6/+S9e
irPOcNx7O0s20LKmdQNRfPjY65mhME4qIDoHR/cNf8YEmR4n33Rxpy8Y1DJyz5QpNESJAvvnae9V
1jOD6dK7HD7e816ezvJxI1U69O7y161b5JJVEkol4fGBDhM6aYYffpsdHBOOWVG81pBl7oHi6+JH
VWGRf821grIhLT5kJ4uc4zAh+Llglq7dMEuoqCuf7nTS896p9iSakfQfM37L+b2wTRfJz04fVwdf
Q4q9PUEZVBx3IN1h3wzdQXwvf1ZKbrF9j4J1D79W0m5MAYD8+DTpUobR+iNYtG9yX5YoloQyGEXh
xynhHekm1o7vg15vFgxszDaZh/JIaq+WrULM3Of/j8h7RC9/U1GdbA1DrCUn8isqjRvasRmjHhKm
1pWwBjDX3j8KL281Fk39yoitPV3qgstCckjD6s/Uf9Cr1FHa3ukdNld+Pa7frwrj1p8IsazPGySv
9E3HTSd3y2BgdkrkatKK5yTUkotH0TW9qCJmBvA4Io92oPMgpW5h3nZoc8A5Hl+U/LnLkhB3VgFk
TcqMOojAFT5zgFd+W2+trZ82ZtTW82KbzL42vW37scnEnj6dcnyjsQuocvvFEQA+rVJvq6w85N+0
5iDyoHSuXSVRoRJ0kILLUKYwWKG1o9Lalo+dOFMv+uVBZ3TpczDg9M3QScFgAvYhULF3UKvNkmjJ
WaZcA33gWUd8r4Q6xfDj1v1lUHR1+DGdAhpJmCsoVs8/FzNLQ7V1lpDN143T84VnXQlOhcULOGSO
bkc4n7X/R+p6Vmz/WzFNGbunGmH6iVDmVqM4drdreUh8GdBIlbqCMDgn0Xz8M0AQwvpcL19EFHQc
Bf1VPsD1bx6GenC7oxdQqJRAXqPLli5G/kduG/bVrUYNy8cruiExY7rh6eTGCI0nTaSMQ84jAwaV
58xSU67jXAXOXKmhgVIeOyFuA/6BkIIEpxgWdTGJl2+S4soDqyuSqunf8LRzOdlAdagVhbt8jjsb
AZGo/CxpO6mQl8fFMkGWtVa3LegzBOhpUSH5Xju+dH7q0ckKND7UFnUCJ6sIRNT0uHRToLzyPPqO
aPHCRSJuPlfvFv5+RORnwi5fo1qxlStnsYXtrUFepd956WV8n3TgjnY5wvRNishEgK8nRaImY4cJ
VdM0AhlzHGB0SwBf0WbkQcYO7aIVoFSoPO+vxLhg40h6dpwkUMK0hzDpK07rRtWBJFf+whguwTdZ
9cI882o8ohfHGonE6Dv67tNa3VIQf41R6m92AITmjQEmbeIfWbep/clTTK/W9dTGOhlzIkYZEhER
TLlt8Mdb29MXnM19ybqgkswDXlXf43QBe43tb0nx1qC849Gk5zvgGNSc9iHquOKS6RUK3/+gA+oe
n9hmJyPp4hO42XHpbmc8n7WIdz8r10n7gOrhjVUgvdbQPymqrl2Y2dqRWyHm9HuGZ1KaMwpiKYXn
vJYMCALUEUAue14PfuQCe/ncBC5Z51djicQ9iT+6Jvspe9RGgou8Cv4RkAqF+Kkz+t52xRWZYlyf
omSo6mO2ITXlKY/E3ay7L01SEde2yUJDb61gync2WV2H7Wur7hPr/ZfuzFL9UdbuFIVaM4fqZGZD
ifbovTyvgPdkcwwz574eWaAp2XCQv9UXY5Gmx/SgfVumBoIPSaJCjVzZJ2PvztGIZ+vBge7mOwXY
NGLMEWCdrrjYWzGIDedk+y8JO2UbLA4DDJAoYTRMLI2PRnGBi565tRb7s8lW15B1+YnHCFGkYM73
s2T9+43fcra8/WfVRU7s+Ec88NGjTKrF/3N/sM1puTAvBAG6bVOKEfnNIgdquwMFmSP/Ok4M02DX
zqt9hbYWhr3BGO9SmpD5wn3gP180kyLexSmcMAU2Q82YzzRhkgA7EMu83LT+XtrlKLWlutRlttwn
r0jkr/5fSnN+99cRIK4ZKyqbzyme6uaksuAlQA9kXtn0ekVmKBUiUB1oXn489vq3XJKg4pPvXYXH
sUEWED/o08zq2J8zgfTQfUfGCgPZVQ27FHixjwuTKBzVRlQuP39jrg7m70ucwokJhU4czXOiXUFJ
IJUMUXWZlYYT0W43NGny8XmSQcmHRHP96dsKkte+DD/ZKWhku1l6yR6w4VGZkgZpTNw87NaZ+CI0
P9GuInNFQPggpw0IZiSkhRK7V33YsDcBrtbUaW6MNrOXlK2OUrC9GWxo52OAtp8JW9jBBB6oX5Lw
nA99eNajCILnGAtOUkR2eYtx8OakleiCyIScuEHO6qo9ehR0VH4ng421dcTE6gW2rQkvOoTGWCkU
QyZGWKWmHo4o3KsEhZ+Z1g9HL/ZpQ4PKHDDgjv2csiwnUEcjbB8SPIQYh6IfjhHXqSBH8WZ0MIZY
/IHhWOSl/Og/eIKmB9z0KeVtqlWJHm+kVIHNpPqQ8eCRt4hwWC7vV8V8Chk2PlKmqk8jn9KrsXib
sRMQUcJsQPtNSRCcqk18AuPU0MOocXuntXNoaJUjk+VyhkZGMC8/6z6pfpTioesESrTfud2xcPf8
/oGZFWgbrTWzZ1qMo6A/+V9Q+SU+85bVjKsAlSks6RdGGuy0myLHEj/dCQTrhkXAdPEEWDUqz3Q6
jJ+TKxh5af+kHfjOONM41KqYP4/mZoJzZH9krT9FWqyuz4rqnE0wpxG20iKlK1xG+711TbJNr0dW
dRl+RWyF9JMlD+reCw5+UCfj8hAerl+sMliAgTIqAaiYe0S6aYAmRnYOpUXwRrNAeY7Wxsejbjdm
94ZcLCqGnb0kzq55IJCH+NUo1ZFbBdDIxajgkMXdMZDIWdPVhfWB96okRdGCN8X/Os83Vt5LMO9c
BmvihF8LSP7P9iA9V23wJYcLhmTUcJ7y1K15J3XZfZBYeVFhfSRmhkr4j1lDQHKQ8ecDP4oKAY0h
AECgZ+/seGFgCuYj+sWCAm7gDSFOhgU9zCuRSG6Bq6zwD/tas4Wlo0qdZlnzFpNs8cSNH8I09H0q
PEfyzY5UZ9481OVG9EN/0Ya+NPCXpSUSR0V4pJc5u3FM2V4FKgOgfT90L1SeBDTFs/U/j6ULMdyh
F+g/C8ZShKNfymswiVkr26MWf50cLilpJbZWstEK6ub46wqu0aLRoa8BaMotkKVApkG31Gl2YzlI
UVD+9TPoxazVViH0rTWQqOY+dHFbXL2JQuc/Y7SK0gcrehOTuKuoGIUPKyt7KBkks2BcrfdfwO0P
B7GacZYOx4pHN8SfDRO7kIFDYZXfkOw+r+LSFnCqYcSikmjAh+RLg+aAb31oHeonc8GMPnfJJuzA
0hWAJOPI4YpMms7XogXj2MLF6IUj8qQh51FCvunbfauXj0vtZWyLg5tEESaA3uo7Pdc8NhMGJi+E
ojP8gWgtyQrVi7aE69ze+RHQsFrJZblhQvBBNG1siIr2gmn7YVxLHkbkvyox/2XdtfAjeUA0Bk/k
fVv32WA4BICdlz7v52lOmDdFuNeX0IG4gztF8K3ib2cmDJoPCHACuO383f9ZU5HCh/hI0doOdzfe
CPSYwy5tvNLDlEGoqybsD6EJ6RFBba74Dx+pH5fn1MqS8fETCi/FekhD2O9kI9ycugVrmj3KtGpP
4abhGOm4p9PKlJV0Kt0R+barKXCuaizd+CTrhF6wkuilScBaW/CxB0fXa2w0oc3j0RttLu5aSzXk
YJAJ8eWNvWPrXgcqWIG7D/Hw8PIHt2U265B7auxjPYX3yuz/ci/fvSXi7+BAG8svVOFm3P09RF/+
j8ArgmG2sxeUbZaYN2OjHmLoyCJiol4a4+81TIXCFp63cg3/68gaGfuUNowdUZnRAzeLAc6QRL5u
qD68BmuweOilXg5n6x9nCWC13GNCRzdDmJt+qkj2PeubhAA3G/xtV79fiL1EAtS5vkyLJD7rkgcv
cSMbCfGY0cNOjUIcj5fh7LSKFlRlOGqwpMF/JcL7LoyPEy1ETMRfEBOW8Fj6QG7uFHpMoBcFp9qR
Aeu9eyyfxbK+fBvIEj6uGTqmCpCuP/sUg/IwClbqJ1X48i9XzAyWpCK2staYaqmhRQjneiT0uWzv
3YwQeBr6mSly3nQCEmi+1zAeoTiItOiDn1eMUeO8emjn1yv7BEpIAR9MUISwY1FSlOayjG8KDFvS
0ApYxoPZNs5kEnPFpYhvhxzaHCM66m7cNjC9fmA190s5a3KS68R+HtjUA1gZuuBbvG3pBsfpevvZ
CcAkSsrfimyOK5LoWmcDqrSXZmRqjMBKDvWIV5OcZAeF84DMrM4Xr4Z9TEUWCuCBFzNYxpWSC+Hj
wzsxNeCjiV20esg7ncDn20AQiUI/LSmIcHshp0upANesXYr3gXeLa4ICkP9wdgwUjeJQh3/CSSrJ
6L2RPjDYlPd3olsHDaynCLxcO96qLKbaInMed7O4IH4KyWR7E9dhfueONZiSpKcOc39n5e/llVfZ
ABd6Rhg9Nhh91+qCAy29xW60QlX4KvYHbXzYvMQvU3NHZs31ahvR5wW05FHAaxWNS0+a7HP/Ze4d
2cENczOlxcrB13B9qBzw4R0feiDDiaHn80WSsYBvRLdN2JmrRzIIW9D3C0s01g+jYOxezC/QFB0F
elywrhBoiwNbdWGuUuMT7GMDDKaev9G1NuWvBAOk4QjikYyz17Ggs0yaQsHbQZ0bXmD2gbYAoV3o
D+nNI3eH7/KbHhi55Huub1H9LUij4DDmzbpaII5dxhKH8ms8idxyWxe7h8RvZD0qRpEKJV7HUaA7
Wjgh5rVMFIlD0ZXa2YIm3O1yQdrb1Wh4HeZ/iz6xEOdH8UfNVryIp9zImLLiW83HLogljfDnf21A
O7mpQdV2i32rxssyr3qwNEBL3udFaV3mb62GB8qLaLL2C/aYfvuHNxXoHWWUKWqqQvXKDtEgSkfR
gf8QD9/9uBYPJpjrZY2FLHWV+l8s9AIauj2M4R4WpyIDA+7AHo6yJIAUlSgKDH8SEZecXZqG36W5
G5Vk32Qorw4Bx2M+OeqyMuv2qbxARc3u7cppCsDTpsZaaP9qo8x1DxyxoOTdNNv1va4uc6E1KNuW
hdi6Thx7ZuIJaYLgjfXjhVqqk1VZDIEDygNPv28S8YcdHs9sa1xErFZx+nRTGUjvTWfUeINC0hZZ
z/Jdn4MmStSCFNAVvI5enoUNQLVcDXcnPZobYRav7Cg3dInLor0MTe3+FXc87Sj4t2970FTg9ULt
WkiF4ZtoqqEZhx9djnjBtmecZxFagr468ibkoA5uefkd5ZIVLNa9RfgeazwaUt7FZ/bnu1O9DBJR
yOwjqlvQUdX9z1vdo3uRwd+zpbk6J9BoRoU3RsAvIPELn0mOTvEgHu4TSd/sUX9jtNdBp+zvXUVV
pz5zGdnS+N56AGi4Md317OgyPINyNUKCQ4yy3dobB5bQg9gPbNQ6meMj7671QeKkHZkXyTRu/+EO
k6GzQ1Upd62tjawn07QAKt+ZuGRlW6mFMJTt9/58n2hZPoze7h1Ns5wJyvhC1UNVh5h/mTo1Gqg6
KFlwtzjykj4R9u22zzEFoVu3gBv+2h4nbKhW/6gu7X2/Ryzj8ktd3/v+FE3HeYYEP8QuJgWH46E0
TvIZM2Ag+MTItqP2KKLiuJYZUjUsdnUgrw63x20dOikrGqwrs2jwGOfhlDxXaq9oQQWEKYE/eDaJ
/2I4epnO8hlUECC1mJFCVoN+EXedSN6b9UDaB31+M6XuYx1MoydoArlsIjYXRJ779anwAgWtVqdo
rP5YCCYTALZmd4aGtEFL7+5eNxmTVuWQZCW0YUIw/Ve+0jzaeNEMfkAPrKczYdePnoxgepr4Cn3/
u+4dw0R+Q7E5bNh/WWU9JPEteOKON85NtpJwaQqmBap7nkVBGD3YFI3gHjQoOCWg7vREr6gj8KN/
+HyvUL1YbANkp0l7Ny91QkkbTTnxsISeF84gm/qEJVOMxHgaC9s4WUukyQFJFNpL/ki0RjPSzQrM
sgJGhubZjwV6ePLkLg06M28LUoiBRlOr6OYLYosywuqld+EX1mW4dzadVkDqoOksCPPj8CR53Vfs
5m2ZgcpE8/7VP7OKNZlfTTzaDzfGjWe0jEQm3ON7ubC7HUAzavuDVLYPrD9aJE/ujmPZwKvFI9gC
5NVIIsUaAfkaFBhm7tC1ucLmTNuZuE79by8J9Rmr8f7d+weESsmS0+QrUJ7hu2m6uH54e4bO8B1n
qPdkw0C3t+D2FZx9Jlhz3jfVqXSfu3DdmrCjZaTnRnwPwawIsXS6ojYkjtz1sbT0smy7GzgiFtl8
YaXwGKw1Uz2bsNSVduJd1uqvjQCMG9vTLcr3c/1OGs2cxsFhc4XWwMqXY2oVs7awBP1L76TAETqa
hfb24lbbUMQePGCEelesOVRbWZP5TGjycvTVG62GMuH3x7ylfb2KiBYBk6/8k+RN9mgl3GjUe0L/
nuhAipTCZCMD3+9RhWZJQdZ+PIgckJ5d/7M8Ifsv0rkuSG7SqSlLDhtnETE7K9EyQvSzW0ziyZS5
MxkteAVei+KoXwsDeu9jlf3sugvPBiC+XMtu66C/TWH3rZpqZjZogec33nafmFEcsE4R0W839F4g
Yit+hUHf0ukXyISEetGu2WkBzlFwCb3JqFytflEvzhMxLQyWFq9qjk5gqSaTRzhGJIWGYIN3rIuE
gWV4GSGlfELdOJj0mt5Kzs3EZ7CimryA5qSNw7dayRNlgKglll8dVFvwtNhLcTh3GU5kj9kH6knB
hXVmwbgdTqvDw3S0xQ6fpNNflIwO4PiZ51PP0B+QhzZ1+q9zex5aCaCkD28abzG1DqYs43TAOZT4
bUtLAF0jxbG+hGr3sdPAEEsFMBgpYWJjqWs4XBDIwJL4KRQtJyOXDEVr95I/umqhWdRy/gjt+BUG
NPZY9bmVMKBn4Stn2zgcg2zNk3ymFCILsoVdujQviZC+YejuEoDF4UDL+XfIl0AYsjaC3VGP5nyd
DIl/KDmaL68nLVnWIHDlU88qqfV0QGMmwPOgZHv6RVPQ7LmVh6Y+l/Y+Kp+Zove8ZqXhP7qy8r4v
QjaXNtBlfRp/3fNzxiOYGcAhumzj0TbHS+hrpv64HO5js8Bkv2gqio/zDME0XO2hB+9W8A/OyFlX
85ktVP2XT5LDtJLXaxFM4NXwBwgJSAr5OAEeumitgEiUpK21QYuTk5EA0UT5VRKIIwe4VY0wVuIk
GDQhSjo3bC0xWKfgD3eZxeJ8KldnB5dcitAud8TRuMu5h4mrNv1OoIcuUmlUHy7giZLV5sbQaZA2
O8QHW9ByBdv8NheAsyxqKQDttgKMjLJZrgkMRsbjRkddjyFVasKW3ZtPeCN/MOJ5QClSxCpG0TfN
+9UhU66pxlG+SqDA4rwEUpdEM3/uWDH/E1ycJIGuAo0gUgRTPNgISVD/T9R5qHOYRrRqXYEs2qHJ
kbsZ+zlDEMektkegHXIdNAo4tz0n0YvdcPNFL9jY/4l7lllq5zewLKuPSE7m2RrINw1pUTC2IpL4
y0+O4icTtwPRWoJqIvEKc6MkHmvH4FLIgyfGPCVHKy9dq6iNBzTQ86kuYPWNVrKrPXAEm96R2lKz
gmxN72H0GyidWI7mzXyuQM4kNei7udPQcolXKkUg3lOg5pGhfqT4IeDapQCcbHPLxKT8ICRTGTor
kYCt1rsS/1h+kZh6eJZXr6I6TqwmEG4ncDUrSCCdxK/4+B2m6ea4k9vvAjWc1Fcdh+meskxqCcof
Ti0qW3CZ9VANwJP9/G6ldKCdO95botoo3VYUQ1oPxnQ7HhTcmufUne3ZaQzNpXT6nOa4/beTSkIa
bWOZLNrajduuRNw1re6sFSYMe91r5ZT2naJRH4nYqZGID5bmeJ1VDrkUNQsJk06cIkxwevnfdwiU
Kf1s+BupFUwBDAEshN+A2zloYCzdWwKfBgnu1fZyylq88c3b/gAZU5CTO0ZfLZwd7GiN6JaNqBwT
tJL7VhikDieGQ+XS/BKSkD5U01fIbCPgXmjJxOq0It2SVAcBhCVzxb/YsjkZeuwJyD3ytkTPJabh
kOH0KCFUViKVAISTsrqT6x8CD5isr6aFKuosVPO4S4ZFm7tT1PyFn5/WXsSVgmpm/135yChI9+xb
gyWIvwwNCrFtQLXOSLKXPnKOYH+4C1cO7NInI9VTeBSa57EhNzIEz6iMx89z54wanhwSbEkgFxFt
qiVPPdIENp6nGC8ybSnuSMpTyPFyCMHO6+nJk8aqMjmmDlbjJivdF1TOcTWdSdy2onPiJmjfab7m
C5WWtW4T3rQCjMI437iXnAikzisU9tc6giDnrmTB40sOXbiBtUBWQRa+9wck5EigJfbDKOxKFDb9
B2y2MHVMev9OMl6Wg0EZFwggS3zzLiWKxA5v6uGig71ksMajLZdEDoONL9HBPy4ZoX6r7amQoEaS
zTkSKzSNkTCRu66Umet374tOv9RzKSs9ca9logMrnZFzYnL31wI309H91siZN1qcDh4MnhIZzbca
zJW9rmJKvMU3IgnZpO+JrlQvRbMAV0kObirTWDY0esf2rYSLraM0qt+lcC7qZg+blbzqA7vSbAyZ
JHgh2dndkNWGZMmfuIpC4x0eVdbHoalMwrHSMGcKOJolge2IneImjiqgCN1rc+IHQwHyr6jlnq9f
7GcKbhQzNWBJwwjwIlmrZsCk+pd1KPNtcqUYQ8G7MJO6VBqCcM3T1HqMHt20Xd7CCNeyLVD/qwkE
k0rHUTdyMNW6CgkfJC2u9OKAEbs0gr+x0+Jt4PSjlgMe+fibVq8J6mbSgZLAS0evMtdfaX/Yi+sY
pa9hi1Wb/Ix9nSoXHoKJFKUyU0m9fZPmhPn/Nzh+okLZv26c3O8CWpyAExsm+/+tZptNnzxpNiNG
F9RYT7651X4qjeCHPvP6XjUMH07pWs6Pmn+L4WKdWaiZq7xv/MgbN4nggFFPZ94A4B48PrpKcH8/
lY0S+6PGW8pE8FwA+GJwI/9NciU2BAHZMxCuJDeKj+O5+v2PUPiM803fyIsEFgqUY3rDny4QYDql
VUIumeacx/+i3SXGHW36tr8NPhLGI2jVair9AuBO55nQKjJdt1nDXZyHeOg+6LIFmdp5j/PlKP0u
1jg3jmpOkrdrD5ODQfH2NHV4dunB5Bggibr23Pb4Tr/2ARyZ4T7bS7cjAVfJ2sE7jHc6hViWzs7P
3eami8a/cMMFDyhC0f4ZMLbttFgMh3/RQvK6iy6Yxk/vRaDg/lFLbPpqZd7pQb2xryxGijcQXdsg
QeTOXgtQDlk9QPeb5cLSgTXo6xCobQ9RvYnPvIr/I0tFcQI7aAk1k/gCSP1UkYG3lhY3k0gQ350r
x9FmZe7wVXYuAp1VB68ULtolNFvrFW6GAV/8G3Go9hsciQrFprLOrALlVybedADgVcmmWrVo0X9g
92CcJ9kPEmCNjpBjzC/9wWPl315GSiiDg2IecruYUVqZ8pBwteuAeegSkvDIxhjX4gjFrhb3a/jJ
SbkyewvGvvh+tUIP6IehlbxwY85WEf1JLkFlHk3IOLb14ttNgvnR3ygz+R4GE53iznVZxp6vzpBL
Uw/UWRCiwashhhCKuaPWhhtS6sA0LMDbaqaN/1Hhl/D/jhSC4ILD7q7mkpGFw6kiZcPnJ0MXTdC0
CodVKxlhVpvNSCpYM7+/uYI4M81Fh/2ApxXOU2wPOkDKJ0+d47yV7rZund2nKe+wKXqL4nN8ZUaA
mK4tib+CvGcaSREeWe8fa+OV41SeA9M97eOxvK9vq/nokNc48m/w1EMKqvuatPe/bvsFb5PMvmhI
j4BqaX6igsmrmwLKRPVTmhJDus2NdP1WPD9e9GrjbtAzCwnB3Cq8sWdwD5MoAJbMHyu86CeHqMxm
wxHBhrRVCFAWciuQC4OOYzrXCy1tetslzCQg8JeFPqNFS7xzmn0PKauY8HXjBiu3+oWD4zuY8oQw
/RgUImEBjNsjjbSwTsoaYse1ihF61XloBYwmVatZp10GrK4KPONg2gGTwBwHJxyFP6EPUu0fimpQ
sa0+3ONgo8szo73fzFu4YxQFMKyADbY1ipmFPxLS6KKFxaXjskvh81JIl4yBllzsPEIesS4WOkVR
uUi2PvyNAB0sxoL/EowgiIVnAjFX5blO2K2cq80OIh/1TAFxYV7iBRU1rr905IDbYehN5JdC9kox
CKf5NJy5Hm8WTW+giqwvp/BPaWdARAZLV0JKjJc/HU9zXQxNEOl8nZFRrMPHbx8G+yz9R8TFqle8
yGN+rSMIKZsRw9y1x90daaJCkU1u9tmJKNaoU3Z6PaAky21Dn0u6+hYMiQ8hQ4vXw8iEj69Obmtd
pDAevmc/qg1MbURZ0vKQvYYwhLCHaACm6NCWuLmrZ64FMh8ibLYOIFkle3CHQaLQ2Z8l+loi7th1
DuGxi280tCx7a0YmgE6vQRoK4N9st5uGEuS1ZE74hVEwgOIAIQ3EtXWiPTPJvQc/2iqxqlhBEO28
GfdH+EopjhpREkoSGbzXRaUbS1CwRw6IRSjCmAlw36MFsZIv8UzsJO08xG7CHTY3qTyuVTDPeC8/
TzIiHmHofyiKfpqpBkUtQEkCL8gWNFFuHBSisdSDEvpA2Svr0HCZnDzqHgcrpvj3F1SQfOTvx0t6
nJCGvJiJ66fG9HNqcTYn9uCKkBne+NxUObcKOFjGSdNxa9BU7CSmQzY1oyNPyrYx3abHgYkpVWox
abRI/6mpmcnx20Flp+CIpK0qoPMVJxjcHk493YXjGKHhVK9SFjy/b3IOqmAx0qr1IHjK46kqzOph
w/OjI622VbNjqwLa81G6RCWDUpc734la1AyJuPK2EaFmSNh3jpZypbYL6uvMNGQPUnl4sRPtCPBH
uQ/9Yu+Ns9lOO6NAOQnruVtF7VOOMRH/Z2bp1bQQL3R9oF4XMtmBLv/sligdIbrgSGcUfMhyiE/z
XmbQn5hNpNNcTBRt7kaQhXmqqMm8im28sC4YJHXOBTqRFeT2nzT/I7tiSANwsEu2+yMLpXhfdum4
+ApOU7MckNp7ky7NZKoTo6LlzdOynuN9Dj5OFevBZXz+o+t2IkcR+pXhytSQuaecOmY+O02HWpQV
j6m2aYyZ+Iv9ZleDXykNlmQXGHRgUcdfxQTc2i8RnqKwY+tWAvg56X0ubNjTi4VxcGeK34YhMSg9
E3YWVsK9UpN63xOM3q8wJlxQjloCZEdzaLphRT4fXvbHRYV+pds3+v7caJzh/FO4itcHSBEeRN9T
9SJ0wxvAAxoviCJRF/GPPfNNHobSWpCPNy9ZjAWDbwslWov3m4xwTgkYF7j5ATn5GlYgsQTiXFwC
EU8iWV0RN4jZC4VmWCmFLrSWTn07kA73EAonMbaf6geWrjD22MU07ciajg3ddT7FgEmj4uIuKHFd
xiVy67UhPEM7DZDpps5pvNAOy7V5itjkkMpMbIvu5n9zAiWoYSdvoPxeEaogn1rjOrL+i0BfBLzJ
P2cizQ+CR30lc4pMKGEpQg1M7ZFOeipDqdPUtOOF5ZyHEO70yjajlojx8PUDlZqblBgzxzv1yGsG
LhGwCc7O/sMlVlrAwUY3sWjFeFrbkERPENDkxvl8BV+NtWOoDKvJQRVcSEBVRlXGOBUGFDbvkwBp
JnfHqlLH/H5LyaXuN5ej26dkkkw1zUEed4Ij+wkd6T54xMt8TMu3uVbPrUT6h/AfV3SWaCQaO4gQ
o7qwjPjqX31+hfxRyLK5qX6ANspG6VT7K81cC8/Wa82ehluTLs6WTSS7wTxMNPzdufkvHPEfHiLQ
CTc75z8FaaWLjPdc22fk0YjRF0VybKFQy4B/NsACJ5xqFWZoNU3Rd+Pn6ggCknOQQN4y3FlkdhwA
L0d4z4QRmEYYz4qVR5MpRJ/XLgCUo7OmoPJR33n4yxuIpH2MA6WR8KldSaXkcxXX4phNmLjljwnw
lILGE7RnIdnlmJNVPnvd7JDbXCj0Ek7Qr7ufPRTiwtUZvqzonaK044Og/YswgDOw7bBO5K6kmjXn
DjVVqB++smrT3byc7xaVc9MubXlAQNsRckKv+9HRWCGkPt+gBM6iQ8Q8Fe2rz9sEVQwXDsawTicG
HQ0mhXHlE9XmN5xpzBTrFWu3F0CcU1JLtHwmn1OHDbKyjcElbK4shbvCq5AawRAwHJk/RIsxP45g
hICmORMeVKYbhaiufNB9w8nUF9LtSBnFb4LB4k/8B9JduLAzHUFkMvsvZ9diCSPKCQggOyg2hTbS
QqJujkmuKrhUdgXz9cmqmFT6XHZZfQ0/6hmnq4fF9LnZnuSYKn54rqVURQ/5VeZYVo1ECBhZinwA
T8p2kTaWbMboI6YufRhPOsir9+wYoTQl4oqT1YS5SSbaaVqhHrwkUPHa5THPEi5oKOWSZEfyWnjw
oMypbVCN5upFm2h+/Bn2Nz3AqsLZBHCk7W8RgPgumLlOVA0+pUV2saMiQwwLsRpnAf/W8mXMkXYc
WVvLI8tZ6utRwe1YJuPIa2nPzsOs3RKJRVPuzD7rG4+zVBGlicCz87GVqDQvn4+cGIRvPxxdrYIr
q2YjtN+H9a5glZ2BeY+59+uIIqm4Un8jHhE9gWrcoNb+AYQhXkTHEHr/Jb7qpM18fJqyPRFwDDFB
sIU1O5OSIaVTPIooMbdctepbOFhnQnY8W8Kg0r1ChVQOKd7QIH502N3DQr1p9/XDKI+E+ycoO+78
gjyfvr7tf2Tb5bya7yUSi1MLpyM8xbJbkuzXpnR6/8A+/gsmiP9nhmwqy4PHClowrMHxrMiE3RC4
VxX8knIr0HiP8MO33OIGaJIVQUOA8auAc2AgmM3sZfcbItNJNde8YsLPIkbTttiNdxCuDR6DXwcJ
ursWHoXyqe+mcjI2EhRJRg9Me2LtOq8lk8MGRAmzR+OKyUAJ1UFI0ZIbzlKQd69LhQbK9ckwUqjU
pvQlu0z7zhENfESREc/TkKvvtDxcgJyUog1zHh7/FeV1PaVEzfMvVjQcU+hyRlp9S7OzjYMGIuUD
Hp/lcxxo0884lezsDzomV0LkVLLP+ZmUV8dzMCNGgS3SczFEQUKUcbG4cr7mNiaaeo8ftGCiPf7L
l60OSkQYqtgxh8jHldbw/hWumDME+7inOI8zJq0uwZ564ruqF/sMtsCJ2pqn5ow+hI3/ErwXW+sN
wTqZzwdA2tTspW055E87tmSSKkW1GQ4A6f4cvklI0muDrW0HjrKkeFk+ysaijIX/bgur5TSVCGg4
VzaYMlA5WtUrhYM/4G4Gbnm6sSNFldNojFnTRp/xBRfem1W2cahpSxC+Gc7lNPFl/OXYKqc+86Ux
o344VYdFnQ11GRPSsSOrQMITGKdcNS9nqnksKnDy6rJmnyIGi+K848UBRZ5xgB2U5PX7CwjxbrC2
WGArh8t2TtMP/Nj2boKmvc7tKmaN1Mv1smU9XT6SaOsx3T7z85MjgptYzkUpYZqKSKvcYi3O5zZr
Dp+lR5c3PtYqiJ6DDaWOqkItqZwF7C0KTsCz/jfqsV+tCs/vtXgILfjP/L5fqlrNb9OkrjvF9r2P
ejP/83iK3zmE7s8pA22L8C9gM/0P4GQWlEv1Cc5Q0aKw1cigw6QDkDJ4F8K0GRBGi02Z/SvThvIr
RLsDNlfM6BIshpZdZKkxxui6Bz2/Kr9SQMrPjq1P8m/Vbx2XJ2/MQK5WUC1q9MRVYuCLHTHptokZ
0PN/bLLctRl5+PSYcugH5jD0EL263npIt97fqOpRAgwZmU3Jg7GgHjJEHeSCp3h+bI8lDReh6iU3
IJBGsduMbcTteMqiseDzt6SVHijrFiKcjFMI1ZpefysX4uCz+M2Ufu9IBYUw2iARqJ0fqR/pb7Lg
cAE9nQ5xf3oXSD1m1qL8f3cSB5dgdULehPC6lpXPlePrf+3eaz6EXSrgjt4cYnWfx9XthHSquN0T
atz116RnY6kNiRLy70XOzbMLxd4Y4Q6arkSNrmNWi1IO5nZg55BgE513USd3j6p27z2UIjc2MOtx
cu5BqfTOe/ek7702asKpTkI7+8zfPKZgMYnZU5NtyOr57tFnN9/cth+xQ9GC3/7RqU/vFtJYMypr
12Kc0CVeWgr5l6mjPKrSzsnN3A4UOPOMl8ed62r3WvCP99Ht/3sS1wWdZBI3xzY3u1+0Yof8WF4H
PwmE4FkeFH7ItUil+hg4njNSSCa4aVOmlY2YMFHKp3Zo3kM2hPGopQ8xJCYreDSim3fXbBbn6r/M
fgIK3sQQsHk7aaLZ/O++YBmwytnfJwmsoBth7t1puK0U9VrHKRIukAkJS9FvenlivVJTvfRO5uLW
yxgXgwJAdEfPiGIciQYuDdI2cZZyoKg52o92C9W5G13IC8JdNbC1vLdu8U3OhRCfztu3PphhqQzt
nnEouhKt9LWUz1og+B6UHWv9QrM51McoxoEThvTiynGKGdSJAfdOIJ2pPUzLmmtvUMDhGVimmDGV
oC7IbnEBHuklE98chkX+hR0jmgeLAGSMNBfnXBB7HYwjvg9RfBtjk6t5KQNq3XhrPA3dZ5SR1Ord
zVBSi3Ut0FJn/gqEzMNspiv/5QYIkJNJHkNrxTGdZL4TwFZ17Roz3KJx/8caZxhSDv4IdjIhRhra
dfy4sAnvxhtmNPMkHiR2OO9XlaBInCifUGh7WLKoKuwB6pvPCwrJ4Nma05POciWv9XVM5cvh90vE
Q6YR7bTIuIQLugJWsKKRARF7xAXLsdaXwsMGj7oMdG7k8gFzeXaLXvwLSmyS6HJS9dMA3LSQSwHT
GvwncdJuU2cy1/mT6KrTu2+4dBjob9wDQIU4dOI/D8Tr3/4itD4dL4r+di12KCiALmn0ux4tYWZ9
WKQ4IQ5qRoDgv1KC4/GjTjMYYGM8g3FC/ctiQmik8goN5vGp+qEbzzkwVt2opdfgsuhBnFATAyA4
nrZKNgACRnOaBPTvnJNajy650cOytZ/NF6xRSuOh6xvcFTaF9z+l6rXkJxUzkg/zQFnI0i3Ueq8U
rggD+M/fsK5+uGbOwhRPOzKejKIpgAQQTBuw5d+4Jnc+tBtpA1hV3rUPt7NQPVUuSvPPiV+trDwv
bqQP0uJIlwJs4+llZC/ea7SQ7747BE+yyEM8igOfxE5J24wzHcy1T0WYNp+FyDYfYVBy556Ms9lq
OP9si3c9dUygq9iG/EIpFTpDucxhlGjAk8XO99E8QvtXnMMlZojS9Lv9V/Q8LX6+rRhttG/iEZiP
Op37SD1+cC316qnGZkH2w7eJzt6hDX9qEYfV1G/lstM04RxIdVJFhPcn+C+oQ4/ytsAjusoqs31T
kR/HN9fGbwdhQHTu7Qj7aMyuSxD377lokjsDrBTGqP8O9YDOdtI5WZJ9L6nHmsWZ1VH/az114mZ3
WhUgnlubLslnVKa3gBIQsuITG6RTIkpuo8hGi0BtASSv5mBAIzriCe6lwtOh+bFratTWoaw6IXvc
jq/CyKO2+oVdc4s+qta7A4EDRzMF0DTkwNOXiroeDcTQjBI0l64Y5zuyc1ye4p8g8jlSF+mvRkHu
ZXcpwrGS+xZrqEsBNI4XFs3wKFeH6h+nS12zz5xXfkasnKD3rh9MV6qDaQVVpab1MWECT3GeEWIo
gaoe09HeuKJAO6s6LESEJcN0ZrGcAKnN2v72nWocdNQj37InaFzVsGXNA/r8O+8KMRzj5DmwaMdY
MhaxIVG7w8XjCJRYkAkGmVMjcP1QRF1hhBtuDb53JfXuN3KA7Defaxgu3REVdGorHTziKx6Yt6HG
fUYWfBQcxYvJPxX8tW8Z+jSWTPd/NSWAy8hzhjEpqvcHVrDlAKP2/CXZYqStRMk8JmRPZ2ULeyL5
IsO0s+rnFuok9P0NzZBlo2srLDjnTCyw0RqBm84jHz7JeCRGP01xx7VQIwcUpDy78o7RYzEjHt/u
GUaDi042fJFAqFr/Rq1LQHJIN71ExdjnUFh2BBY6o2KaXIL6npJ6ZmAlj4oRilH7nGeqQElnu72s
OlN3emdOuixf2j7on2Uq2QvDBUVchcgTSOS/Fp+Dlg3MU8pUPeJUZnHt4eC7XCGzApnIrdGcDTWi
VgXEJpYDlKcs5pRTieA1CErRHCzTa71HT9+i8GQagBsmBGecxEN4wqQa4p9Iy1IH+E5jcEODNT8r
U47vOsxRfAOvNAiEsoSX/oyV7NxmixA7sBj8gVel4+ShohyNj+wUOISedW0aWCI2VDlyAafdxjyD
G+BP9HikICaQn1bRgUoikcSn1Eazd5x95lt97JROkuRAaVCgx4m4AOu3XGD4phn5CoLmvi04OMRN
w247/ytax6PumZhMBcFBF5gPAHlyjL/33tJ+/CENOigQoRdaRitJsiT0MJmJ4KfbqwgcIypkWZZb
9dj1wqSs4ihHWdZUFGr1vqWkppSWtaoZ51PHx2Fmj+i8V5Nr69OnX9TKK7hBdwigfUdQMsJA0grS
sfyCYfgxQkc75UpH61BXpoToP/lG6FD/ewBfbmO0h5eYpOy639tu3NNH9EmsjdVut+gAGtu5ZqCz
elWCfHRJpFrdobXZhx40XbMYMpEU/+yS+gRRJLZQ+oc90u+UqzNFJgTz8icWJvFih6u00secRlto
SWqWXI7uNCCnWxY62HuGxZjBHtjGM01eUJYy+hLsS48QevCsChxbJ8wGJ/DTOA1BEXIVOyCZ5qGq
Ct80gwH20AoQpG27/WkT/FJJVH1YBatNmWOUcq3Gashg5yzDSd5tJ0vyxTdLJi7TL56cdVLjuZPx
bxeJDhvPYjnuKRJUQFcpSjNUePAcntjGxyMIk8KNMfqCRDL8envvKOHqXcTmtM61f8LuvCOkmZwg
Z3yU8l/3BIZWOtanj3OAHqQ0Wyx9c6A7FbdRB1IoowJcd2V3PuBZ8nnIcmdT5hL2kg1RCaKf3wvs
Y4Pl6Wp2aH7XXdbJDLNyROiPq2GNx76hxysL/YgVPzNyKAlFfXBgOE8irhODiiuCBGDiCWT7nuMy
rateDwO8Kp95laTJHIl++iocV42VbLpsTvkxF3lXRn5DEBiF9dqcKTEMt2yixizcJCixFTs4ROKX
LlNq1W7Wiax9fZP9NyUqD5EMjcC3ItzPEvRBK62mu9gCJ9W1l+wlj3Yb70PfNyYWZNZ0dRz3UX86
U+qmzSb/nSCD94l3yYqOguF/uzyCgxKuGwGzr6iYggzZCLwhc3Xve8KoKheXBaYoOGyMxiTu1fq+
lFIW0co/l6HCh+7wjvB5kL3pYQK6ImXCluGvkeJDF8c4TrsGqZGyIpAnaMK7AVQEfA1T3sLZMQk7
r7MR5W8eW5/sAR5PQszCYFiCACcdtTyG9/LMlU4isKUCxND3N8+Xffkf5cUXZdHgiYAkz7prIKXu
5nZbNi+BDIRW2qayaEAHTaf4YUtPQ3CdlGqUoL6pMIPspUClzrIl6mA92U2oFIeWx9FAhsxlFCqw
lZ/cCH9Tix4x5H6cOUSq1m3VMxH9fGG/HbmkIPvp6PNGLuSM9/OSqwHzzr+Zq5ebY9HJZKy4JoK+
CTcQxgNm2RpIAth8DRA9i3cDAq+F4lEG85s0cBORmPKJ5ixLCiX3MoYp1Z6u6RXld4YHhfT2oTWi
rufDc4qRCM/gnylVc8MEMzbxggQnkDNRKgm0AUsIpkLZxnzdD64OcDcJetPuPf/dc4JZBFI2An+A
atwVtde/lE938/jLNeCKM33g9KCVn5xefzNonyOj1Vy+CS5UA1MpDpBikfSfkMBGAczrmvPAuW34
2VLr3gcadzui6zrL1krUWh1YZVrw8muwJV3yAFnTuBz7RFG+BblAfO+FCTBg17byJvUVKjj0HyQl
JI4phfBr5nKPRBVRaHmKVmg5qHnE4dC+QDoYO0BBlepedxkKYs5LzXo7Z2ZdbnMvhf4BsgLe+v9x
Pdp/6ce44C3Ti/nncAbbzrHtRMRs2hpr8j8nhgzZDi1RazVVugT9HPOKjteFOr+HyDtogeAnuKYo
JS0Z8Wy6ZpDqx/GlXWey5hIDwVqxfUGvJrFLC6b4MXOHwEB0tqe+Tco4WsSta8o/tIXRCR9rNHkW
kQgaE1Jod2juJEaOlERR38mQKR3+BJqzg1iRLKF0lUtvQ2uuGWrnxv7NTIBMLHk5g/GLMFevFfTJ
5gsjYkx5X9oCATCnkt+A/dbzvM+Br4XNFqVTOxNdfs3n4xt1q1Z0fUFMNbQJ7G53BoWaso3O9w3Q
ltMQBcORX1JxMiIhrFdM7EKPrybFT0uO4zwYAbq7TnK1qBlFFFSXeWVZqwjQUatsQR9KGW1wxuW0
Ekt84zphjeKWx4Qy7VwtnODxn2TcORrxNtOdT6gQqPkIrBn2xZCkS3xtr3BK3E3IIV9uwUmi49NA
29/ZmUONlWYEhXm0mYN+Skwx8d8uZfwBA8eGHdrVjIKxMFmqTWYHGXjOirVEX3nQ3XCY2spGIT6y
KQq/W909Ag/K9LXHkM/UqBSN+FaquW6CJrLeSNra6Sr3LZmHFZkvh77re6xiYLrPH8/jDgJmKOX9
UOrrEveeCYUaGV69IyORU1TZtwUOf6ACY+lCGQJO2WlpBkj3LgtQOOsnrV36K1EyC9RgqJIyRclu
Z8s4Kmq5Q6qxppjeUE3zQBhiVGoTdsYfoHxrx1lvtcovT13wMwRhCoWaMuYOp4Ro+/ZIc3zzY/5A
PmP1Pw3oT30fAFYJv23/sJmFecQ7qYqmm/GulAFMltlICgs8Uf5dT6cbpPO/j8GqQIOVJNpUkT5X
1aZKJQp+Va68oG/XOF4rb0+fp+MLwzQae9fUYdmO1DTF5/gwu2huqFVaM7U2rXdioBgqYP6G/9cw
88MYzstMxVAwb2JSfoLuSHoLfQk7MMhgpH/zVijRSiUqtttXlvYMQzEiwAlFEAqon0OSbfstnkdS
TDfk37R7ymzQhcqfmVxPExlmPPbxgcel0NKFgs8g6sGcVunl6V3vaXQpw5p+SgF3JUZpCIJn4edz
PzNhMAVYamo/YVOP+mmIxzMLVCyLR1kgNhDkvioaOxr38JzR++JWR8PI/zpDtSYVOyUOztrBP02O
rMhyxFJtCs8nZKLbAf7yussrTM3aovcLPJaCCQyVn/1CEuE5WW0RSf1EkMjdzRVC8l5uQfEgevaG
nC4jg8YTq/pEjFKcyBXPYI+RSa2daF1p03IZNlrN6dHstryeo9arztmeTKqoIRtsi6ucPvao2N8/
ujvAhR31BmPtUmfqW7ZRftXI6m2RGPoxHbrUh3hByhjfkoCreTrRyOPMCT26ENI4HyIggOYHvQ9I
4/Zw+rsnzCtXhFAPaKrlYbhXdFkWS/w+4ijUevHvLzubPI1pGMi1XNm1ivvUS6YdOllNdXaQTvfX
0vBf/PnoFVXM0gw6uCs1bMkmmUmJFmf4NRys2qAI4NVm4PrDtcE7EJPn/LuCyBTsh2sS4gK0X8vb
pNxY/QkQx/ozeIOniQqxEOvx9SyV1VmKmCffLNrD4IaxRZ/lBRabjujCsft1avnZsnATaqxpzNgr
Xk4rmsCqzt7JVUrNb7w0d/3gVRVPFUTsnD3ucxctVIWc1QHwj+BkFOr8At4P4W/o2Vc1+vXzBXMB
/qO0FaFoRzSCzubnLKJc/8XFUxzw0Zc5py9CAIEZFNfOD3PUAeV4uinhuC73ml8InoHBbwT37ypA
JK0UWPvE1WFP2wx0dESBFezHK4Ndmlm/q7vMPe/1OBEyU7HwmdYfLZ5VFKx6r8o6BlwkdDx28ZgP
zxf4nK6J/X6b1oxf6kgSk4ktwb/SjTsRWdZnbp3swhSiU+zGEgBuyRZ1smcQMZKfqTeDR0z2Ockt
Q+xB9mqJWLxg3gdfN2DuzjWKAYImPumodqMs4PSuRIzOFZBxt0up6TPndZXxvYgdvsWWeVrFI9CA
QEVOQyVP14rsu5M1LLHs5nUcZjytAck6GXFhKcnnlVeUERCcMeERB4XDypYUFTeFKUnHbwZslPim
mu4SvqjhkcxYJEtijOfLW0FXNBC9Hwh0qMX6WF5JPL58NQSZ0qDccnH2yEXBmV9dJST3ZLFUD+U4
w+uOqpB3nMBKw/3HPuxLVkQ8INc85+yiB7c2f5lWyOck9kKSrcmDW0QCAcXYD0gWeZn+1GmJ5+QZ
ZR61ls772TV88eJ1jO5YPTDNkwwCIrpoaSdHgu2V+9+ar4qMEYQ0a62U9hVEubDgExnXSpdbWMUe
ZhyAYmbkOK2ksxG2OFIAJY9YAjHQZVazOD3pk8VnbsQFXRZwMJFU8mL3LSqD/MXI9oiNMjjKBnnw
uB+gNeOmSR5BD8Z98j7HTCCy7SqkTXPEqojTVbHciXXruBT5O8xx5gb9L90PokQvgnec11Nrs5C2
mRARqwZdbPijOil3/phKNKjBW0Cgq5UrjqADIGdbx6e/Adaih1ki5R8VmCUhWIYpIpn1POmB/Xlr
xubwVxDOJ7VPAacvp/eFaq8hHeJP0f6VI8RklbKDb/S/33qc3RRtR5mn+4q12XRFUtHdWxzU3tnW
/c24wRsNSIerFsPVO2KKIk62SdOjHhpuWzTxYcw6A3CUk95jr4hma9CYu6MPuWKusjXTSkqsQf2S
ewjj3aey3dDBrKoctbxAJeIgr0Cg24tB6CYExRp4X1jlA4mOvMyY6kNRl4uRCB0z/LsPkXXQOHHN
WToaS/pnJle7p4GKP0xoS62W+MBPJ68GQVw52Lgdd3wz26j94/tHvA4CVC8Tgemr2i+9lP97Rmcb
WWIwnL3uJnsBMaSUEvGaf2nUYgexqbMkuR8nNM9ml2TnE+6VL/1p0PU/nDN36Byn4Gn9RSt0Rjcs
sX5VKnvI5UBaJ72pYiioA6m3z+XmptA/J6l19tGc4BVL+rQ9T6JB31W9jqojeb+kLyrnLbqOyKPQ
cZ/djqxlygZLFMZC1Dh92opob1O8G0q8/FquvZoIyWQt3sS0wU9FvsaTPwB7G1Nx+DZgPKdKnzD7
ctuRR1j23EdiDceIOVgJXAwBr9dH+rnqaVvTbRgzGFci4Hem7FbNU151ZqrOZ2hKLcJOGogvdMws
bXCSQVfVEHu/2QHCkT8KgAjyCupo6Dq/W1saMC+EMO67PGnOa/7BrQ852tqEFr07olfVjt3tnspl
Zw0kYE4N6e0F8VI5oiECWBHU4ibTWscnQ5q7hlv090raEIBLo/SXTgl3DWB/zv+9xdkdANRV2C1j
t/pb27UzTeaTwCsNsWZEPf5/xyXxjusGFShcOUvXoU+iiBPITK8043iJP1Hz/sZk6/4dvUNK/Q2z
zn6DM+grERygp+OtRaCRtCRnd1B5qmPEEsxRw73ZbK3DUY2J3rqkaDIAhtsD3HsVMoJnd8efRDsG
bl4FUTBXIhTvNh0wkYjeQfCBPOxsNci7J7pmLdceXkSXhKdRYb8x9OaXzR3FwmP9/rxzgotrGUea
852yy5KjXi3zFWMfj/g8IjE0+GyUTJpw6o9ndUlSo4qMyEdJQ8saJRc4GnY2wqoC7Q2sYzN+hYy3
93KqOHMTw4zq2Tv7f56W28/z6iRoc8HFGvLUAkO73nLVKyFSzJzFe4QGaN4Uq+qKrm0yBDsQpw0k
+JTiQEeBxwek88Zc89rmvTR26duFYdlbrrZ8eu0Xfo8/KDDAecmu2rq6g5eT9Yki9CsbtsbzF6aX
Wd5qfb0nbgsnIqBZEZIyCOO8EGq+RdvlNjHTAG6WUTC/CAQSy9kUUwfoPx/7u2+iaVO/3ORek/o0
Hj1YdEuBA+oCg1KRcKbpKzg270oU2sm3px02Y2wMzqt0sObxE5Jdnr8h2lAy8Q/u5yglotgLqjXJ
Hx1pwStXeeAHps+v0M+j6jgU8IoSLIayO6TuXERHkmJheCxHBBTtlTCEmQQlTeqvBs5ko1MHuz+M
oygYOpJCSd0zR8BmX3TP6bzgWXd85QrKFIpefh15r+DlRIFVR9xC+Lw51Hdlm/IBv8Xy7JggaJYP
6Pdem/hxfP+MARaICv1BcRvOWGyDzUSnS+8uywX5FbYnGgP2S1YM/x8e7SNAuYGcAENo3KY+36h3
7aiPDWsSNKIPKzZ0bLDTU1tLqapGH6M+6yXG6VOL4LO+e8rok8yCIHvxaMEe93OBpwYk1iZjFeBe
OFzi5Q2WTEBj1A4xq2nQjgFIeSRC3RkgvrjDqW1rd9VrWW75LZ5lyx+0WiJWxByYMP5ruFyTvUW4
cwmJx4Zg7Man4g8DcsqhpdNhnYO++rOBuiTrmrgpmbVxt1HMGn63jUcD8rZwzHN9m6dT+AkeSZkA
QqR2X3Nt4hGg/SiYufIlb2hSGWN0CVlZDvYb9gdumZnV5vjeMWEZY040TUIDzXriAxCZRNWtDP0t
bWJJmRVl2zPFqaoUfqRMKCIznvNNNXWsrwITmfBq+WE7AYfcpJi7a3KIMjGk03ac1Mn6xJAljTiF
hzsWvFnLQaaZwbXkuB+uGZrKh6c3qSdFZy98o4YUFBcj7MuI088YSpQJZwcppeYB5AaOT5GM3wA7
xqLxxbaJhWt7ZBRY1LO6jioGLhVlFezjAk0kROYh/n+UgvkypeKUEpCxfcZ7ehZtOKvr6cZg0/HD
uSwRqtPIfzFt5vqd2QX2KzI0wZ8xY6oj9W79sNKzdVllOfEOhKRl91Q4xyQeMLLgik3ljIKqSAt/
eGIPxqfMi3mddQMEfaTjhT3QdKxYnmknBeSEmEZKbzLuMgsy2gA5GCRcEHyzR543kEoWn32kgHCD
Df5ZHbhAycJSLz1M4Lu7V4p0mhjQSG1+16A6jxxm3zZyssbTg8x+8VeGpuHKr5ZGBTG34SURNeoP
xw5wGOvKTvqDGPZPszlxH5APyneBt2T+PF0fgRY4fRAbNRwUytPOV4nU1BPkRgkx5MI7na8tz97P
IsIuIv/peVnw5aeckYxm+/DAh0PNip71SNods7834tmrhfqs38vs5yb77thPGQBZUz7xc4MINTLL
8YXnzz00/FUHYcquEihnEO8QZ4g6H7Jq+P8tq4w7sPu9iE8/YI4lDdMM2eLjd/Xgc1TZkqPDY9Qm
n3nYGUp/l4bHg6/DzUZoW+dGxiRmEivSAYs1kTTv6VaISPKpX67kYvZnrhjJJJrzSabbFzL7YGDE
YFwaBMUvP0aFm7ievYHD33vwdLEmTtqdzP4p6ZtFGpKqN43AE7ebo12bFoWs986YW26JKjrnkWuY
Y8P06jahmqHw6ba/Lpt3X4q3AWxNWb4g2CTAGt6/u26zXd1tat4hGykCF9CXFI0+KX3zHIPDzM8b
cN67uOkQfHVYfKcHdvLgLfV5g7uaHKEmlJmvhbWORzK0DQatysiDmMaw5GZVPIk+TaxV6T+c06Y9
i+3mrtJWhscMhk9piqJVLXgVTSh9wUOyPWGSsIdLGyvPZ7b2gy9P07FtGkXk3wWtEKKEm/Nhp8EQ
HjC+YmG0hEyg730qfR1/hlFFnDjjblLnqKgC3Iay3FDhR80UYV3smmwMgShg+zSrprdtpcgKLY+v
nY0WtTZkMw5RJhRY97xbl1+lsS+b1AyWbkeefBl5O3eM0oVxgtfvMuTMc70nPOaUogAJeGdAQY4f
+nVXLnq4mi87p2iRhs2ud6adPMtXHKyEiUUu9/lgaADbX8TEJ4zEdtcd1C8xV2Lw/nRM3HjNWv+z
sJ20y9KbIvgd2m9c/srcevmMWjYAV4MR3Uz6p1Uxwrl37Zk7Jk67j9hkKwmpK9euI2WEc5IUjMQt
lm60orXkNUht+Jhfue3pT9hthW1GUwUKgEyYzKFhHWjQjZ7Eo0fFtbV3TumojDe6QoepY6Y0pSaa
RPWgqV/bNLM7llXV6PvVv612yp7XD8S3c4DqU2R0VGPovkxNxo3BpKwrmhVWydDoI6BYA3s1YHbj
e03KcWOcBlQVp64mlFy2etkFnP+hTAlxfnn++VZ9IYuROFziVXyMQcFjLeH4eotAwnmE9vHqIKA+
/bcP+qPCmEEfIqwUui/beenVmpP8GRn9iKgL1zim1T6Eo2EgAPVvHOq8TtiEo5eAhN6swg23VnUm
qjTaG+u3ul28dN+s41K9Ge/MRT+1RWq2KGGyRCJ5W+hT7ljv+pJrNT9w5MeEp8pFK1KAVavt1RJY
s9pATZFA4suiVNPZDoWBcm9qdC2eEYDj2VSNw39qU2bpBSbksoCDm/7oWziwgSS2YVJR9ef6keQi
lYbbIyTvDNi/f6iCcSiDkH1avPOFV3pn5kYhPLxxb0JpKoTu0ZAbfhKk7v+hoIraJ2LI+Uwmu86N
EozuFcm77/9vluW7dQzJ4z2X8QL/2hx605zrDYQy/z3zDzCXUYAuM35aWkMFtn3PpWlbUbxfeTwU
CnB8OL2OSSFSpz8GmNgprgsq4D2bUOoq6GW9QGTnDIIho7RxsEozizkBCMlXJExUZGeun2yVp4XZ
Mksuj6kufr1XzP80ls6BAx8LU1BChEQyjeagXysomH2bADNE3aTS9s6MuBmnxCtBF8loyb6Bh/aB
oBvVDMiXCcV3yqI+uY8D/A1jUf8aNxN9Jr9I5xGU878snvNu6Uh0BNsUeRE7B5901TXRkn3mBor5
ErRXDaAkhEYhz3vrqGfYWgw2tUltYKGDI9cMgxnxtNlcSPgGjPuee/hqEz+RX08jtEMfqxRIk0ha
3ylbmHAQR98GLNyUxLGEKwH+/Ut96RjPDQcvIairl4vmwDAUIqyJD2bgvT5ECaRkl5pDFDJlp9Ts
hTKAPfidFQV9zpES+WxaVDNdVZs7y/GUfZipjb1/80oRVIlaheEvZ/wxs0DlnI3NpdDtOq13NPW/
0bk6Z330x2wsDC+RLv99MkLl+zaELw9/8DrbErWiYTiYgm0bsaEhIJF6Cf8+bUrmND65obtIBL5d
j6gLa7nVYXN6FfDkZfUC/bJp34wrrRa9DA0yYXVX2NO8L2YIddDx/RVPrkPHd54eUbSNJoS/hYGG
hxXys6BGAyPtIyQZ9RmH4sP+cqvV6KKSXexpTX590RWZjSfCgTIt1j3ZLSh/coLtfY6Epv4rZoGo
Dwlae0igiEZrT2A9sw3U8Tqg8h8ZmxP/Z5FjOogsaCWn9zw3rq2URXSuQi/puwqEOPPonKjKF/QC
AcoLKCsC5zoa6ViZ0Uuu6Lv8roiX8bs9BpIUfBkPNpGn+e1wuV3RY1A+3n+WbTIFqV1nBu0yEMit
qvo+6qSPadmozpZNiWb+wuq3wN9CkUW0/z/BjNULchGEp1W5MaiF1j2tNGI/jr5z/F1thXHZDWJb
KZVSoqg9wMbTqp23bdxKTEz2ywDdQi6MYKdimUFB3Cf6fT6BntraqTGrbjYawwtSu3hpxgRiNf7Q
j7tOFKgJC7H0hZrHCqStnYacpzn1sxxsa26l/azdX9u8gAgoXV6ZuLgDErpCTNPas+vvW8hbTBLc
N1CHp+xruClX5E1xi1ZHF/MrT7lw5QitNQ/XwhplHqPy+vn7UMC8Cf2y30jVk7UzhgDe+Pl/W5Pz
aE1krxNLZfxKGUH/kyIzT1q/fpOinZ1e518yrwkWbIDb+xtRO1Sj764c6B6jLTaA2widkgDbAGm0
OkKVgTheV5WYztaCfstnPanDWVnG2uPU+P2fhdSnRXQywntvdiW0YKmmn3QmLZ81CiA11SAbU5Nj
t5ZEyFIDHmzFqF0W6zriMAV8+lHjfdt/A7f1D/39SSbYIh1WC+25FVYBZsZICLxvEsg30Ojth+5m
kPW0RrKaw8Tnm75MsXTMe0nb9Y2uARSXO9g367cRhlw8F2AAeizaBk1kLc9ViMxGnXlxeslqDOrx
8dT2mRHjWqv/54xoXRm9531CcHfNbLplZ91+/Bg/p6hMRQwzEKWFHB5kLzhTgKcG8rOnWOYP9+fi
nv30rCAFTjRpmhTGrllr6O5Q9QbPm/MvgDthMTtgMnyYj8qZYl8Z4ye/SX60qZh7A1/797U2onb3
Vi5VUKpCjXiMMWzTa7E/zWgk2fE9xUp3dbzk5fR40iGOPOH/hTbWkTDNe/jDLM0j5A1NELgC6/ds
LHz6e2smK4r8oHsTwuA2zbwm2vaeyjqNj05ijU+z+WZrKfRUcpnzZlpYNSEfFoW3+WRe/BCynMV6
Vta8zmATJpshy5mxIZz5hbCVb3AHDEPu/lCUI4qCNsM8DH5ukCAYvaAvLAW6SUYO/Ou952pQWQB3
KgWfm2a0aJrn7jsBv7dJ3LzbFvExMVqsLktzoa+7wJ7E0g58sjzmi+LfaF3/AEGU9hE3ON0j13GM
sNQ5/9X4HmfuQMsqBFR+HgIQrtdLohirdvxuMAvZ21e90J906x2W8tcbWI6C5O4RSaIA7ws6nwJG
d016KxJMceufftEtSvTFF9sc5Nh2pOK0KD+3N5PYTl8yzBlVGugrgAs+fXvZg5kHdFPurlu0Ased
0/5neHjhucEqQnd2JlNH88JJWYK/ShDVhx7jy8qtITgkvCFTFQU0DOqhtdL1Ek1LzZcgNe249GUr
s7r3EGaYpSFU+gjr2WKOooorHWcdZJVbeYOONXcwbN9lnbN7AuxntcWfhYEgXpdnJclCz5vAEApE
64xfAHEQGAnYiET2YFA68SGborAzWEdJoI/g/ReBksLQmcjjEun329XzApXqaIYckGlOLR/ao0HC
YrS3EffTSj669mZiDvKWXzs+RbwVP0ZbDpcHWyFhp5Ixu4wBcM1vikKZLmRcJGwYu5JwgC1+gdvm
rqjVqKZFoxLEbf1aYF/oDL80fgEoj+oTuv+2K0GFTzOkyi4XzbfcH2FDPWFMdwjMRpSihmu+8zRl
YbtmIuPBAgCUsb30zTD6Ti2X+6C7Ji0J/d6vH9FfmqA4oTDILundy/7c99HfYhkjc+nXZ9NoaH31
x3PEsjnoL6JkKbMsmY6AhgSQLQKIkB3eyq/lUSQVbzbr3fVkNtxrOmabVFARZ1gOjrvtd0g5zECy
7De6EWqDWaZkrLLDMZ5S/wY0cXVREvjCQsuWWWPYaJjsJW8k4vrDGceJxcCuMci+LC2i4+VDdzqe
zHSo0Cct5oTQoE/ULZxEphRwshCzIjaVAlCjKcHWL9+9yCqzwT4thCPQafnH55aKvheABl/Auj+l
LM1zrgCscun2LOEq9SUonHWdKEI2ucaGVLYwzVuJ/X7//E9kLj75Xq588uh6YSxCtGXy9Wei9YNy
qFpp9GrSHqwtlkFpyK/+m7D0B6Rldb2huRsJiw/1sGMnZOlJJ8gM1WVYJZRiAqbzvA22T01mZmbg
dEGmqxLpqmatXODeBj1QsGzXlZ1gUeDHIQlK9ug6dVbtZwfJuLeVVgMtrHXYuhYEAXpaF6cUcNyf
ea2N80rjyPc4zA9JT5cDaT4uRX6r0YYtYOSUa4p10VuKHGBVe+xjWDIqQHFgwk/MDiPKwlc1VCdF
Bp/zuPoK7PivAlfNYp/jt4gbrxMn9m1dHCvPfWzYmXmDixY5I9gOTz+T37bi2pbCKu2qAtVNTySV
YNxZ4/K3FmCcP8MucQ5MZt1UNtlmMr9+8Zr1B74xqenDx1IXA1ub7TkdI7IKRazccMvPpbFcYN65
18fvwyy8l4S0pLeOyM58YzS51Nyd/lUe3m+vUDByh4skNMLm2SRNMfjrDr6hRvFGjxh6yNuYtBrI
Lja/SDP/Ek2wQh6J1Flg/cZGJX1tRXT+gv0tjf58Y8udzYlxGDYaF0PTR9vew+zdA62/wSZ+C3nb
v47VOe9GHhBSbkPJYhS8TiEk9Iklp10x61zVH8KyUBqkaUsnFL+mkWjjhSWsTU8/QGS4oFA6yiNO
aLViEWypUHVfTfJu2WxMH2MKoyveSBqGzEdZKLGz3OLafvamF8axQI2CciG7j14w5TBukBbFBHmH
6ie6mbGzz6Wq4U9ZTqCr01nFqX0ScIiG421NI8W7W3Cue76gEZ4DuXhPlVT+jC/oTY1vReX3lm1R
WrFHm5b9cQVTNQ710BFXuY2G+SLp5PK+ihlEmJTOrS2CgYbSMvP8ZbuJYOvwZjz9zmXG6wPMSjtp
q9rwwSGPxaKSXlvb/ozdzUV9HG++Fi2Lh9bA+3Z3BaKBU1UP0JqXIqxuHhr08IEAuSZzdvJYAV4W
N7Vksa1dI7KH6/KNpthH6TPA6Hwwa2HqeNkyzCxRAX0txCIQgbv1qPTFZIhFAUYkbSzrRLZggchR
psA3EESjlAawGPMkV3oOu4e9uYXemP54s82W+kc/m4VqwH8k7QR18vjH5NygsPo8owa29/F3QD5I
4SZXuWgEWB+7Lf4x+B1zzHzRIuRk5V44VWd3loVh8G5tuyer/bP8y34bpamC9o2yXnEzOG/UR7MO
FRBHuB7SxWoti7PXJ6fq7qnjTV89BVHaUgn1kMe2scnLWfxv23zcg6P0GwBXEmw8slnf27o67Ji2
ZfYCV5BveUTOKGmF46LgKCpniUxVkvvMzRorszAzlnDB4zNH6r8eRnpaS2dk9/QeBJ8b51zObvHv
x4RtuAUxspZjnEyScBCKramzrTAwwRQm/8j4cdCAtwU63rIi+t6bpo0wBm1jmcCcPwXMauIrtG9t
lS8AizXu3J6hODSklYwLNGlSY58RM2tP5NJ7U/TSl3csrRb1khRWBxJuquFjTCAvNp4ZDQ9+sfak
CjkNn2oXXw8fHQrLNmN4Ek2KkqHgjUMYTX9dJxCWZi0y0KO7ejEm8knnY2xWbg8m/tosnwd74noy
NZmzO2nv4Z4OKD3ckLsPywTJ23pSo55LTxx2BIIjJ4bNwg8jUX4HzCneKQbnTwaXm7y7eTUPfRcr
b/jY0bgoz08MV/TtltZQf5sebZVX/AFAli3WTveToWRT9lHFqt3YxRwBrQutd2oUMzrAp4v0sBXz
6lBuffZcgohYbMmtVKONx62BEEE7mpPEsbUyvyzZQLJDYbHfHUJo79ATvQpucHORJaxG9XCoMeCh
kst4a2p2dgRZD6oY/BFhcvRit6hF8azpHVnfTKCtq+rr+GBSjsDEHjPNPcMfQdg6/lectYmELN27
tHF7R/2vKfpB4tekMhqFqouVL3QZiB5X8rmcHjH/RGYdNBkTKqR1YK4dDb6uO16i7ceFMcAB87Og
4mfcKy6hHigUy+6O3iqAK/xvmjUvM4PpNiUJxdnxkQFR4vuZ394d6KmN19OfYh+D9czhQS5dNZxi
af03JQ7yFTIBZAEDopVlBPnQETSr0A5R7Xjev9J83+4Ye8nH+YGx678mNdYIAUhWMD6IbatlvLNq
Z7b1DERkOe7uU6XEN6847Qq4v94stKGr9h0QxHc48DOljGjgrsTZEJeqmQzobVVPeSDBDncHlQPf
/l4YaUBzUjLT0IDAvP7NAg7+GWjqA5PunMHtExdP/xNQXAmVADdGNVRbXrmLOH29VszTmCpdi2+k
kDQHCx9WijleWREm1snWkcCIzQai2zOJvAbHdSB9dl1ZOLmyGIrTH7wlk+qBeQWpI9zvTuM3otu1
WfMyn8+HKi7IuDneam9UpTldepTDDJhjQqGP8Xg1IEkD07WsbIGbsjNnaGtTvvrxn1vN1+4vTGiK
IUFspiOp0E3UWbSnBR4kAt/2+5ZLnhsCsFCwU6U63asxxAT+RuLqjfLsbR69f+QgOfjY3EsEd0Ik
uVtneBcNSyq92Fm9bMKFOkDtrkB5S3OwaO+QZaQ0RrNo6fH03FJ+nFb6r3cIlF7Qqgl5i06nUPnk
57uIX/EhlpEy8pCjQPrPMWOrE2VNyXGgjv42hfwfdmQXVsbgxb+liR4+PR9rXHc7rB3lPUAvllkL
ehjuPB8ABuLZxQ2Qlvq1DWaoOdxsgEEykSQhnw7if/PFzPh7comCYKbfHdkb3Lp5F5cqhBmQN0ve
4BAWWB8HkMcsyGEeFrf15tXSujRH86lB+uogp+dPxiTRYurpqTUOG8CSo8CL640OwnpkQgStrsPJ
B9tlD0BDunpwCfPc529wSMxxm3Z/dKX7Ghcpb2YFpoOdMAHcnHCdXQNkG+LGjjzysJpiVJloCP2B
iKckFqMnYUPYUMOUzawiSKYd0xcLlSy9XzkaI/dgYc6aqFL7UdxEpaoCcvwv8D/3KHgfDXqM46rw
VPjY5wCJPXJ8LkXQEzxI+DSgsgFh+CugK6XduZ764gr+Jq6Tz1dsEGgqZ0BKnfLFOF6dPuB4Q0Y5
9QSo1PJEFlvc5/PwNvLnCcV/26JKwqBk32w6qePgv3zpdtwctVnlIRSiIys9qxD2P0irMPJcLh3P
Li0MdkXshPtt35tLbG0CXHiPCGYW4v1p2qHCGBQOCrgX0Tn7Z7NiALK+P0enL+nCnembg9vLzZzX
iOBwPbcUkNMwA7hrACWCkz7370A5EscGPN6roQKt2dgSbT5h5Fgruw/XFaaF2LnjFLMi++PA9Sk4
gUSTHVg5nBB1BSaO5jx9qZCU3UyiK4W7zXULO81SsvVA8jFbyBvpuPnghfc0g49/JociCyzPTjXM
edMpZg0yeEwLAOMo2NhjPt9OJpiKRs06A47nq/QDO/TEvGtR9fu7sLlahxPHkED7SNZYfh06Yofo
a9mqXcQRFXs+t9FzVkOzlLS0Zm3HKQkVGHq3077HnOgkN2gxbTRWmAJO+4X44kjliQoJ2XXJKfQi
+JXbiwzpp9OP8hIhqD3ogZPEL1dcTpUUeqWe8SnmCICAtja+IqY71ELfZjldNPt18Dm5cmPde/J5
+1rlzyOkGFk9xs3FSUB7PSKMuihpWLK9IcwaiCFlmCQa//KRyfyDUiPytgUAteuBfAUcpj4y5EI/
gjv5nFzbm+1l5ok8Ivp+2GJo+6fYb/BLHUBhoRiMQmYI0908T0hEP7By2DLlNW94ijLnwJvgaXHd
U03az8euOCZRcuJCW1gpQM2B7C2IeB/prIs0/Hgmu4K8vsLRYb3o5xsokLlKmae0lvSJ0qzfEFBl
1yigQPq6Jkv9Xiz/0kEh2qdXDL9Q4tM6bUQUoCZ6kXqjmp6v8UxD0uCRe3VnwJo5rTKrQHcAAEQ8
dnWY7HI48PnVtAjVqsJsaKFcZSevd8q6LrC5b445KWCwizL1CPdf67Rsclej1Knog6uM/p3ykDKZ
Vy2D423mZxscmDgs3ZjykqfTBpiQpeoCswo90GrzaA9Vx5kBPZUtAA7l8TUC5LSbyQIRHVIlvsdO
uxz/xXBJrD25El6Z3lcOk/xErUwmtnjVLw4yYUyth2XL14uWP9DHLw8AWqmC6Rrx2pAlJOBnJBYy
vTIrk54MgnyBUsCyBo9BjwJzSTpBEEka9exCnnPP/cWSFJzlNuGwrvljEt6qNh36VlqyJFBFxp/x
ZAaP/xjE1IQFT0l2Tf6uF3NaTq4TNKLWMoP88ntt1G6QHokEdAlyTY/NLAqYHqYM1WY1WRo6P/B9
cnSifkU92xph7BVfw2RGecj7+fyVB+VBozoucx7xrbpBQDUE6mhZGy/boK3EuNZE6uWSmi1H9yR0
uRnPSk2eqKB/2mcrDqJouAXNYrFWpetsob9Hiho7BFyEiSkvzi9ySHeGw4AbDHhgFb8fdewkhvVO
CVbv0qBsc0A9eK9kHGC5lzPMP/vZNlcEhaJKJ+Sdq0M9oAJ9fWvuHGv89KJarKfPGza2zTNps53R
8xkOzyNvYdjfkaY/N2inAZkqFxw2rPWuNmCBXLs1tyZsB8WzLnaRrEq2Gf5QNa4PanXSqq40wK1C
yY+Y1TOHFq4+XkUlsKvIu5/Y/k51/Wjc4nZfSTWjzhx1k+wCttzIjPdEkAMbCaKCr1Ggv9/uSO6+
FgC8adtcJHnfr6nEegHYgxTCxZ3arl79ZaVBKVGauJXm4qdLZGedz0uzU3e/DRxEqz5Z3+skdjok
NDwmVdgP0OK1CvO5xcEqvs93Kub8KmrE0D655PeMwPWzSdLY2hprlj2DJfpc2i9RUgmKBTeifteO
Fr63/KqBubvfUhXNMBPYRQJqPMrOsQU33KcSN5HHlYmlm7IzkMGKOL/HzAE54IKYicbGD9DIlZM+
2nBz9OLFHjqhkNwfOh4J8qpOFQ2RC2VujApZa5eTo19wM+G0tddPVXgZxNEYZW5zIKQ1IeSRDD71
HgpJ7TMbznnJp7WSYXJX/gcacirRz6SnmZ1Ypk59FFdUxhx1AvIYZUOlpARSOJwzl6LkjEEE8oFj
CZdMONPtbcnaUWvtO/Wy5ZEr7kRXHU+zogtl/NgcuG+rxc3SC4DHX0teKXNiUsdgCqtZ7bzG9UpF
Y0A+07uqHglWgTK8Fe95ajU1v0WCIBRjA55zlZMOI0OdWKLpYQ9Rd9L53kgyrajMtuCl9rL19JGv
2c2WYZiRXWZFw3DmtxyZmpQH5flSeBVzOfNTF0sTMsgDV9oaB93SabzU/xzeljscHviJRgtTum4x
3WhO7H6zX+1W9Kptd3/5UcFbjtUrouRYaPVpUrVFzZiNTcA0CuAiK2I3h0ob4doQ4f0bMsSTtTtv
Mz6AM/nk45P9xIG9gToZJuGAJc2Jql+JC5kwywazK+9YVZSNxkFbisXPZ3gv70sqdrGH1//85Gja
5Xb1Z0V6nyKKxPUywzJUYTcvO8ynmTvoJb51KTN703nZdYiTXebtt8oz+8qUBFeEC7dDdKxrx/s6
OY3cdPwCrVsjNdj/CVr+gJmORj0Xf4rzAEqZ/MH8szKEuMmlK1e0Rcn7lUgJI4i6IYLKKKXakYim
iIbOVF2xvRPkwkMXAoOaDNcoG4rkZubD+klGWRxtrpKZc/+f8uL4infrAnXE/97Q9EIX90Uygr7V
RuhC/uizkuLB9jqqBwoniu5oypkgyIDQu1oIWzyFZkyro4NIS9b3VxOPyFlX9v5Jq7Rse+6EQsxO
8Y2t2UOBvfK81us4Ei9l92rZYm4+/1UYwX0bkhrC7pxU4B+RCg6qXG9zBDV5y+f39vkAocTvF97X
YarVMkO/YQMbddVv3AG+YwlLSqyfcIsq4UQfPSV6sXtWE94tIV+TKeM5b83SSq5gA9zwHMLX5e3u
9sRoq+sK+hn43BK15LZpcbfaJx8f5F/8F4EfGLiNUxDS6xGpfDXij1/aqEXvZfxCNhC/KtZ/B5Io
sAfOqWl2RWuiCw2gHHF117bB7MdDeUV1FVFTi1KamPwq2LTHmSPe8CO7JYZzUZqpf5LXKsCoFLAw
y1iWSoIr07PZufZ8YWXycVXW9BpHiXXzRn2di0WK1cNPaB/Y+7iqXkezAdZMQV4Yv5NF9VFBAcXy
qOb09Si74pZjlEiIlrzvrgpQJbTBdovQjZBz1mUFhzSjh4EulqkVrVbZ5COY9oNrqsuHDz0vpGA2
f8oqi+w0pJ4YTEcLfz2xiVLlnCG5KXdysIkdGwO1eyekiM1vh5PI3bTgmzI8rplN3Ezx2Ce5Lz7j
bqjrM4sM9H82T5XTszDtkACAin0RgpENE/xhMXrpEAQdsTAXuyZhOupyS7liIbp4aavNQnBE7d3x
80TvY3yftwY1OoOyOKJOpXbTC+/uHXCg9dqfSQ0BSv9YsB/SejyYMR7PpZWTQZLLGIFFQ95WtRkD
56WU3Canf2IGK0mSMss30U7lUOw1+tZQq5MTjm4zsnyDron75yKaTqI/taVDwougeLWrJZjzPBYb
hOBvH/8U4R6rp3n6Po++hMJxYNhmyqK3PZopoS+D7Lleqmhfwxgl+FdvzwcY8V6M6wMaJcC9b2tj
In22xfLtBuTGijOb4rjvjt1zDkU1DQdHuID98fZMDQ+EagLT3F63sWVb/6f2JdfJL+AijXokJLH6
IcRQVQrz8K0X5VH39g+oUXm9D1qcN5qVl9qS05UsHZuoOoeqqhJjmEGiEmYn1cfS4Y6KpXr4IwSp
7Z+TfPdC0zjNkiXPgOQPFoz8id89q5RMpgOlVx6yWc2QIq1+EhtB/qu7jVcvfjKx1UzZNblrxPET
Ud/TvKeFr3PJExAb00gPPpDcMuKODAdYWZ4ePai7cMQgtfarXY9QhOLtQBV/rpiJU6VfhaA3zW8y
FpZ8ZeYH8cOF3fUE+XOxuLQQwCtBoWe9wx9nBpM/aLcrJhFE/PgBW5Zrx8XEJOcEWTNSmEOMQpPv
YdIuNQhWlFxRW+5ePP3CGykqLpfglBVBPUhNBrkdpu2kq6bDz6UvMwia3jnfWpxpTTmvIxb4rfmn
iJ4j+MlXq+kNzU5wl+VVL2Dk/Y6X1iEjHrM7ZVlCMBQVaRyUNKmxEEGbI9utF1GgkhwPGM8xjbYN
GKAFXmD7G3H4Lvyt1VqsZYcfpbbRwf44XpR8OWm2tlCZtZIx3smKaPfYSZQSh5ukFVFIdT365P5r
FC3kucakGQwr7H+/mmqgYJksNBexFzCL9/SfqpSxWG3i+IZ1uk0b7TzH8P5I0NYJiyhm637h0DCA
E6KPr9z8AWKSyrq/C+jFbjehmeuLlF+//IZj+86QIS70WKRyPvCxJ3Koc2ePDkuHSGoq7SQhqVTt
WcljUyWt6HdekgAxg92uXA4tRtllE3wRLAwjqdG0KTeVp+YDstlUFtJPI1O3CZuhPDBUOUCBMB8+
IeEYn8sv2b+P3bVOkpOSSWWZ9xUFflcxtVI61zaN5+QgvLv0gK2tL1cbRc8yYdvTiZSMSdbQShVr
xBkCsI8Mza35D9Cp54e1NnjZSkJN0emyuGNNOoj3HiPcPTUyEMCuyCTsGeEUmMbQscqZv+scDVRQ
0meR/ntW4Sal7vGRNpoGJzMwKiuw3N6eFfjVrko5dJOJN6NEE9QoJnydIiQu44u0HqVoYFdbM4rW
d5VrvwTFNIsRjWBB/r7txHkYL0ZKeoMk6JhZEkgMCk4HuwGYqhArTVFyJ+fx3YM67ALhiBFyTWdS
UzH5wWKT0XHQkq0EWVccLSLpWsxMyEsu1ue7UV6DVn/X118yAUm91QzDNi9gh2lgv3P8zd2U9Xpd
190srGgo0ldsEMQJ5hFCp3z/wEFhf3aTgSyktoZW401mkfnGfKEFjlSnV9AGApCFFm6SOtB5LMZo
mEaZNLZJHApl6W2uWTCjxgacJvEsgtP8L3IXmLZ4/fBdz6MHm0ZmThQADKma/0quJKwlLqu+DYrI
sBTvfB16ytzoGiar5JgCdJjdBX3eItH/o30h330bb7+LdDExYbk+i9RhEk3IpKOlY7ElmOM3KG+N
bTL4IVHzKy0zjRAFmjuzhBYGtLEXgNGpB+NvOwwW8KcygKHYp2fJ+paAFY7MFBxX+Db7FzeD2pB2
iLiksYF3nSLYtvOq3XdZ7ALYsmDjtXWmpBxlPzrdo2iiLxaejvQ4q42ARsgApFCD9C8Tftz10xsb
Z6ASPbrDbiDJB2UA7u2qQBtSB3yHZeDktjI5IOqbTI+5DVGxwwcEOrVFWy27KXs37Vev3T8xq5KI
S6plw3SETdKsaUWgykhnnX3QN2R7SHEKaWX7oG/loGY/p+v0PPKyfvGX9srKIeuhA7/YAYOrFfI2
luHYrt7X7U4H1O0EC4WeG3VBrnSEsutNM6Ya7rV22sTGVKLgupfXxfcNIPPCx19Y/HZC7lavPwXR
/stqUdcjYm6/y17ks1bT6PYou22eFRfZynInEpqvDIZHiIZSG38B8nmg3uHwClR8H1YH1sqACv3r
2Krz3L5UfYgPmaznG8RXR+buh4ye1ZWCzdFg8PNtBKjH6+/6hF1jAhOTwkujnu/MOtWEomvwlDRE
rhTd4fE/W7wsD6hup1fo2JwfiLFlR9JUkKKhWTTm6p/MNI4zNFynKYJAgSZC3QpjT7YcRCcAtQzp
B7nWGnyU4noGyMp9IHTmRMsLoZN631n8Jig5viBRBKnihNbje/gkgHx+nwq9qL9rsJqgYzg4JnHc
l0n4KEg+96VNMgkDx9dF0x0/oL2N80pgi9xpaBm6Zb47MIXVg3+/Quwr+BZU4sezQi8cLwuI5Tsi
7i2IDMY5rH7CqckXrguL4S9LXPaPhT2BHMMgb39v/vbLOsGFs4Qwrg6vd5wQyvE1DDIMc0BKxr4Q
rjT319Ks3MNAVh4stvYsjywq0ZkZiGychF8XZIf+Gmx+M8oxupyOmbyG/yGF0OE9jFv3/eO0DK49
fHGijJGss1TfZKbEuG0Xpl/6fjiZkzoz+Wv2ZaOLZaG1K1kkacOQJOIJ+LeMwV8OEgbjHmHp5gDA
F/KmycVy/1qvlLWQMh3ngJHHTyXg3v/VA84DpJqljjWqUSqqB+hYYe7rxDOyj7s7KyMhnSXDqYqL
tfEySxydmE/l/EdKzejC5ytEHi8UPSDphHU1SK5DeAnAO3bKHbucPMjyfifj8Px4EugnZllJOU+0
fnZx3Mw2sG8CGFSbKS49twz67QXmpZ3nUcg2uqecckfWiuQiPaUWd/9lY8HXCj1fsyqnzaMmmC19
b6BwjP2uYmCC7ZHp4IIhLBv86TfPkCou+QIbtsV0eynRKrqyOd5jXiDikS+WcYRPbyh2dTtPS7tM
emD7sJdCQOirgMril3u9ZnlMeH9MoiJzb2MC3jGzIGCNG0iaGfeU/CAy/HJnoZvgtryvEGfbxUAf
P5ilDEwhc8ZGzT3o8z3TDUNE4FI6NaeOpC+vpZFHLo5dQ9qjjNfmgo6Bp51m5bXTHmUc1O4FUPdV
nlwOX1r7krVIz8DUI5Cq/7lHRes4w0RtfOQPJjUtPM+NDXd7Yvwm49LSm6aP85w24qJGXBCcJsYi
OuHSYmGygYUpxSpmXR0mqruUOWWsVsXhLMK6NvCE10ktIMXgQJD19ojBvm1Mo2T5u9zhlWN9uXZt
/naLL/bNIRKObYNG28S5eGui8lMAXicEsuWWMYnJ6MzlhdCMCDt3v0hxmCrKEwacIUc1vYvfbTn3
mPb6fqGlNcOXAaQ4wwC0t2Pzb9OoQDgIzocZ43yep1/kcuvEM+L1SoYOux3U+knAgHQ8uxmmsGS4
ZIYVL6wo9+bG0715D0rN9OKzGzNjyRTnCmpBkMydWcY9ya/6YEJO5MswFT6tJmmVwriTUvIwt9g/
PGylLpTQDUURNBUmOw+VoXIzMpx/aEfikIcYwN5NfRuA/ke/blrkdWWX/JPeJb1v6CyKwfW/saOT
fFp53fdECoODuaLYuusA17wgNNkU30YnA/KrZJSj7BP9vAKSrXKhHYQZUyhZ1+Sy5eaMOR/Jtlum
gmEll2Gwo01stWoduZFtS0+OejxNhCEHYoHD2TQouCQ7S0I4S6htWTfHCwnafqvgKvdWz7nc0mv5
gBjY6huCtJwocnSQ01njULuHnaxPtGjUu/jmfhwEhkmDxA1RuAIoRS/0NUqn5itj1693QSscL78O
oEN6rH6ySAGmdazmkH4TYlAhGJbebDj0LvWvhK7FxB44SkpN/VZleXWaVNP3MjI6p7z3TSMsqHAD
+urHKsLozSFl2+Acm4XY+NHoCkfO+/ibFSI+aj0s/0ok3HRvFGp1m5CGG4rl5uVDT6AgvXIe1Kjt
AREaDX7x97gxtYJl0JXpvriQYgXo8RRUIfBVzZNEchOWvTsaqtS0OISnSCNfB9hQjiv4J1IR0w5A
bYECxPp7tE9DFgXNp9D/mJAoOLFkuQ4MipzM8BPGXUvTrsGkIdWo8W8D+cKZk2FNASbMNFW8Yv1J
5zhpq5ILnLeL8ecBLDKotVHvLbJ1blGRILyTVnQ8kclTd0aJIz/p64ZVpeSjcryzMKlSOGmjVwWE
SnE1X5UO4RsWx/QVXMnp5bEqTFvYVeHfd/On9mGdmB0ELRr6Ys+gwt3t4t2OV3KAxBGIC7xeFrN5
IrLdHEbqeoGtNpDDn+gbYY1uDHEmvuv7/1FnzltpOZPd+GR7NmrU018rykMIRW3OLF9LXEr6z+kn
Dz9PT0g50aV1BpvjTbbf+YAY7ullPoORm1ROm7pmZCLjyBcI/1nKaP/5HtUzfgScdyTswsBrG7oX
RMbZqBeEshE/2yYoHsqoAQz/LOIiY88g7QED9nv6ITAvrUt5xV0hqLuln0Lv26J1d0aHnzBkeFZX
alXjEEcLx/2yLuynqhLGzUPfI0tepgbFXSgs0D8W1+jAh18EuRSKa+XqBMAXZIdhhFY3cqHtXXCw
UXAxP038pZxBJUuyIOfS7ZP0IzwX73E9I/MZHr8vDnW/tRbpylSrdtUgV3PiX9loqmKopByUM9Pw
wfIvGpyX8RTVW1sl4ya+djJE2TnlyuNmOZZHACjSweUsyL5bcQcd+qxiU/Y4oaXnvOJy64I1eFcn
NnoimRafoDrma667f1s5R4kIR+8evAJxygVjcZdMSLzgh+G/wp6UrJiNMK12BYQb5BtSZFxdUNjV
iFpB7Q6mlNyG4ITN2pqAhTqjhlsZbLVsy+NQd2xsoVVusb6PrxJzT8aIjw+cNY11Zx842UzsxAVB
J6yXQWCYtVc6os+avqrhFs/TKf/mxu8XDAUaUozFLDToZwWJb8XAbw8qOogrh9Z4z8oJxYALSRIX
ZvjuFgsKvRWhsr9khXFigB336pZSq0ftE3Jt9TF/ux+dvbwCUL7rjj3i+wGrcvQ31vUA0u3kYukt
QuxbTihV2+R0iOx3rminklJrb8T03C3+AzSP3fZ4+UpsXicMAoe92o5dKqdV/YUrLhx0Nunl9z06
Mx/37LVfJ3rmFS2rEnaNcfIspSVXeO14dE6QF2Q20iZVoFo86BC0x0h2x8FwOt758DJy9XAZg/Y7
Lnne4oJ3vlReUYFsFkF3D5i/VVB0H+y+FxvZ/ICZleqNAbl0ciSUbD7hFJ28ucIxzKbshSmr7cu0
1E2yrb1lxT7nOMLPf2sD4P6ynCcfq0F4AB0L2k7yP9h8IIV5IlKP/XPHp0A1R2uKkpCWf+qNk2iK
9SVlhq38Ds9fiZnFa7Q9VffeReyu+p7RrPfYN0AKaA9Bk+26amDbd7qN/UsAhJ8uoiJgOByTBvVW
W44Z3s51bhLYs/wbXs3TUFxGoAkwilth933f3EFDKAePkwSVxL2iMl5yzRYxdvD1XZ1JbFvJEOX7
KvJlGRALkekC+UqppyFc9kkWvAnT4bBCJueUqcAZJKvA4/QQedkPGowPBWQ7wd/0YV/oqnM38eDs
MUV7Oqhnju5IsdSOAlM/Zb5zy1BocIPnvOUuyOpIakvMLF+fvN5dNyW7RuLxGCEbS7b2pPjn76rX
0cWJWHXakECRtov1u0VIivbkw3kstow/x3Dh7vF54/treFxNLzVi8TLB50wfrd50PykEdR/2o2Tw
0qunpFInS/gI6GUvRou3YEYp45gtj2nBmhItlBMxJzJk503W/1no7zLQeh9TtH1llkuEnIC3y7gS
4gocZfGL2BApaKOFj4gWA+FJmtcE05/1TS5Wn3D93BdkQlrz61aig+4iFf5CTyZIJg69JpH4iWj7
5T84p/o0GBfQfUjdbUmWIBwoxWxR9S1qJ/kvOQn7Xoo/ciQWT9kyB822IevDa2UMTTnognt62TI1
PKnIPxlEHXNj+6DiQcOeeJUdKTCaaRu+dKtvmIDxuHI6/L0CxqPJBxwGaCo4/X74cfvzChwt51bC
3Ct89m3lT9fmur+Dlt6PZ5k13h3KE3TltBuJY8vfoEXOFzARHCOtS1ljL0NxP9dNFnxW+LeZskvO
4Gx9Tip/4qISApvJDrVHMUO9awqUdgJGreNyU4C/yl9xVQT81FAxp5IJhnolqZeQmkzxwN421ujc
OrfhDOG9ostOF9QvDMg9fdTTKuqvea/DwQ572pbpXNb7ad0Yb6qS+iqz+7c+pmf3RmLh4NPGLSuf
Vi8qKQz2A7ECXAlfd9hiAzmsC/TESp9zai+WB/QLmozBMH/XwW7qjBqiNBFhYVEGWs9onvTYNzNh
Pz135aWu/KtUktPTsgtZRKogFuIk7DrJmx0OeWeEC4WhY1eh+i1w7BLCOkzBvsy0qjT1lwTn6kig
cySLc8SUH7tugEjYP4V0MyUJ8p72QlBohZVcgf4cXW3Are20NIKZVKg9oZe6FAIyxri2zhXg19MK
y1hZmhpXv1cplv4fi20OJVIOdm/phhkNVD4pTWLdriA/RMWirW/hAFqR5FNgI3v+tpzhlXuL53Hu
RVoNBK6NMEEbo7S3f++MhrzVmgfm2ra374NKkaWAqQR/KhwTGVMRBVSTnSfU9KUQq6SmOxe2YGiQ
IlwcYR6EjaUCulqgowAT1RZ6D5zvDKSGJct/6NbtV9//u3SFlj+bcZdFJtAv25SlHMyTqWDlm63d
ZgxWjZ+XvM7//z4dYLMmgjtpXRhN5VIJ//GCpDEe+Gtg8Ctr/ek7BfgLJ/OdtUBWEDtzcQ1q4/oo
h5zasOxTdHNikAkhfdTBICmxDTGF8LIN+PQf2pT1huV8WFx+KiLJyYCmPHJRAeM5vmqRcr9TUdA0
cpGW51NQ3mTYdJZnWszcMJ/gzlXhVX6XUSwkm4I1WtZUwfTJfCaobPawMF9Q/VxAZQLFNKBuz828
dSbEEPpFZdjZbQcfH9hmBUU9JLMLtBK0qHcHDfNh8vhNoPoxjq8cw9cqiZO+71q6D9c90oIlczzG
uCBDq4vdT3k8urGyyPzRo5nLiW+TYP+vm5yuJod/7vrFdzw5IcOmrplmsW3A3RBDZHbIXoFd0Mov
nl7bEnBb1BNP+ViRWjyy1Pyh8Z1f2sm9KaB11LrLYwXbq2JUG1oBhzq5ITdMa8mZ2C8lVvGRE90n
kLO+vBntSgJlAhp9L5rksX/JKKUVkYLlVRJxiKxhUeBpALvDUS0s1olf+qqM+Zi2B8DbOIeurYvK
eutyef7tJMTg18JPy2CBefTANsBpJjzXGi4Y7mqLPpabSwyXPTfq+ru5H7/O5ivhU6g217YyerrK
H0o5apXU/hq3dzxFhWL/l65Yp63AwDxrAqCTHdHTXUaZocktwzZDHE5l8BFterTNsvR5lZT0maA/
XHR+lK2AgMgAartmrPQP4gz95tacob2Tn5BJwLwCRDn3iX9lrGKid2IFCyBkwEiAfe/sIrxz2qTK
ABUy0VB26erpCU0ViAWWq8TEzcVKBlZgF1/q96L1RGksszYNY7PMvZDy0g2ZlVVcjcEW7Sd2vpae
7lKHQaYOv0H5WEH4W+w/vuhWUqo+JRYR5KzNMXEL58SNFHdYGLNToESALpY6gMP9Va2OV6DzaW6h
LUK6kG8C0149kbLQzccS6SrBx7b4iCR9jBjS9YdAeFuaUi9Y0i6bRruBW6cwd0LmOT34jzUu26qr
pGKgOyz9VRvj17TGsZeCOY+rEBgLhRWbhnDHAX8LgSo3UL8x9NLYfaGvswLdz9vhDxDkEFSVQK0j
yvgus6uRe1lWrnvqrAVasI4xcC57ByZr6Uun6XEOIYWo6CrQDWXe2k8VIf3m0D76ynCN8OFVp0kx
7ZGnXPNhdXiWueXmVtmultvktCCX8PWjVDtnoNMXiQOuMyuH2j5bb3FINh9BDzoPaickYw3x9xnx
ue3Riq3YrVAbbhiwGPKcGA/qXLKtRxdVoApLTf11imvwo79SYIm4q+q8AnFY8zoKoIIY6aJLXrag
ERWA9JJSXWgPXnbr7YQVU1/qicRpKqMe3Q7fUN/umJnyNAJaKJ1SbK7EtirPnaVztL/4sO4jHR7U
6Ogys+SPkdwyVze4tmdLDeoA/Dx2Z7X004Ffd/awHmz5RXUsQ436EdCnlupNf2iKrYCJM9HFly6Y
EC+bhsa0a/kuG64rHLUEoqHezXSyuuOvcYaQuZn0JnjGPnfGnGcaaOv0sQmBU1d2uYBiqMyGTUll
eMJIT5w36jFZTQ9C/oKgMunHTLyo6BW1B9zJ9MicNIfX4qTXiDoY8T/T0yXtt91nE6xLkCSgEfuG
I8AJiWRr7s0qnYuZu4V5YC6txriaJixtHf4+cbw55eUa4bPuId/jjbQwsuwo92d5qy9noW6dbGNO
M2OcQMhSNqr9kYoG6f2e7R+0Bz4tvNQVsd8ftqztaE+/ZXjXAMV5ryiTKvlFkDDEVACq9L8mxY/4
6lWf0dF7jhikwd9ZZBHRgZR82ETBml/d0faQ195zYuFw2dF2+4omk0SlsubJ2yfpkFX3RPK1C1O4
ZjAmxUXfiJnxHgXwm/AtrDxvhLmyivwG7jm1XjVHfyfL/AjvLU6K053PUoHALnXMljr/SI/8AeD5
5aLaw2Zj21PDVlaKpvPvSNobPLtOXPswZ4toRQTal7wKjxx+2hDD7kxuNzdV17D3YIozJNEn9oGa
OUJ8e78cXJHxXeuzIS2rvIkNKnZj21hZDYQ67nsWOZYWZeZrs5EXwtcm8P24eXYjBDw23cbG4Ng5
eVcUYiefT9Uxws0LArhoxduqvvu2KhhgYMe1Bz6Jc5CSEGpilcIu9TsqOBd2LS0eMGRJn92/qm4B
qd98OAGgZPBKHY0iXPJ7oteoerbapUkLrH4JNA81w906s5dJtxCaCtgIaYKd1kQKzPUyAhH9VIGu
k3Ce6mWFe/W/EVfNwzMYauxJkjxclZCv7kSVJzs9A4zU7AYn5LciGP2vExjGFWKcLf/C55GgPiQX
WuKN/RwVffM9Rroa1BIoMH1SjIYzOL8SYBzZV5RKPOfQOGkt4isXFLQmiv04YnHqQuyfCL51ESGp
jpXUKOU/KiH9cFsWhTXxs+Ht7r2nJkj1swZihBPrNOpl5zObfntOhDeM2T+yMaIdZqnA1SQOIHq/
M7ft5kttqf/8JPRKlZxbMVhPypjrjX7D1UHXNn3A2J+/H/crFfVuIzWDB7X3Bx+ItkPmfmFBtHGK
PClIEsDfFYJXf41PCfggd677WWU5UVW3Jb7sGvb3gf+6x+OHx0dHeTLpqf22VxSN+5dJRaq/M0OV
FhZB8544h+f0ZF7MF/MMYonZ0iD/EW8DONC9Pp4VGPp9QUm3KH7tY/Z4Z5sh4zGA0fTza1HbihHo
ARHo84/iiACJpEPITsNdUasDFp/1cpepHot9DlkEbICW/6CT3uLqjYiIU6F3YyhgmTu4Bxv6MlYx
PXoZ25cfq7bnBcG22fxHn7lkRi4zf94IDBiBZW79hZjbgGsuKkuUjVsFhcVvNQV/7pK/h8xdxZp9
YvTbjsxtXbbqOV4wm9B2FWh9RDm8EyzcQSt7Ac9wj/eY0jCJNU7P+vF9340detsAGJl097q+C9Cg
onKDzp29+XyiGeG/V8emyBsRFQ0bu6Lvg1h/7dmM6hJIcBJ8USEKjS8R6mUGxWkKxnBgrHxmhIf/
Ul7MC7wyypthJYDbqrAEAEx73T0CTPhumTQoyXcaEDk8GTJMGQPll5O4JjELm94L8aT6V3X7e6Y0
d1sKqZFHdBDPbjGLRALn0oGprHPqKa0Ig75hXV/zknz2r7Uhg/Zz0osNw0iwqOKGP7qprEKQjaW3
kmQYeqiNn78XSh9MjdvUtAhcML2h2ZDgGmdBdsA9af63aifJzpIvJwDZcvgqGJjju34pAfgjjAXH
cB5pGJgmSzZtC9o3SYq7GXsvv5JzxhMMKHaKr99aH29hWBvWQfFKs9ZB9G7eoM2iSghT6ftfpOUh
Kpjnu4uZQBGUu3Y3R+YYZ14LpV5eC98zbyJ1S5RYh1KQV4owqQCkUQ8mBgtmu5/wSVevMAw4+Hg5
fW1FC8sccdbQkZtsH2AucatjQPw8+ZAAYC5wGJ+phy6PCK36XD+uK3qTtCmX02TXyUNCiHwil2BQ
uZ73Wb6xZoWPHZcDYhiK2Jb4m71cE1ZKXyzeRwKWWm3DbM87Kd/9nD4fahnqV/sA9MjGx0XkSC8p
5m8rIYLZCskTeryZctNrIwoYuaPCatulQ9P7+Ml5T73C/GkIUuc0Fg9mjBUtzbNHwLa9U1WlHFfH
oPtVzsh0IXhLBN+qfD/Fdm0rE0tVsjtiFo9Xkh0TvtM5N9iAxt/TvV/MEbn2s/T7Ga1kAzoLusYu
LVLwx3BONN3cLma05ddg5HaNJXE3NxZvL/lbzQROtuWBegmOP4u80p7R5rzTyWHllMRGAnHgBQXN
aIdmrWxSXnV46/PdqDq463sT1hg08CCY2yIRDwNXcCA32JUBEQFcdWq/9x3dqEdfhFx2fBDCrfFN
EFPZ3B6GfdciIscr030+aNu9a3VvOr/JaqCQrrhZQ4HJJ4ZCK6B/jfFCvBoepz7/fJgo2WJksGTQ
f0cayZO5PaK8lKmJrHtWrXtpGNzFCq6SiCcYz3pR1ojYzjuKhGzej4bSzzYB/sxXtOV5Tn1s0/yp
Ve8I2UfJ9ijtyxXmNYnH6P6WaHFiPw6dABWeKElASuGnZXS9uEH1OZrxmIcrJx5lNWxfP9kD/+52
7rGq7xv2tNJ/Zw/Rg/H4RK9qBj6G90QIDQcpDW99U3g+MPh+zTErdjhURiPSyw2xKOrWeUTgGk3L
tnydnbb1XHOYq1ntEjf7eyyrbEudCNeqdf/99sFV8JI8eXeZrkzyOzsKJ0wqYA0t+m8KA50LaLvi
wHj2PQZDlZbERGGM73b1KfoODW1L/XLodBx92CiEyq3KwZ5mAVbovxHcU0zGS7YhDKC/Gy1jyi//
94Jg9Gr/Rlfg3/KgDrUAp3lvW0+SMKpkQbbCgYgEI1bh6LzVLVnX55R6uPhT8rOj6cadjDK5hLq6
gb2MAunNSTPvzqVmAsZ5q/Ru+zgtjTirCW/7ha3cHc8mdQwIq9PlWW1/Plqk+QSZrmKR3VBEork3
zNjuHFayTkTcV63oWs9lRXMlvuVR2yTovm4KpHQKRhFNWCv/iMZEYep6TlX2dHhE4zakY/xoqc6d
0X2cf1cJIKleWb7L0EulmAF6++slArAePKGmt0dhHoe0IlsSEP/bIrTO2Z3Nsr7jgygYYMUe/ejB
33Ux/BPDUgp61xXv83a0j5Bg7h15sSELRHxjipNn/Pnp3R6TEZyCL08pD/80RUHiZDVHLp7g5cIT
xyrm7b4EbwOocdxpxbh87j5YWqM6zFOAKnbOKlWUaGSoSPHi4tfUW5V96EwYRu4tRT5iOLhynZ/n
ISxQc1R05sF+P4wV2GQOtuy2JGB1j2FJx2YTyw6S69eQb3VYwPoCNVnEXe2D/SyVmrkdAD7S+IlI
UO6GJiaFFFB/vbxj4bsmat2BdKPvyCjT5cTKne8o8U6Nwu+W8oBrDjE7096cJfXLcInQfguiu7SZ
kmsl7EIL97HwRg554HA04hGOcGGly64/Gdrr4SU0Kkm+nTecNGU/a90+Oa78eKOX+XWLUTnyWAtM
Y/CEPXnW4T0dsHbMIwNL3wSZnok6/cd53mr7b6WlGdc9OosVdEHw1y9VK/nLY7A+yGbGFF+EcScP
XhHXmkARFgc3SLamDkSqfWrLf29ff45HCkPLepdnXAZQWu7lGpQya9f6UnhYxkyH9CJYQJN3PGD/
vecvylyjAAbIupt6YjzbRruOOoKvZ+DFKmUrkSVN1SNJo8AZOJcEx+Z8gPeWblIN9njeG5D9/kwC
NdpVBcmJkWSNMbh51KgkOHXGDwcK4B9roRttIwjUgcW3VKf51khF+7nhhGy2EFt4LR8xr1VOks1y
FxUh4evNVOrVY8Zypmb3glxdu0y4VNhCPpxi9JFYg2nSD6ecqLeU1/GKnlz6NtcForNN82LalCa2
egq0XczN+8wv9xhqYrNPpIJ1zR/x8LI5S9rlSQznXkJri9JcEHHY1jMC1qYf2rhbR6tqEDXZKxWK
YxfNh0/qVbH7UAFjcAkwsoMNWzCQIfnL8m1qbRIFCxLuzZFJwFSmIkSioOkIhXJAKN2+mbPrbWrf
mpgsUSVqV2FvCERVX9JnMabp0/zMOOYSGqff00Ql+zMvj1g6Ap27WSLHdiwba6RnDDKM1gLzqXqx
IbPt3QX77eFfYP+Lyy77m9o1zp307z94ctQwFyrIRmJNfVpPZRCdHdBp6EquwmxmTGMXo/OJkOoD
TRaE9HEmMBadMYVN47OTp5zjRzZqJ2YQEeNbuXXN/qRAca8TBkiQqIocp9ts7W8Qm7SJOgFiNB3r
0hvlzYbOi8zuvb/cASdsGiKAmATtXPLbWy0WNq2M6mSrnkbYxwBZSNN0w3hJbMrESfzXMyItWTmf
EvForiIOQCoCwH86eUIqTv68qZWhc4FBsA7a8VTB0eqQ10F5hvAoINWJhmCFf/3CZfYXWAUC2ph4
ikkveEb/uFA+Z9rYekGnSkRlIvlyS0CGmKkduRPLUp4fEWsgxEywe93+iRI+yTmCZ+TWrHRhqo7l
SxYtKPpdaufBWeNSehbQIc823ES++wTS6aBs9fvpblQsK1p6dn3S/i3th3tsvwOG7SLuFeavo8w/
Iot6+I4m9U2NzYY/C6Vpz1CKo5YkyC7HHdhvYl818HnfFf9uQhFhnKYn/x2bHYQrDPyHlwpexLNS
6B5rnkQwPYR46Mztgki9XqmrLckNEDPtsiAzEHYHLR9YW9iNkEAX6oPRydjL2dp+X/9yN3Q2LDfu
eVUUU8yhQniktJsQ5TzcZPZ1HBZSSfz3OyImucFlnPZ0D97J7nIkQR3N/wuYo7WXz2uJGkbZugIB
uUwD3Noz8AdNUgVeKsWfP4JNPu5NWrJzvpb4R+a1c3s/GT8zZjoOHT1MD6Mmbvf1a6A2ZGFhFlZp
b8Zxt+0YsEMK3sbDiyhpQ11fqoVc7Tk6gv1Vc1ZyF/oIbzYTYD08GLbHtSv1lNgW3a/JSflWnV6x
JvyjXuWe2R3MhY8GmQ//VwKkKrczlhEKH1xRAGK9tyxz3bSEiHuqgyUC/tvJCNyqUBXDiEQ+EFep
XFjPr5CnTqoPMBmnJZua6ynESmbCz4ANLmldeXFjoUUZha5kc6ZvPPKKmNKvhgXP/xny1bMnjgxC
YmFbT+xGy0WH+p32pOtfsRYEfAfBmPwC4ec3PilWF3KRwzXg4aQ0AykL0dgV0c7WThcsWqU84ek1
p5v+E5NjvkvaV4YaX7r9qtbXEXKBFBvMA+fz9N/iXAH24SPUjX92cLw0eY53mYUCqR18DhNQQGG7
TWnt6KU5K5wok2u3k/Gj5RPQd1Y2ZC54gCkJebedPtj1Vw/nbQ1NfTZC+ss8vHZB5hwzLiLavGGB
YudCETprtFkjN04tAg8NpFjl7rCv4fC0ahEvNYzLKSf+xUr9QuxIkew/FLy+ZGPt7tmaBVA4p7ZW
0braqBSQ7kTK69d/6o3roR4aZB0su/+v4Bcqqh+w72iBUG20vApCVtzvF/x7J4mX/NPmYkMRlnPw
EBL5+GvmUNZmRRntfAjMPo5pxdNrf25pRah6TdcO+mTdu77LJFl86P36SLW76Ma8DAOFjZn7Eqxh
NsgSP5ixOdpUTSd35kcErw7DicmCfqFDO8XO+jpUOZDkDraAkmGRYcgkwPY165q7T/A3SZAjImuv
naWnD+swksWiuIPherqb1H6oNNqcS6zZIkCKjjomFJflMTYU46PgRjBE2hG2hJIWZTdGuA6Hp3he
uVO3BZ0CR1mx7qJavVHZc3gvofgZeCo+9yGdQfP0KDnsWmHhvxBvq8JqDe31ViDVCIPJYl1Nl3hf
d57qSHrNvmUbOB4nVB2FIk70m9LIQ/QOUYhPM7PTErr5EnK1K6u6XQJJkZVyUeFTQmBPrKF3Rgq0
5X872zehmxYM+aEjTCUkZIvzxd9X3JAQcWywkG2/4i1F/aO3QM9gBnuJfgz0tTlfm71GCrvQsXxk
Tnt//596lr/nLVwscSo9iZDBYEUjLLNrjOPGo5jGse9Rdh4212dTNS9gvu0DEcvrG7Q0Bk9cPns2
rjtx/l1ZF5fVjzhbtBnufHmTEahwV2g9J+PEcZsCTtOiUc4yJmTIlOpxLqfXswraWRZuC1+Lf/Pq
t99pv+hC3NIRqeYKyARWEZ80KP5/x1sFEi6dBiSjkAS3UWqbyEGaoNkizU8nQusHIwChsY91P256
1CP84lCJ6yjT+lVyl464dP+j98ZwpOYsUUVYOn290zDXe6FICMqHCYj0Z3pslQgUWvpg1pvyEdzp
hPRsqB049lp12bGz4YjTN7S2KFHPsIyX7NZ9SKHjIbVGqBHG2MZ2mTyGOp+sdFRabwTPyQ0SZFGq
PZxYQnVHYBg5YtweZCE4Ui3m0RnosTMpPPFYiK1pbV9ennl0oSUxJ3ScMvinMb4pyHZQ0gyDrMQT
7WHSAUPYODGXuPrqpLzk3uIoBOY2ZQPU/u108cwNpCOA5jTa4gflR57clIGXk5rzP5olqoAR6qs0
LRhvtEn8FPrP/E9A3vf5E7m6qcZGy79M7t5X8vLyQTVsjod3SxpJYvTwiKm7JpZlLmHTjs2LnTfR
7CXmhe8ktIHvxUx4PJ8W2oG8h53voUbjsIaEPHFf5+2TeTf/MBlMkySB1CUNy7CZ0PI+IOOhf5X6
NXB+7+66fiD3jebVpFhwL4oFt4Sx91aVOCWEdG7GtViJ9iCGiy/soWz9bCdFLQwkFHWKGSchnPUc
DNPkKbLU9Nnlb1b2feU6fg7SLt7muwoP+0f7h7CuEsr3JwGlVDb9jGXzJHeu+PsgMJujWM9vHDCP
OpIOv7h3rKgOKgtvjgabG4OoU61d9Bkrm6UdHv7iCRWQkCr07NRDgIgFD2rCjJmI0s5Y8go2cB36
citZO0J8lEYzKSoVYMH+CMxhXOG6gUuV/j0a7np9mx1LopX1p/2aDQQ6B+Xw0RNPBgHOsIg5+DoF
WvdDpGE9O7r3EjWA760AmNF3JEAwsGH0uAxtfBqJZjfo8HihJFEPbXnntwCacUIytl5bzQ9MFqv5
eldk1Xn5Wdp3UmJsBy5IRcN5Jv6/bimySmdWuoJcHiDStlsW9h+AKtSso0pyQ6s4N+Q6/MRVif5Z
3CpSnbAVunCdRkgOg2yAqaQClqjsrQ19izM0/rCpKeRr6WfCYZuacsWEuvrmDqVeCK/G3HGbrG2c
5uYWyOxQ0i68Lv8eobmmz0pb2n5pacbB5hEF9B0Y3HjPg7N0cTiAbpnQMn41G6R3kOU6DxpO2t2N
RnAoh1RWITqgVp3AS2hRok23u++2plGsWrV/dB84TqnuTvERisEx9opZtRFPoyOgHq94I8EjXCWS
gvYNGTVF+eDZ0yC4u/fTcubeNBo1oIy2OCp51EZwfGxOe88M24Q4t6Fv/MnbFJBHlJq/vOpqAq5m
PuLp4qTI5LN3RMYTQJEu5KiIag7d4sOJTDErzjVfLaVg1Yvr6RQuDCu3Ksf5K7HFUDo8qtTFItEU
J4Tck5m+NNZqYXphxwRDJcaogF+poZSTTZZfJJsJJDd7qaDyVHNRF8srwgsBdUGkgTs1GX1wqZ9p
s3xwJ34wN5hss+iZXmWws3TEzboYsjR36JACzbff4gVGf4P9c8XUZ9/f8jyd3Z1SvpJu0OLwtrF0
RcigD/ikF8a6B0iRgirbwFlHN77dIDCadZH75HKiZHEIwxrN+7ETJeKolUIcXswgxhS2+qTd/fCC
yhPn4yjjMfGlozw6K36E3IwjQKedKJ2es/LnqeHCzF9iOh9RQE8mSuqicXJ7mHltN9yRY+n+SkfJ
egN7Xr5TFZgS4GM3WOMVTqZ1Esitm+r5KF8H7CCqrheEAMJRQGrSWtcIFTpqo6wjkbokHcxYQEJw
TFLMKrKm7ntX/Lds5I/v8/tn5FJ3u2wnE7N8dVCcxyBDllh2wTFabedTBEcCy7SWwAAD4Vx3l0JK
B5tepHpZNgdC1o1vyVT6K5saqSSqbGvvtnhAi8tcLEX2Ye0uYHVTAlcmUAs/Ln3AXGWMdBnxovEK
+rt7mNyjSnov99WRhgWWYpdhJ1WACO/wTaSkDfEolu2eeR2KiAwrlze+t3EJOMlWu8raNJ6X5vhU
KSDZmRVnBchcihAkNqJ4zu0gdI8AA335mPQuTkvyVsLC7aW81EDOpu9fFBbEPqFdGBcqn0FMps1S
tOKknBM9QHXEPmw+7DJ6nU+P/R1rBFzp95C6AsaYZlgZxQMaxNfjzo5WhkhhDQJbYT12WvCqvd3K
slmobMPRg0oKYaG27+LypqdOQD3eZBM5t8fRjwD5+E4XnTuqV/t2xsnNDERIybisfOnkyI1mxYQb
QLTuZ7se47PdONqbHYbf/jXCXIx5otEx30xwg2j0mb6gena2lfvntByX8fyfTl9WwnSWQJyATP+W
1nyk1goxEwx262/jXPjqdbAS8V+m6Pd0Dus6JvORot30PB+jfb7OibGX7DL8APOCHA95DPsEKNoU
T8PP64czwKWE9gPMikVldzLg4TTFULoue+/PVNdcMWCm3s2O0VZtVawz1zIPpWtvAoA9YC441ZWF
7j5AcFsLVNqZmRufpdgD4uCDeTl1d5YLnJfWCOKNJ1XzbT006AX3RAbP2F8TydQTuk40xNfrI3cL
smw/W4SynRMBKzheQpqYco+0zkMxfyFtySMzyn2GC8EMS8xWA0oZqLLKLzRdnx02w+P6q0FWTzfk
QNN19K3A4beiwKPdH54PGhhwvQKT9lWThoB5wxqYD0yESgQDcsRm9M6HdPT8uo8swWCwvURJ9/U2
sOdC+QZ9mI+OekYO0de6a42oxmenoSbWnMLt1Q5gtlcmvrpKUlgJZT9gb7havGi1GZT+5NoBBn32
uaS1c1NNGXNgXncdg3FrhTEMQtR+R4Ft1wF2iWvTkII9pFuUlSo9R0f6W7aBICWZwQ9L9xEEMztV
k1DEJBbXnu44vMtBjTBkagCl5NI5WB/sJHbL3c+pBrnCS9VFwSQ3YTbaj4ppowdifYMOIOswigl8
cxSo9WIuMUbdoyfVgRTqKKhM/ht9E4Jb3xZGZVI4s8Hp+XzT6FaA94fpXGNuhgERv9bPFFqT11ta
2PXxVbgJofJSE0b+RmqPpoHqu1Ml7O2wPAF08vF4CFnNLUZ+SQfykbL+QBIuAxApDW1g/iSRVozd
sFHbUNZBMHgn6j2NMHn/YfNY/dEJV+G+2qE0NoqLRxP8qXmNlzbWnDw2xlJ5JLc02FoLg+OpbZHF
jlOsbasoJmjmRmuKCGsS1XpwV5eTqOTWnL8R1zi3AspEuShZBUAWF/ZbGPQHIBDbH80TKE15jlPt
HInIHHmMNCUhAA7od16UsZ0/IZs4VKvUMTKFkpfQ5NwbqLCw+yvb9RtowHNEnTHfmF2BMFRWSuoH
xlMBGm7V/XqWuztp5MSh/mRBJ6ryofKLjHhVeSOjVEBgITTT6cpBhbNxCimOlCJ9cMB16wswQWXI
SYvo/k9rK+qapL1ygSYfHbE2LlKPlkMfKrVR5+ZItSM7rJgK4X0Y0RDVZ5NcbmTb
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
