`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/21 16:38:59
// Design Name: 
// Module Name: M2V
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

module M2V#(parameter DIMENSION=16, WIDTH=8)   //16*16 × 16*1,dimension is the number of number in a line, is the same as dimension in PE.V
(clk,rst,en,
M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,M16,
V,
//MV1,MV2,MV3,MV4,MV5,MV6,MV7,MV8,MV9,MV10,MV11,MV12,MV13,MV14,MV15,MV16
MV
    );
    input clk,rst,en;
    input signed [DIMENSION*WIDTH-1:0] M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,M13,M14,M15,M16;
    input signed [DIMENSION*WIDTH-1:0] V;
    output reg signed [DIMENSION*WIDTH-1:0] MV;

    reg [WIDTH-1:0] MV1,MV2,MV3,MV4,MV5,MV6,MV7,MV8,MV9,MV10,MV11,MV12,MV13,MV14,MV15,MV16;
    
    wire [WIDTH-1:0] r1[DIMENSION+14:0];   //预留错开数据输入的空间
    wire [WIDTH-1:0] r2[DIMENSION+14:0];
    wire [WIDTH-1:0] r3[DIMENSION+14:0];
    wire [WIDTH-1:0] r4[DIMENSION+14:0];
    wire [WIDTH-1:0] r5[DIMENSION+14:0];
    wire [WIDTH-1:0] r6[DIMENSION+14:0];
    wire [WIDTH-1:0] r7[DIMENSION+14:0];
    wire [WIDTH-1:0] r8[DIMENSION+14:0];
    wire [WIDTH-1:0] r9[DIMENSION+14:0];
    wire [WIDTH-1:0] r10[DIMENSION+14:0];
    wire [WIDTH-1:0] r11[DIMENSION+14:0];
    wire [WIDTH-1:0] r12[DIMENSION+14:0];
    wire [WIDTH-1:0] r13[DIMENSION+14:0];
    wire [WIDTH-1:0] r14[DIMENSION+14:0];
    wire [WIDTH-1:0] r15[DIMENSION+14:0];
    wire [WIDTH-1:0] r16[DIMENSION+14:0];
    
    wire [WIDTH-1:0] col[DIMENSION-1:0];
    

    
    reg [4:0] count;
    
    reg [8:0] c_n;


genvar i;
generate
for(i=0;i<DIMENSION;i=i+1)
begin: gen
assign r1[i]=M1[(i+1)*WIDTH-1:i*WIDTH];
assign r2[i+1]=M2[(i+1)*WIDTH-1:i*WIDTH];
assign r3[i+2]=M3[(i+1)*WIDTH-1:i*WIDTH];
assign r4[i+3]=M4[(i+1)*WIDTH-1:i*WIDTH];

assign r5[i+4]=M5[(i+1)*WIDTH-1:i*WIDTH];
assign r6[i+5]=M6[(i+1)*WIDTH-1:i*WIDTH];
assign r7[i+6]=M7[(i+1)*WIDTH-1:i*WIDTH];
assign r8[i+7]=M8[(i+1)*WIDTH-1:i*WIDTH];

assign r9[i+8]=M9[(i+1)*WIDTH-1:i*WIDTH];
assign r10[i+9]=M10[(i+1)*WIDTH-1:i*WIDTH];
assign r11[i+10]=M11[(i+1)*WIDTH-1:i*WIDTH];
assign r12[i+11]=M12[(i+1)*WIDTH-1:i*WIDTH];

assign r13[i+12]=M13[(i+1)*WIDTH-1:i*WIDTH];
assign r14[i+13]=M14[(i+1)*WIDTH-1:i*WIDTH];
assign r15[i+14]=M15[(i+1)*WIDTH-1:i*WIDTH];
assign r16[i+15]=M16[(i+1)*WIDTH-1:i*WIDTH];


assign col[i]=V[(i+1)*WIDTH-1:i*WIDTH];
end
endgenerate
assign r2[0]= r2[16]; 
assign r3[0]= r3[16]; assign r3[1]= r3[17];
assign r4[0]= r4[16]; assign r4[1]= r4[17]; assign r4[2]= r4[18];
assign r5[0]= r5[16]; assign r5[1]= r5[17]; assign r5[2]= r5[18]; assign r5[3]= r5[19]; 
assign r6[0]= r6[16]; assign r6[1]= r6[17]; assign r6[2]= r6[18]; assign r6[3]= r6[19]; assign r6[4]= r6[20]; 
assign r7[0]= r7[16]; assign r7[1]= r7[17]; assign r7[2]= r7[18]; assign r7[3]= r7[19]; assign r7[4]= r7[20]; assign r7[5]= r7[21]; 
assign r8[0]= r8[16]; assign r8[1]= r8[17]; assign r8[2]= r8[18]; assign r8[3]= r8[19]; assign r8[4]= r8[20]; assign r8[5]= r8[21]; assign r8[6]= r8[22];
assign r9[0]= r9[16]; assign r9[1]= r9[17]; assign r9[2]= r9[18]; assign r9[3]= r9[19]; assign r9[4]= r9[20]; assign r9[5]= r9[21]; assign r9[6]= r9[22]; assign r9[7]= r9[23];
assign r10[0]= r10[16]; assign r10[1]= r10[17]; assign r10[2]= r10[18]; assign r10[3]= r10[19]; assign r10[4]= r10[20]; assign r10[5]= r10[21]; assign r10[6]= r10[22]; assign r10[7]= r10[23];
assign r10[8]= r10[24];
assign r11[0]= r11[16]; assign r11[1]= r11[17]; assign r11[2]= r11[18]; assign r11[3]= r11[19]; assign r11[4]= r11[20]; assign r11[5]= r11[21]; assign r11[6]= r11[22]; assign r11[7]= r11[23];
assign r11[8]= r11[24]; assign r11[9]= r11[25]; 
assign r12[0]= r12[16]; assign r12[1]= r12[17]; assign r12[2]= r12[18]; assign r12[3]= r12[19]; assign r12[4]= r12[20]; assign r12[5]= r12[21]; assign r12[6]= r12[22]; assign r12[7]= r12[23];
assign r12[8]= r12[24]; assign r12[9]= r12[25]; assign r12[10]= r12[26];
assign r13[0]= r13[16]; assign r13[1]= r13[17]; assign r13[2]= r13[18]; assign r13[3]= r13[19]; assign r13[4]= r13[20]; assign r13[5]= r13[21]; assign r13[6]= r13[22]; assign r13[7]= r13[23];
assign r13[8]= r13[24]; assign r13[9]= r13[25]; assign r13[10]= r13[26]; assign r13[11]= r13[27];
assign r14[0]= r14[16]; assign r14[1]= r14[17]; assign r14[2]= r14[18]; assign r14[3]= r14[19]; assign r14[4]= r14[20]; assign r14[5]= r14[21]; assign r14[6]= r14[22]; assign r14[7]= r14[23];
assign r14[8]= r14[24]; assign r14[9]= r14[25]; assign r14[10]= r14[26]; assign r14[11]= r14[27]; assign r14[12]= r14[28];
assign r15[0]= r15[16]; assign r15[1]= r15[17]; assign r15[2]= r15[18]; assign r15[3]= r15[19]; assign r15[4]= r15[20]; assign r15[5]= r15[21]; assign r15[6]= r15[22]; assign r15[7]= r15[23];
assign r15[8]= r15[24]; assign r15[9]= r15[25]; assign r15[10]= r15[26]; assign r15[11]= r15[27]; assign r15[12]= r15[28]; assign r15[13]= r15[29];
assign r16[0]= r16[16]; assign r16[1]= r16[17]; assign r16[2]= r16[18]; assign r16[3]= r16[19]; assign r16[4]= r16[20]; assign r16[5]= r16[21]; assign r16[6]= r16[22]; assign r16[7]= r16[23];
assign r16[8]= r16[24]; assign r16[9]= r16[25]; assign r16[10]= r16[26]; assign r16[11]= r16[27]; assign r16[12]= r16[28]; assign r16[13]= r16[29]; assign r16[14]= r16[30];

    
    wire [WIDTH-1:0]  wMV1,wMV2,wMV3,wMV4,wMV5,wMV6,wMV7,wMV8,wMV9,wMV10,wMV11,wMV12,wMV13,wMV14,wMV15,wMV16;
    wire [WIDTH-1:0]  r1t2,r2t3,r3t4,r4t5,r5t6,r6t7,r7t8,r8t9,r9t10,r10t11,r11t12,r12t13,r13t14,r14t15,r15t16;
    wire en12,en23,en34,en45,en56,en67,en78,en89,en910,en1011,en1112,en1213,en1314,en1415,en1516;
    PE PE_r1(.clk(clk),.rst(rst),.en(en), .in_A(r1[count]),.in_B(col[count]),.out_B(r1t2),.P(wMV1),.en_o(en12));
    PE PE_r2(.clk(clk),.rst(rst),.en(en12),.in_A(r2[count]),.in_B(r1t2),.out_B(r2t3),.P(wMV2),.en_o(en23));
    PE PE_r3(.clk(clk),.rst(rst),.en(en23),.in_A(r3[count]),.in_B(r2t3),.out_B(r3t4),.P(wMV3),.en_o(en34));
    PE PE_r4(.clk(clk),.rst(rst),.en(en34),.in_A(r4[count]),.in_B(r3t4),.out_B(r4t5),.P(wMV4),.en_o(en45));
    PE PE_r5(.clk(clk),.rst(rst),.en(en45),.in_A(r5[count]),.in_B(r4t5),.out_B(r5t6),.P(wMV5),.en_o(en56));
    PE PE_r6(.clk(clk),.rst(rst),.en(en56),.in_A(r6[count]),.in_B(r5t6),.out_B(r6t7),.P(wMV6),.en_o(en67));
    PE PE_r7(.clk(clk),.rst(rst),.en(en67),.in_A(r7[count]),.in_B(r6t7),.out_B(r7t8),.P(wMV7),.en_o(en78));
    PE PE_r8(.clk(clk),.rst(rst),.en(en78),.in_A(r8[count]),.in_B(r7t8),.out_B(r8t9),.P(wMV8),.en_o(en89));
    PE PE_r9(.clk(clk),.rst(rst),.en(en89),.in_A(r9[count]),.in_B(r8t9),.out_B(r9t10),.P(wMV9),.en_o(en910));
    PE PE_r10(.clk(clk),.rst(rst),.en(en910),.in_A(r10[count]),.in_B(r9t10),.out_B(r10t11),.P(wMV10),.en_o(en1011));
    PE PE_r11(.clk(clk),.rst(rst),.en(en1011),.in_A(r11[count]),.in_B(r10t11),.out_B(r11t12),.P(wMV11),.en_o(en1112));
    PE PE_r12(.clk(clk),.rst(rst),.en(en1112),.in_A(r12[count]),.in_B(r11t12),.out_B(r12t13),.P(wMV12),.en_o(en1213));
    PE PE_r13(.clk(clk),.rst(rst),.en(en1213),.in_A(r13[count]),.in_B(r12t13),.out_B(r13t14),.P(wMV13),.en_o(en1314));
    PE PE_r14(.clk(clk),.rst(rst),.en(en1314),.in_A(r14[count]),.in_B(r13t14),.out_B(r14t15),.P(wMV14),.en_o(en1415));
    PE PE_r15(.clk(clk),.rst(rst),.en(en1415),.in_A(r15[count]),.in_B(r14t15),.out_B(r15t16),.P(wMV15),.en_o(en1516));
    PE PE_r16(.clk(clk),.rst(rst),.en(en1516),.in_A(r16[count]),.in_B(r15t16),.out_B(      ),.P(wMV16),.en_o(      ));

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

always@(posedge clk)
begin
if(!rst)
c_n<=0;
else if(en)
c_n<=c_n+1;
else
c_n<=0;
end


    always@(posedge clk)
    begin
    if(!rst)
    MV<=0;
    else if(en)
    if(c_n==DIMENSION)
    MV[7:0]<=wMV1;
    else if(c_n==DIMENSION+1)
    MV[15:8]<=wMV2;
    else if(c_n==DIMENSION+2)
    MV[23:16]<=wMV3;
    else if(c_n==DIMENSION+3)
    MV[31:24]<=wMV4;
    else if(c_n==DIMENSION+4)
    MV[39:32]<=wMV5;
    else if(c_n==DIMENSION+5)
    MV[47:40]<=wMV6;
    else if(c_n==DIMENSION+6)
    MV[55:48]<=wMV7;
    else if(c_n==DIMENSION+7)
    MV[63:56]<=wMV8;
    else if(c_n==DIMENSION+8)
    MV[71:64]<=wMV9;
    else if(c_n==DIMENSION+9)
    MV[79:72]<=wMV10;
    else if(c_n==DIMENSION+10)
    MV[87:80]<=wMV11;
    else if(c_n==DIMENSION+11)
    MV[95:88]<=wMV12;
    else if(c_n==DIMENSION+12)
    MV[103:96]<=wMV13;
    else if(c_n==DIMENSION+13)
    MV[111:104]<=wMV14;
    else if(c_n==DIMENSION+14)
    MV[119:112]<=wMV15;
    else if(c_n==DIMENSION+15)
    MV[127:120]<=wMV16;
    end

endmodule
