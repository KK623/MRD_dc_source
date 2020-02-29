`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/25 18:22:23
// Design Name: 
// Module Name: pre_process
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


module pre_process#(parameter DIMENSION=256, WIDTH=8)
(clk,rst,en,
H1,H2,H3,H4,H5,H6,H7,H8,
H9,H10,H11,H12,H13,H14,H15,H16,
y_in,
A1,A2,A3,A4,A5,A6,A7,A8,
A9,A10,A11,A12,A13,A14,A15,A16,
y_out
);

input clk,rst,en;
input signed [DIMENSION*WIDTH-1:0] H1,H2,H3,H4,H5,H6,H7,H8,
H9,H10,H11,H12,H13,H14,H15,H16;   //Hi is the Hermite matrix of original H(256*16)

input signed [DIMENSION*WIDTH-1:0] y_in;

output signed [DIMENSION*WIDTH-1:0] A1,A2,A3,A4,A5,A6,A7,A8,
A9,A10,A11,A12,A13,A14,A15,A16;
output signed [DIMENSION*WIDTH-1:0] y_out;

Gram_gen  #(DIMENSION,WIDTH) Gram_gen_256_module(clk,rst,en,
H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,H16,
A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16);

M2V #(DIMENSION,WIDTH) M2V_256_module(clk,rst,en,H1,H2,H3,H4,H5,H6,H7,H8,
H9,H10,H11,H12,H13,H14,H15,H16,y_in,y_out);


    
endmodule
