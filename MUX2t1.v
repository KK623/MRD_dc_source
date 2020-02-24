`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/23 11:53:21
// Design Name: 
// Module Name: MUX2t1
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


module MUX2t1#(parameter DIMENSION=16,WIDTH=8)
(clk,rst,en,
data1,data2,select_sig,data_selected
);

input clk, rst, en;
input signed [DIMENSION*WIDTH-1:0] data1,data2;
input select_sig;
output reg  signed [DIMENSION*WIDTH-1:0] data_selected;


always@(posedge clk)
begin
if(!rst)
data_selected <= 0;
else if (en)
begin
if(select_sig == 0)
data_selected <= data1;
else
data_selected <= data2;
end
else 
data_selected <= 0;
end
    
endmodule
