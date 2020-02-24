`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 16:38:07
// Design Name: 
// Module Name: PE
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

module PE#(parameter WIDTH=8, DIMENSION=16) //DIMENSION is the time of MAC operation
(clk,rst,en,in_A,in_B,out_B,P,en_o

    );
    input clk;
    input rst;
    input en;
    input [WIDTH-1:0] in_A;
    input [WIDTH-1:0] in_B;
    output reg [WIDTH-1:0] out_B;
    output reg[WIDTH-1:0] P;
    output reg en_o;
   
     reg[WIDTH-1:0] P_tmp;
     reg [4:0] count;
   
    always @(posedge clk)
    begin
    if(!rst )
    begin
    out_B<=0;
    P<=0;
    P_tmp<=0;
    en_o<=0;

    end
    else if(en)
    begin
    if(count<DIMENSION)
    begin
     out_B<=in_B;
     P_tmp<=0;
     P<=P+in_A*in_B;
     en_o<=1;
     end
     else
     begin
      out_B<=in_B;
     P_tmp<=0;
     P<=in_A*in_B;
     en_o<=1;
     end
    end
    else 
    begin
    out_B<=0;
    P<=0;
    P_tmp<=0;
    en_o<=0;

    end
    end
    
    always @(posedge clk)
    begin
    if(!rst)
    count<=0;
    else if (en)
      begin
       if(count<DIMENSION)
       count<=count+1;
       else
       begin
       count<=1;

       end
      end
     else
     count<=0;
    
    end
    
   
 
    
    
    
    
    
endmodule
