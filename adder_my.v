`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/24 11:36:02
// Design Name: 
// Module Name: adder_my
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


module adder_my#(parameter DIMENSION=16,WIDTH=8)
(clk,rst,en,
data1,data2,
data_out
);

input clk,rst,en;
input [DIMENSION*WIDTH-1:0] data1,data2;
output reg [DIMENSION*WIDTH-1:0] data_out;


genvar i;

generate
for(i=0;i<DIMENSION;i=i+1)
	begin:adder_DIMENSION
		always@(posedge clk)
		begin
		if(!rst)
		data_out[(i+1)*WIDTH-1:i*WIDTH] <=0;
		else if(en)
		data_out[(i+1)*WIDTH-1:i*WIDTH] <= data1[(i+1)*WIDTH-1:i*WIDTH]-data2[(i+1)*WIDTH-1:i*WIDTH];
		else
		data_out[(i+1)*WIDTH-1:i*WIDTH] <=0;
		end
		
		
	end


endgenerate

endmodule
