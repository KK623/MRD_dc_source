`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/24 18:19:51
// Design Name: 
// Module Name: top
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


module top#(parameter DIMENSION=16,WIDTH=8)
(clk,rst,en,
H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,H16,
M_init1,M_init2,M_init3,M_init4,M_init5,M_init6,M_init7,M_init8,
M_init9,M_init10,M_init11,M_init12,M_init13,M_init14,M_init15,M_init16,
y,
x0,
x_final
);
input clk,rst,en;
input signed [256*WIDTH-1:0] H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,H16;
input signed [DIMENSION*WIDTH-1:0] M_init1,M_init2,M_init3,M_init4,M_init5,M_init6,M_init7,M_init8,
M_init9,M_init10,M_init11,M_init12,M_init13,M_init14,M_init15,M_init16;
input signed [DIMENSION*WIDTH-1:0] x0;
input signed [256*WIDTH-1:0] y;
output  signed [DIMENSION*WIDTH-1:0] x_final;

wire signed [DIMENSION*WIDTH-1:0] b;

wire signed [DIMENSION*WIDTH-1:0] A1,A2,A3,A4,A5,A6,A7,A8,
A9,A10,A11,A12,A13,A14,A15,A16; //gram matrix

wire  [DIMENSION*WIDTH-1:0] M_iter_c1,M_iter_c2,M_iter_c3,M_iter_c4,M_iter_c5,M_iter_c6,M_iter_c7,M_iter_c8,
M_iter_c9,M_iter_c10,M_iter_c11,M_iter_c12,M_iter_c13,M_iter_c14,M_iter_c15,M_iter_c16;

wire signed  [16*WIDTH-1:0] Mb;


pre_process pre_process_top_module(clk,rst,en,
H1,H2,H3,H4,H5,H6,H7,H8,
H9,H10,H11,H12,H13,H14,H15,H16,
y,
A1,A2,A3,A4,A5,A6,A7,A8,
A9,A10,A11,A12,A13,A14,A15,A16,
b);

MRD_init_all MRD_inv_module(clk,rst,en,
A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,,
M_init1,M_init2,M_init3,M_init4,M_init5,M_init6,M_init7,M_init8,
M_init9,M_init10,M_init11,M_init12,M_init13,M_init14,M_init15,M_init16,
128'h00000000000000000000000000000001,128'h00000000000000000000000000000100,128'h00000000000000000000000000010000,128'h00000000000000000000000001000000,
128'h00000000000000000000000100000000,128'h00000000000000000000010000000000,128'h00000000000000000001000000000000,128'h00000000000000000100000000000000,
128'h00000000000000010000000000000000,128'h00000000000001000000000000000000,128'h00000000000100000000000000000000,128'h00000000010000000000000000000000,
128'h00000001000000000000000000000000,128'h00000100000000000000000000000000,128'h00010000000000000000000000000000,128'h01000000000000000000000000000000,
M_iter_c1,M_iter_c2,M_iter_c3,M_iter_c4,M_iter_c5,M_iter_c6,M_iter_c7,M_iter_c8,
M_iter_c9,M_iter_c10,M_iter_c11,M_iter_c12,M_iter_c13,M_iter_c14,M_iter_c15,M_iter_c16);



M2V Mb_generation(clk,rst,en,
M_iter_c1,M_iter_c2,M_iter_c3,M_iter_c4,M_iter_c5,M_iter_c6,M_iter_c7,M_iter_c8,
M_iter_c9,M_iter_c10,M_iter_c11,M_iter_c12,M_iter_c13,M_iter_c14,M_iter_c15,M_iter_c16,
b,
Mb);

Iteration_unit Iteration_unit_module(clk,rst,en,
A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,
M_iter_c1,M_iter_c2,M_iter_c3,M_iter_c4,M_iter_c5,M_iter_c6,M_iter_c7,M_iter_c8,
M_iter_c9,M_iter_c10,M_iter_c11,M_iter_c12,M_iter_c13,M_iter_c14,M_iter_c15,M_iter_c16,
x0,
Mb,
x_final
);



endmodule
