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

module mux128to1_M (input [7:0] in0,   input [7:0] in1,   input [7:0] in2,   input [7:0] in3,
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
    register_IM rIM4   (clk, reset, 8'h20, outR4);  //    ADDI $3,  $0,  24H
    register_IM rIM5   (clk, reset, 8'h03, outR5);  
    register_IM rIM6   (clk, reset, 8'h00, outR6);  
    register_IM rIM7   (clk, reset, 8'h24, outR7);   
    register_IM rIM8   (clk, reset, 8'h20, outR8);  //    ADDI $4,  $0,  1EH
    register_IM rIM9   (clk, reset, 8'h04, outR9);   
    register_IM rIM10  (clk, reset, 8'h00, outR10);   
    register_IM rIM11  (clk, reset, 8'h1E, outR11);   
    register_IM rIM12  (clk, reset, 8'h20, outR12); //    ADDI $5,  $0,  1BH
    register_IM rIM13  (clk, reset, 8'h05, outR13);  
    register_IM rIM14  (clk, reset, 8'h00, outR14);  
    register_IM rIM15  (clk, reset, 8'h1B, outR15); 
    register_IM rIM16  (clk, reset, 8'h00, outR16); //    ADD  $6,  $2,  $2
    register_IM rIM17  (clk, reset, 8'h42, outR17);  
    register_IM rIM18  (clk, reset, 8'h30, outR18);  
    register_IM rIM19  (clk, reset, 8'h14, outR19); 
    register_IM rIM20  (clk, reset, 8'h00, outR20); //    SUB  $7,  $2,  $3  
    register_IM rIM21  (clk, reset, 8'h43, outR21);  
    register_IM rIM22  (clk, reset, 8'h38, outR22);  
    register_IM rIM23  (clk, reset, 8'h16, outR23); 
    register_IM rIM24  (clk, reset, 8'hAC, outR24); //    SW   $2,  $3,  0H 
    register_IM rIM25  (clk, reset, 8'h62, outR25);  
    register_IM rIM26  (clk, reset, 8'h00, outR26);  
    register_IM rIM27  (clk, reset, 8'h00, outR27);
    register_IM rIM28  (clk, reset, 8'hAC, outR28); //    SW   $5,  $3,  4H  
    register_IM rIM29  (clk, reset, 8'h65, outR29);   
    register_IM rIM30  (clk, reset, 8'h00, outR30);   
    register_IM rIM31  (clk, reset, 8'h04, outR31);  
    register_IM rIM32  (clk, reset, 8'h00, outR32); //    ADD  $8,  $6,  $5
    register_IM rIM33  (clk, reset, 8'hC5, outR33);   
    register_IM rIM34  (clk, reset, 8'h40, outR34);   
    register_IM rIM35  (clk, reset, 8'h14, outR35);
    register_IM rIM36  (clk, reset, 8'h00, outR36); //    SUB  $9,  $6,  $7  
    register_IM rIM37  (clk, reset, 8'hC7, outR37);   
    register_IM rIM38  (clk, reset, 8'h48, outR38);   
    register_IM rIM39  (clk, reset, 8'h16, outR39);  
    register_IM rIM40  (clk, reset, 8'h8C, outR40); //    LW  $10,  $3,  0H
    register_IM rIM41  (clk, reset, 8'h6A, outR41);  
    register_IM rIM42  (clk, reset, 8'h00, outR42);  
    register_IM rIM43  (clk, reset, 8'h00, outR43); 
    register_IM rIM44  (clk, reset, 8'h8C, outR44); //    LW  $11,  $3,  4H
    register_IM rIM45  (clk, reset, 8'h6B, outR45);             
    register_IM rIM46  (clk, reset, 8'h00, outR46);             
    register_IM rIM47  (clk, reset, 8'h04, outR47); 
    register_IM rIM48  (clk, reset, 8'h00, outR48); 
    register_IM rIM49  (clk, reset, 8'h00, outR49);  
    register_IM rIM50  (clk, reset, 8'h00, outR50);  
    register_IM rIM51  (clk, reset, 8'h00, outR51); 
    register_IM rIM52  (clk, reset, 8'h00, outR52); 
    register_IM rIM53  (clk, reset, 8'h00, outR53);  
    register_IM rIM54  (clk, reset, 8'h00, outR54);  
    register_IM rIM55  (clk, reset, 8'h00, outR55);  
    register_IM rIM56  (clk, reset, 8'h00, outR56); 
    register_IM rIM57  (clk, reset, 8'h00, outR57);             
    register_IM rIM58  (clk, reset, 8'h00, outR58);             
    register_IM rIM59  (clk, reset, 8'h00, outR59);  
    register_IM rIM60  (clk, reset, 8'h00, outR60); 
    register_IM rIM61  (clk, reset, 8'h00, outR61); 
    register_IM rIM62  (clk, reset, 8'h00, outR62); 
    register_IM rIM63  (clk, reset, 8'h00, outR63); 
    register_IM rIM64  (clk, reset, 8'h00, outR64); 
    register_IM rIM65  (clk, reset, 8'h00, outR65); 
    register_IM rIM66  (clk, reset, 8'h00, outR66);
    register_IM rIM67  (clk, reset, 8'h00, outR67);
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

    mux128to1_M muxIM  (outR0,   outR1,   outR2,   outR3,   outR4,   outR5,   outR6,   outR7,   
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

module register32bit_RF(input clk, input reset, input regWrite, input decOut1b, input [31:0] inR, 
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
    register32bit_RF r0  (clk, reset, regWrite, decOut[0],  32'b0, outR0);
    register32bit_RF r1  (clk, reset, regWrite, decOut[1],  writeData, outR1);
    register32bit_RF r2  (clk, reset, regWrite, decOut[2],  writeData, outR2);
    register32bit_RF r3  (clk, reset, regWrite, decOut[3],  writeData, outR3);
    register32bit_RF r4  (clk, reset, regWrite, decOut[4],  writeData, outR4);
    register32bit_RF r5  (clk, reset, regWrite, decOut[5],  writeData, outR5);
    register32bit_RF r6  (clk, reset, regWrite, decOut[6],  writeData, outR6);
    register32bit_RF r7  (clk, reset, regWrite, decOut[7],  writeData, outR7);
    register32bit_RF r8  (clk, reset, regWrite, decOut[8],  writeData, outR8);
    register32bit_RF r9  (clk, reset, regWrite, decOut[9],  writeData, outR9);
    register32bit_RF r10 (clk, reset, regWrite, decOut[10], writeData, outR10);
    register32bit_RF r11 (clk, reset, regWrite, decOut[11], writeData, outR11);
    register32bit_RF r12 (clk, reset, regWrite, decOut[12], writeData, outR12);
    register32bit_RF r13 (clk, reset, regWrite, decOut[13], writeData, outR13);
    register32bit_RF r14 (clk, reset, regWrite, decOut[14], writeData, outR14);
    register32bit_RF r15 (clk, reset, regWrite, decOut[15], writeData, outR15);
    register32bit_RF r16 (clk, reset, regWrite, decOut[16], writeData, outR16);
    register32bit_RF r17 (clk, reset, regWrite, decOut[17], writeData, outR17);
    register32bit_RF r18 (clk, reset, regWrite, decOut[18], writeData, outR18);
    register32bit_RF r19 (clk, reset, regWrite, decOut[19], writeData, outR19);
    register32bit_RF r20 (clk, reset, regWrite, decOut[20], writeData, outR20);
    register32bit_RF r21 (clk, reset, regWrite, decOut[21], writeData, outR21);
    register32bit_RF r22 (clk, reset, regWrite, decOut[22], writeData, outR22);
    register32bit_RF r23 (clk, reset, regWrite, decOut[23], writeData, outR23);
    register32bit_RF r24 (clk, reset, regWrite, decOut[24], writeData, outR24);
    register32bit_RF r25 (clk, reset, regWrite, decOut[25], writeData, outR25);
    register32bit_RF r26 (clk, reset, regWrite, decOut[26], writeData, outR26);
    register32bit_RF r27 (clk, reset, regWrite, decOut[27], writeData, outR27);
    register32bit_RF r28 (clk, reset, regWrite, decOut[28], writeData, outR28);
    register32bit_RF r29 (clk, reset, regWrite, decOut[29], writeData, outR29);
    register32bit_RF r30 (clk, reset, regWrite, decOut[30], writeData, outR30);
    register32bit_RF r31 (clk, reset, regWrite, decOut[31], writeData, outR31);
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

// Memory Starts 
module register8bit(input clk, input reset, input regWrite, input decOut1b, input [7:0] inR, 
                     output [7:0] outR);
    Dff d0  (clk, reset, regWrite, decOut1b, inR[0],  outR[0]);
    Dff d1  (clk, reset, regWrite, decOut1b, inR[1],  outR[1]);
    Dff d2  (clk, reset, regWrite, decOut1b, inR[2],  outR[2]);
    Dff d3  (clk, reset, regWrite, decOut1b, inR[3],  outR[3]);
    Dff d4  (clk, reset, regWrite, decOut1b, inR[4],  outR[4]);
    Dff d5  (clk, reset, regWrite, decOut1b, inR[5],  outR[5]);
    Dff d6  (clk, reset, regWrite, decOut1b, inR[6],  outR[6]);
    Dff d7  (clk, reset, regWrite, decOut1b, inR[7],  outR[7]);
endmodule

module DM(input clk, input reset, input memRead, input memWrite, input [4:0] address, input [31:0] writeData,  output [31:0] memOut);
    wire [7:0] mem0,   mem1,   mem2,   mem3,   mem4,   mem5,   mem6,   mem7,   
               mem8,   mem9,   mem10,  mem11,  mem12,  mem13,  mem14,  mem15,   
               mem16,  mem17,  mem18,  mem19,  mem20,  mem21,  mem22,  mem23, 
               mem24,  mem25,  mem26,  mem27,  mem28,  mem29,  mem30,  mem31, 
               mem32,  mem33,  mem34,  mem35,  mem36,  mem37,  mem38,  mem39, 
               mem40,  mem41,  mem42,  mem43,  mem44,  mem45,  mem46,  mem47, 
               mem48,  mem49,  mem50,  mem51,  mem52,  mem53,  mem54,  mem55, 
               mem56,  mem57,  mem58,  mem59,  mem60,  mem61,  mem62,  mem63, 
               mem64,  mem65,  mem66,  mem67,  mem68,  mem69,  mem70,  mem71, 
               mem72,  mem73,  mem74,  mem75,  mem76,  mem77,  mem78,  mem79, 
               mem80,  mem81,  mem82,  mem83,  mem84,  mem85,  mem86,  mem87, 
               mem88,  mem89,  mem90,  mem91,  mem92,  mem93,  mem94,  mem95, 
               mem96,  mem97,  mem98,  mem99,  mem100, mem101, mem102, mem103,
               mem104, mem105, mem106, mem107, mem108, mem109, mem110, mem111,
               mem112, mem113, mem114, mem115, mem116, mem117, mem118, mem119,
               mem120, mem121, mem122, mem123, mem124, mem125, mem126, mem127;

    wire [31:0] decOut;
    wire [31:0] memReadOut;
    decoder5to32 writeDec (address, decOut);

    // 4 registers one decout
    register8bit rMem0   (clk, reset, memWrite, decOut[0],  writeData[31:24], mem0);
    register8bit rMem1   (clk, reset, memWrite, decOut[0],  writeData[23:16], mem1);   
    register8bit rMem2   (clk, reset, memWrite, decOut[0],  writeData[15: 8], mem2);   
    register8bit rMem3   (clk, reset, memWrite, decOut[0],  writeData[7 : 0], mem3);   
    register8bit rMem4   (clk, reset, memWrite, decOut[1],  writeData[31:24], mem4);
    register8bit rMem5   (clk, reset, memWrite, decOut[1],  writeData[23:16], mem5);  
    register8bit rMem6   (clk, reset, memWrite, decOut[1],  writeData[15: 8], mem6);  
    register8bit rMem7   (clk, reset, memWrite, decOut[1],  writeData[7 : 0], mem7);   
    register8bit rMem8   (clk, reset, memWrite, decOut[2],  writeData[31:24], mem8); 
    register8bit rMem9   (clk, reset, memWrite, decOut[2],  writeData[23:16], mem9);   
    register8bit rMem10  (clk, reset, memWrite, decOut[2],  writeData[15: 8], mem10);   
    register8bit rMem11  (clk, reset, memWrite, decOut[2],  writeData[7 : 0], mem11);   
    register8bit rMem12  (clk, reset, memWrite, decOut[3],  writeData[31:24], mem12); 
    register8bit rMem13  (clk, reset, memWrite, decOut[3],  writeData[23:16], mem13);  
    register8bit rMem14  (clk, reset, memWrite, decOut[3],  writeData[15: 8], mem14);  
    register8bit rMem15  (clk, reset, memWrite, decOut[3],  writeData[7 : 0], mem15); 
    register8bit rMem16  (clk, reset, memWrite, decOut[4],  writeData[31:24], mem16); 
    register8bit rMem17  (clk, reset, memWrite, decOut[4],  writeData[23:16], mem17);  
    register8bit rMem18  (clk, reset, memWrite, decOut[4],  writeData[15: 8], mem18);  
    register8bit rMem19  (clk, reset, memWrite, decOut[4],  writeData[7 : 0], mem19); 
    register8bit rMem20  (clk, reset, memWrite, decOut[5],  writeData[31:24], mem20);  
    register8bit rMem21  (clk, reset, memWrite, decOut[5],  writeData[23:16], mem21);  
    register8bit rMem22  (clk, reset, memWrite, decOut[5],  writeData[15: 8], mem22);  
    register8bit rMem23  (clk, reset, memWrite, decOut[5],  writeData[7 : 0], mem23); 
    register8bit rMem24  (clk, reset, memWrite, decOut[6],  writeData[31:24], mem24); 
    register8bit rMem25  (clk, reset, memWrite, decOut[6],  writeData[23:16], mem25);  
    register8bit rMem26  (clk, reset, memWrite, decOut[6],  writeData[15: 8], mem26);  
    register8bit rMem27  (clk, reset, memWrite, decOut[6],  writeData[7 : 0], mem27);
    register8bit rMem28  (clk, reset, memWrite, decOut[7],  writeData[31:24], mem28);  
    register8bit rMem29  (clk, reset, memWrite, decOut[7],  writeData[23:16], mem29);   
    register8bit rMem30  (clk, reset, memWrite, decOut[7],  writeData[15: 8], mem30);   
    register8bit rMem31  (clk, reset, memWrite, decOut[7],  writeData[7 : 0], mem31);  
    register8bit rMem32  (clk, reset, memWrite, decOut[8],  writeData[31:24], mem32);  
    register8bit rMem33  (clk, reset, memWrite, decOut[8],  writeData[23:16], mem33);   
    register8bit rMem34  (clk, reset, memWrite, decOut[8],  writeData[15: 8], mem34);   
    register8bit rMem35  (clk, reset, memWrite, decOut[8],  writeData[7 : 0], mem35);
    register8bit rMem36  (clk, reset, memWrite, decOut[9],  writeData[31:24], mem36);  
    register8bit rMem37  (clk, reset, memWrite, decOut[9],  writeData[23:16], mem37);   
    register8bit rMem38  (clk, reset, memWrite, decOut[9],  writeData[15: 8], mem38);   
    register8bit rMem39  (clk, reset, memWrite, decOut[9],  writeData[7 : 0], mem39);  
    register8bit rMem40  (clk, reset, memWrite, decOut[10], writeData[31:24], mem40);  
    register8bit rMem41  (clk, reset, memWrite, decOut[10], writeData[23:16], mem41);  
    register8bit rMem42  (clk, reset, memWrite, decOut[10], writeData[15: 8], mem42);  
    register8bit rMem43  (clk, reset, memWrite, decOut[10], writeData[7 : 0], mem43); 
    register8bit rMem44  (clk, reset, memWrite, decOut[11], writeData[31:24], mem44);                       
    register8bit rMem45  (clk, reset, memWrite, decOut[11], writeData[23:16], mem45);             
    register8bit rMem46  (clk, reset, memWrite, decOut[11], writeData[15: 8], mem46);             
    register8bit rMem47  (clk, reset, memWrite, decOut[11], writeData[7 : 0], mem47); 
    register8bit rMem48  (clk, reset, memWrite, decOut[12], writeData[31:24], mem48);  
    register8bit rMem49  (clk, reset, memWrite, decOut[12], writeData[23:16], mem49);  
    register8bit rMem50  (clk, reset, memWrite, decOut[12], writeData[15: 8], mem50);  
    register8bit rMem51  (clk, reset, memWrite, decOut[12], writeData[7 : 0], mem51); 
    register8bit rMem52  (clk, reset, memWrite, decOut[13], writeData[31:24], mem52);  
    register8bit rMem53  (clk, reset, memWrite, decOut[13], writeData[23:16], mem53);  
    register8bit rMem54  (clk, reset, memWrite, decOut[13], writeData[15: 8], mem54);  
    register8bit rMem55  (clk, reset, memWrite, decOut[13], writeData[7 : 0], mem55);  
    register8bit rMem56  (clk, reset, memWrite, decOut[14], writeData[31:24], mem56);                       
    register8bit rMem57  (clk, reset, memWrite, decOut[14], writeData[23:16], mem57);             
    register8bit rMem58  (clk, reset, memWrite, decOut[14], writeData[15: 8], mem58);             
    register8bit rMem59  (clk, reset, memWrite, decOut[14], writeData[7 : 0], mem59);  
    register8bit rMem60  (clk, reset, memWrite, decOut[15], writeData[31:24], mem60);
    register8bit rMem61  (clk, reset, memWrite, decOut[15], writeData[23:16], mem61); 
    register8bit rMem62  (clk, reset, memWrite, decOut[15], writeData[15: 8], mem62); 
    register8bit rMem63  (clk, reset, memWrite, decOut[15], writeData[7 : 0], mem63); 
    register8bit rMem64  (clk, reset, memWrite, decOut[16], writeData[31:24], mem64);
    register8bit rMem65  (clk, reset, memWrite, decOut[16], writeData[23:16], mem65); 
    register8bit rMem66  (clk, reset, memWrite, decOut[16], writeData[15: 8], mem66);
    register8bit rMem67  (clk, reset, memWrite, decOut[16], writeData[7 : 0], mem67);
    register8bit rMem68  (clk, reset, memWrite, decOut[17], writeData[31:24], mem68);
    register8bit rMem69  (clk, reset, memWrite, decOut[17], writeData[23:16], mem69);
    register8bit rMem70  (clk, reset, memWrite, decOut[17], writeData[15: 8], mem70);
    register8bit rMem71  (clk, reset, memWrite, decOut[17], writeData[7 : 0], mem71);
    register8bit rMem72  (clk, reset, memWrite, decOut[18], writeData[31:24], mem72);
    register8bit rMem73  (clk, reset, memWrite, decOut[18], writeData[23:16], mem73);
    register8bit rMem74  (clk, reset, memWrite, decOut[18], writeData[15: 8], mem74);
    register8bit rMem75  (clk, reset, memWrite, decOut[18], writeData[7 : 0], mem75);
    register8bit rMem76  (clk, reset, memWrite, decOut[19], writeData[31:24], mem76);
    register8bit rMem77  (clk, reset, memWrite, decOut[19], writeData[23:16], mem77);
    register8bit rMem78  (clk, reset, memWrite, decOut[19], writeData[15: 8], mem78);
    register8bit rMem79  (clk, reset, memWrite, decOut[19], writeData[7 : 0], mem79);
    register8bit rMem80  (clk, reset, memWrite, decOut[20], writeData[31:24], mem80);
    register8bit rMem81  (clk, reset, memWrite, decOut[20], writeData[23:16], mem81);
    register8bit rMem82  (clk, reset, memWrite, decOut[20], writeData[15: 8], mem82);
    register8bit rMem83  (clk, reset, memWrite, decOut[20], writeData[7 : 0], mem83);
    register8bit rMem84  (clk, reset, memWrite, decOut[21], writeData[31:24], mem84);
    register8bit rMem85  (clk, reset, memWrite, decOut[21], writeData[23:16], mem85);
    register8bit rMem86  (clk, reset, memWrite, decOut[21], writeData[15: 8], mem86);
    register8bit rMem87  (clk, reset, memWrite, decOut[21], writeData[7 : 0], mem87);
    register8bit rMem88  (clk, reset, memWrite, decOut[22], writeData[31:24], mem88);
    register8bit rMem89  (clk, reset, memWrite, decOut[22], writeData[23:16], mem89);
    register8bit rMem90  (clk, reset, memWrite, decOut[22], writeData[15: 8], mem90);
    register8bit rMem91  (clk, reset, memWrite, decOut[22], writeData[7 : 0], mem91);
    register8bit rMem92  (clk, reset, memWrite, decOut[23], writeData[31:24], mem92);
    register8bit rMem93  (clk, reset, memWrite, decOut[23], writeData[23:16], mem93);
    register8bit rMem94  (clk, reset, memWrite, decOut[23], writeData[15: 8], mem94);
    register8bit rMem95  (clk, reset, memWrite, decOut[23], writeData[7 : 0], mem95);
    register8bit rMem96  (clk, reset, memWrite, decOut[24], writeData[31:24], mem96);
    register8bit rMem97  (clk, reset, memWrite, decOut[24], writeData[23:16], mem97);
    register8bit rMem98  (clk, reset, memWrite, decOut[24], writeData[15: 8], mem98);
    register8bit rMem99  (clk, reset, memWrite, decOut[24], writeData[7 : 0], mem99);
    register8bit rMem100 (clk, reset, memWrite, decOut[25], writeData[31:24], mem100);
    register8bit rMem101 (clk, reset, memWrite, decOut[25], writeData[23:16], mem101);
    register8bit rMem102 (clk, reset, memWrite, decOut[25], writeData[15: 8], mem102);
    register8bit rMem103 (clk, reset, memWrite, decOut[25], writeData[7 : 0], mem103);
    register8bit rMem104 (clk, reset, memWrite, decOut[26], writeData[31:24], mem104);
    register8bit rMem105 (clk, reset, memWrite, decOut[26], writeData[23:16], mem105);
    register8bit rMem106 (clk, reset, memWrite, decOut[26], writeData[15: 8], mem106);
    register8bit rMem107 (clk, reset, memWrite, decOut[26], writeData[7 : 0], mem107);
    register8bit rMem108 (clk, reset, memWrite, decOut[27], writeData[31:24], mem108);
    register8bit rMem109 (clk, reset, memWrite, decOut[27], writeData[23:16], mem109);
    register8bit rMem110 (clk, reset, memWrite, decOut[27], writeData[15: 8], mem110);
    register8bit rMem111 (clk, reset, memWrite, decOut[27], writeData[7 : 0], mem111);
    register8bit rMem112 (clk, reset, memWrite, decOut[28], writeData[31:24], mem112);
    register8bit rMem113 (clk, reset, memWrite, decOut[28], writeData[23:16], mem113);
    register8bit rMem114 (clk, reset, memWrite, decOut[28], writeData[15: 8], mem114);
    register8bit rMem115 (clk, reset, memWrite, decOut[28], writeData[7 : 0], mem115);
    register8bit rMem116 (clk, reset, memWrite, decOut[29], writeData[31:24], mem116);
    register8bit rMem117 (clk, reset, memWrite, decOut[29], writeData[23:16], mem117);
    register8bit rMem118 (clk, reset, memWrite, decOut[29], writeData[15: 8], mem118);
    register8bit rMem119 (clk, reset, memWrite, decOut[29], writeData[7 : 0], mem119);
    register8bit rMem120 (clk, reset, memWrite, decOut[30], writeData[31:24], mem120);
    register8bit rMem121 (clk, reset, memWrite, decOut[30], writeData[23:16], mem121);
    register8bit rMem122 (clk, reset, memWrite, decOut[30], writeData[15: 8], mem122);
    register8bit rMem123 (clk, reset, memWrite, decOut[30], writeData[7 : 0], mem123);
    register8bit rMem124 (clk, reset, memWrite, decOut[31], writeData[31:24], mem124);
    register8bit rMem125 (clk, reset, memWrite, decOut[31], writeData[23:16], mem125);
    register8bit rMem126 (clk, reset, memWrite, decOut[31], writeData[15: 8], mem126);
    register8bit rMem127 (clk, reset, memWrite, decOut[31], writeData[7 : 0], mem127);

    mux128to1_M muxMemRead  (mem0,   mem1,   mem2,   mem3,   mem4,   mem5,   mem6,   mem7,   
                             mem8,   mem9,   mem10,  mem11,  mem12,  mem13,  mem14,  mem15,   
                             mem16,  mem17,  mem18,  mem19,  mem20,  mem21,  mem22,  mem23, 
                             mem24,  mem25,  mem26,  mem27,  mem28,  mem29,  mem30,  mem31, 
                             mem32,  mem33,  mem34,  mem35,  mem36,  mem37,  mem38,  mem39, 
                             mem40,  mem41,  mem42,  mem43,  mem44,  mem45,  mem46,  mem47, 
                             mem48,  mem49,  mem50,  mem51,  mem52,  mem53,  mem54,  mem55, 
                             mem56,  mem57,  mem58,  mem59,  mem60,  mem61,  mem62,  mem63, 
                             mem64,  mem65,  mem66,  mem67,  mem68,  mem69,  mem70,  mem71, 
                             mem72,  mem73,  mem74,  mem75,  mem76,  mem77,  mem78,  mem79, 
                             mem80,  mem81,  mem82,  mem83,  mem84,  mem85,  mem86,  mem87, 
                             mem88,  mem89,  mem90,  mem91,  mem92,  mem93,  mem94,  mem95, 
                             mem96,  mem97,  mem98,  mem99,  mem100, mem101, mem102, mem103,
                             mem104, mem105, mem106, mem107, mem108, mem109, mem110, mem111,
                             mem112, mem113, mem114, mem115, mem116, mem117, mem118, mem119,
                             mem120, mem121, mem122, mem123, mem124, mem125, mem126, mem127,
                             address, memReadOut);
    mux2to1_32bits muxReadIM (32'b0, memReadOut, memRead, memOut); 							
endmodule

module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adderOut);
    always@(in1, in2)
    begin
        adderOut = in1 + in2;
    end
endmodule

module alu(input signed [31:0] aluIn1, input signed [31:0] aluIn2, input aluOp, output reg [31:0] aluOut);
    always@(aluIn1, aluIn2, aluOp)
    begin
        case(aluOp)
            3'd0: aluOut = aluIn1 + aluIn2;
            3'd1: aluOut = aluIn1 - aluIn2;
        endcase
    end
endmodule

module signExt16to32(input [15:0] in, output reg [31:0] signExtIn);
    always@(in)
    begin
        signExtIn={{16{in[15]}},in};
    end
endmodule

module mux2to1_5bit(input [4:0] in0, input [4:0] in1, input select, output reg [4:0] muxOut);
    always@(in0, in1, select)
    begin
        case(select)
            1'b0: muxOut = in0;
            1'b1: muxOut = in1;
        endcase
    end
endmodule

module mux2to1_32bit(input [31:0] in0, input [31:0] in1, input select, output reg [31:0] muxOut);
    always@(in0, in1, select)
    begin
        case(select)
            1'b0: muxOut = in0;
            1'b1: muxOut = in1;
        endcase
    end
endmodule

// Intermediate Registers start
module Dff_Reg(input clk, input reset, input regWrite, input d, output reg q);
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

// Should be used for PC register as well 
module register32bit(input clk, input reset, input regWrite, input [31:0] inR, output [31:0] outR);
    Dff_Reg d0  (clk, reset, regWrite, inR[0],  outR[0]);
    Dff_Reg d1  (clk, reset, regWrite, inR[1],  outR[1]);
    Dff_Reg d2  (clk, reset, regWrite, inR[2],  outR[2]);
    Dff_Reg d3  (clk, reset, regWrite, inR[3],  outR[3]);
    Dff_Reg d4  (clk, reset, regWrite, inR[4],  outR[4]);
    Dff_Reg d5  (clk, reset, regWrite, inR[5],  outR[5]);
    Dff_Reg d6  (clk, reset, regWrite, inR[6],  outR[6]);
    Dff_Reg d7  (clk, reset, regWrite, inR[7],  outR[7]);
    Dff_Reg d8  (clk, reset, regWrite, inR[8],  outR[8]);
    Dff_Reg d9  (clk, reset, regWrite, inR[9],  outR[9]);
    Dff_Reg d10 (clk, reset, regWrite, inR[10], outR[10]);
    Dff_Reg d11 (clk, reset, regWrite, inR[11], outR[11]);
    Dff_Reg d12 (clk, reset, regWrite, inR[12], outR[12]);
    Dff_Reg d13 (clk, reset, regWrite, inR[13], outR[13]);
    Dff_Reg d14 (clk, reset, regWrite, inR[14], outR[14]);
    Dff_Reg d15 (clk, reset, regWrite, inR[15], outR[15]);
    Dff_Reg d16 (clk, reset, regWrite, inR[16], outR[16]);
    Dff_Reg d17 (clk, reset, regWrite, inR[17], outR[17]);
    Dff_Reg d18 (clk, reset, regWrite, inR[18], outR[18]);
    Dff_Reg d19 (clk, reset, regWrite, inR[19], outR[19]);
    Dff_Reg d20 (clk, reset, regWrite, inR[20], outR[20]);
    Dff_Reg d21 (clk, reset, regWrite, inR[21], outR[21]);
    Dff_Reg d22 (clk, reset, regWrite, inR[22], outR[22]);
    Dff_Reg d23 (clk, reset, regWrite, inR[23], outR[23]);
    Dff_Reg d24 (clk, reset, regWrite, inR[24], outR[24]);
    Dff_Reg d25 (clk, reset, regWrite, inR[25], outR[25]);
    Dff_Reg d26 (clk, reset, regWrite, inR[26], outR[26]);
    Dff_Reg d27 (clk, reset, regWrite, inR[27], outR[27]);
    Dff_Reg d28 (clk, reset, regWrite, inR[28], outR[28]);
    Dff_Reg d29 (clk, reset, regWrite, inR[29], outR[29]);
    Dff_Reg d30 (clk, reset, regWrite, inR[30], outR[30]);
    Dff_Reg d31 (clk, reset, regWrite, inR[31], outR[31]);
endmodule

module register5bit(input clk, input reset, input regWrite, input [4:0] inR, 
                     output [4:0] outR);
    Dff_Reg d0  (clk, reset, regWrite, inR[0],  outR[0]);
    Dff_Reg d1  (clk, reset, regWrite, inR[1],  outR[1]);
    Dff_Reg d2  (clk, reset, regWrite, inR[2],  outR[2]);
    Dff_Reg d3  (clk, reset, regWrite, inR[3],  outR[3]);
    Dff_Reg d4  (clk, reset, regWrite, inR[4],  outR[4]);
endmodule

module register1bit(input clk, input reset, input regWrite, input inR, output outR);
    Dff_Reg d0  (clk, reset, regWrite, inR,  outR);
endmodule	 


module IF_ID(input clk, input reset, input regWr, input [31:0] ir, output [31:0] ir_IF_ID);
	//   
	register32bit r32(.clk(clk), .reset(reset), .regWrite(regWr), .inR(ir), .outR(ir_IF_ID));
  

endmodule

module ID_EX(input clk, input reset, input regWr, input [31:0] regRs, input [31:0] regRt, 
				 input regDest, input aluSrcB, input aluOp, input memRead, input memWrite, input memToReg, 
				 input regWrite, input [31:0] sext16to32, input [4:0] rt, input [4:0] rd, output [31:0] regRs_ID_EX, 
				 output [31:0] regRt_ID_EX, output regDest_ID_EX, output aluSrcB_ID_EX, output aluOp_ID_EX, 
				 output memRead_ID_EX, output memWrite_ID_EX, output memToReg_ID_EX, output regWrite_ID_EX, 
				 output [31:0] sext16to32_ID_EX, output [4:0] rt_ID_EX, output [4:0] rd_ID_EX);
	//   
	register32bit rregRs(.clk(clk), .reset(reset), .regWrite(regWr), .inR(regRs), .outR(regRs_ID_EX));
  register32bit rregRt(.clk(clk), .reset(reset), .regWrite(regWr), .inR(regRt), .outR(regRt_ID_EX));
  register32bit rsext(.clk(clk), .reset(reset), .regWrite(regWr), .inR(sext16to32), .outR(sext16to32_ID_EX));
  //rt
  register5bit rrt(.clk(clk), .reset(reset), .regWrite(regWr), .inR(rt),.outR(rt_ID_EX));
  //rd
  register5bit rrd(.clk(clk), .reset(reset), .regWrite(regWr), .inR(rd),.outR(rd_ID_EX));
  //regWr
  register1bit rregWrite(.clk(clk), .reset(reset), .regWrite(regWr), .inR(regWrite),.outR(regWrite_ID_EX));
  //memtoReg
  register1bit rmemtoreg(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memToReg),.outR(memToReg_ID_EX));
  //memWr
  register1bit rmemWrite(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memWrite),.outR(memWrite_ID_EX));
  
  //memRd
  register1bit rmemRead(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memRead),.outR(memRead_ID_EX));
  
  //aluOp
  register1bit raluOp(.clk(clk), .reset(reset), .regWrite(regWr), .inR(aluOp),.outR(aluOp_ID_EX));
  
  //aluSrcB
  register1bit raluSrcB(.clk(clk), .reset(reset), .regWrite(regWr), .inR(aluSrcB),.outR(aluSrcB_ID_EX));
  
  //regDest
   register1bit rregDest(.clk(clk), .reset(reset), .regWrite(regWr), .inR(regDest),.outR(regDest_ID_EX));
  
endmodule

module EX_MEM(input clk, input reset, input regWr, input memRead, input memWrite, input memToReg, 
				 input regWrite, input [4:0] destReg, input [31:0] memData, input [31:0] aluOut, output memRead_EX_MEM, 
				 output memWrite_EX_MEM, output memToReg_EX_MEM, output regWrite_EX_MEM, output [4:0] destReg_EX_MEM, 
				 output [31:0] memData_EX_MEM, output [31:0] aluOut_EX_MEM);
	//   
	register32bit raluOut(.clk(clk), .reset(reset), .regWrite(regWr), .inR(aluOut), .outR(aluOut_EX_MEM));
   register32bit rmemData(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memData), .outR(memData_EX_MEM));
	
	 register5bit rdestReg(.clk(clk), .reset(reset), .regWrite(regWr), .inR(destReg),.outR(destReg_EX_MEM));
	 register1bit rregWrite(.clk(clk), .reset(reset), .regWrite(regWr), .inR(regWrite),.outR(regWrite_EX_MEM));
	 register1bit rmemToReg(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memToReg),.outR(memToReg_EX_MEM));
	 register1bit rmemWrite(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memWrite),.outR(memWrite_EX_MEM));
	 register1bit rmemRead(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memRead),.outR(memRead_EX_MEM));
	 
	 
	 
  
endmodule

module MEM_WB(input clk, input reset, input regWr, input memToReg, input regWrite, input [4:0] destReg, 
				  input [31:0] memData, input [31:0] aluOut, 
				  output memToReg_MEM_WB, output regWrite_MEM_WB, 
				  output [4:0] destReg_MEM_WB, output [31:0] memData_MEM_WB, output [31:0] aluOut_MEM_WB);
	//   
register32bit raluOut(.clk(clk), .reset(reset), .regWrite(regWr), .inR(aluOut), .outR(aluOut_MEM_WB));
  register32bit rmemData(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memData), .outR(memData_MEM_WB));
	  register5bit rdestReg(.clk(clk), .reset(reset), .regWrite(regWr), .inR(destReg),.outR(destReg_MEM_WB));
	register1bit rregWrite(.clk(clk), .reset(reset), .regWrite(regWr), .inR(regWrite),.outR(regWrite_MEM_WB));
	 register1bit rmemToReg(.clk(clk), .reset(reset), .regWrite(regWr), .inR(memToReg),.outR(memToReg_MEM_WB));
endmodule


// Intermediate Registers end
// Control circuit. Generates the control signals. Default value for all the outputs is zero(0).
module controlCircuit(input [5:0] opcode, input [5:0] funct, output reg regDest, output reg aluSrcB, output reg aluOp, 
                      output reg memRead, output reg memWrite, output reg memToReg, output reg regWrite);
//   
always @(opcode, funct)
	begin
		case(opcode)
			6'b100011: begin
							regDest = 1'b0;
							aluSrcB = 1'b1;
							aluOp = 1'b0;
							memRead = 1'b1;
							memWrite = 1'b0;
							memToReg = 1'b1;
							regWrite = 1'b1;
							end
			
			6'b101011: begin
							regDest = 1'b0;
							aluSrcB = 1'b1;
							aluOp = 1'b0;
							memRead = 1'b0;
							memWrite = 1'b1;
							memToReg = 1'b0;
							regWrite = 1'b0;
							end

				6'b001000: begin
							regDest = 1'b0;
							aluSrcB = 1'b1;
							aluOp = 1'b0;
							memRead = 1'b0;
							memWrite = 1'b0;
							memToReg = 1'b0;
							regWrite = 1'b1;
							end
				
				6'b000000: begin
							if(funct == 6'b010100)
							begin
								regDest = 1'b1;
							aluSrcB = 1'b0;
							aluOp = 1'b0;
							memRead = 1'b0;
							memWrite = 1'b0;
							memToReg = 1'b0;
							regWrite = 1'b1;
							end
							else if(funct == 6'b010110)
							begin
								regDest = 1'b1;
							aluSrcB = 1'b0;
							aluOp = 1'b1;
							memRead = 1'b0;
							memWrite = 1'b0;
							memToReg = 1'b0;
							regWrite = 1'b1;
							end
							end


		endcase
	end

endmodule

module pipeline(input clk, input reset, output [31:0] result);
//   
	//pc
		//mem-wb
	wire memToReg_MEM_WB, regWrite_MEM_WB;
	wire [4:0] destReg_MEM_WB;
	wire [31:0] memData_MEM_WB, aluOut_MEM_WB;
	wire [31:0] pcAdderOut;
	wire [31:0] pcOut, regRs, regRt, memwbWriteDataOut;
	wire [31:0] instrMemOut, ifidOut, sextOut;
	wire regDest, aluSrcB, aluOp,memRead, memWrite, memToReg,regWrite, memwbRegWriteOut;
 	register32bit pc(.clk(clk), .reset(reset), .regWrite(1'b1), .inR(pcAdderOut), .outR(pcOut));
	//pc adder
	adder pcAdder(.in1(pcOut), .in2(32'd4), .adderOut(pcAdderOut));
	
	//im
	IM instrMem(.clk(clk), .reset(reset), .pc5bits(pcOut[6:2]), .memRead(1'b1), .IR(instrMemOut));
	//if-id
	IF_ID ifid(.clk(clk), .reset(reset), .regWr(1'b1), .ir(instrMemOut), .ir_IF_ID(ifidOut));
	//cc
	controlCircuit cc(.opcode(ifidOut[31:26]), .funct(ifidOut[5:0]), .regDest(regDest),
							.aluSrcB(aluSrcB), .aluOp(aluOp), 
                      .memRead(memRead), .memWrite(memWrite), 
							.memToReg(memToReg), .regWrite(regWrite));

	//regf
	registerFile rf(.clk(clk), .reset(reset), .regWrite(regWrite_MEM_WB), 
						.rs(ifidOut[25:21]), .rt(ifidOut[20:16]),
						.rd(destReg_MEM_WB), .writeData(result),
						.regRs(regRs), .regRt(regRt));

	//sext
	 signExt16to32 sext(.in(ifidOut[15:0]), .signExtIn(sextOut));
	//id-ex
	wire [31:0] regRs_ID_EX, regRt_ID_EX, sext16to32_ID_EX;
	wire [4:0] rt_ID_EX, rd_ID_EX; 
	wire regDest_ID_EX, aluSrcB_ID_EX, aluOp_ID_EX, memRead_ID_EX, memWrite_ID_EX, memToReg_ID_EX, regWrite_ID_EX;
	ID_EX idex(.clk(clk), .reset(reset), .regWr(1'b1), .regRs(regRs), 
			.regRt(regRt), .regDest(regDest), .aluSrcB(aluSrcB), .aluOp(aluOp), .memRead(memRead), .memWrite(memWrite), .memToReg(memToReg), 
				 .regWrite(regWrite), .sext16to32(sextOut), .rt(ifidOut[20:16]), 
				 .rd(ifidOut[15:11]), .regRs_ID_EX(regRs_ID_EX), 
				 .regRt_ID_EX(regRt_ID_EX), .regDest_ID_EX(regDest_ID_EX), .aluSrcB_ID_EX(aluSrcB_ID_EX), .aluOp_ID_EX(aluOp_ID_EX), 
				 .memRead_ID_EX(memRead_ID_EX), .memWrite_ID_EX(memWrite_ID_EX), .memToReg_ID_EX(memToReg_ID_EX),.regWrite_ID_EX(regWrite_ID_EX), 
				 .sext16to32_ID_EX(sext16to32_ID_EX), .rt_ID_EX(rt_ID_EX), .rd_ID_EX(rd_ID_EX));
	
	//alu
	wire [31:0] alusrcBMuxOut;
	mux2to1_32bit aluSrcBmux(.in0(regRt_ID_EX), .in1(sext16to32_ID_EX), .select(aluSrcB_ID_EX), .muxOut(alusrcBMuxOut));

	wire [31:0] aluOut;
	alu alumain(.aluIn1(regRs_ID_EX), .aluIn2(alusrcBMuxOut), .aluOp( aluOp_ID_EX), .aluOut(aluOut));
	
	//regdest mux
	wire [4:0] regDestMuxOut;
	mux2to1_5bit regDestMux(.in0(rt_ID_EX), .in1(rd_ID_EX), .select(regDest_ID_EX), .muxOut(regDestMuxOut));
 
	//ex_mem
	wire memRead_EX_MEM, memWrite_EX_MEM, memToReg_EX_MEM, regWrite_EX_MEM;
	wire [4:0] destReg_EX_MEM;
	wire [31:0] memData_EX_MEM, aluOut_EX_MEM;
	EX_MEM  exmem(.clk(clk), .reset(reset), .regWr(1'b1), .memRead(memRead_ID_EX), .memWrite(memWrite_ID_EX), .memToReg(memToReg_ID_EX), 
				 .regWrite(regWrite_ID_EX), .destReg(regDestMuxOut), .memData(regRt_ID_EX), .aluOut(aluOut),  .memRead_EX_MEM(memRead_EX_MEM), 
				 .memWrite_EX_MEM(memWrite_EX_MEM), .memToReg_EX_MEM(memToReg_EX_MEM), .regWrite_EX_MEM(regWrite_EX_MEM), 
				 .destReg_EX_MEM(destReg_EX_MEM), 
				 .memData_EX_MEM(memData_EX_MEM), .aluOut_EX_MEM(aluOut_EX_MEM));

	//dm
	wire [31:0] memOut;
	DM dm(.clk(clk), .reset(reset), .memRead(memRead_EX_MEM), .memWrite(memWrite_EX_MEM),.address(aluOut_EX_MEM[6:2]), .writeData(memData_EX_MEM),  .memOut(memOut));
 

	MEM_WB memwb(.clk(clk), .reset(reset), .regWr(1'b1), .memToReg(memToReg_EX_MEM),.regWrite(regWrite_EX_MEM), 
					.destReg(destReg_EX_MEM), .memData(memOut), .aluOut(aluOut_EX_MEM), 
				  .memToReg_MEM_WB(memToReg_MEM_WB), .regWrite_MEM_WB(regWrite_MEM_WB), 
				 .destReg_MEM_WB(destReg_MEM_WB), .memData_MEM_WB(memData_MEM_WB), .aluOut_MEM_WB(aluOut_MEM_WB));

	//
	mux2to1_32bit muxfinal(.in0(aluOut_MEM_WB), .in1(memData_MEM_WB), .select(memToReg_MEM_WB), .muxOut(result));

	
	
endmodule

module testbench();
	reg clk;
	reg reset;
	wire [31:0] result;
	pipeline pl(clk, reset, result);

	always
	#5 clk=~clk;
	
	initial
	begin
		clk=0; reset=1;
		#5  reset=0;	
		#165 $finish;
	end
endmodule
