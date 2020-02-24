`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 17:55:47
// Design Name: 
// Module Name: V2V
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


module V2V#(parameter DIMENSION=16,WIDTH=8)
(clk,rst,en,
V1,V2,
VV
);
input signed[DIMENSION*WIDTH-1:0] V1,V2;
input clk,rst,en;
output signed [WIDTH-1:0] VV;

 wire [WIDTH-1:0] v1[DIMENSION-1:0];  
 wire [WIDTH-1:0] v2[DIMENSION-1:0];
 reg [4:0] count;

 
 genvar i;
 generate
 for(i=0;i<DIMENSION;i=i+1)
 begin: gen
 assign v1[i]=V1[(i+1)*WIDTH-1:i*WIDTH];
 assign v2[i]=V2[(i+1)*WIDTH-1:i*WIDTH];
 end
 endgenerate

PE  PE_V2V(.clk(clk),.rst(rst),.en(en), .in_A(v1[count]),.in_B(v2[count]),.out_B(),.P(VV),.en_o());


always@(posedge clk)
begin
if(!rst)
count<=0;
else if(en)
 begin
 if(count<DIMENSION-1)
 count<=count+1;
 else 
 begin
 count<=0;
 end
 end
else 
  count<=0;
end

endmodule
