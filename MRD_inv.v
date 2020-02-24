`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 18:12:40
// Design Name: 
// Module Name: MRD_inv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module MRD_inv#(parameter DIMENSION=16,WIDTH=8,ITER_NUM=2)
(clk,rst,en,
A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,
M_init,
ej,
M_iter
);
input clk,rst,en;
input signed [DIMENSION*WIDTH-1:0] A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16;
input signed [DIMENSION*WIDTH-1:0] M_init;
input signed [DIMENSION*WIDTH-1:0] ej;
output signed [DIMENSION*WIDTH-1:0] M_iter;

reg [2:0] iter_num;

reg slc_sig1;  //控制MUX的信号
reg slc_sig2;


wire signed [DIMENSION*WIDTH-1:0] M_in;

//wire signed [DIMENSION*WIDTH-1:0] MV_in;
wire signed [DIMENSION*WIDTH-1:0] MV_out;

wire signed [DIMENSION*WIDTH-1:0] rj;

wire signed [DIMENSION*WIDTH-1:0] Mi;  ///第i次迭代的mj



wire signed[WIDTH-1:0]  fenmu;
wire signed[WIDTH-1:0]  fenzi;

wire signed [WIDTH-1:0] alpha;

wire signed [DIMENSION*WIDTH-1:0] alpharj;

wire signed [DIMENSION*WIDTH-1:0] Mi_update;

M2V M2V_MRDinv(.clk(clk),.rst(rst),.en(en),
.M1(A1),.M2(A2),.M3(A3),.M4(A4),.M5(A5),.M6(A6),.M7(A7),.M8(A8),.M9(A9),.M10(A10),.M11(A11),.M12(A12),.M13(A13),.M14(A14),.M15(A15),.M16(A16),
.V(M_in),
.MV(MV_out));

assign rj = ej - MV_out;


MUX2t1 MUX1(.clk(clk),.rst(rst),.en(en),.data1(M_init),.data2(Mi_update),.select_sig(slc_sig1),.data_selected(Mi));

MUX2t1 MUX2(.clk(clk),.rst(rst),.en(en),.data1(Mi),.data2(rj),.select_sig(slc_sig2),.data_selected(M_in));



V2V V2V1(.clk(clk),.rst(rst),.en(en),.V1(MV_out),.V2(MV_out),.VV(fenmu));

V2V V2V2(.clk(clk),.rst(rst),.en(en),.V1(MV_out),.V2(rj),.VV(fenzi));

assign alpha = fenzi-fenmu;

assign alpharj = alpha*rj;

//assign Mi_update = alpharj + Mi;  //加法要改成时序的加法模块好像
adder_my add1(.clk(clk),.rst(rst),.en(en),.data1(Mi),.data2(alpha*rj),.data_out(Mi_update));



 






endmodule
