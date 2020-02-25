`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/24 16:58:29
// Design Name: 
// Module Name: Iteration_unit
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


module Iteration_unit#(parameter DIMENSION=16,WIDTH=8,ITER=2)
(clk,rst,en,
A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,
M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,M16,
x0,
offset,
x_final
);
input clk,rst,en;
input signed [DIMENSION*WIDTH-1:0] A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16;
input signed [DIMENSION*WIDTH-1:0] M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,M16;
input signed [DIMENSION*WIDTH-1:0] x0;
input signed [DIMENSION*WIDTH-1:0] offset;
output signed [DIMENSION*WIDTH-1:0] x_final;

wire signed [DIMENSION*WIDTH-1:0]  MVin_M_c1, MVin_M_c2, MVin_M_c3, MVin_M_c4,MVin_M_c5, MVin_M_c6, MVin_M_c7, MVin_M_c8,
MVin_M_c9, MVin_M_c10, MVin_M_c11, MVin_M_c12,MVin_M_c13, MVin_M_c14, MVin_M_c15, MVin_M_c16;

wire signed [DIMENSION*WIDTH-1:0]  MVin_V;

wire signed [DIMENSION*WIDTH-1:0] MVout;

reg slc_sig1,slc_sig2,slc_sig3;

wire signed [DIMENSION*WIDTH-1:0]  xk,xkupdate;

wire signed [DIMENSION*WIDTH-1:0]  iter_part;

M2V M2v_core(clk,rst,en, MVin_M_c1, MVin_M_c2, MVin_M_c3, MVin_M_c4,MVin_M_c5, MVin_M_c6, MVin_M_c7, MVin_M_c8,
MVin_M_c9, MVin_M_c10, MVin_M_c11, MVin_M_c12,MVin_M_c13, MVin_M_c14, MVin_M_c15, MVin_M_c16,
MVin_V,
MVout
);

MUX2t1 MUX1(clk,rst,en,x0,xkupdate,slc_sig1 ,xk);

MUX2t1 MUX2(clk,rst,en,xk,MVout,slc_sig2 ,MVin_V);

MUX2t1 MUX3_1(clk,rst,en,A1,M1,slc_sig3,MVin_M_c1);
MUX2t1 MUX3_2(clk,rst,en,A2,M2,slc_sig3,MVin_M_c2);
MUX2t1 MUX3_3(clk,rst,en,A3,M3,slc_sig3,MVin_M_c3);
MUX2t1 MUX3_4(clk,rst,en,A4,M4,slc_sig3,MVin_M_c4);
MUX2t1 MUX3_5(clk,rst,en,A5,M5,slc_sig3,MVin_M_c5);
MUX2t1 MUX3_6(clk,rst,en,A6,M6,slc_sig3,MVin_M_c6);
MUX2t1 MUX3_7(clk,rst,en,A7,M7,slc_sig3,MVin_M_c7);
MUX2t1 MUX3_8(clk,rst,en,A8,M8,slc_sig3,MVin_M_c8);
MUX2t1 MUX3_9(clk,rst,en,A9,M9,slc_sig3,MVin_M_c9);
MUX2t1 MUX3_10(clk,rst,en,A10,M10,slc_sig3,MVin_M_c10);
MUX2t1 MUX3_11(clk,rst,en,A11,M11,slc_sig3,MVin_M_c11);
MUX2t1 MUX3_12(clk,rst,en,A12,M12,slc_sig3,MVin_M_c12);
MUX2t1 MUX3_13(clk,rst,en,A13,M13,slc_sig3,MVin_M_c13);
MUX2t1 MUX3_14(clk,rst,en,A14,M14,slc_sig3,MVin_M_c14);
MUX2t1 MUX3_15(clk,rst,en,A15,M15,slc_sig3,MVin_M_c15);
MUX2t1 MUX3_16(clk,rst,en,A16,M16,slc_sig3,MVin_M_c16);

adder_my add1(clk,rst,en,xk,MVout,iter_part);

adder_my add2(clk,rst,en,offset,iter_part,xkupdate);

assign x_final=xkupdate;




endmodule
