// Instruction Memory Starts
module Dff_IM(input clk, input reset, input d, output reg q);
    always@(reset, posedge clk)
    begin
        if(reset == 1'b1)
        begin
            q = d;
        end
    end
endmodule

module register_IM(input clk, input reset, input [7:0] inR, output [7:0] outR);
    Dff_IM d0 (clk, reset, inR[0],  outR[0]);
    Dff_IM d1 (clk, reset, inR[1],  outR[1]);
    Dff_IM d2 (clk, reset, inR[2],  outR[2]);
    Dff_IM d3 (clk, reset, inR[3],  outR[3]);
    Dff_IM d4 (clk, reset, inR[4],  outR[4]);
    Dff_IM d5 (clk, reset, inR[5],  outR[5]);
    Dff_IM d6 (clk, reset, inR[6],  outR[6]);
    Dff_IM d7 (clk, reset, inR[7],  outR[7]);
endmodule

module mux128to1_IM(input [7:0] in0,   input [7:0] in1,   input [7:0] in2,   input [7:0] in3,
                    input [7:0] in4,   input [7:0] in5,   input [7:0] in6,   input [7:0] in7,
                    input [7:0] in8,   input [7:0] in9,   input [7:0] in10,  input [7:0] in11,
                    input [7:0] in12,  input [7:0] in13,  input [7:0] in14,  input [7:0] in15,
                    input [7:0] in16,  input [7:0] in17,  input [7:0] in18,  input [7:0] in19,
                    input [7:0] in20,  input [7:0] in21,  input [7:0] in22,  input [7:0] in23,
                    input [7:0] in24,  input [7:0] in25,  input [7:0] in26,  input [7:0] in27,
                    input [7:0] in28,  input [7:0] in29,  input [7:0] in30,  input [7:0] in31,
                    input [7:0] in32,  input [7:0] in33,  input [7:0] in34,  input [7:0] in35,
                    input [7:0] in36,  input [7:0] in37,  input [7:0] in38,  input [7:0] in39,
                    input [7:0] in40,  input [7:0] in41,  input [7:0] in42,  input [7:0] in43,
                    input [7:0] in44,  input [7:0] in45,  input [7:0] in46,  input [7:0] in47,
                    input [7:0] in48,  input [7:0] in49,  input [7:0] in50,  input [7:0] in51,
                    input [7:0] in52,  input [7:0] in53,  input [7:0] in54,  input [7:0] in55,
                    input [7:0] in56,  input [7:0] in57,  input [7:0] in58,  input [7:0] in59,
                    input [7:0] in60,  input [7:0] in61,  input [7:0] in62,  input [7:0] in63,
                    input [7:0] in64,  input [7:0] in65,  input [7:0] in66,  input [7:0] in67,
                    input [7:0] in68,  input [7:0] in69,  input [7:0] in70,  input [7:0] in71,
                    input [7:0] in72,  input [7:0] in73,  input [7:0] in74,  input [7:0] in75,
                    input [7:0] in76,  input [7:0] in77,  input [7:0] in78,  input [7:0] in79,
                    input [7:0] in80,  input [7:0] in81,  input [7:0] in82,  input [7:0] in83,
                    input [7:0] in84,  input [7:0] in85,  input [7:0] in86,  input [7:0] in87,
                    input [7:0] in88,  input [7:0] in89,  input [7:0] in90,  input [7:0] in91,
                    input [7:0] in92,  input [7:0] in93,  input [7:0] in94,  input [7:0] in95,
                    input [7:0] in96,  input [7:0] in97,  input [7:0] in98,  input [7:0] in99,
                    input [7:0] in100, input [7:0] in101, input [7:0] in102, input [7:0] in103,
                    input [7:0] in104, input [7:0] in105, input [7:0] in106, input [7:0] in107,
                    input [7:0] in108, input [7:0] in109, input [7:0] in110, input [7:0] in111,
                    input [7:0] in112, input [7:0] in113, input [7:0] in114, input [7:0] in115,
                    input [7:0] in116, input [7:0] in117, input [7:0] in118, input [7:0] in119,
                    input [7:0] in120, input [7:0] in121, input [7:0] in122, input [7:0] in123,
                    input [7:0] in124, input [7:0] in125, input [7:0] in126, input [7:0] in127,
                    input [4:0] select, output reg [31:0] muxOut);
    always@(in0,   in1,   in2,   in3,   in4,   in5,   in6,   in7, 
            in8,   in9,   in10,  in11,  in12,  in13,  in14,  in15,   
            in16,  in17,  in18,  in19,  in20,  in21,  in22,  in23, 
            in24,  in25,  in26,  in27,  in28,  in29,  in30,  in31, 
            in32,  in33,  in34,  in35,  in36,  in37,  in38,  in39, 
            in40,  in41,  in42,  in43,  in44,  in45,  in46,  in47, 
            in48,  in49,  in50,  in51,  in52,  in53,  in54,  in55, 
            in56,  in57,  in58,  in59,  in60,  in61,  in62,  in63, 
            in64,  in65,  in66,  in67,  in68,  in69,  in70,  in71, 
            in72,  in73,  in74,  in75,  in76,  in77,  in78,  in79, 
            in80,  in81,  in82,  in83,  in84,  in85,  in86,  in87, 
            in88,  in89,  in90,  in91,  in92,  in93,  in94,  in95, 
            in96,  in97,  in98,  in99,  in100, in101, in102, in103,
            in104, in105, in106, in107, in108, in109, in110, in111,
            in112, in113, in114, in115, in116, in117, in118, in119,
            in120, in121, in122, in123, in124, in125, in126, in127,
            select)
    begin
        case(select)
            5'd0:  muxOut = {in0,   in1,   in2,   in3  };
            5'd1:  muxOut = {in4,   in5,   in6,   in7  };
            5'd2:  muxOut = {in8,   in9,   in10,  in11 };
            5'd3:  muxOut = {in12,  in13,  in14,  in15 };
            5'd4:  muxOut = {in16,  in17,  in18,  in19 };
            5'd5:  muxOut = {in20,  in21,  in22,  in23 };
            5'd6:  muxOut = {in24,  in25,  in26,  in27 };
            5'd7:  muxOut = {in28,  in29,  in30,  in31 };
            5'd8:  muxOut = {in32,  in33,  in34,  in35 };
            5'd9:  muxOut = {in36,  in37,  in38,  in39 };
            5'd10: muxOut = {in40,  in41,  in42,  in43 };
            5'd11: muxOut = {in44,  in45,  in46,  in47 };
            5'd12: muxOut = {in48,  in49,  in50,  in51 };
            5'd13: muxOut = {in52,  in53,  in54,  in55 };
            5'd14: muxOut = {in56,  in57,  in58,  in59 };
            5'd15: muxOut = {in60,  in61,  in62,  in63 };
            5'd16: muxOut = {in64,  in65,  in66,  in67 };
            5'd17: muxOut = {in68,  in69,  in70,  in71 };
            5'd18: muxOut = {in72,  in73,  in74,  in75 };
            5'd19: muxOut = {in76,  in77,  in78,  in79 };
            5'd20: muxOut = {in80,  in81,  in82,  in83 };
            5'd21: muxOut = {in84,  in85,  in86,  in87 };
            5'd22: muxOut = {in88,  in89,  in90,  in91 };
            5'd23: muxOut = {in92,  in93,  in94,  in95 };
            5'd24: muxOut = {in96,  in97,  in98,  in99 };
            5'd25: muxOut = {in100, in101, in102, in103};
            5'd26: muxOut = {in104, in105, in106, in107};
            5'd27: muxOut = {in108, in109, in110, in111};
            5'd28: muxOut = {in112, in113, in114, in115};
            5'd29: muxOut = {in116, in117, in118, in119};
            5'd30: muxOut = {in120, in121, in122, in123};
            5'd31: muxOut = {in124, in125, in126, in127};
        endcase
    end
endmodule

module mux2to1_32bits(input [31:0] in0, input [31:0] in1, input select, output reg [31:0] muxOut);
    always@(in0, in1, select)
    begin
        case(select)
            1'b0: muxOut = in0;
            1'b1: muxOut = in1;
        endcase
    end
endmodule

module IM(input clk, input reset, input [4:0] pc5bits, input memRead, output [31:0] IR);
    wire [7:0] outR0,   outR1,   outR2,   outR3,   outR4,   outR5,   outR6,   outR7,   
               outR8,   outR9,   outR10,  outR11,  outR12,  outR13,  outR14,  outR15,   
               outR16,  outR17,  outR18,  outR19,  outR20,  outR21,  outR22,  outR23, 
               outR24,  outR25,  outR26,  outR27,  outR28,  outR29,  outR30,  outR31, 
               outR32,  outR33,  outR34,  outR35,  outR36,  outR37,  outR38,  outR39, 
               outR40,  outR41,  outR42,  outR43,  outR44,  outR45,  outR46,  outR47, 
               outR48,  outR49,  outR50,  outR51,  outR52,  outR53,  outR54,  outR55, 
               outR56,  outR57,  outR58,  outR59,  outR60,  outR61,  outR62,  outR63, 
               outR64,  outR65,  outR66,  outR67,  outR68,  outR69,  outR70,  outR71, 
               outR72,  outR73,  outR74,  outR75,  outR76,  outR77,  outR78,  outR79, 
               outR80,  outR81,  outR82,  outR83,  outR84,  outR85,  outR86,  outR87, 
               outR88,  outR89,  outR90,  outR91,  outR92,  outR93,  outR94,  outR95, 
            outR96,  outR97,  outR98,  outR99,  outR100, outR101, outR102, outR103,
               outR104, outR105, outR106, outR107, outR108, outR109, outR110, outR111,
               outR112, outR113, outR114, outR115, outR116, outR117, outR118, outR119,
               outR120, outR121, outR122, outR123, outR124, outR125, outR126, outR127;

     wire [31:0] imOut;
    register_IM rIM0   (clk, reset, 8'h20, outR0);  //    ADDI $2,  $0,  2AH
    register_IM rIM1   (clk, reset, 8'h02, outR1);   
    register_IM rIM2   (clk, reset, 8'h00, outR2);   
    register_IM rIM3   (clk, reset, 8'h2A, outR3);   
    register_IM rIM4   (clk, reset, 8'h38, outR4);  //    XORI $3,  $0,  6H
    register_IM rIM5   (clk, reset, 8'h03, outR5);  
    register_IM rIM6   (clk, reset, 8'h00, outR6);  
    register_IM rIM7   (clk, reset, 8'h06, outR7);   
    register_IM rIM8   (clk, reset, 8'h00, outR8);  //    DIV  $2,  $3 
    register_IM rIM9   (clk, reset, 8'h43, outR9);   
    register_IM rIM10  (clk, reset, 8'h00, outR10);   
    register_IM rIM11  (clk, reset, 8'h1A, outR11);   
    register_IM rIM12  (clk, reset, 8'h00, outR12); //    MFHI $5 
    register_IM rIM13  (clk, reset, 8'h00, outR13);  
    register_IM rIM14  (clk, reset, 8'h28, outR14);  
    register_IM rIM15  (clk, reset, 8'h10, outR15); 
    register_IM rIM16  (clk, reset, 8'h00, outR16); //    MFLO $4 
    register_IM rIM17  (clk, reset, 8'h00, outR17);  
    register_IM rIM18  (clk, reset, 8'h20, outR18);  
    register_IM rIM19  (clk, reset, 8'h12, outR19); 
    register_IM rIM20  (clk, reset, 8'h00, outR20); //    ADD  $14, $4,  $3  
    register_IM rIM21  (clk, reset, 8'h83, outR21);  
    register_IM rIM22  (clk, reset, 8'h70, outR22);  
    register_IM rIM23  (clk, reset, 8'h14, outR23); 
    register_IM rIM24  (clk, reset, 8'h10, outR24); //    BEQ  $0,  $5,  2H 
    register_IM rIM25  (clk, reset, 8'h05, outR25);  
    register_IM rIM26  (clk, reset, 8'h00, outR26);  
    register_IM rIM27  (clk, reset, 8'h02, outR27);
    register_IM rIM28  (clk, reset, 8'h00, outR28); //    SUB  $1,  $2,  $3  
    register_IM rIM29  (clk, reset, 8'h43, outR29);   
    register_IM rIM30  (clk, reset, 8'h08, outR30);   
    register_IM rIM31  (clk, reset, 8'h16, outR31);  
    register_IM rIM32  (clk, reset, 8'h0C, outR32); //    JAL  13H  
    register_IM rIM33  (clk, reset, 8'h00, outR33);   
    register_IM rIM34  (clk, reset, 8'h00, outR34);   
    register_IM rIM35  (clk, reset, 8'h0D, outR35);
    register_IM rIM36  (clk, reset, 8'h00, outR36); //    AND  $21, $3, $2  
    register_IM rIM37  (clk, reset, 8'h62, outR37);   
    register_IM rIM38  (clk, reset, 8'hA8, outR38);   
    register_IM rIM39  (clk, reset, 8'h18, outR39);  
    register_IM rIM40  (clk, reset, 8'h0C, outR40); //    JAL  7H  
    register_IM rIM41  (clk, reset, 8'h00, outR41);  
    register_IM rIM42  (clk, reset, 8'h00, outR42);  
    register_IM rIM43  (clk, reset, 8'h07, outR43); 
    register_IM rIM44  (clk, reset, 8'h03, outR44); //    OR   $31, $31, $3                       
    register_IM rIM45  (clk, reset, 8'hE3, outR45);             
    register_IM rIM46  (clk, reset, 8'hF8, outR46);             
    register_IM rIM47  (clk, reset, 8'h19, outR47); 
    register_IM rIM48  (clk, reset, 8'h00, outR48); //    MFLO $4  
    register_IM rIM49  (clk, reset, 8'h00, outR49);  
    register_IM rIM50  (clk, reset, 8'h20, outR50);  
    register_IM rIM51  (clk, reset, 8'h12, outR51); 
    register_IM rIM52  (clk, reset, 8'h10, outR52); //    BEQ  $1,  $31, FFFDH  
    register_IM rIM53  (clk, reset, 8'h3F, outR53);  
    register_IM rIM54  (clk, reset, 8'hFF, outR54);  
    register_IM rIM55  (clk, reset, 8'hFD, outR55);  
    register_IM rIM56  (clk, reset, 8'h00, outR56); //    DIV  $2, $31                       
    register_IM rIM57  (clk, reset, 8'h5F, outR57);             
    register_IM rIM58  (clk, reset, 8'h00, outR58);             
    register_IM rIM59  (clk, reset, 8'h1A, outR59);  
    register_IM rIM60  (clk, reset, 8'h00, outR60); //    MFHI $21
    register_IM rIM61  (clk, reset, 8'h00, outR61); 
    register_IM rIM62  (clk, reset, 8'hA8, outR62); 
    register_IM rIM63  (clk, reset, 8'h10, outR63); 
    register_IM rIM64  (clk, reset, 8'h00, outR64); //    MFLO $14
    register_IM rIM65  (clk, reset, 8'h00, outR65); 
    register_IM rIM66  (clk, reset, 8'h70, outR66);
    register_IM rIM67  (clk, reset, 8'h12, outR67);
    register_IM rIM68  (clk, reset, 8'h00, outR68);
    register_IM rIM69  (clk, reset, 8'h00, outR69);
    register_IM rIM70  (clk, reset, 8'h00, outR70);
    register_IM rIM71  (clk, reset, 8'h00, outR71);
    register_IM rIM72  (clk, reset, 8'h00, outR72);
    register_IM rIM73  (clk, reset, 8'h00, outR73);
    register_IM rIM74  (clk, reset, 8'h00, outR74);
    register_IM rIM75  (clk, reset, 8'h00, outR75);
    register_IM rIM76  (clk, reset, 8'h00, outR76);
    register_IM rIM77  (clk, reset, 8'h00, outR77);
    register_IM rIM78  (clk, reset, 8'h00, outR78);
    register_IM rIM79  (clk, reset, 8'h00, outR79);
    register_IM rIM80  (clk, reset, 8'h00, outR80);
    register_IM rIM81  (clk, reset, 8'h00, outR81);
    register_IM rIM82  (clk, reset, 8'h00, outR82);
    register_IM rIM83  (clk, reset, 8'h00, outR83);
    register_IM rIM84  (clk, reset, 8'h00, outR84);
    register_IM rIM85  (clk, reset, 8'h00, outR85);
    register_IM rIM86  (clk, reset, 8'h00, outR86);
    register_IM rIM87  (clk, reset, 8'h00, outR87);
    register_IM rIM88  (clk, reset, 8'h00, outR88);
    register_IM rIM89  (clk, reset, 8'h00, outR89);
    register_IM rIM90  (clk, reset, 8'h00, outR90);
    register_IM rIM91  (clk, reset, 8'h00, outR91);
    register_IM rIM92  (clk, reset, 8'h00, outR92);
    register_IM rIM93  (clk, reset, 8'h00, outR93);
    register_IM rIM94  (clk, reset, 8'h00, outR94);
    register_IM rIM95  (clk, reset, 8'h00, outR95);
    register_IM rIM96  (clk, reset, 8'h00, outR96);
    register_IM rIM97  (clk, reset, 8'h00, outR97);
    register_IM rIM98  (clk, reset, 8'h00, outR98);
    register_IM rIM99  (clk, reset, 8'h00, outR99);
    register_IM rIM100 (clk, reset, 8'h00, outR100);
    register_IM rIM101 (clk, reset, 8'h00, outR101);
    register_IM rIM102 (clk, reset, 8'h00, outR102);
    register_IM rIM103 (clk, reset, 8'h00, outR103);
    register_IM rIM104 (clk, reset, 8'h00, outR104);
    register_IM rIM105 (clk, reset, 8'h00, outR105);
    register_IM rIM106 (clk, reset, 8'h00, outR106);
    register_IM rIM107 (clk, reset, 8'h00, outR107);
    register_IM rIM108 (clk, reset, 8'h00, outR108);
    register_IM rIM109 (clk, reset, 8'h00, outR109);
    register_IM rIM110 (clk, reset, 8'h00, outR110);
    register_IM rIM111 (clk, reset, 8'h00, outR111);
    register_IM rIM112 (clk, reset, 8'h00, outR112);
    register_IM rIM113 (clk, reset, 8'h00, outR113);
    register_IM rIM114 (clk, reset, 8'h00, outR114);
    register_IM rIM115 (clk, reset, 8'h00, outR115);
    register_IM rIM116 (clk, reset, 8'h00, outR116);
    register_IM rIM117 (clk, reset, 8'h00, outR117);
    register_IM rIM118 (clk, reset, 8'h00, outR118);
    register_IM rIM119 (clk, reset, 8'h00, outR119);
    register_IM rIM120 (clk, reset, 8'h00, outR120);
    register_IM rIM121 (clk, reset, 8'h00, outR121);
    register_IM rIM122 (clk, reset, 8'h00, outR122);
    register_IM rIM123 (clk, reset, 8'h00, outR123);
    register_IM rIM124 (clk, reset, 8'h00, outR124);
    register_IM rIM125 (clk, reset, 8'h00, outR125);
    register_IM rIM126 (clk, reset, 8'h00, outR126);
    register_IM rIM127 (clk, reset, 8'h00, outR127);

    mux128to1_IM muxIM (outR0,   outR1,   outR2,   outR3,   outR4,   outR5,   outR6,   outR7,   
                        outR8,   outR9,   outR10,  outR11,  outR12,  outR13,  outR14,  outR15,   
                        outR16,  outR17,  outR18,  outR19,  outR20,  outR21,  outR22,  outR23, 
                        outR24,  outR25,  outR26,  outR27,  outR28,  outR29,  outR30,  outR31, 
                        outR32,  outR33,  outR34,  outR35,  outR36,  outR37,  outR38,  outR39, 
                        outR40,  outR41,  outR42,  outR43,  outR44,  outR45,  outR46,  outR47, 
                        outR48,  outR49,  outR50,  outR51,  outR52,  outR53,  outR54,  outR55, 
                        outR56,  outR57,  outR58,  outR59,  outR60,  outR61,  outR62,  outR63, 
                        outR64,  outR65,  outR66,  outR67,  outR68,  outR69,  outR70,  outR71, 
                        outR72,  outR73,  outR74,  outR75,  outR76,  outR77,  outR78,  outR79, 
                        outR80,  outR81,  outR82,  outR83,  outR84,  outR85,  outR86,  outR87, 
                        outR88,  outR89,  outR90,  outR91,  outR92,  outR93,  outR94,  outR95, 
                        outR96,  outR97,  outR98,  outR99,  outR100, outR101, outR102, outR103,
                        outR104, outR105, outR106, outR107, outR108, outR109, outR110, outR111,
                        outR112, outR113, outR114, outR115, outR116, outR117, outR118, outR119,
                        outR120, outR121, outR122, outR123, outR124, outR125, outR126, outR127,
                        pc5bits, imOut);
    mux2to1_32bits muxReadIM (32'b0, imOut, memRead, IR); 							
endmodule

//Instruction Memory Ends

// Register File Starts

module Dff(input clk, input reset, input regWrite, input decOut1b , input d, output reg q);
    always @ (negedge clk)
    begin
        if(reset == 1'b1)
        begin
            q = 0;
        end
        else if(regWrite == 1'b1 && decOut1b == 1'b1)
        begin
            q = d;
        end
    end
endmodule

module register32bit(input clk, input reset, input regWrite, input decOut1b, input [31:0] inR, 
                     output [31:0] outR);
    Dff d0  (clk, reset, regWrite, decOut1b, inR[0],  outR[0]);
    Dff d1  (clk, reset, regWrite, decOut1b, inR[1],  outR[1]);
    Dff d2  (clk, reset, regWrite, decOut1b, inR[2],  outR[2]);
    Dff d3  (clk, reset, regWrite, decOut1b, inR[3],  outR[3]);
    Dff d4  (clk, reset, regWrite, decOut1b, inR[4],  outR[4]);
    Dff d5  (clk, reset, regWrite, decOut1b, inR[5],  outR[5]);
    Dff d6  (clk, reset, regWrite, decOut1b, inR[6],  outR[6]);
    Dff d7  (clk, reset, regWrite, decOut1b, inR[7],  outR[7]);
    Dff d8  (clk, reset, regWrite, decOut1b, inR[8],  outR[8]);
    Dff d9  (clk, reset, regWrite, decOut1b, inR[9],  outR[9]);
    Dff d10 (clk, reset, regWrite, decOut1b, inR[10], outR[10]);
    Dff d11 (clk, reset, regWrite, decOut1b, inR[11], outR[11]);
    Dff d12 (clk, reset, regWrite, decOut1b, inR[12], outR[12]);
    Dff d13 (clk, reset, regWrite, decOut1b, inR[13], outR[13]);
    Dff d14 (clk, reset, regWrite, decOut1b, inR[14], outR[14]);
    Dff d15 (clk, reset, regWrite, decOut1b, inR[15], outR[15]);
    Dff d16 (clk, reset, regWrite, decOut1b, inR[16], outR[16]);
    Dff d17 (clk, reset, regWrite, decOut1b, inR[17], outR[17]);
    Dff d18 (clk, reset, regWrite, decOut1b, inR[18], outR[18]);
    Dff d19 (clk, reset, regWrite, decOut1b, inR[19], outR[19]);
    Dff d20 (clk, reset, regWrite, decOut1b, inR[20], outR[20]);
    Dff d21 (clk, reset, regWrite, decOut1b, inR[21], outR[21]);
    Dff d22 (clk, reset, regWrite, decOut1b, inR[22], outR[22]);
    Dff d23 (clk, reset, regWrite, decOut1b, inR[23], outR[23]);
    Dff d24 (clk, reset, regWrite, decOut1b, inR[24], outR[24]);
    Dff d25 (clk, reset, regWrite, decOut1b, inR[25], outR[25]);
    Dff d26 (clk, reset, regWrite, decOut1b, inR[26], outR[26]);
    Dff d27 (clk, reset, regWrite, decOut1b, inR[27], outR[27]);
    Dff d28 (clk, reset, regWrite, decOut1b, inR[28], outR[28]);
    Dff d29 (clk, reset, regWrite, decOut1b, inR[29], outR[29]);
    Dff d30 (clk, reset, regWrite, decOut1b, inR[30], outR[30]);
    Dff d31 (clk, reset, regWrite, decOut1b, inR[31], outR[31]);
endmodule

// Note: r0 in MIPS is always 0
module registerSet(input clk, input reset, input regWrite, input [31:0] decOut, input [31:0] writeData,
                   output [31:0] outR0,  output [31:0] outR1,  output [31:0] outR2,  output [31:0] outR3,
                   output [31:0] outR4,  output [31:0] outR5,  output [31:0] outR6,  output [31:0] outR7,
                   output [31:0] outR8,  output [31:0] outR9,  output [31:0] outR10, output [31:0] outR11,
                   output [31:0] outR12, output [31:0] outR13, output [31:0] outR14, output [31:0] outR15,
                   output [31:0] outR16, output [31:0] outR17, output [31:0] outR18, output [31:0] outR19,
                   output [31:0] outR20, output [31:0] outR21, output [31:0] outR22, output [31:0] outR23,
                   output [31:0] outR24, output [31:0] outR25, output [31:0] outR26, output [31:0] outR27,
                   output [31:0] outR28, output [31:0] outR29, output [31:0] outR30, output [31:0] outR31);
    register32bit r0  (clk, reset, regWrite, decOut[0],  32'b0, outR0);
    register32bit r1  (clk, reset, regWrite, decOut[1],  writeData, outR1);
    register32bit r2  (clk, reset, regWrite, decOut[2],  writeData, outR2);
    register32bit r3  (clk, reset, regWrite, decOut[3],  writeData, outR3);
    register32bit r4  (clk, reset, regWrite, decOut[4],  writeData, outR4);
    register32bit r5  (clk, reset, regWrite, decOut[5],  writeData, outR5);
    register32bit r6  (clk, reset, regWrite, decOut[6],  writeData, outR6);
    register32bit r7  (clk, reset, regWrite, decOut[7],  writeData, outR7);
    register32bit r8  (clk, reset, regWrite, decOut[8],  writeData, outR8);
    register32bit r9  (clk, reset, regWrite, decOut[9],  writeData, outR9);
    register32bit r10 (clk, reset, regWrite, decOut[10], writeData, outR10);
    register32bit r11 (clk, reset, regWrite, decOut[11], writeData, outR11);
    register32bit r12 (clk, reset, regWrite, decOut[12], writeData, outR12);
    register32bit r13 (clk, reset, regWrite, decOut[13], writeData, outR13);
    register32bit r14 (clk, reset, regWrite, decOut[14], writeData, outR14);
    register32bit r15 (clk, reset, regWrite, decOut[15], writeData, outR15);
    register32bit r16 (clk, reset, regWrite, decOut[16], writeData, outR16);
    register32bit r17 (clk, reset, regWrite, decOut[17], writeData, outR17);
    register32bit r18 (clk, reset, regWrite, decOut[18], writeData, outR18);
    register32bit r19 (clk, reset, regWrite, decOut[19], writeData, outR19);
    register32bit r20 (clk, reset, regWrite, decOut[20], writeData, outR20);
    register32bit r21 (clk, reset, regWrite, decOut[21], writeData, outR21);
    register32bit r22 (clk, reset, regWrite, decOut[22], writeData, outR22);
    register32bit r23 (clk, reset, regWrite, decOut[23], writeData, outR23);
    register32bit r24 (clk, reset, regWrite, decOut[24], writeData, outR24);
    register32bit r25 (clk, reset, regWrite, decOut[25], writeData, outR25);
    register32bit r26 (clk, reset, regWrite, decOut[26], writeData, outR26);
    register32bit r27 (clk, reset, regWrite, decOut[27], writeData, outR27);
    register32bit r28 (clk, reset, regWrite, decOut[28], writeData, outR28);
    register32bit r29 (clk, reset, regWrite, decOut[29], writeData, outR29);
    register32bit r30 (clk, reset, regWrite, decOut[30], writeData, outR30);
    register32bit r31 (clk, reset, regWrite, decOut[31], writeData, outR31);
endmodule

module decoder5to32(input [4:0] destReg, output reg [31:0] decOut);
    always@(destReg)
    begin
        case(destReg)
            5'd0:  decOut = 32'b0000_0000_0000_0000_0000_0000_0000_0001;
            5'd1:  decOut = 32'b0000_0000_0000_0000_0000_0000_0000_0010;
            5'd2:  decOut = 32'b0000_0000_0000_0000_0000_0000_0000_0100;
            5'd3:  decOut = 32'b0000_0000_0000_0000_0000_0000_0000_1000;
            5'd4:  decOut = 32'b0000_0000_0000_0000_0000_0000_0001_0000;
            5'd5:  decOut = 32'b0000_0000_0000_0000_0000_0000_0010_0000;
            5'd6:  decOut = 32'b0000_0000_0000_0000_0000_0000_0100_0000;
            5'd7:  decOut = 32'b0000_0000_0000_0000_0000_0000_1000_0000;
            5'd8:  decOut = 32'b0000_0000_0000_0000_0000_0001_0000_0000;
            5'd9:  decOut = 32'b0000_0000_0000_0000_0000_0010_0000_0000;
            5'd10: decOut = 32'b0000_0000_0000_0000_0000_0100_0000_0000;
            5'd11: decOut = 32'b0000_0000_0000_0000_0000_1000_0000_0000;
            5'd12: decOut = 32'b0000_0000_0000_0000_0001_0000_0000_0000;
            5'd13: decOut = 32'b0000_0000_0000_0000_0010_0000_0000_0000;
            5'd14: decOut = 32'b0000_0000_0000_0000_0100_0000_0000_0000;
            5'd15: decOut = 32'b0000_0000_0000_0000_1000_0000_0000_0000;
            5'd16: decOut = 32'b0000_0000_0000_0001_0000_0000_0000_0000;
            5'd17: decOut = 32'b0000_0000_0000_0010_0000_0000_0000_0000;
            5'd18: decOut = 32'b0000_0000_0000_0100_0000_0000_0000_0000;
            5'd19: decOut = 32'b0000_0000_0000_1000_0000_0000_0000_0000;
            5'd20: decOut = 32'b0000_0000_0001_0000_0000_0000_0000_0000;
            5'd21: decOut = 32'b0000_0000_0010_0000_0000_0000_0000_0000;
            5'd22: decOut = 32'b0000_0000_0100_0000_0000_0000_0000_0000;
            5'd23: decOut = 32'b0000_0000_1000_0000_0000_0000_0000_0000;
            5'd24: decOut = 32'b0000_0001_0000_0000_0000_0000_0000_0000;
            5'd25: decOut = 32'b0000_0010_0000_0000_0000_0000_0000_0000;
            5'd26: decOut = 32'b0000_0100_0000_0000_0000_0000_0000_0000;
            5'd27: decOut = 32'b0000_1000_0000_0000_0000_0000_0000_0000;
            5'd28: decOut = 32'b0001_0000_0000_0000_0000_0000_0000_0000;
            5'd29: decOut = 32'b0010_0000_0000_0000_0000_0000_0000_0000;
            5'd30: decOut = 32'b0100_0000_0000_0000_0000_0000_0000_0000;
            5'd31: decOut = 32'b1000_0000_0000_0000_0000_0000_0000_0000;
        endcase
    end
endmodule

module mux32to1_32bits(input [31:0] in0,  input [31:0] in1,  input [31:0] in2,  input [31:0] in3,
                       input [31:0] in4,  input [31:0] in5,  input [31:0] in6,  input [31:0] in7,
                       input [31:0] in8,  input [31:0] in9,  input [31:0] in10, input [31:0] in11,
                       input [31:0] in12, input [31:0] in13, input [31:0] in14, input [31:0] in15,
                       input [31:0] in16, input [31:0] in17, input [31:0] in18, input [31:0] in19,
                       input [31:0] in20, input [31:0] in21, input [31:0] in22, input [31:0] in23,
                       input [31:0] in24, input [31:0] in25, input [31:0] in26, input [31:0] in27,
                       input [31:0] in28, input [31:0] in29, input [31:0] in30, input [31:0] in31,
                       input [4:0] select, output reg [31:0] muxOut);
    always@(in0,  in1,  in2,  in3,  in4,  in5,  in6,  in7,
            in8,  in9,  in10, in11, in12, in13, in14, in15,
            in16, in17, in18, in19, in20, in21, in22, in23,
            in24, in25, in26, in27, in28, in29, in30, in31, select)
    begin
        case(select)
            5'd0:  muxOut = in0;
            5'd1:  muxOut = in1;
            5'd2:  muxOut = in2;
            5'd3:  muxOut = in3;
            5'd4:  muxOut = in4;
            5'd5:  muxOut = in5;
            5'd6:  muxOut = in6;
            5'd7:  muxOut = in7;
            5'd8:  muxOut = in8;
            5'd9:  muxOut = in9;
            5'd10: muxOut = in10;
            5'd11: muxOut = in11;
            5'd12: muxOut = in12;
            5'd13: muxOut = in13;
            5'd14: muxOut = in14;
            5'd15: muxOut = in15;
            5'd16: muxOut = in16;
            5'd17: muxOut = in17;
            5'd18: muxOut = in18;
            5'd19: muxOut = in19;
            5'd20: muxOut = in20;
            5'd21: muxOut = in21;
            5'd22: muxOut = in22;
            5'd23: muxOut = in23;
            5'd24: muxOut = in24;
            5'd25: muxOut = in25;
            5'd26: muxOut = in26;
            5'd27: muxOut = in27;
            5'd28: muxOut = in28;
            5'd29: muxOut = in29;
            5'd30: muxOut = in30;
            5'd31: muxOut = in31;
        endcase
    end
endmodule

module registerFile(input clk, input reset, input regWrite, input [4:0] rs, input [4:0] rt, input [4:0] rd,
                          input [31:0] writeData, output [31:0] regRs, output [31:0] regRt);
    wire [31:0] decOut;
    wire [31:0] outR0,  outR1,  outR2,  outR3,  outR4,  outR5,  outR6,  outR7;
    wire [31:0] outR8,  outR9,  outR10, outR11, outR12, outR13, outR14, outR15;
    wire [31:0] outR16, outR17, outR18, outR19, outR20, outR21, outR22, outR23;
    wire [31:0] outR24, outR25, outR26, outR27, outR28, outR29, outR30, outR31;

    decoder5to32 rdDec (rd, decOut);

    registerSet regSet (clk, reset, regWrite, decOut, writeData,
                        outR0,  outR1,  outR2,  outR3,
                        outR4,  outR5,  outR6,  outR7,
                        outR8,  outR9,  outR10, outR11,
                        outR12, outR13, outR14, outR15,
                        outR16, outR17, outR18, outR19,
                        outR20, outR21, outR22, outR23,
                        outR24, outR25, outR26, outR27,
                        outR28, outR29, outR30, outR31);

    mux32to1_32bits rsSel (outR0,  outR1,  outR2,  outR3,
                           outR4,  outR5,  outR6,  outR7,
                           outR8,  outR9,  outR10, outR11,
                           outR12, outR13, outR14, outR15,
                           outR16, outR17, outR18, outR19,
                           outR20, outR21, outR22, outR23,
                           outR24, outR25, outR26, outR27,
                           outR28, outR29, outR30, outR31,
                           rs, regRs);


    mux32to1_32bits rtSel (outR0,  outR1,  outR2,  outR3,
                           outR4,  outR5,  outR6,  outR7,
                           outR8,  outR9,  outR10, outR11,
                           outR12, outR13, outR14, outR15,
                           outR16, outR17, outR18, outR19,
                           outR20, outR21, outR22, outR23,
                           outR24, outR25, outR26, outR27,
                           outR28, outR29, outR30, outR31,
                           rt, regRt);

endmodule

// Register File Ends

module Dff_register(input clk, input reset, input regWrite, input d, output reg q);
    always @ (negedge clk)
    begin
        if(reset == 1'b1)
        begin
            q = 0;
        end
        else if(regWrite == 1'b1)
        begin
            q = d;
        end
    end
endmodule

// This register would be used for PC, IR, A, B, Hi, Lo, and aluOut as well.
module stateRegister32bit(input clk, input reset, input regWrite, input [31:0] inR, output [31:0] outR);
    Dff_register d0  (clk, reset, regWrite, inR[0],  outR[0]);
    Dff_register d1  (clk, reset, regWrite, inR[1],  outR[1]);
    Dff_register d2  (clk, reset, regWrite, inR[2],  outR[2]);
    Dff_register d3  (clk, reset, regWrite, inR[3],  outR[3]);
    Dff_register d4  (clk, reset, regWrite, inR[4],  outR[4]);
    Dff_register d5  (clk, reset, regWrite, inR[5],  outR[5]);
    Dff_register d6  (clk, reset, regWrite, inR[6],  outR[6]);
    Dff_register d7  (clk, reset, regWrite, inR[7],  outR[7]);
    Dff_register d8  (clk, reset, regWrite, inR[8],  outR[8]);
    Dff_register d9  (clk, reset, regWrite, inR[9],  outR[9]);
    Dff_register d10 (clk, reset, regWrite, inR[10], outR[10]);
    Dff_register d11 (clk, reset, regWrite, inR[11], outR[11]);
    Dff_register d12 (clk, reset, regWrite, inR[12], outR[12]);
    Dff_register d13 (clk, reset, regWrite, inR[13], outR[13]);
    Dff_register d14 (clk, reset, regWrite, inR[14], outR[14]);
    Dff_register d15 (clk, reset, regWrite, inR[15], outR[15]);
    Dff_register d16 (clk, reset, regWrite, inR[16], outR[16]);
    Dff_register d17 (clk, reset, regWrite, inR[17], outR[17]);
    Dff_register d18 (clk, reset, regWrite, inR[18], outR[18]);
    Dff_register d19 (clk, reset, regWrite, inR[19], outR[19]);
    Dff_register d20 (clk, reset, regWrite, inR[20], outR[20]);
    Dff_register d21 (clk, reset, regWrite, inR[21], outR[21]);
    Dff_register d22 (clk, reset, regWrite, inR[22], outR[22]);
    Dff_register d23 (clk, reset, regWrite, inR[23], outR[23]);
    Dff_register d24 (clk, reset, regWrite, inR[24], outR[24]);
    Dff_register d25 (clk, reset, regWrite, inR[25], outR[25]);
    Dff_register d26 (clk, reset, regWrite, inR[26], outR[26]);
    Dff_register d27 (clk, reset, regWrite, inR[27], outR[27]);
    Dff_register d28 (clk, reset, regWrite, inR[28], outR[28]);
    Dff_register d29 (clk, reset, regWrite, inR[29], outR[29]);
    Dff_register d30 (clk, reset, regWrite, inR[30], outR[30]);
    Dff_register d31 (clk, reset, regWrite, inR[31], outR[31]);
endmodule

module signExt16to32(input [15:0] in, output reg [31:0] signExtIn);
    always@(in)
    begin
        signExtIn={{16{in[15]}},in};
    end
endmodule

module zeroExt16to32(input [15:0] in, output reg [31:0] zeroExtIn);
    always@(in)
    begin
        zeroExtIn={{16{1'b0}},in};
    end
endmodule

module mux4to1_5bits(input [4:0] in0, input [4:0] in1, input [4:0] in2, input [4:0] in3, input [1:0] select, output reg [4:0] muxOut);
    always@(in0, in1, in2, in3, select)
    begin
        case(select)
            2'b00: muxOut = in0;
            2'b01: muxOut = in1;
            2'b10: muxOut = in2;
            2'b11: muxOut = in3;
        endcase
    end
endmodule

module mux4to1_32bits(input [31:0] in0, input [31:0] in1, input [31:0] in2, input [31:0] in3, input [1:0] select, output reg [31:0] muxOut);
    always@(in0, in1, in2, in3, select)
    begin
        case(select)
            2'b00: muxOut = in0;
            2'b01: muxOut = in1;
            2'b10: muxOut = in2;
            2'b11: muxOut = in3;
        endcase
    end
endmodule

module mux8to1_32bits(input [31:0] in0, input [31:0] in1, input [31:0] in2, input [31:0] in3, 
                             input [31:0] in4, input [31:0] in5, input [31:0] in6, input [31:0] in7,
                             input [2:0] select, output reg [31:0] muxOut);
    always@(in0, in1, in2, in3, in4, in5, in6, in7, select)
    begin
        case(select)
            3'b000: muxOut = in0;
            3'b001: muxOut = in1;
            3'b010: muxOut = in2;
            3'b011: muxOut = in3;
            3'b100: muxOut = in4;
            3'b101: muxOut = in5;
            3'b110: muxOut = in6;
            3'b111: muxOut = in7;
        endcase
    end
endmodule

//zero flag is set to one when aluOut0 and aluOut1 is zero. 
//Refer ALU operations Table in labsheet for specification of ALU operation
module alu(input [31:0] aluIn1, input [31:0] aluIn2, input [2:0] aluOp, output reg [31:0] aluOut0, output reg [31:0] aluOut1, output reg zero);
    
	  
	always @(aluIn1, aluIn2, aluOp)
	begin
		case(aluOp)
		3'd0: //add; 
			begin
			aluOut0 = aluIn1+aluIn2;
			aluOut1 = 32'd0;
			
			end
		3'd1://sub
		 	begin
			aluOut0 = aluIn1 - aluIn2;
			aluOut1 = 32'd0;

			
			end  
		3'd2://and
		 			begin
			aluOut0 = aluIn1 & aluIn2;
			aluOut1 = 32'd0;
			
			end
		3'd3://or
					begin
			aluOut0 = aluIn1 | aluIn2;
			aluOut1 = 32'd0;
			
			end
		3'd4://div
					begin
			aluOut0 = aluIn1/aluIn2;
			aluOut1 = aluIn1 % aluIn2;
			
			end
		3'd5://xor
					begin
			aluOut0 = aluIn1 ^ aluIn2;
			aluOut1 = 32'd0;
			
			end
		endcase
		if(aluOut0 == 32'd0 && aluOut1 == 32'd0)
			zero = 1'b1;
		else
			zero = 1'b0;
	end
	
endmodule


module controlCircuit(input clk, input reset, input [5:0] opcode, input [5:0] funct, output reg pcWr, output reg [1:0] pcSrc,
                             output reg pcWrCondi, output reg irWr, output reg memRead, output reg regWrite, output reg [1:0] regDest, 
                             output reg [1:0] regData, output reg aluSrcA, output reg [2:0] aluSrcB, output reg [2:0] aluOp, 
                             output reg hiWr, output reg loWr);

	  
	reg [3:0] state;
	reg [3:0] nextstate;
	//stateRegister32bit state(.clk(clk), .reset(reset), .regWrite(1'b1)/*chcek*/, .inR(stateIn), .outR(currState));
	always @(negedge clk)
	begin
		if(reset==1'b1)
				state = 4'd0;
		else
			state = nextstate;
	end
	always @(state, funct, opcode )
	begin
		/*						pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'd0; 
            regData = 2'd0;
				aluSrcA = 1'b00;
				aluSrcB = 3'd0;
				aluOp = 3'd0;
				hiWr = 1'b0;
				loWr = 1'b0;
				state = 4'd0;
			*/
	
	
			case(state)
			4'd0: begin
					pcWr = 1'b1; pcSrc = 2'b00; pcWrCondi = 1'b0; irWr = 1'b1; memRead = 1'b1; regWrite = 1'b0; regDest = 2'b00; 
                            regData = 2'b00; aluSrcA = 1'b0; aluSrcB = 3'd0; aluOp = 3'd0; hiWr = 1'b0; loWr = 1'b0;
					nextstate = 4'd1;
					end
			4'd1: begin
					pcWr = 1'b0; pcSrc = 2'b00; pcWrCondi = 1'b0; irWr = 1'b0; memRead = 1'b0; regWrite = 1'b0; regDest = 2'b00; 
                            regData = 2'b00; aluSrcA = 1'b0; aluSrcB = 3'd4; aluOp = 3'd0; hiWr = 1'b0; loWr = 1'b0;
					case(opcode)
					6'd0: begin
						case(funct)
						6'b010100: nextstate = 4'd2;
						6'b010110: nextstate = 4'd3;
						6'b011000: nextstate = 4'd4;
						6'b011001: nextstate = 4'd5;
						6'b011010: nextstate = 4'd6;
						6'b010000: nextstate = 4'd7;
						6'b010010: nextstate = 4'd8;
						default: nextstate = 4'd0;
						endcase
						end
					6'b001000: nextstate = 4'd9;
					6'b001110: nextstate = 4'd10;
					6'b000100: nextstate = 4'd11;
					6'b000011: nextstate = 4'd12;
					default: nextstate = 4'd0;
					endcase
					end
			4'd2://add
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'b00; 
            regData = 2'b00;
				aluSrcA = 1'b1;
				aluSrcB = 3'd1;
				aluOp = 3'd0;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd13;
			end
			4'd3://sub
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'b00; 
            regData = 2'b00;
				aluSrcA = 1'b1;
				aluSrcB = 3'd1;
				aluOp = 3'd1;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd13;
			end
			4'd4://amd
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'b00; 
            regData = 2'b00;
				aluSrcA = 1'b1;
				aluSrcB = 3'd1;
				aluOp = 3'd2;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd13;
			end
			4'd5://or
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'b00; 
            regData = 2'b00;
				aluSrcA = 1'b1;
				aluSrcB = 3'd1;
				aluOp = 3'd3;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd13;
			end
			4'd6://div
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'b00; 
            regData = 2'b00;
				aluSrcA = 1'b1;
				aluSrcB = 3'd1;
				aluOp = 3'd4;
				hiWr = 1'b1;
				loWr = 1'b1;
				nextstate = 4'd0;
			end
			4'd7://mfhi
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b1;
				regDest = 2'b01; 
            regData = 2'd2;
				aluSrcA = 1'b0;
				aluSrcB = 3'd0;
				aluOp = 3'd0;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd0;
			end

			4'd8://mflo
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b1;
				regDest = 2'b01; 
            regData = 2'd1;
				aluSrcA = 1'b0;
				aluSrcB = 3'd0;
				aluOp = 3'd0;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd0;
			end
			4'd9://addi
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'b00; 
            regData = 2'b00;
				aluSrcA = 1'b1;
				aluSrcB = 3'd2;
				aluOp = 3'd0;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd14;
			end
			4'd10://xori
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'b00; 
            regData = 2'b00;
				aluSrcA = 1'b1;
				aluSrcB = 3'd3;
				aluOp = 3'd5;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd14;
			end
			4'd11://beq
			begin
				pcWr = 1'b0;
				pcSrc = 2'b01;
				pcWrCondi = 1'b1;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b0;
				regDest = 2'b00; 
            regData = 2'b00;
				aluSrcA = 1'b1;
				aluSrcB = 3'd1;
				aluOp = 3'd1;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd0;
			end
			4'd12://jal
			begin
				pcWr = 1'b1;
				pcSrc = 2'b10;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b1;
				regDest = 2'd2; 
            regData = 2'd3;
				aluSrcA = 1'b0;
				aluSrcB = 3'd0;
				aluOp = 3'd0;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd0;
			end
			4'd13://add
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b1;
				regDest = 2'd1; 
            regData = 2'd0;
				aluSrcA = 1'b0;
				aluSrcB = 3'd0;
				aluOp = 3'd0;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd0;
			end
						4'd14://addi
			begin
				pcWr = 1'b0;
				pcSrc = 2'b00;
				pcWrCondi = 1'b0;
				irWr = 1'b0;
				memRead = 1'b0;
				regWrite = 1'b1;
				regDest = 2'd0; 
            regData = 2'd0;
				aluSrcA = 1'b0;
				aluSrcB = 3'd0;
				aluOp = 3'd0;
				hiWr = 1'b0;
				loWr = 1'b0;
				nextstate = 4'd0;
			end
			default: begin
				nextstate=4'd0;
				end
			endcase
		end

endmodule

module multiCycle(input clk, input reset, output [31:0] result);
    
	  
	//pc
	wire  irRegWrite, aRegWrite, bRegWrite, hiRegWrite, loRegWrite;
	wire [31:0] pcInR, pcOutR, irInR, irOutR, aInR, aOutR, bInR, bOutR, hiOutR, hiInR, loInR, loOutR;
	
	wire pcWr,pcWrCondi, irWr, memRead,regWrite, aluSrcA;
	wire [1:0] pcSrc, regDest, regData;
	wire [2:0] aluSrcB, aluOp;
		//control circuit
	controlCircuit cc(.clk(clk), .reset(reset), .opcode(irOutR[31:26]), .funct(irOutR[5:0]),
								.pcWr(pcWr), .pcSrc(pcSrc), .pcWrCondi(pcWrCondi), .irWr(irRegWrite), .memRead(memRead), .regWrite(regWrite),
								.regDest(regDest), .regData(regData), .aluSrcA(aluSrcA), .aluSrcB(aluSrcB), .aluOp(aluOp), 
                         .hiWr(hiRegWrite), .loWr(loRegWrite));
	//assign pcRegWrite = 	pcWr|(pcWrCondi & zero)	;						  
	stateRegister32bit PC(.clk(clk), .reset(reset), .regWrite(pcWr|(pcWrCondi & zero)), .inR(pcInR), .outR(pcOutR));
	
	//im
	IM im(.clk(clk), .reset(reset), .pc5bits(pcOutR[6:2]), .memRead(memRead), .IR(irInR));

	
	//pc controls
	//and a1(branch, pcWrCondi, zero);
	//or a2(pcRegWrite, pcWr, branch);
	//ir
	stateRegister32bit IR(.clk(clk), .reset(reset), .regWrite(irRegWrite), .inR(irInR), .outR(irOutR));
	
	wire [31:0] writeData, regRs, regRt;
	//rd mux
	wire [4:0] rdMuxOut;
	 mux4to1_5bits rdMux(.in0(irOutR[20:16]), .in1(irOutR[15:11]),
							.in2(5'd31), .in3(5'd0), .select(regDest), .muxOut(rdMuxOut));
    
	//regfile
	registerFile rf(.clk(clk), .reset(reset), .regWrite(regWrite),
						.rs(irOutR[25:21]), .rt(irOutR[20:16]),
						.rd(rdMuxOut), .writeData(writeData),
						.regRs(aInR), .regRt(bInR));
						
	//reg a
	stateRegister32bit A(.clk(clk), .reset(reset), .regWrite(1'b1), .inR(aInR), .outR(aOutR));
	
	//reg b
	stateRegister32bit B(.clk(clk), .reset(reset), .regWrite(1'b1), .inR(bInR), .outR(bOutR));
	

	//alusrcmux
	wire [31:0] srcAMuxOut;
	mux2to1_32bits srcAMux(.in0(pcOutR), .in1(aOutR), .select(aluSrcA), .muxOut(srcAMuxOut));
  
	//ext
	wire [31:0] sextOut, zextOut;
	signExt16to32 sext(.in(irOutR[15:0]), .signExtIn(sextOut));
	zeroExt16to32 zext(.in(irOutR[15:0]), .zeroExtIn(zextOut));
	
	wire [31:0] srcBMuxOut;
	mux8to1_32bits srcBMux(.in0(32'd4), .in1(bOutR),
								.in2(sextOut), .in3(zextOut), 
                        .in4(sextOut<<2), .in5(32'd0),.in6(32'd0), .in7(32'd0), .select(aluSrcB), .muxOut(srcBMuxOut));
  
	
 
	//alusrcbmux
	//
	wire [31:0] aluOut0, aluOut1;
	//alu
	alu alu1(.aluIn1(srcAMuxOut), .aluIn2(srcBMuxOut),
	.aluOp(aluOp), .aluOut0(aluOut0), .aluOut1(aluOut1),
	.zero(zero));
	


	//hi
	//reg a
	stateRegister32bit Hi(.clk(clk), .reset(reset), .regWrite(hiRegWrite), .inR(aluOut1), .outR(hiOutR));
	
	//lo
	//reg a
	stateRegister32bit Lo(.clk(clk), .reset(reset), .regWrite(loRegWrite), .inR(aluOut0), .outR(loOutR));
	
	stateRegister32bit aluOut(.clk(clk), .reset(reset), .regWrite(1'b1), .inR(aluOut0), .outR(result));
	
	//pcsrc mux
	wire [31:0] temp ;
	assign temp = {irOutR[31:28],irOutR[25:0]<<2};
	mux4to1_32bits pcSrcMux(.in0(aluOut0), .in1(result), .in2(temp), .in3(32'd0), .select(pcSrc), .muxOut(pcInR));
 
	
	//memtoreg mux
	mux4to1_32bits memToRegMux(.in0(result), .in1(loOutR), 
	.in2(hiOutR), .in3(pcOutR), .select(regData), .muxOut(writeData));
  
endmodule

module testbench_cc();
    reg clk;
    reg reset;
    reg [5:0] opcode;
    reg [5:0] funct;
    // Control Signals
    wire pcWr;
    wire [1:0] pcSrc;
    wire pcWrCondi;
    wire irWr;
    wire memRead;
    wire regWrite;
    wire [1:0] regDest;	
    wire [1:0] regData;
    wire aluSrcA; 
    wire [2:0] aluSrcB;
    wire [2:0] aluOp;
    wire hiWr;
    wire loWr;

    controlCircuit cc (clk, reset, opcode, funct, pcWr, pcSrc, pcWrCondi, irWr,
                           memRead, regWrite, regDest, regData, aluSrcA, aluSrcB, aluOp, hiWr, loWr);

    always
    #5 clk=~clk;
    
    initial
    begin
        clk=0; reset=1;
        #5  reset=0;	
        #40 opcode=6'b000000; funct=6'b010100; 	// 4 cycles		(add)		
        #40 opcode=6'b000000; funct=6'b010110; 	// 4 cycles		(sub)		
        #40 opcode=6'b000000; funct=6'b011000; 	// 4 cycles		(and)		
        #40 opcode=6'b000000; funct=6'b011001; 	// 4 cycles		(or)				
        #30 opcode=6'b000000; funct=6'b011010; 	// 3 cycles		(div)			
        #30 opcode=6'b000000; funct=6'b010000; 	// 3 cycles		(mhfi)		
        #30 opcode=6'b000000; funct=6'b010010; 	// 3 cycles		(mflo)	
        #40 opcode=6'b001000; 	// 4 cycles				(addi)	
        #40 opcode=6'b001110; 	// 4 cycles				(xori)	
        #30 opcode=6'b000100; 	// 3 cycles				(beq)
        #30 opcode=6'b000011; 	// 3 cycles				(jal)
        #45 $finish;
    end
endmodule

module testbench();
    reg clk;
    reg reset;
    wire [31:0] result;
    multiCycle MC(clk, reset, result);

    always
    #5 clk=~clk;
    
    initial
    begin
        clk=0; reset=1;
        #5  reset=0;	
        #605 $finish;
    end
endmodule
