`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/28 12:53:39
// Design Name: 
// Module Name: Gram_gen
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


module Gram_gen#(parameter DIMENSION=256,WIDTH=8)
(clk,rst,en,
H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,H16,
G1,G2,G3,G4,G5,G6,G7,G8,G9,G10,G11,G12,G13,G14,G15,G16
);
input clk,rst,en;
input signed [DIMENSION*WIDTH-1:0] H1,H2,H3,H4,H5,H6,H7,H8,H9,H10,H11,H12,H13,H14,H15,H16;
output reg signed [16*WIDTH-1:0] G1,G2,G3,G4,G5,G6,G7,G8,G9,G10,G11,G12,G13,G14,G15,G16; //final matrix

reg [8:0] count;

reg [8:0] c_n;
   
wire [WIDTH-1:0] r1[DIMENSION+14:0];   //变大了16-1
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

wire [WIDTH-1:0] c1[DIMENSION+29:0];  //共轭转置  //变大了2*(16-1)
wire [WIDTH-1:0] c2[DIMENSION+29:0];
wire [WIDTH-1:0] c3[DIMENSION+29:0];  
wire [WIDTH-1:0] c4[DIMENSION+29:0];
wire [WIDTH-1:0] c5[DIMENSION+29:0];
wire [WIDTH-1:0] c6[DIMENSION+29:0];
wire [WIDTH-1:0] c7[DIMENSION+29:0];
wire [WIDTH-1:0] c8[DIMENSION+29:0];
wire [WIDTH-1:0] c9[DIMENSION+29:0];  
wire [WIDTH-1:0] c10[DIMENSION+29:0];
wire [WIDTH-1:0] c11[DIMENSION+29:0];  
wire [WIDTH-1:0] c12[DIMENSION+29:0];
wire [WIDTH-1:0] c13[DIMENSION+29:0];
wire [WIDTH-1:0] c14[DIMENSION+29:0];
wire [WIDTH-1:0] c15[DIMENSION+29:0];
wire [WIDTH-1:0] c16[DIMENSION+29:0];

wire [WIDTH-1:0] P11;
wire [WIDTH-1:0] P21,P22;
wire [WIDTH-1:0] P31,P32,P33;
wire [WIDTH-1:0] P41,P42,P43,P44;
wire [WIDTH-1:0] P51,P52,P53,P54,P55;
wire [WIDTH-1:0] P61,P62,P63,P64,P65,P66;
wire [WIDTH-1:0] P71,P72,P73,P74,P75,P76,P77;
wire [WIDTH-1:0] P81,P82,P83,P84,P85,P86,P87,P88;
wire [WIDTH-1:0] P91,P92,P93,P94,P95,P96,P97,P98,P99;
wire [WIDTH-1:0] P101,P102,P103,P104,P105,P106,P107,P108,P109,P1010;
wire [WIDTH-1:0] P111,P112,P113,P114,P115,P116,P117,P118,P119,P1110,P1111;
wire [WIDTH-1:0] P121,P122,P123,P124,P125,P126,P127,P128,P129,P1210,P1211,P1212;
wire [WIDTH-1:0] P131,P132,P133,P134,P135,P136,P137,P138,P139,P1310,P1311,P1312,P1313;
wire [WIDTH-1:0] P141,P142,P143,P144,P145,P146,P147,P148,P149,P1410,P1411,P1412,P1413,P1414;
wire [WIDTH-1:0] P151,P152,P153,P154,P155,P156,P157,P158,P159,P1510,P1511,P1512,P1513,P1514,P1515;
wire [WIDTH-1:0] P161,P162,P163,P164,P165,P166,P167,P168,P169,P1610,P1611,P1612,P1613,P1614,P1615,P1616;



assign r2[0]=r2[256];
assign r3[0]=r3[256]; assign r3[1]=r3[257];
assign r4[0]=r4[256]; assign r4[1]=r4[257]; assign r4[2]=r4[258];
assign r5[0]=r5[256]; assign r5[1]=r5[257]; assign r5[2]=r5[258]; assign r5[3]=r5[259];
assign r6[0]=r6[256]; assign r6[1]=r6[257]; assign r6[2]=r6[258]; assign r6[3]=r6[259]; assign r6[4]=r6[260];
assign r7[0]=r7[256]; assign r7[1]=r7[257]; assign r7[2]=r7[258]; assign r7[3]=r7[259]; assign r7[4]=r7[260]; assign r7[5]=r7[261];
assign r8[0]=r8[256]; assign r8[1]=r8[257]; assign r8[2]=r8[258]; assign r8[3]=r8[259]; assign r8[4]=r8[260]; assign r8[5]=r8[261]; assign r8[6]=r8[262];
assign r9[0]=r9[256]; assign r9[1]=r9[257]; assign r9[2]=r9[258]; assign r9[3]=r9[259]; assign r9[4]=r9[260]; assign r9[5]=r9[261]; assign r9[6]=r9[262]; assign r9[7]=r9[263];
assign r10[0]=r10[256]; assign r10[1]=r10[257]; assign r10[2]=r10[258]; assign r10[3]=r10[259]; assign r10[4]=r10[260]; assign r10[5]=r10[261]; 
assign r10[6]=r10[262]; assign r10[7]=r10[263]; assign r10[8]=r10[264];
assign r11[0]=r11[256]; assign r11[1]=r11[257]; assign r11[2]=r11[258]; assign r11[3]=r11[259]; assign r11[4]=r11[260]; assign r11[5]=r11[261]; 
assign r11[6]=r11[262]; assign r11[7]=r11[263]; assign r11[8]=r11[264]; assign r11[9]=r11[265];
assign r12[0]=r12[256]; assign r12[1]=r11[257]; assign r12[2]=r12[258]; assign r12[3]=r12[259]; assign r12[4]=r12[260]; assign r12[5]=r12[261]; 
assign r12[6]=r12[262]; assign r12[7]=r12[263]; assign r12[8]=r12[264]; assign r12[9]=r12[265]; assign r12[10]=r12[266];
assign r13[0]=r13[256]; assign r13[1]=r13[257]; assign r13[2]=r13[258]; assign r13[3]=r13[259]; assign r13[4]=r13[260]; assign r13[5]=r13[261]; 
assign r13[6]=r13[262]; assign r13[7]=r13[263]; assign r13[8]=r13[264]; assign r13[9]=r13[265]; assign r13[10]=r13[266]; assign r13[11]=r13[267];
assign r14[0]=r14[256]; assign r14[1]=r14[257]; assign r14[2]=r14[258]; assign r14[3]=r14[259]; assign r14[4]=r14[260]; assign r14[5]=r14[261]; 
assign r14[6]=r14[262]; assign r14[7]=r14[263]; assign r14[8]=r14[264]; assign r14[9]=r14[265]; assign r14[10]=r14[266]; assign r14[11]=r14[267]; assign r14[12]=r14[268];
assign r15[0]=r15[256]; assign r15[1]=r15[257]; assign r15[2]=r15[258]; assign r15[3]=r15[259]; assign r15[4]=r15[260]; assign r15[5]=r15[261]; 
assign r15[6]=r15[262]; assign r15[7]=r15[263]; assign r15[8]=r15[264]; assign r15[9]=r15[265]; assign r15[10]=r15[266]; assign r15[11]=r15[267]; assign r15[12]=r15[268]; assign r15[13]=r15[269];
assign r16[0]=r16[256]; assign r16[1]=r16[257]; assign r16[2]=r16[258]; assign r16[3]=r16[259]; assign r16[4]=r16[260]; assign r16[5]=r16[261]; 
assign r16[6]=r16[262]; assign r16[7]=r16[263]; assign r16[8]=r16[264]; assign r16[9]=r16[265]; assign r16[10]=r16[266]; assign r16[11]=r16[267]; assign r16[12]=r16[268]; assign r16[13]=r16[269]; assign r16[14]=r16[270];

/// 0
assign c2[0]= c2[256];
assign c2[1]= c2[257];
/// 1
assign c3[0]= c3[256];
assign c3[1]= c3[257];
assign c3[2]= c3[258];
assign c3[3]= c3[259];
/// 2
assign c4[0]= c4[256];
assign c4[1]= c4[257];
assign c4[2]= c4[258];
assign c4[3]= c4[259];
assign c4[4]= c4[260];
assign c4[5]= c4[261];
/// 3
assign c5[0]= c5[256];
assign c5[1]= c5[257];
assign c5[2]= c5[258];
assign c5[3]= c5[259];
assign c5[4]= c5[260];
assign c5[5]= c5[261];
assign c5[6]= c5[262];
assign c5[7]= c5[263];
/// 4
assign c6[0]= c6[256];
assign c6[1]= c6[257];
assign c6[2]= c6[258];
assign c6[3]= c6[259];
assign c6[4]= c6[260];
assign c6[5]= c6[261];
assign c6[6]= c6[262];
assign c6[7]= c6[263];
assign c6[8]= c6[264];
assign c6[9]= c6[265];
/// 5
assign c7[0]= c7[256];
assign c7[1]= c7[257];
assign c7[2]= c7[258];
assign c7[3]= c7[259];
assign c7[4]= c7[260];
assign c7[5]= c7[261];
assign c7[6]= c7[262];
assign c7[7]= c7[263];
assign c7[8]= c7[264];
assign c7[9]= c7[265];
assign c7[10]= c7[266];
assign c7[11]= c7[267];
/// 6
assign c8[0]= c8[256];
assign c8[1]= c8[257];
assign c8[2]= c8[258];
assign c8[3]= c8[259];
assign c8[4]= c8[260];
assign c8[5]= c8[261];
assign c8[6]= c8[262];
assign c8[7]= c8[263];
assign c8[8]= c8[264];
assign c8[9]= c8[265];
assign c8[10]= c8[266];
assign c8[11]= c8[267];
assign c8[12]= c8[268];
assign c8[13]= c8[269];
/// 7
assign c9[0]= c9[256];
assign c9[1]= c9[257];
assign c9[2]= c9[258];
assign c9[3]= c9[259];
assign c9[4]= c9[260];
assign c9[5]= c9[261];
assign c9[6]= c9[262];
assign c9[7]= c9[263];
assign c9[8]= c9[264];
assign c9[9]= c9[265];
assign c9[10]= c9[266];
assign c9[11]= c9[267];
assign c9[12]= c9[268];
assign c9[13]= c9[269];
assign c9[14]= c9[270];
assign c9[15]= c9[271];
/// 8
assign c10[0]= c10[256];
assign c10[1]= c10[257];
assign c10[2]= c10[258];
assign c10[3]= c10[259];
assign c10[4]= c10[260];
assign c10[5]= c10[261];
assign c10[6]= c10[262];
assign c10[7]= c10[263];
assign c10[8]= c10[264];
assign c10[9]= c10[265];
assign c10[10]= c10[266];
assign c10[11]= c10[267];
assign c10[12]= c10[268];
assign c10[13]= c10[269];
assign c10[14]= c10[270];
assign c10[15]= c10[271];
assign c10[16]= c10[272];
assign c10[17]= c10[273];
/// 9
assign c11[0]= c11[256];
assign c11[1]= c11[257];
assign c11[2]= c11[258];
assign c11[3]= c11[259];
assign c11[4]= c11[260];
assign c11[5]= c11[261];
assign c11[6]= c11[262];
assign c11[7]= c11[263];
assign c11[8]= c11[264];
assign c11[9]= c11[265];
assign c11[10]= c11[266];
assign c11[11]= c11[267];
assign c11[12]= c11[268];
assign c11[13]= c11[269];
assign c11[14]= c11[270];
assign c11[15]= c11[271];
assign c11[16]= c11[272];
assign c11[17]= c11[273];
assign c11[18]= c11[274];
assign c11[19]= c11[275];
/// 10
assign c12[0]= c12[256];
assign c12[1]= c12[257];
assign c12[2]= c12[258];
assign c12[3]= c12[259];
assign c12[4]= c12[260];
assign c12[5]= c12[261];
assign c12[6]= c12[262];
assign c12[7]= c12[263];
assign c12[8]= c12[264];
assign c12[9]= c12[265];
assign c12[10]= c12[266];
assign c12[11]= c12[267];
assign c12[12]= c12[268];
assign c12[13]= c12[269];
assign c12[14]= c12[270];
assign c12[15]= c12[271];
assign c12[16]= c12[272];
assign c12[17]= c12[273];
assign c12[18]= c12[274];
assign c12[19]= c12[275];
assign c12[20]= c12[276];
assign c12[21]= c12[277];
/// 11
assign c13[0]= c13[256];
assign c13[1]= c13[257];
assign c13[2]= c13[258];
assign c13[3]= c13[259];
assign c13[4]= c13[260];
assign c13[5]= c13[261];
assign c13[6]= c13[262];
assign c13[7]= c13[263];
assign c13[8]= c13[264];
assign c13[9]= c13[265];
assign c13[10]= c13[266];
assign c13[11]= c13[267];
assign c13[12]= c13[268];
assign c13[13]= c13[269];
assign c13[14]= c13[270];
assign c13[15]= c13[271];
assign c13[16]= c13[272];
assign c13[17]= c13[273];
assign c13[18]= c13[274];
assign c13[19]= c13[275];
assign c13[20]= c13[276];
assign c13[21]= c13[277];
assign c13[22]= c13[278];
assign c13[23]= c13[279];
/// 12
assign c14[0]= c14[256];
assign c14[1]= c14[257];
assign c14[2]= c14[258];
assign c14[3]= c14[259];
assign c14[4]= c14[260];
assign c14[5]= c14[261];
assign c14[6]= c14[262];
assign c14[7]= c14[263];
assign c14[8]= c14[264];
assign c14[9]= c14[265];
assign c14[10]= c14[266];
assign c14[11]= c14[267];
assign c14[12]= c14[268];
assign c14[13]= c14[269];
assign c14[14]= c14[270];
assign c14[15]= c14[271];
assign c14[16]= c14[272];
assign c14[17]= c14[273];
assign c14[18]= c14[274];
assign c14[19]= c14[275];
assign c14[20]= c14[276];
assign c14[21]= c14[277];
assign c14[22]= c14[278];
assign c14[23]= c14[279];
assign c14[24]= c14[280];
assign c14[25]= c14[281];
/// 13
assign c15[0]= c15[256];
assign c15[1]= c15[257];
assign c15[2]= c15[258];
assign c15[3]= c15[259];
assign c15[4]= c15[260];
assign c15[5]= c15[261];
assign c15[6]= c15[262];
assign c15[7]= c15[263];
assign c15[8]= c15[264];
assign c15[9]= c15[265];
assign c15[10]= c15[266];
assign c15[11]= c15[267];
assign c15[12]= c15[268];
assign c15[13]= c15[269];
assign c15[14]= c15[270];
assign c15[15]= c15[271];
assign c15[16]= c15[272];
assign c15[17]= c15[273];
assign c15[18]= c15[274];
assign c15[19]= c15[275];
assign c15[20]= c15[276];
assign c15[21]= c15[277];
assign c15[22]= c15[278];
assign c15[23]= c15[279];
assign c15[24]= c15[280];
assign c15[25]= c15[281];
assign c15[26]= c15[282];
assign c15[27]= c15[283];
/// 14
assign c16[0]= c16[256];
assign c16[1]= c16[257];
assign c16[2]= c16[258];
assign c16[3]= c16[259];
assign c16[4]= c16[260];
assign c16[5]= c16[261];
assign c16[6]= c16[262];
assign c16[7]= c16[263];
assign c16[8]= c16[264];
assign c16[9]= c16[265];
assign c16[10]= c16[266];
assign c16[11]= c16[267];
assign c16[12]= c16[268];
assign c16[13]= c16[269];
assign c16[14]= c16[270];
assign c16[15]= c16[271];
assign c16[16]= c16[272];
assign c16[17]= c16[273];
assign c16[18]= c16[274];
assign c16[19]= c16[275];
assign c16[20]= c16[276];
assign c16[21]= c16[277];
assign c16[22]= c16[278];
assign c16[23]= c16[279];
assign c16[24]= c16[280];
assign c16[25]= c16[281];
assign c16[26]= c16[282];
assign c16[27]= c16[283];
assign c16[28]= c16[284];
assign c16[29]= c16[285];

genvar i; 
generate
    for(i=0;i<DIMENSION;i=i+1)
       begin:assign_value
       assign r1[i]=H1[(i+1)*WIDTH-1:i*WIDTH];
       assign r2[i+1]=H2[(i+1)*WIDTH-1:i*WIDTH];
       assign r3[i+2]=H3[(i+1)*WIDTH-1:i*WIDTH];
       assign r4[i+3]=H4[(i+1)*WIDTH-1:i*WIDTH];
       assign r5[i+4]=H5[(i+1)*WIDTH-1:i*WIDTH];
       assign r6[i+5]=H6[(i+1)*WIDTH-1:i*WIDTH];
       assign r7[i+6]=H7[(i+1)*WIDTH-1:i*WIDTH];
       assign r8[i+7]=H8[(i+1)*WIDTH-1:i*WIDTH];
       assign r9[i+8]=H9[(i+1)*WIDTH-1:i*WIDTH];
       assign r10[i+9]=H10[(i+1)*WIDTH-1:i*WIDTH];
       assign r11[i+10]=H11[(i+1)*WIDTH-1:i*WIDTH];
       assign r12[i+11]=H12[(i+1)*WIDTH-1:i*WIDTH];
       assign r13[i+12]=H13[(i+1)*WIDTH-1:i*WIDTH];
       assign r14[i+13]=H14[(i+1)*WIDTH-1:i*WIDTH];
       assign r15[i+14]=H15[(i+1)*WIDTH-1:i*WIDTH];
       assign r16[i+15]=H16[(i+1)*WIDTH-1:i*WIDTH];

       if(i<128)
       begin
       assign c1[i]=H1[(i+1)*WIDTH-1:i*WIDTH];
       assign c2[i+2]=H2[(i+1)*WIDTH-1:i*WIDTH];
       assign c3[i+4]=H3[(i+1)*WIDTH-1:i*WIDTH];
       assign c4[i+6]=H4[(i+1)*WIDTH-1:i*WIDTH];
       assign c5[i+8]=H5[(i+1)*WIDTH-1:i*WIDTH];
       assign c6[i+10]=H6[(i+1)*WIDTH-1:i*WIDTH];
       assign c7[i+12]=H7[(i+1)*WIDTH-1:i*WIDTH];
       assign c8[i+14]=H8[(i+1)*WIDTH-1:i*WIDTH];
       assign c9[i+16]=H9[(i+1)*WIDTH-1:i*WIDTH];
       assign c10[i+18]=H10[(i+1)*WIDTH-1:i*WIDTH];
       assign c11[i+20]=H11[(i+1)*WIDTH-1:i*WIDTH];
       assign c12[i+22]=H12[(i+1)*WIDTH-1:i*WIDTH];
       assign c13[i+24]=H13[(i+1)*WIDTH-1:i*WIDTH];
       assign c14[i+26]=H14[(i+1)*WIDTH-1:i*WIDTH];
       assign c15[i+28]=H15[(i+1)*WIDTH-1:i*WIDTH];
       assign c16[i+30]=H16[(i+1)*WIDTH-1:i*WIDTH];
       end
       
       else
       begin
       assign c1[i]=-H1[(i+1)*WIDTH-1:i*WIDTH];
       assign c2[i+2]=-H2[(i+1)*WIDTH-1:i*WIDTH];
       assign c3[i+4]=-H3[(i+1)*WIDTH-1:i*WIDTH];
       assign c4[i+6]=-H4[(i+1)*WIDTH-1:i*WIDTH];
       assign c5[i+8]=-H5[(i+1)*WIDTH-1:i*WIDTH];
       assign c6[i+10]=-H6[(i+1)*WIDTH-1:i*WIDTH];
       assign c7[i+12]=-H7[(i+1)*WIDTH-1:i*WIDTH];
       assign c8[i+14]=-H8[(i+1)*WIDTH-1:i*WIDTH];
       assign c9[i+16]=-H9[(i+1)*WIDTH-1:i*WIDTH];
       assign c10[i+18]=-H10[(i+1)*WIDTH-1:i*WIDTH];
       assign c11[i+20]=-H11[(i+1)*WIDTH-1:i*WIDTH];
       assign c12[i+22]=-H12[(i+1)*WIDTH-1:i*WIDTH];
       assign c13[i+24]=-H13[(i+1)*WIDTH-1:i*WIDTH];
       assign c14[i+26]=-H14[(i+1)*WIDTH-1:i*WIDTH];
       assign c15[i+28]=-H15[(i+1)*WIDTH-1:i*WIDTH];
       assign c16[i+30]=-H16[(i+1)*WIDTH-1:i*WIDTH];
       end
       
       
        end
        
endgenerate

wire ctr_11o,ctr_21o,ctr_22o,ctr_31o,ctr_32o,ctr_33o,
ctr_41o,ctr_42o,ctr_43o,ctr_44o,
ctr_51o,ctr_52o,ctr_53o,ctr_54o,ctr_55o,
ctr_61o,ctr_62o,ctr_63o,ctr_64o,ctr_65o,ctr_66o,
ctr_71o,ctr_72o,ctr_73o,ctr_74o,ctr_75o,ctr_76o,ctr_77o,
ctr_81o,ctr_82o,ctr_83o,ctr_84o,ctr_85o,ctr_86o,ctr_87o,ctr_88o,
ctr_91o,ctr_92o,ctr_93o,ctr_94o,ctr_95o,ctr_96o,ctr_97o,ctr_98o,ctr_99o,
ctr_101o,ctr_102o,ctr_103o,ctr_104o,ctr_105o,ctr_106o,ctr_107o,ctr_108o,ctr_109o,ctr_1010o,
ctr_111o,ctr_112o,ctr_113o,ctr_114o,ctr_115o,ctr_116o,ctr_117o,ctr_118o,ctr_119o,ctr_1110o,ctr_1111o,
ctr_121o,ctr_122o,ctr_123o,ctr_124o,ctr_125o,ctr_126o,ctr_127o,ctr_128o,ctr_129o,ctr_1210o,ctr_1211o,ctr_1212o,
ctr_131o,ctr_132o,ctr_133o,ctr_134o,ctr_135o,ctr_136o,ctr_137o,ctr_138o,ctr_139o,ctr_1310o,ctr_1311o,ctr_1312o,ctr_1313o,
ctr_141o,ctr_142o,ctr_143o,ctr_144o,ctr_145o,ctr_146o,ctr_147o,ctr_148o,ctr_149o,ctr_1410o,ctr_1411o,ctr_1412o,ctr_1413o,ctr_1414o,
ctr_151o,ctr_152o,ctr_153o,ctr_154o,ctr_155o,ctr_156o,ctr_157o,ctr_158o,ctr_159o,ctr_1510o,ctr_1511o,ctr_1512o,ctr_1513o,ctr_1514o,ctr_1515o,
ctr_161o,ctr_162o,ctr_163o,ctr_164o,ctr_165o,ctr_166o,ctr_167o,ctr_168o,ctr_169o,ctr_1610o,ctr_1611o,ctr_1612o,ctr_1613o,ctr_1614o,ctr_1615o,ctr_1616o;


wire [WIDTH-1:0]
data_11t12,data_11t21, 
data_21t22,data_21t31,data_22t23,data_22t32, 
data_31t32,data_31t41,data_32t33,data_32t42,data_33t34,data_33t43, 
data_41t42,data_41t51,data_42t43,data_42t52,data_43t44,data_43t53,data_44t45,data_44t54, 
data_51t52,data_51t61,data_52t53,data_52t62,data_53t54,data_53t63,data_54t55,data_54t64,data_55t56,data_55t65, 
data_61t62,data_61t71,data_62t63,data_62t72,data_63t64,data_63t73,data_64t65,data_64t74,data_65t66,data_65t75,data_66t67,data_66t76, 
data_71t72,data_71t81,data_72t73,data_72t82,data_73t74,data_73t83,data_74t75,data_74t84,data_75t76,data_75t85,data_76t77,data_76t86,data_77t78,data_77t87, 
data_81t82,data_81t91,data_82t83,data_82t92,data_83t84,data_83t93,data_84t85,data_84t94,data_85t86,data_85t95,data_86t87,data_86t96,data_87t88,data_87t97,data_88t89,data_88t98, 
data_91t92,data_91t101,data_92t93,data_92t102,data_93t94,data_93t103,data_94t95,data_94t104,data_95t96,data_95t105,data_96t97,data_96t106,data_97t98,data_97t107,data_98t99,data_98t108,data_99t910,data_99t109, 
data_101t102,data_101t111,data_102t103,data_102t112,data_103t104,data_103t113,data_104t105,data_104t114,data_105t106,data_105t115,data_106t107,data_106t116,data_107t108,data_107t117,data_108t109,data_108t118,data_109t1010,data_109t119,data_1010t1011,data_1010t1110, 
data_111t112,data_111t121,data_112t113,data_112t122,data_113t114,data_113t123,data_114t115,data_114t124,data_115t116,data_115t125,data_116t117,data_116t126,data_117t118,data_117t127,data_118t119,data_118t128,data_119t1110,data_119t129,data_1110t1111,data_1110t1210,data_1111t1112,data_1111t1211, 
data_121t122,data_121t131,data_122t123,data_122t132,data_123t124,data_123t133,data_124t125,data_124t134,data_125t126,data_125t135,data_126t127,data_126t136,data_127t128,data_127t137,data_128t129,data_128t138,data_129t1210,data_129t139,data_1210t1211,data_1210t1310,data_1211t1212,data_1211t1311,data_1212t1213,data_1212t1312, 
data_131t132,data_131t141,data_132t133,data_132t142,data_133t134,data_133t143,data_134t135,data_134t144,data_135t136,data_135t145,data_136t137,data_136t146,data_137t138,data_137t147,data_138t139,data_138t148,data_139t1310,data_139t149,data_1310t1311,data_1310t1410,data_1311t1312,data_1311t1411,data_1312t1313,data_1312t1412,data_1313t1314,data_1313t1413, 
data_141t142,data_141t151,data_142t143,data_142t152,data_143t144,data_143t153,data_144t145,data_144t154,data_145t146,data_145t155,data_146t147,data_146t156,data_147t148,data_147t157,data_148t149,data_148t158,data_149t1410,data_149t159,data_1410t1411,data_1410t1510,data_1411t1412,data_1411t1511,data_1412t1413,data_1412t1512,data_1413t1414,data_1413t1513,data_1414t1415,data_1414t1514, 
data_151t152,data_151t161,data_152t153,data_152t162,data_153t154,data_153t163,data_154t155,data_154t164,data_155t156,data_155t165,data_156t157,data_156t166,data_157t158,data_157t167,data_158t159,data_158t168,data_159t1510,data_159t169,data_1510t1511,data_1510t1610,data_1511t1512,data_1511t1611,data_1512t1513,data_1512t1612,data_1513t1514,data_1513t1613,data_1514t1515,data_1514t1614,data_1515t1516,data_1515t1615, 
data_161t162,data_161t171,data_162t163,data_162t172,data_163t164,data_163t173,data_164t165,data_164t174,data_165t166,data_165t175,data_166t167,data_166t176,data_167t168,data_167t177,data_168t169,data_168t178,data_169t1610,data_169t179,data_1610t1611,data_1610t1710,data_1611t1612,data_1611t1711,data_1612t1613,data_1612t1712,data_1613t1614,data_1613t1713,data_1614t1615,data_1614t1714,data_1615t1616,data_1615t1715,data_1616t1617,data_1616t1716; 




PE_gram PE11(.clk(clk),.rst(rst),.en(en),.in_A(r1[count]),.in_B(c1[count]),.out_A(data_11t12),.out_B(data_11t21),.P(P11),.en_o(ctr_11o));

PE_gram PE21(.clk(clk),.rst(rst),.en(ctr_11o),.in_A(r2[count]),.in_B(data_11t21),.out_A(data_21t22),.out_B(data_21t31),.P(P21),.en_o(ctr_21o));
PE_gram PE22(.clk(clk),.rst(rst),.en(ctr_21o),.in_A(data_21t22),.in_B(c2[count]),.out_A(data_22t23),.out_B(data_22t32),.P(P22),.en_o(ctr_22o));

PE_gram PE31(.clk(clk),.rst(rst),.en(ctr_21o),.in_A(r3[count]),.in_B(data_21t31),.out_A(data_31t32),.out_B(data_31t41),.P(P31),.en_o(ctr_31o));
PE_gram PE32(.clk(clk),.rst(rst),.en(ctr_31o & ctr_22o),.in_A(data_31t32),.in_B(data_22t32),.out_A(data_32t33),.out_B(data_32t42),.P(P32),.en_o(ctr_32o));
PE_gram PE33(.clk(clk),.rst(rst),.en(ctr_32o),.in_A(data_32t33),.in_B(c3[count]),.out_A(data_33t34),.out_B(data_33t43),.P(P33),.en_o(ctr_33o));

PE_gram PE41(.clk(clk),.rst(rst),.en(ctr_31o),.in_A(r4[count] ),.in_B(data_31t41),.out_A(data_41t42),.out_B(data_41t51),.P(P41),.en_o(ctr_41o));
PE_gram PE42(.clk(clk),.rst(rst),.en(ctr_41o & ctr_32o),.in_A(data_41t42),.in_B(data_32t42),.out_A(data_42t43),.out_B(data_42t52),.P(P42),.en_o(ctr_42o));
PE_gram PE43(.clk(clk),.rst(rst),.en(ctr_42o & ctr_33o),.in_A(data_42t43),.in_B(data_33t43),.out_A(data_43t44),.out_B(data_43t53),.P(P43),.en_o(ctr_43o));
PE_gram PE44(.clk(clk),.rst(rst),.en(ctr_43o),.in_A(data_43t44),.in_B(c4[count] ),.out_A(data_44t45),.out_B(data_44t54),.P(P44),.en_o(ctr_44o));
	
PE_gram PE51(.clk(clk),.rst(rst),.en(ctr_41o),.in_A(r5[count] ),.in_B(data_41t51),.out_A(data_51t52),.out_B(data_51t61),.P(P51),.en_o(ctr_51o));
PE_gram PE52(.clk(clk),.rst(rst),.en(ctr_51o & ctr_42o ),.in_A(data_51t52),.in_B(data_42t52),.out_A(data_52t53),.out_B(data_52t62),.P(P52),.en_o(ctr_52o));
PE_gram PE53(.clk(clk),.rst(rst),.en(ctr_52o & ctr_43o ),.in_A(data_52t53),.in_B(data_43t53),.out_A(data_53t54),.out_B(data_53t63),.P(P53),.en_o(ctr_53o));
PE_gram PE54(.clk(clk),.rst(rst),.en(ctr_53o & ctr_44o ),.in_A(data_53t54),.in_B(data_44t54),.out_A(data_54t55),.out_B(data_54t64),.P(P54),.en_o(ctr_54o));
PE_gram PE55(.clk(clk),.rst(rst),.en(ctr_54o),.in_A(data_54t55),.in_B(c5[count] ),.out_A(data_55t56),.out_B(data_55t65),.P(P55),.en_o(ctr_55o));
	
PE_gram PE61(.clk(clk),.rst(rst),.en(ctr_51o),.in_A(r6[count] ),.in_B(data_51t61),.out_A(data_61t62),.out_B(data_61t71),.P(P61),.en_o(ctr_61o));
PE_gram PE62(.clk(clk),.rst(rst),.en(ctr_61o & ctr_52o ),.in_A(data_61t62),.in_B(data_52t62),.out_A(data_62t63),.out_B(data_62t72),.P(P62),.en_o(ctr_62o));
PE_gram PE63(.clk(clk),.rst(rst),.en(ctr_62o & ctr_53o ),.in_A(data_62t63),.in_B(data_53t63),.out_A(data_63t64),.out_B(data_63t73),.P(P63),.en_o(ctr_63o));
PE_gram PE64(.clk(clk),.rst(rst),.en(ctr_63o & ctr_54o ),.in_A(data_63t64),.in_B(data_54t64),.out_A(data_64t65),.out_B(data_64t74),.P(P64),.en_o(ctr_64o));
PE_gram PE65(.clk(clk),.rst(rst),.en(ctr_64o & ctr_55o ),.in_A(data_64t65),.in_B(data_55t65),.out_A(data_65t66),.out_B(data_65t75),.P(P65),.en_o(ctr_65o));
PE_gram PE66(.clk(clk),.rst(rst),.en(ctr_65o ),.in_A(data_65t66),.in_B(c6[count] ),.out_A(data_66t67),.out_B(data_66t76),.P(P66),.en_o(ctr_66o));
	
PE_gram PE71(.clk(clk),.rst(rst),.en(ctr_61o ),.in_A(r7[count] ),.in_B(data_61t71),.out_A(data_71t72),.out_B(data_71t81),.P(P71),.en_o(ctr_71o));
PE_gram PE72(.clk(clk),.rst(rst),.en(ctr_71o & ctr_62o ),.in_A(data_71t72),.in_B(data_62t72),.out_A(data_72t73),.out_B(data_72t82),.P(P72),.en_o(ctr_72o));
PE_gram PE73(.clk(clk),.rst(rst),.en(ctr_72o & ctr_63o ),.in_A(data_72t73),.in_B(data_63t73),.out_A(data_73t74),.out_B(data_73t83),.P(P73),.en_o(ctr_73o));
PE_gram PE74(.clk(clk),.rst(rst),.en(ctr_73o & ctr_64o ),.in_A(data_73t74),.in_B(data_64t74),.out_A(data_74t75),.out_B(data_74t84),.P(P74),.en_o(ctr_74o));
PE_gram PE75(.clk(clk),.rst(rst),.en(ctr_74o & ctr_65o ),.in_A(data_74t75),.in_B(data_65t75),.out_A(data_75t76),.out_B(data_75t85),.P(P75),.en_o(ctr_75o));
PE_gram PE76(.clk(clk),.rst(rst),.en(ctr_75o & ctr_66o ),.in_A(data_75t76),.in_B(data_66t76),.out_A(data_76t77),.out_B(data_76t86),.P(P76),.en_o(ctr_76o));
PE_gram PE77(.clk(clk),.rst(rst),.en(ctr_76o ),.in_A(data_76t77),.in_B(c7[count] ),.out_A(data_77t78),.out_B(data_77t87),.P(P77),.en_o(ctr_77o));
	
PE_gram PE81(.clk(clk),.rst(rst),.en(ctr_71o ),.in_A(r8[count] ),.in_B(data_71t81),.out_A(data_81t82),.out_B(data_81t91),.P(P81),.en_o(ctr_81o));
PE_gram PE82(.clk(clk),.rst(rst),.en(ctr_81o & ctr_72o ),.in_A(data_81t82),.in_B(data_72t82),.out_A(data_82t83),.out_B(data_82t92),.P(P82),.en_o(ctr_82o));
PE_gram PE83(.clk(clk),.rst(rst),.en(ctr_82o & ctr_73o ),.in_A(data_82t83),.in_B(data_73t83),.out_A(data_83t84),.out_B(data_83t93),.P(P83),.en_o(ctr_83o));
PE_gram PE84(.clk(clk),.rst(rst),.en(ctr_83o & ctr_74o ),.in_A(data_83t84),.in_B(data_74t84),.out_A(data_84t85),.out_B(data_84t94),.P(P84),.en_o(ctr_84o));
PE_gram PE85(.clk(clk),.rst(rst),.en(ctr_84o & ctr_75o ),.in_A(data_84t85),.in_B(data_75t85),.out_A(data_85t86),.out_B(data_85t95),.P(P85),.en_o(ctr_85o));
PE_gram PE86(.clk(clk),.rst(rst),.en(ctr_85o & ctr_76o ),.in_A(data_85t86),.in_B(data_76t86),.out_A(data_86t87),.out_B(data_86t96),.P(P86),.en_o(ctr_86o));
PE_gram PE87(.clk(clk),.rst(rst),.en(ctr_86o & ctr_77o ),.in_A(data_86t87),.in_B(data_77t87),.out_A(data_87t88),.out_B(data_87t97),.P(P87),.en_o(ctr_87o));
PE_gram PE88(.clk(clk),.rst(rst),.en(ctr_87o ),.in_A(data_87t88),.in_B(c8[count] ),.out_A(data_88t89),.out_B(data_88t98),.P(P88),.en_o(ctr_88o));
	
PE_gram PE91(.clk(clk),.rst(rst),.en(ctr_81o ),.in_A(r9[count] ),.in_B(data_81t91),.out_A(data_91t92),.out_B(data_91t101),.P(P91),.en_o(ctr_91o));
PE_gram PE92(.clk(clk),.rst(rst),.en(ctr_91o & ctr_82o ),.in_A(data_91t92),.in_B(data_82t92),.out_A(data_92t93),.out_B(data_92t102),.P(P92),.en_o(ctr_92o));
PE_gram PE93(.clk(clk),.rst(rst),.en(ctr_92o & ctr_83o ),.in_A(data_92t93),.in_B(data_83t93),.out_A(data_93t94),.out_B(data_93t103),.P(P93),.en_o(ctr_93o));
PE_gram PE94(.clk(clk),.rst(rst),.en(ctr_93o & ctr_84o),.in_A(data_93t94),.in_B(data_84t94),.out_A(data_94t95),.out_B(data_94t104),.P(P94),.en_o(ctr_94o));
PE_gram PE95(.clk(clk),.rst(rst),.en(ctr_94o & ctr_85o ),.in_A(data_94t95),.in_B(data_85t95),.out_A(data_95t96),.out_B(data_95t105),.P(P95),.en_o(ctr_95o));
PE_gram PE96(.clk(clk),.rst(rst),.en(ctr_95o & ctr_86o ),.in_A(data_95t96),.in_B(data_86t96),.out_A(data_96t97),.out_B(data_96t106),.P(P96),.en_o(ctr_96o));
PE_gram PE97(.clk(clk),.rst(rst),.en(ctr_96o & ctr_87o ),.in_A(data_96t97),.in_B(data_87t97),.out_A(data_97t98),.out_B(data_97t107),.P(P97),.en_o(ctr_97o));
PE_gram PE98(.clk(clk),.rst(rst),.en(ctr_97o & ctr_88o ),.in_A(data_97t98),.in_B(data_88t98),.out_A(data_98t99),.out_B(data_98t108),.P(P98),.en_o(ctr_98o));
PE_gram PE99(.clk(clk),.rst(rst),.en(ctr_98o ),.in_A(data_98t99),.in_B(c9[count] ),.out_A(data_99t910),.out_B(data_99t109),.P(P99),.en_o(ctr_99o));
	
PE_gram PE101(.clk(clk),.rst(rst),.en(ctr_91o ),.in_A(r10[count]  ),.in_B(data_91t101),.out_A(data_101t102),.out_B(data_101t111),.P(P101),.en_o(ctr_101o));
PE_gram PE102(.clk(clk),.rst(rst),.en(ctr_101o & ctr_92o ),.in_A(data_101t102),.in_B(data_92t102),.out_A(data_102t103),.out_B(data_102t112),.P(P102),.en_o(ctr_102o));
PE_gram PE103(.clk(clk),.rst(rst),.en(ctr_102o & ctr_93o ),.in_A(data_102t103),.in_B(data_93t103),.out_A(data_103t104),.out_B(data_103t113),.P(P103),.en_o(ctr_103o));
PE_gram PE104(.clk(clk),.rst(rst),.en(ctr_103o & ctr_94o ),.in_A(data_103t104),.in_B(data_94t104),.out_A(data_104t105),.out_B(data_104t114),.P(P104),.en_o(ctr_104o));
PE_gram PE105(.clk(clk),.rst(rst),.en(ctr_104o & ctr_95o ),.in_A(data_104t105),.in_B(data_95t105),.out_A(data_105t106),.out_B(data_105t115),.P(P105),.en_o(ctr_105o));
PE_gram PE106(.clk(clk),.rst(rst),.en(ctr_105o & ctr_96o ),.in_A(data_105t106),.in_B(data_96t106),.out_A(data_106t107),.out_B(data_106t116),.P(P106),.en_o(ctr_106o));
PE_gram PE107(.clk(clk),.rst(rst),.en(ctr_106o & ctr_97o ),.in_A(data_106t107),.in_B(data_97t107),.out_A(data_107t108),.out_B(data_107t117),.P(P107),.en_o(ctr_107o));
PE_gram PE108(.clk(clk),.rst(rst),.en(ctr_107o & ctr_98o ),.in_A(data_107t108),.in_B(data_98t108),.out_A(data_108t109),.out_B(data_108t118),.P(P108),.en_o(ctr_108o));
PE_gram PE109(.clk(clk),.rst(rst),.en(ctr_108o & ctr_99o ),.in_A(data_108t109),.in_B(data_99t109),.out_A(data_109t1010),.out_B(data_109t119),.P(P109),.en_o(ctr_109o));
PE_gram PE1010(.clk(clk),.rst(rst),.en(ctr_109o ),.in_A(data_109t1010),.in_B(c10[count]  ),.out_A(data_1010t1011),.out_B(data_1010t1110),.P(P1010),.en_o(ctr_1010o));
	
PE_gram PE111(.clk(clk),.rst(rst),.en(ctr_101o ),.in_A(r11[count]  ),.in_B(data_101t111),.out_A(data_111t112),.out_B(data_111t121),.P(P111),.en_o(ctr_111o));
PE_gram PE112(.clk(clk),.rst(rst),.en(ctr_111o & ctr_102o ),.in_A(data_111t112),.in_B(data_102t112),.out_A(data_112t113),.out_B(data_112t122),.P(P112),.en_o(ctr_112o));
PE_gram PE113(.clk(clk),.rst(rst),.en(ctr_112o & ctr_103o ),.in_A(data_112t113),.in_B(data_103t113),.out_A(data_113t114),.out_B(data_113t123),.P(P113),.en_o(ctr_113o));
PE_gram PE114(.clk(clk),.rst(rst),.en(ctr_113o & ctr_104o ),.in_A(data_113t114),.in_B(data_104t114),.out_A(data_114t115),.out_B(data_114t124),.P(P114),.en_o(ctr_114o));
PE_gram PE115(.clk(clk),.rst(rst),.en(ctr_114o & ctr_105o ),.in_A(data_114t115),.in_B(data_105t115),.out_A(data_115t116),.out_B(data_115t125),.P(P115),.en_o(ctr_115o));
PE_gram PE116(.clk(clk),.rst(rst),.en(ctr_115o & ctr_106o ),.in_A(data_115t116),.in_B(data_106t116),.out_A(data_116t117),.out_B(data_116t126),.P(P116),.en_o(ctr_116o));
PE_gram PE117(.clk(clk),.rst(rst),.en(ctr_116o & ctr_107o ),.in_A(data_116t117),.in_B(data_107t117),.out_A(data_117t118),.out_B(data_117t127),.P(P117),.en_o(ctr_117o));
PE_gram PE118(.clk(clk),.rst(rst),.en(ctr_117o & ctr_108o ),.in_A(data_117t118),.in_B(data_108t118),.out_A(data_118t119),.out_B(data_118t128),.P(P118),.en_o(ctr_118o));
PE_gram PE119(.clk(clk),.rst(rst),.en(ctr_118o & ctr_109o ),.in_A(data_118t119),.in_B(data_109t119),.out_A(data_119t1110),.out_B(data_119t129),.P(P119),.en_o(ctr_119o));
PE_gram PE1110(.clk(clk),.rst(rst),.en(ctr_119o & ctr_1010o ),.in_A(data_119t1110),.in_B(data_1010t1110),.out_A(data_1110t1111),.out_B(data_1110t1210),.P(P1110),.en_o(ctr_1110o));
PE_gram PE1111(.clk(clk),.rst(rst),.en(ctr_1110o ),.in_A(data_1110t1111),.in_B(c11[count]   ),.out_A(data_1111t1112),.out_B(data_1111t1211),.P(P1111),.en_o(ctr_1111o));
	
PE_gram PE121(.clk(clk),.rst(rst),.en(ctr_111o ),.in_A(r12[count]  ),.in_B(data_111t121),.out_A(data_121t122),.out_B(data_121t131),.P(P121),.en_o(ctr_121o));
PE_gram PE122(.clk(clk),.rst(rst),.en(ctr_121o & ctr_112o ),.in_A(data_121t122),.in_B(data_112t122),.out_A(data_122t123),.out_B(data_122t132),.P(P122),.en_o(ctr_122o));
PE_gram PE123(.clk(clk),.rst(rst),.en(ctr_122o & ctr_113o ),.in_A(data_122t123),.in_B(data_113t123),.out_A(data_123t124),.out_B(data_123t133),.P(P123),.en_o(ctr_123o));
PE_gram PE124(.clk(clk),.rst(rst),.en(ctr_123o & ctr_114o ),.in_A(data_123t124),.in_B(data_114t124),.out_A(data_124t125),.out_B(data_124t134),.P(P124),.en_o(ctr_124o));
PE_gram PE125(.clk(clk),.rst(rst),.en(ctr_124o & ctr_115o ),.in_A(data_124t125),.in_B(data_115t125),.out_A(data_125t126),.out_B(data_125t135),.P(P125),.en_o(ctr_125o));
PE_gram PE126(.clk(clk),.rst(rst),.en(ctr_125o & ctr_116o ),.in_A(data_125t126),.in_B(data_116t126),.out_A(data_126t127),.out_B(data_126t136),.P(P126),.en_o(ctr_126o));
PE_gram PE127(.clk(clk),.rst(rst),.en(ctr_126o & ctr_117o ),.in_A(data_126t127),.in_B(data_117t127),.out_A(data_127t128),.out_B(data_127t137),.P(P127),.en_o(ctr_127o));
PE_gram PE128(.clk(clk),.rst(rst),.en(ctr_127o & ctr_118o ),.in_A(data_127t128),.in_B(data_118t128),.out_A(data_128t129),.out_B(data_128t138),.P(P128),.en_o(ctr_128o));
PE_gram PE129(.clk(clk),.rst(rst),.en(ctr_128o & ctr_119o ),.in_A(data_128t129),.in_B(data_119t129),.out_A(data_129t1210),.out_B(data_129t139),.P(P129),.en_o(ctr_129o));
PE_gram PE1210(.clk(clk),.rst(rst),.en(ctr_129o & ctr_1110o ),.in_A(data_129t1210),.in_B(data_1110t1210),.out_A(data_1210t1211),.out_B(data_1210t1310),.P(P1210),.en_o(ctr_1210o));
PE_gram PE1211(.clk(clk),.rst(rst),.en(ctr_1210o & ctr_1111o ),.in_A(data_1210t1211),.in_B(data_1111t1211),.out_A(data_1211t1212),.out_B(data_1211t1311),.P(P1211),.en_o(ctr_1211o));
PE_gram PE1212(.clk(clk),.rst(rst),.en(ctr_1211o ),.in_A(data_1211t1212),.in_B(c12[count]    ),.out_A(data_1212t1213),.out_B(data_1212t1312),.P(P1212),.en_o(ctr_1212o));
	
PE_gram PE131(.clk(clk),.rst(rst),.en(ctr_121o ),.in_A(r13[count]  ),.in_B(data_121t131),.out_A(data_131t132),.out_B(data_131t141),.P(P131),.en_o(ctr_131o));
PE_gram PE132(.clk(clk),.rst(rst),.en(ctr_131o & ctr_122o ),.in_A(data_131t132),.in_B(data_122t132),.out_A(data_132t133),.out_B(data_132t142),.P(P132),.en_o(ctr_132o));
PE_gram PE133(.clk(clk),.rst(rst),.en(ctr_132o & ctr_123o ),.in_A(data_132t133),.in_B(data_123t133),.out_A(data_133t134),.out_B(data_133t143),.P(P133),.en_o(ctr_133o));
PE_gram PE134(.clk(clk),.rst(rst),.en(ctr_133o & ctr_124o ),.in_A(data_133t134),.in_B(data_124t134),.out_A(data_134t135),.out_B(data_134t144),.P(P134),.en_o(ctr_134o));
PE_gram PE135(.clk(clk),.rst(rst),.en(ctr_134o & ctr_125o ),.in_A(data_134t135),.in_B(data_125t135),.out_A(data_135t136),.out_B(data_135t145),.P(P135),.en_o(ctr_135o));
PE_gram PE136(.clk(clk),.rst(rst),.en(ctr_135o & ctr_126o ),.in_A(data_135t136),.in_B(data_126t136),.out_A(data_136t137),.out_B(data_136t146),.P(P136),.en_o(ctr_136o));
PE_gram PE137(.clk(clk),.rst(rst),.en(ctr_136o & ctr_127o ),.in_A(data_136t137),.in_B(data_127t137),.out_A(data_137t138),.out_B(data_137t147),.P(P137),.en_o(ctr_137o));
PE_gram PE138(.clk(clk),.rst(rst),.en(ctr_137o & ctr_128o ),.in_A(data_137t138),.in_B(data_128t138),.out_A(data_138t139),.out_B(data_138t148),.P(P138),.en_o(ctr_138o));
PE_gram PE139(.clk(clk),.rst(rst),.en(ctr_138o & ctr_129o ),.in_A(data_138t139),.in_B(data_129t139),.out_A(data_139t1310),.out_B(data_139t149),.P(P139),.en_o(ctr_139o));
PE_gram PE1310(.clk(clk),.rst(rst),.en(ctr_139o & ctr_1210o ),.in_A(data_139t1310),.in_B(data_1210t1310),.out_A(data_1310t1311),.out_B(data_1310t1410),.P(P1310),.en_o(ctr_1310o));
PE_gram PE1311(.clk(clk),.rst(rst),.en(ctr_1310o & ctr_1211o ),.in_A(data_1310t1311),.in_B(data_1211t1311),.out_A(data_1311t1312),.out_B(data_1311t1411),.P(P1311),.en_o(ctr_1311o));
PE_gram PE1312(.clk(clk),.rst(rst),.en(ctr_1311o & ctr_1212o ),.in_A(data_1311t1312),.in_B(data_1212t1312),.out_A(data_1312t1313),.out_B(data_1312t1412),.P(P1312),.en_o(ctr_1312o));
PE_gram PE1313(.clk(clk),.rst(rst),.en(ctr_1312o ),.in_A(data_1312t1313),.in_B(c13[count]    ),.out_A(data_1313t1314),.out_B(data_1313t1413),.P(P1313),.en_o(ctr_1313o));
	
PE_gram PE141(.clk(clk),.rst(rst),.en(ctr_131o ),.in_A(r14[count]  ),.in_B(data_131t141),.out_A(data_141t142),.out_B(data_141t151),.P(P141),.en_o(ctr_141o));
PE_gram PE142(.clk(clk),.rst(rst),.en(ctr_141o & ctr_132o ),.in_A(data_141t142),.in_B(data_132t142),.out_A(data_142t143),.out_B(data_142t152),.P(P142),.en_o(ctr_142o));
PE_gram PE143(.clk(clk),.rst(rst),.en(ctr_142o & ctr_133o ),.in_A(data_142t143),.in_B(data_133t143),.out_A(data_143t144),.out_B(data_143t153),.P(P143),.en_o(ctr_143o));
PE_gram PE144(.clk(clk),.rst(rst),.en(ctr_143o & ctr_134o ),.in_A(data_143t144),.in_B(data_134t144),.out_A(data_144t145),.out_B(data_144t154),.P(P144),.en_o(ctr_144o));
PE_gram PE145(.clk(clk),.rst(rst),.en(ctr_144o & ctr_135o ),.in_A(data_144t145),.in_B(data_135t145),.out_A(data_145t146),.out_B(data_145t155),.P(P145),.en_o(ctr_145o));
PE_gram PE146(.clk(clk),.rst(rst),.en(ctr_145o & ctr_136o ),.in_A(data_145t146),.in_B(data_136t146),.out_A(data_146t147),.out_B(data_146t156),.P(P146),.en_o(ctr_146o));
PE_gram PE147(.clk(clk),.rst(rst),.en(ctr_146o & ctr_137o ),.in_A(data_146t147),.in_B(data_137t147),.out_A(data_147t148),.out_B(data_147t157),.P(P147),.en_o(ctr_147o));
PE_gram PE148(.clk(clk),.rst(rst),.en(ctr_147o & ctr_138o ),.in_A(data_147t148),.in_B(data_138t148),.out_A(data_148t149),.out_B(data_148t158),.P(P148),.en_o(ctr_148o));
PE_gram PE149(.clk(clk),.rst(rst),.en(ctr_148o & ctr_139o ),.in_A(data_148t149),.in_B(data_139t149),.out_A(data_149t1410),.out_B(data_149t159),.P(P149),.en_o(ctr_149o));
PE_gram PE1410(.clk(clk),.rst(rst),.en(ctr_149o & ctr_1310o ),.in_A(data_149t1410),.in_B(data_1310t1410),.out_A(data_1410t1411),.out_B(data_1410t1510),.P(P1410),.en_o(ctr_1410o));
PE_gram PE1411(.clk(clk),.rst(rst),.en(ctr_1410o & ctr_1311o ),.in_A(data_1410t1411),.in_B(data_1311t1411),.out_A(data_1411t1412),.out_B(data_1411t1511),.P(P1411),.en_o(ctr_1411o));
PE_gram PE1412(.clk(clk),.rst(rst),.en(ctr_1411o & ctr_1312o ),.in_A(data_1411t1412),.in_B(data_1312t1412),.out_A(data_1412t1413),.out_B(data_1412t1512),.P(P1412),.en_o(ctr_1412o));
PE_gram PE1413(.clk(clk),.rst(rst),.en(ctr_1412o & ctr_1313o ),.in_A(data_1412t1413),.in_B(data_1313t1413),.out_A(data_1413t1414),.out_B(data_1413t1513),.P(P1413),.en_o(ctr_1413o));
PE_gram PE1414(.clk(clk),.rst(rst),.en(ctr_1413o  ),.in_A(data_1413t1414),.in_B(c14[count]    ),.out_A(data_1414t1415),.out_B(data_1414t1514),.P(P1414),.en_o(ctr_1414o));
	
PE_gram PE151(.clk(clk),.rst(rst),.en(ctr_141o ),.in_A(r15[count]  ),.in_B(data_141t151),.out_A(data_151t152),.out_B(data_151t161),.P(P151),.en_o(ctr_151o));
PE_gram PE152(.clk(clk),.rst(rst),.en(ctr_151o & ctr_142o ),.in_A(data_151t152),.in_B(data_142t152),.out_A(data_152t153),.out_B(data_152t162),.P(P152),.en_o(ctr_152o));
PE_gram PE153(.clk(clk),.rst(rst),.en(ctr_152o & ctr_143o ),.in_A(data_152t153),.in_B(data_143t153),.out_A(data_153t154),.out_B(data_153t163),.P(P153),.en_o(ctr_153o));
PE_gram PE154(.clk(clk),.rst(rst),.en(ctr_153o & ctr_144o ),.in_A(data_153t154),.in_B(data_144t154),.out_A(data_154t155),.out_B(data_154t164),.P(P154),.en_o(ctr_154o));
PE_gram PE155(.clk(clk),.rst(rst),.en(ctr_154o & ctr_145o ),.in_A(data_154t155),.in_B(data_145t155),.out_A(data_155t156),.out_B(data_155t165),.P(P155),.en_o(ctr_155o));
PE_gram PE156(.clk(clk),.rst(rst),.en(ctr_155o & ctr_146o ),.in_A(data_155t156),.in_B(data_146t156),.out_A(data_156t157),.out_B(data_156t166),.P(P156),.en_o(ctr_156o));
PE_gram PE157(.clk(clk),.rst(rst),.en(ctr_156o & ctr_147o ),.in_A(data_156t157),.in_B(data_147t157),.out_A(data_157t158),.out_B(data_157t167),.P(P157),.en_o(ctr_157o));
PE_gram PE158(.clk(clk),.rst(rst),.en(ctr_157o & ctr_148o ),.in_A(data_157t158),.in_B(data_148t158),.out_A(data_158t159),.out_B(data_158t168),.P(P158),.en_o(ctr_158o));
PE_gram PE159(.clk(clk),.rst(rst),.en(ctr_158o & ctr_149o ),.in_A(data_158t159),.in_B(data_149t159),.out_A(data_159t1510),.out_B(data_159t169),.P(P159),.en_o(ctr_159o));
PE_gram PE1510(.clk(clk),.rst(rst),.en(ctr_159o & ctr_1410o ),.in_A(data_159t1510),.in_B(data_1410t1510),.out_A(data_1510t1511),.out_B(data_1510t1610),.P(P1510),.en_o(ctr_1510o));
PE_gram PE1511(.clk(clk),.rst(rst),.en(ctr_1510o & ctr_1411o ),.in_A(data_1510t1511),.in_B(data_1411t1511),.out_A(data_1511t1512),.out_B(data_1511t1611),.P(P1511),.en_o(ctr_1511o));
PE_gram PE1512(.clk(clk),.rst(rst),.en(ctr_1511o & ctr_1412o ),.in_A(data_1511t1512),.in_B(data_1412t1512),.out_A(data_1512t1513),.out_B(data_1512t1612),.P(P1512),.en_o(ctr_1512o));
PE_gram PE1513(.clk(clk),.rst(rst),.en(ctr_1512o & ctr_1413o ),.in_A(data_1512t1513),.in_B(data_1413t1513),.out_A(data_1513t1514),.out_B(data_1513t1613),.P(P1513),.en_o(ctr_1513o));
PE_gram PE1514(.clk(clk),.rst(rst),.en(ctr_1513o & ctr_1414o ),.in_A(data_1513t1514),.in_B(data_1414t1514),.out_A(data_1514t1515),.out_B(data_1514t1614),.P(P1514),.en_o(ctr_1514o));
PE_gram PE1515(.clk(clk),.rst(rst),.en(ctr_1514o ),.in_A(data_1514t1515),.in_B(c15[count]    ),.out_A(data_1515t1516),.out_B(data_1515t1615),.P(P1515),.en_o(ctr_1515o));
	
PE_gram PE161(.clk(clk),.rst(rst),.en(ctr_151o ),.in_A(r16[count]  ),.in_B(data_151t161),.out_A(data_161t162),.out_B(data_161t171),.P(P161),.en_o(ctr_161o));
PE_gram PE162(.clk(clk),.rst(rst),.en(ctr_161o & ctr_152o ),.in_A(data_161t162),.in_B(data_152t162),.out_A(data_162t163),.out_B(data_162t172),.P(P162),.en_o(ctr_162o));
PE_gram PE163(.clk(clk),.rst(rst),.en(ctr_162o & ctr_153o ),.in_A(data_162t163),.in_B(data_153t163),.out_A(data_163t164),.out_B(data_163t173),.P(P163),.en_o(ctr_163o));
PE_gram PE164(.clk(clk),.rst(rst),.en(ctr_163o & ctr_154o ),.in_A(data_163t164),.in_B(data_154t164),.out_A(data_164t165),.out_B(data_164t174),.P(P164),.en_o(ctr_164o));
PE_gram PE165(.clk(clk),.rst(rst),.en(ctr_164o & ctr_155o ),.in_A(data_164t165),.in_B(data_155t165),.out_A(data_165t166),.out_B(data_165t175),.P(P165),.en_o(ctr_165o));
PE_gram PE166(.clk(clk),.rst(rst),.en(ctr_165o & ctr_156o ),.in_A(data_165t166),.in_B(data_156t166),.out_A(data_166t167),.out_B(data_166t176),.P(P166),.en_o(ctr_166o));
PE_gram PE167(.clk(clk),.rst(rst),.en(ctr_166o & ctr_157o ),.in_A(data_166t167),.in_B(data_157t167),.out_A(data_167t168),.out_B(data_167t177),.P(P167),.en_o(ctr_167o));
PE_gram PE168(.clk(clk),.rst(rst),.en(ctr_167o & ctr_158o ),.in_A(data_167t168),.in_B(data_158t168),.out_A(data_168t169),.out_B(data_168t178),.P(P168),.en_o(ctr_168o));
PE_gram PE169(.clk(clk),.rst(rst),.en(ctr_168o & ctr_159o ),.in_A(data_168t169),.in_B(data_159t169),.out_A(data_169t1610),.out_B(data_169t179),.P(P169),.en_o(ctr_169o));
PE_gram PE1610(.clk(clk),.rst(rst),.en(ctr_169o & ctr_1510o ),.in_A(data_169t1610),.in_B(data_1510t1610),.out_A(data_1610t1611),.out_B(data_1610t1710),.P(P1610),.en_o(ctr_1610o));
PE_gram PE1611(.clk(clk),.rst(rst),.en(ctr_1610o & ctr_1511o ),.in_A(data_1610t1611),.in_B(data_1511t1611),.out_A(data_1611t1612),.out_B(data_1611t1711),.P(P1611),.en_o(ctr_1611o));
PE_gram PE1612(.clk(clk),.rst(rst),.en(ctr_1611o & ctr_1512o ),.in_A(data_1611t1612),.in_B(data_1512t1612),.out_A(data_1612t1613),.out_B(data_1612t1712),.P(P1612),.en_o(ctr_1612o));
PE_gram PE1613(.clk(clk),.rst(rst),.en(ctr_1612o & ctr_1513o ),.in_A(data_1612t1613),.in_B(data_1513t1613),.out_A(data_1613t1614),.out_B(data_1613t1713),.P(P1613),.en_o(ctr_1613o));
PE_gram PE1614(.clk(clk),.rst(rst),.en(ctr_1613o & ctr_1514o ),.in_A(data_1613t1614),.in_B(data_1514t1614),.out_A(data_1614t1615),.out_B(data_1614t1714),.P(P1614),.en_o(ctr_1614o));
PE_gram PE1615(.clk(clk),.rst(rst),.en(ctr_1614o & ctr_1515o ),.in_A(data_1614t1615),.in_B(data_1515t1615),.out_A(data_1615t1616),.out_B(data_1615t1715),.P(P1615),.en_o(ctr_1615o));
PE_gram PE1616(.clk(clk),.rst(rst),.en(ctr_1615o ),.in_A(data_1615t1616),.in_B(c16[count]    ),.out_A(data_1616t1617),.out_B(data_1616t1716),.P(P1616),.en_o(ctr_1616o));





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
begin
G1 <= 0;
G2 <= 0;
G3 <= 0;
G4 <= 0;
G5 <= 0;
G6 <= 0;
G7 <= 0;
G8 <= 0;
G9 <= 0;
G10 <= 0;
G11 <= 0;
G12 <= 0;
G13 <= 0;
G14 <= 0;
G15 <= 0;
G16 <= 0;
end
else if(en)
    begin
        if(c_n==DIMENSION)
            begin
                G1[16*WIDTH-1:15*WIDTH]<=P11;
            end
        else if(c_n==DIMENSION+1)
            begin
                G2[16*WIDTH-1:15*WIDTH]<=P21; 
                G1[15*WIDTH-1:14*WIDTH]<=-P21;
            end
        else if(c_n==DIMENSION+2)
            begin
                 G3[16*WIDTH-1:15*WIDTH]<=P31;
                 G2[15*WIDTH-1:14*WIDTH]<=P22; 
                 G1[14*WIDTH-1:13*WIDTH]<=-P31;
            end
        else if(c_n==DIMENSION+3)
            begin
			     G4[16*WIDTH-1:15*WIDTH]<=P41;
                 G3[15*WIDTH-1:14*WIDTH]<=P32; 
                 G2[14*WIDTH-1:13*WIDTH]<=-P32; 
				 G1[13*WIDTH-1:12*WIDTH]<=-P41; 
            end
        else if(c_n==DIMENSION+4)
            begin
                G5[16*WIDTH-1:15*WIDTH]<=P51;
				G4[15*WIDTH-1:14*WIDTH]<=P42;
				G3[14*WIDTH-1:13*WIDTH]<=P33;
				G2[13*WIDTH-1:12*WIDTH]<=-P42;
				G1[12*WIDTH-1:11*WIDTH]<=-P51;
            end
        else if(c_n==DIMENSION+5)
            begin
                G6[16*WIDTH-1:15*WIDTH]<=P61;
				G5[15*WIDTH-1:14*WIDTH]<=P52;
				G4[14*WIDTH-1:13*WIDTH]<=P43;
				G3[13*WIDTH-1:12*WIDTH]<=-P43;
				G2[12*WIDTH-1:11*WIDTH]<=-P52;
				G1[11*WIDTH-1:10*WIDTH]<=-P61;	
            end
        else if(c_n==DIMENSION+6)
            begin
                G7[16*WIDTH-1:15*WIDTH]<=P71;
				G6[15*WIDTH-1:14*WIDTH]<=P62;
				G5[14*WIDTH-1:13*WIDTH]<=P53;
				G4[13*WIDTH-1:12*WIDTH]<=P44;
				G3[12*WIDTH-1:11*WIDTH]<=-P53;
				G2[11*WIDTH-1:10*WIDTH]<=-P62;	
				G1[10*WIDTH-1:9*WIDTH]<=-P71;	
            end			
        else if(c_n==DIMENSION+7)
            begin
                G8[16*WIDTH-1:15*WIDTH]<=P81;
				G7[15*WIDTH-1:14*WIDTH]<=P72;
				G6[14*WIDTH-1:13*WIDTH]<=P63;
				G5[13*WIDTH-1:12*WIDTH]<=P54;
				G4[12*WIDTH-1:11*WIDTH]<=-P54;
				G3[11*WIDTH-1:10*WIDTH]<=-P63;	
				G2[10*WIDTH-1:9*WIDTH]<=-P72;	
				G1[9*WIDTH-1:8*WIDTH]<=-P81;	
            end	
        else if(c_n==DIMENSION+8)
            begin
                G9[16*WIDTH-1:15*WIDTH]<=P91;
				G8[15*WIDTH-1:14*WIDTH]<=P82;
				G7[14*WIDTH-1:13*WIDTH]<=P73;
				G6[13*WIDTH-1:12*WIDTH]<=P64;
				G5[12*WIDTH-1:11*WIDTH]<=P55;
				G4[11*WIDTH-1:10*WIDTH]<=-P64;	
				G3[10*WIDTH-1:9*WIDTH]<=-P73;	
				G2[9*WIDTH-1:8*WIDTH]<=-P82;	
				G1[8*WIDTH-1:7*WIDTH]<=-P91;
            end	
        else if(c_n==DIMENSION+9)
            begin
                G10[16*WIDTH-1:15*WIDTH]<=P101;
				G9[15*WIDTH-1:14*WIDTH]<=P92;
				G8[14*WIDTH-1:13*WIDTH]<=P83;
				G7[13*WIDTH-1:12*WIDTH]<=P74;
				G6[12*WIDTH-1:11*WIDTH]<=P65;
				G5[11*WIDTH-1:10*WIDTH]<=-P65;	
				G4[10*WIDTH-1:9*WIDTH]<=-P74;	
				G3[9*WIDTH-1:8*WIDTH]<=-P83;	
				G2[8*WIDTH-1:7*WIDTH]<=-P92;
				G1[7*WIDTH-1:6*WIDTH]<=-P101;
            end	
        else if(c_n==DIMENSION+10)
            begin
                G11[16*WIDTH-1:15*WIDTH]<=P111;
				G10[15*WIDTH-1:14*WIDTH]<=P102;
				G9[14*WIDTH-1:13*WIDTH]<=P93;
				G8[13*WIDTH-1:12*WIDTH]<=P84;
				G7[12*WIDTH-1:11*WIDTH]<=P75;
				G6[11*WIDTH-1:10*WIDTH]<=P66;	
				G5[10*WIDTH-1:9*WIDTH]<=-P75;	
				G4[9*WIDTH-1:8*WIDTH]<=-P84;	
				G3[8*WIDTH-1:7*WIDTH]<=-P93;
				G2[7*WIDTH-1:6*WIDTH]<=-P102;
				G1[6*WIDTH-1:5*WIDTH]<=-P111;
            end	
        else if(c_n==DIMENSION+11)
            begin
                G12[16*WIDTH-1:15*WIDTH]<=P121;
				G11[15*WIDTH-1:14*WIDTH]<=P112;
				G10[14*WIDTH-1:13*WIDTH]<=P103;
				G9[13*WIDTH-1:12*WIDTH]<=P94;
				G8[12*WIDTH-1:11*WIDTH]<=P85;
				G7[11*WIDTH-1:10*WIDTH]<=P76;	
				G6[10*WIDTH-1:9*WIDTH]<=-P76;	
				G5[9*WIDTH-1:8*WIDTH]<=-P85;	
				G4[8*WIDTH-1:7*WIDTH]<=-P94;
				G3[7*WIDTH-1:6*WIDTH]<=-P103;
				G2[6*WIDTH-1:5*WIDTH]<=-P112;
				G1[5*WIDTH-1:4*WIDTH]<=-P121;
            end			
        else if(c_n==DIMENSION+12)
            begin
                G13[16*WIDTH-1:15*WIDTH]<=P131;
				G12[15*WIDTH-1:14*WIDTH]<=P122;
				G11[14*WIDTH-1:13*WIDTH]<=P113;
				G10[13*WIDTH-1:12*WIDTH]<=P104;
				G9[12*WIDTH-1:11*WIDTH]<=P95;
				G8[11*WIDTH-1:10*WIDTH]<=P86;	
				G7[10*WIDTH-1:9*WIDTH]<=P77;	
				G6[9*WIDTH-1:8*WIDTH]<=-P86;	
				G5[8*WIDTH-1:7*WIDTH]<=-P95;
				G4[7*WIDTH-1:6*WIDTH]<=-P104;
				G3[6*WIDTH-1:5*WIDTH]<=-P113;
				G2[5*WIDTH-1:4*WIDTH]<=-P122;
				G1[4*WIDTH-1:3*WIDTH]<=-P131;
            end	
        else if(c_n==DIMENSION+13)
            begin
                G14[16*WIDTH-1:15*WIDTH]<=P141;
				G13[15*WIDTH-1:14*WIDTH]<=P132;
				G12[14*WIDTH-1:13*WIDTH]<=P123;
				G11[13*WIDTH-1:12*WIDTH]<=P114;
				G10[12*WIDTH-1:11*WIDTH]<=P105;
				G9[11*WIDTH-1:10*WIDTH]<=P96;	
				G8[10*WIDTH-1:9*WIDTH]<=P87;	
				G7[9*WIDTH-1:8*WIDTH]<=-P87;	
				G6[8*WIDTH-1:7*WIDTH]<=-P96;
				G5[7*WIDTH-1:6*WIDTH]<=-P105;
				G4[6*WIDTH-1:5*WIDTH]<=-P114;
				G3[5*WIDTH-1:4*WIDTH]<=-P123;
				G2[4*WIDTH-1:3*WIDTH]<=-P132;
				G1[3*WIDTH-1:2*WIDTH]<=-P141;
            end	
        else if(c_n==DIMENSION+14)
            begin
                G15[16*WIDTH-1:15*WIDTH]<=P151;
				G14[15*WIDTH-1:14*WIDTH]<=P142;
				G13[14*WIDTH-1:13*WIDTH]<=P133;
				G12[13*WIDTH-1:12*WIDTH]<=P124;
				G11[12*WIDTH-1:11*WIDTH]<=P115;
				G10[11*WIDTH-1:10*WIDTH]<=P106;	
				G9[10*WIDTH-1:9*WIDTH]<=P97;	
				G8[9*WIDTH-1:8*WIDTH]<=P88;	
				G7[8*WIDTH-1:7*WIDTH]<=-P97;
				G6[7*WIDTH-1:6*WIDTH]<=-P106;
				G5[6*WIDTH-1:5*WIDTH]<=-P115;
				G4[5*WIDTH-1:4*WIDTH]<=-P124;
				G3[4*WIDTH-1:3*WIDTH]<=-P133;
				G2[3*WIDTH-1:2*WIDTH]<=-P142;
				G1[2*WIDTH-1:1*WIDTH]<=-P151;
            end	
        else if(c_n==DIMENSION+15)
            begin
			    G16[16*WIDTH-1:15*WIDTH]<=P161;
				G15[15*WIDTH-1:14*WIDTH]<=P152;
				G14[14*WIDTH-1:13*WIDTH]<=P143;
				G13[13*WIDTH-1:12*WIDTH]<=P134;
				G12[12*WIDTH-1:11*WIDTH]<=P125;
				G11[11*WIDTH-1:10*WIDTH]<=P116;	
				G10[10*WIDTH-1:9*WIDTH]<=P107;	
				G9[9*WIDTH-1:8*WIDTH]<=P98;	
				G8[8*WIDTH-1:7*WIDTH]<=-P98;
				G7[7*WIDTH-1:6*WIDTH]<=-P107;
				G6[6*WIDTH-1:5*WIDTH]<=-P116;
				G5[5*WIDTH-1:4*WIDTH]<=-P125;
				G4[4*WIDTH-1:3*WIDTH]<=-P134;
				G3[3*WIDTH-1:2*WIDTH]<=-P143;
				G2[2*WIDTH-1:1*WIDTH]<=-P152;
                G1[1*WIDTH-1:0*WIDTH]<=-P161;
            end	
        else if(c_n==DIMENSION+16)
            begin
			    G16[15*WIDTH-1:14*WIDTH]<=P162;
				G15[14*WIDTH-1:13*WIDTH]<=P153;
				G14[13*WIDTH-1:12*WIDTH]<=P144;
				G13[12*WIDTH-1:11*WIDTH]<=P135;
				G12[11*WIDTH-1:10*WIDTH]<=P126;
				G11[10*WIDTH-1:9*WIDTH]<=P117;	
				G10[9*WIDTH-1:8*WIDTH]<=P108;	
				G9[8*WIDTH-1:7*WIDTH]<=P99;	
				G8[7*WIDTH-1:6*WIDTH]<=-P108;
				G7[6*WIDTH-1:5*WIDTH]<=-P117;
				G6[5*WIDTH-1:4*WIDTH]<=-P126;
				G5[4*WIDTH-1:3*WIDTH]<=-P135;
				G4[3*WIDTH-1:2*WIDTH]<=-P144;
				G3[3*WIDTH-1:1*WIDTH]<=-P153;
				G2[1*WIDTH-1:0*WIDTH]<=-P162;
            end	
        else if(c_n==DIMENSION+17)
            begin
			    G16[14*WIDTH-1:13*WIDTH]<=P163;
				G15[13*WIDTH-1:12*WIDTH]<=P154;
				G14[12*WIDTH-1:11*WIDTH]<=P145;
				G13[11*WIDTH-1:10*WIDTH]<=P136;
				G12[10*WIDTH-1:9*WIDTH]<=P127;
				G11[9*WIDTH-1:8*WIDTH]<=P118;	
				G10[8*WIDTH-1:7*WIDTH]<=P109;	
				G9[7*WIDTH-1:6*WIDTH]<=-P109;	
				G8[6*WIDTH-1:5*WIDTH]<=-P118;
				G7[5*WIDTH-1:4*WIDTH]<=-P127;
				G6[4*WIDTH-1:3*WIDTH]<=-P136;
				G5[3*WIDTH-1:2*WIDTH]<=-P145;
				G4[2*WIDTH-1:1*WIDTH]<=-P154;
				G3[1*WIDTH-1:0*WIDTH]<=-P163;
            end				
        else if(c_n==DIMENSION+18)
            begin
				G16[13*WIDTH-1:12*WIDTH]<=P164;
				G15[12*WIDTH-1:11*WIDTH]<=P155;
				G14[11*WIDTH-1:10*WIDTH]<=P146;
				G13[10*WIDTH-1:9*WIDTH]<=P137;
				G12[9*WIDTH-1:8*WIDTH]<=P128;	
				G11[8*WIDTH-1:7*WIDTH]<=P119;	
				G10[7*WIDTH-1:6*WIDTH]<=P1010;	
				G9[6*WIDTH-1:5*WIDTH]<=-P119;
				G8[5*WIDTH-1:4*WIDTH]<=-P128;
				G7[4*WIDTH-1:3*WIDTH]<=-P137;
				G6[3*WIDTH-1:2*WIDTH]<=-P146;
				G5[2*WIDTH-1:1*WIDTH]<=-P155;
				G4[1*WIDTH-1:0*WIDTH]<=-P164;
            end	
        else if(c_n==DIMENSION+19)
            begin
				G16[12*WIDTH-1:11*WIDTH]<=P165;
				G15[11*WIDTH-1:10*WIDTH]<=P156;
				G14[10*WIDTH-1:9*WIDTH]<=P147;
				G13[9*WIDTH-1:8*WIDTH]<=P138;	
				G12[8*WIDTH-1:7*WIDTH]<=P129;	
				G11[7*WIDTH-1:6*WIDTH]<=P1110;	
				G10[6*WIDTH-1:5*WIDTH]<=-P1110;
				G9[5*WIDTH-1:4*WIDTH]<=-P129;
				G8[4*WIDTH-1:3*WIDTH]<=-P138;
				G7[3*WIDTH-1:2*WIDTH]<=-P147;
				G6[2*WIDTH-1:1*WIDTH]<=-P156;
				G5[1*WIDTH-1:0*WIDTH]<=-P165;
            end	
        else if(c_n==DIMENSION+20)
            begin
				G16[11*WIDTH-1:10*WIDTH]<=P166;
				G15[10*WIDTH-1:9*WIDTH]<=P157;
				G14[9*WIDTH-1:8*WIDTH]<=P148;	
				G13[8*WIDTH-1:7*WIDTH]<=P139;	
				G12[7*WIDTH-1:6*WIDTH]<=P1210;	
				G11[6*WIDTH-1:5*WIDTH]<=P1111;
				G10[5*WIDTH-1:4*WIDTH]<=-P1210;
				G9[4*WIDTH-1:3*WIDTH]<=-P139;
				G8[3*WIDTH-1:2*WIDTH]<=-P148;
				G7[2*WIDTH-1:1*WIDTH]<=-P157;
				G6[1*WIDTH-1:0*WIDTH]<=-P166;
            end	
        else if(c_n==DIMENSION+21)
            begin
				G16[10*WIDTH-1:9*WIDTH]<=P167;
				G15[9*WIDTH-1:8*WIDTH]<=P158;	
				G14[8*WIDTH-1:7*WIDTH]<=P149;	
				G13[7*WIDTH-1:6*WIDTH]<=P1310;	
				G12[6*WIDTH-1:5*WIDTH]<=P1211;
				G11[5*WIDTH-1:4*WIDTH]<=-P1211;
				G10[4*WIDTH-1:3*WIDTH]<=-P1310;
				G9[3*WIDTH-1:2*WIDTH]<=-P149;
				G8[2*WIDTH-1:1*WIDTH]<=-P158;
				G7[1*WIDTH-1:0*WIDTH]<=-P167;
            end
        else if(c_n==DIMENSION+22)
            begin
				G16[9*WIDTH-1:8*WIDTH]<=P168;	
				G15[8*WIDTH-1:7*WIDTH]<=P159;	
				G14[7*WIDTH-1:6*WIDTH]<=P1410;	
				G13[6*WIDTH-1:5*WIDTH]<=P1311;
				G12[5*WIDTH-1:4*WIDTH]<=P1212;
				G11[4*WIDTH-1:3*WIDTH]<=-P1311;
				G10[3*WIDTH-1:2*WIDTH]<=-P1410;
				G9[2*WIDTH-1:1*WIDTH]<=-P159;
				G8[1*WIDTH-1:0*WIDTH]<=-P168;
            end			
        else if(c_n==DIMENSION+23)
            begin
				G16[8*WIDTH-1:7*WIDTH]<=P169;	
				G15[7*WIDTH-1:6*WIDTH]<=P1510;	
				G14[6*WIDTH-1:5*WIDTH]<=P1411;
				G13[5*WIDTH-1:4*WIDTH]<=P1312;
				G12[4*WIDTH-1:3*WIDTH]<=-P1312;
				G11[3*WIDTH-1:2*WIDTH]<=-P1411;
				G10[2*WIDTH-1:1*WIDTH]<=-P1510;
				G9[1*WIDTH-1:0*WIDTH]<=-P169;
            end	
        else if(c_n==DIMENSION+24)
            begin
				G16[7*WIDTH-1:6*WIDTH]<=P1610;	
				G15[6*WIDTH-1:5*WIDTH]<=P1511;
				G14[5*WIDTH-1:4*WIDTH]<=P1412;
				G13[4*WIDTH-1:3*WIDTH]<=P1313;
				G12[3*WIDTH-1:2*WIDTH]<=-P1412;
				G11[2*WIDTH-1:1*WIDTH]<=-P1511;
				G10[1*WIDTH-1:0*WIDTH]<=-P1610;
            end				
        else if(c_n==DIMENSION+25)
            begin
				G16[6*WIDTH-1:5*WIDTH]<=P1611;
				G15[5*WIDTH-1:4*WIDTH]<=P1512;
				G14[4*WIDTH-1:3*WIDTH]<=P1413;
				G13[3*WIDTH-1:2*WIDTH]<=-P1413;
				G12[2*WIDTH-1:1*WIDTH]<=-P1512;
				G11[1*WIDTH-1:0*WIDTH]<=-P1611;
            end	
        else if(c_n==DIMENSION+26)
            begin
				G16[5*WIDTH-1:4*WIDTH]<=P1612;
				G15[4*WIDTH-1:3*WIDTH]<=P1513;
				G14[3*WIDTH-1:2*WIDTH]<=P1414;
				G13[2*WIDTH-1:1*WIDTH]<=-P1513;
				G12[1*WIDTH-1:0*WIDTH]<=-P1612;
            end	
        else if(c_n==DIMENSION+27)
            begin
				G16[4*WIDTH-1:3*WIDTH]<=P1613;
				G15[3*WIDTH-1:2*WIDTH]<=P1514;
				G14[2*WIDTH-1:1*WIDTH]<=-P1514;
				G13[1*WIDTH-1:0*WIDTH]<=-P1613;
            end	
        else if(c_n==DIMENSION+28)
            begin
				G16[3*WIDTH-1:2*WIDTH]<=P1614;
				G15[2*WIDTH-1:1*WIDTH]<=P1515;
				G14[1*WIDTH-1:0*WIDTH]<=-P1614;
            end	
        else if(c_n==DIMENSION+29)
            begin
				G16[2*WIDTH-1:1*WIDTH]<=P1615;
				G15[1*WIDTH-1:0*WIDTH]<=-P1615;
            end	
        else if(c_n==DIMENSION+30)
            begin
				G15[1*WIDTH-1:0*WIDTH]<=P1616;
            end	
			
        else
            begin
            G1<=G1;
            G2<=G2;
            G3<=G3;
            G4<=G4;
			G5 <= G5;
			G6 <= G6;
			G7 <= G7;
			G8 <= G8;
			G9 <= G9;
			G10 <= G10;
			G11 <= G11;
			G12 <= G12;
			G13 <= G13;
			G14 <= G14;
			G15 <= G15;
			G16 <= G16;
            end
    end

else
    begin
G1 <= 0;
G2 <= 0;
G3 <= 0;
G4 <= 0;
G5 <= 0;
G6 <= 0;
G7 <= 0;
G8 <= 0;
G9 <= 0;
G10 <= 0;
G11 <= 0;
G12 <= 0;
G13 <= 0;
G14 <= 0;
G15 <= 0;
G16 <= 0;
    end

end

endmodule

