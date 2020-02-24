`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/24 12:43:42
// Design Name: 
// Module Name: MRD_init_all
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


module MRD_init_all#(parameter DIMENSION=16,WIDTH=8,ITER_NUM=2)
(clk,rst,en,
A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,
M_init1,M_init2,M_init3,M_init4,M_init5,M_init6,M_init7,M_init8,
M_init9,M_init10,M_init11,M_init12,M_init13,M_init14,M_init15,M_init16,
e1,e2,e3,e4,e5,e6,e7,e8,
e9,e10,e11,e12,e13,e14,e15,e16,
M_iter_c1,M_iter_c2,M_iter_c3,M_iter_c4,M_iter_c5,M_iter_c6,M_iter_c7,M_iter_c8,
M_iter_c9,M_iter_c10,M_iter_c11,M_iter_c12,M_iter_c13,M_iter_c14,M_iter_c15,M_iter_c16
);
input clk,rst,en;
input signed [DIMENSION*WIDTH-1:0] A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16;
input signed [DIMENSION*WIDTH-1:0] M_init1,M_init2,M_init3,M_init4,M_init5,M_init6,M_init7,M_init8,
M_init9,M_init10,M_init11,M_init12,M_init13,M_init14,M_init15,M_init16;
input signed [DIMENSION*WIDTH-1:0] e1,e2,e3,e4,e5,e6,e7,e8,
e9,e10,e11,e12,e13,e14,e15,e16;
output signed [DIMENSION*WIDTH-1:0] M_iter_c1,M_iter_c2,M_iter_c3,M_iter_c4,M_iter_c5,M_iter_c6,M_iter_c7,M_iter_c8,
M_iter_c9,M_iter_c10,M_iter_c11,M_iter_c12,M_iter_c13,M_iter_c14,M_iter_c15,M_iter_c16;

MRD_inv MRD_c1(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e1,M_iter_c1);
MRD_inv MRD_c2(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e2,M_iter_c2);
MRD_inv MRD_c3(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e3,M_iter_c3);
MRD_inv MRD_c4(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e4,M_iter_c4);

MRD_inv MRD_c5(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e5,M_iter_c5);
MRD_inv MRD_c6(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e6,M_iter_c6);
MRD_inv MRD_c7(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e7,M_iter_c7);
MRD_inv MRD_c8(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e8,M_iter_c8);

MRD_inv MRD_c9(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e9,M_iter_c9);
MRD_inv MRD_c10(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e10,M_iter_c10);
MRD_inv MRD_c11(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e11,M_iter_c11);
MRD_inv MRD_c12(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e12,M_iter_c12);

MRD_inv MRD_c13(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e13,M_iter_c13);
MRD_inv MRD_c14(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e14,M_iter_c14);
MRD_inv MRD_c15(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e15,M_iter_c15);
MRD_inv MRD_c16(clk,rst,en,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,M_init1,e16,M_iter_c16);




endmodule
