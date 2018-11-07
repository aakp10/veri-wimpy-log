// Instruction Memory Starts
module D_ff_IM(input clk, input reset, input d, output reg q);
    always@(reset, posedge clk)
    begin
        if(reset == 1'b1)
        begin
            q = d;
        end
    end
endmodule

module register_IM(input clk, input reset, input [7:0] inR, output [7:0] outR);
    D_ff_IM d0 (clk, reset, inR[0],  outR[0]);
    D_ff_IM d1 (clk, reset, inR[1],  outR[1]);
    D_ff_IM d2 (clk, reset, inR[2],  outR[2]);
    D_ff_IM d3 (clk, reset, inR[3],  outR[3]);
    D_ff_IM d4 (clk, reset, inR[4],  outR[4]);
    D_ff_IM d5 (clk, reset, inR[5],  outR[5]);
    D_ff_IM d6 (clk, reset, inR[6],  outR[6]);
    D_ff_IM d7 (clk, reset, inR[7],  outR[7]);
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

module IM(input clk, input reset, input [4:0] pc_5bits, output [31:0] IR);
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
    register_IM rIM0   (clk, reset, 8'h38, outR0);  //    XORI $0,  $0,  1H
    register_IM rIM1   (clk, reset, 8'h00, outR1);   
    register_IM rIM2   (clk, reset, 8'h00, outR2);   
    register_IM rIM3   (clk, reset, 8'h01, outR3);   
    register_IM rIM4   (clk, reset, 8'h20, outR4);  //    ADDI $1,  $0,  1H
    register_IM rIM5   (clk, reset, 8'h01, outR5);  
    register_IM rIM6   (clk, reset, 8'h00, outR6);  
    register_IM rIM7   (clk, reset, 8'h01, outR7);   
    register_IM rIM8   (clk, reset, 8'h20, outR8);  //    ADDI $12, $1,  3H 
    register_IM rIM9   (clk, reset, 8'h2C, outR9);   
    register_IM rIM10  (clk, reset, 8'h00, outR10);   
    register_IM rIM11  (clk, reset, 8'h03, outR11);   
    register_IM rIM12  (clk, reset, 8'h00, outR12); //    OR   $23, $0,  $1 
    register_IM rIM13  (clk, reset, 8'h01, outR13);  
    register_IM rIM14  (clk, reset, 8'hB8, outR14);  
    register_IM rIM15  (clk, reset, 8'h19, outR15); 
    register_IM rIM16  (clk, reset, 8'h20, outR16); //    ADDI $5,  $0,  2H 
    register_IM rIM17  (clk, reset, 8'h05, outR17);  
    register_IM rIM18  (clk, reset, 8'h00, outR18);  
    register_IM rIM19  (clk, reset, 8'h02, outR19); 
    register_IM rIM20  (clk, reset, 8'h10, outR20); //A:  BEQ  $5,  $12, D  
    register_IM rIM21  (clk, reset, 8'hAC, outR21);  
    register_IM rIM22  (clk, reset, 8'h00, outR22);  
    register_IM rIM23  (clk, reset, 8'h09, outR23); 
    register_IM rIM24  (clk, reset, 8'h00, outR24); //    AND  $4,  $0,  $0 
    register_IM rIM25  (clk, reset, 8'h00, outR25);  
    register_IM rIM26  (clk, reset, 8'h20, outR26);  
    register_IM rIM27  (clk, reset, 8'h18, outR27); 
    register_IM rIM28  (clk, reset, 8'h00, outR28); //    ADD  $6,  $0,  $5  
    register_IM rIM29  (clk, reset, 8'h05, outR29);   
    register_IM rIM30  (clk, reset, 8'h30, outR30);   
    register_IM rIM31  (clk, reset, 8'h14, outR31);  
    register_IM rIM32  (clk, reset, 8'h10, outR32); //B:  BEQ  $6,  $0,  C  
    register_IM rIM33  (clk, reset, 8'hC0, outR33);   
    register_IM rIM34  (clk, reset, 8'h00, outR34);   
    register_IM rIM35  (clk, reset, 8'h03, outR35);  
    register_IM rIM36  (clk, reset, 8'h00, outR36); //    ADD  $4,  $4,  $23  
    register_IM rIM37  (clk, reset, 8'h97, outR37);   
    register_IM rIM38  (clk, reset, 8'h20, outR38);   
    register_IM rIM39  (clk, reset, 8'h14, outR39);  
    register_IM rIM40  (clk, reset, 8'h00, outR40); //    SUB  $6,  $6,  $1  
    register_IM rIM41  (clk, reset, 8'hC1, outR41);  
    register_IM rIM42  (clk, reset, 8'h30, outR42);  
    register_IM rIM43  (clk, reset, 8'h16, outR43); 
    register_IM rIM44  (clk, reset, 8'h08, outR44); //    J    B                        
    register_IM rIM45  (clk, reset, 8'h00, outR45);             
    register_IM rIM46  (clk, reset, 8'h00, outR46);             
    register_IM rIM47  (clk, reset, 8'h08, outR47); 
    register_IM rIM48  (clk, reset, 8'h00, outR48); //C:  AND  $23, $4,  $4  
    register_IM rIM49  (clk, reset, 8'h84, outR49);  
    register_IM rIM50  (clk, reset, 8'hB8, outR50);  
    register_IM rIM51  (clk, reset, 8'h18, outR51); 
    register_IM rIM52  (clk, reset, 8'h00, outR52); //    ADD  $5,  $5,  $1  
    register_IM rIM53  (clk, reset, 8'hA1, outR53);  
    register_IM rIM54  (clk, reset, 8'h28, outR54);  
    register_IM rIM55  (clk, reset, 8'h14, outR55);  
    register_IM rIM56  (clk, reset, 8'h08, outR56); //    J    A                       
    register_IM rIM57  (clk, reset, 8'h00, outR57);             
    register_IM rIM58  (clk, reset, 8'h00, outR58);             
    register_IM rIM59  (clk, reset, 8'h05, outR59);  
    register_IM rIM60  (clk, reset, 8'h3A, outR60); //D:  XORI $27, $23, 2CH
    register_IM rIM61  (clk, reset, 8'hFB, outR61); 
    register_IM rIM62  (clk, reset, 8'h00, outR62); 
    register_IM rIM63  (clk, reset, 8'h2C, outR63); 
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
                        pc_5bits, IR);
endmodule

//Instruction Memory Ends

// Register File Starts

module D_ff(input clk, input reset, input regWrite, input decOut1b , input d, output reg q);
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
    D_ff d0  (clk, reset, regWrite, decOut1b, inR[0],  outR[0]);
    D_ff d1  (clk, reset, regWrite, decOut1b, inR[1],  outR[1]);
    D_ff d2  (clk, reset, regWrite, decOut1b, inR[2],  outR[2]);
    D_ff d3  (clk, reset, regWrite, decOut1b, inR[3],  outR[3]);
    D_ff d4  (clk, reset, regWrite, decOut1b, inR[4],  outR[4]);
    D_ff d5  (clk, reset, regWrite, decOut1b, inR[5],  outR[5]);
    D_ff d6  (clk, reset, regWrite, decOut1b, inR[6],  outR[6]);
    D_ff d7  (clk, reset, regWrite, decOut1b, inR[7],  outR[7]);
    D_ff d8  (clk, reset, regWrite, decOut1b, inR[8],  outR[8]);
    D_ff d9  (clk, reset, regWrite, decOut1b, inR[9],  outR[9]);
    D_ff d10 (clk, reset, regWrite, decOut1b, inR[10], outR[10]);
    D_ff d11 (clk, reset, regWrite, decOut1b, inR[11], outR[11]);
    D_ff d12 (clk, reset, regWrite, decOut1b, inR[12], outR[12]);
    D_ff d13 (clk, reset, regWrite, decOut1b, inR[13], outR[13]);
    D_ff d14 (clk, reset, regWrite, decOut1b, inR[14], outR[14]);
    D_ff d15 (clk, reset, regWrite, decOut1b, inR[15], outR[15]);
    D_ff d16 (clk, reset, regWrite, decOut1b, inR[16], outR[16]);
    D_ff d17 (clk, reset, regWrite, decOut1b, inR[17], outR[17]);
    D_ff d18 (clk, reset, regWrite, decOut1b, inR[18], outR[18]);
    D_ff d19 (clk, reset, regWrite, decOut1b, inR[19], outR[19]);
    D_ff d20 (clk, reset, regWrite, decOut1b, inR[20], outR[20]);
    D_ff d21 (clk, reset, regWrite, decOut1b, inR[21], outR[21]);
    D_ff d22 (clk, reset, regWrite, decOut1b, inR[22], outR[22]);
    D_ff d23 (clk, reset, regWrite, decOut1b, inR[23], outR[23]);
    D_ff d24 (clk, reset, regWrite, decOut1b, inR[24], outR[24]);
    D_ff d25 (clk, reset, regWrite, decOut1b, inR[25], outR[25]);
    D_ff d26 (clk, reset, regWrite, decOut1b, inR[26], outR[26]);
    D_ff d27 (clk, reset, regWrite, decOut1b, inR[27], outR[27]);
    D_ff d28 (clk, reset, regWrite, decOut1b, inR[28], outR[28]);
    D_ff d29 (clk, reset, regWrite, decOut1b, inR[29], outR[29]);
    D_ff d30 (clk, reset, regWrite, decOut1b, inR[30], outR[30]);
    D_ff d31 (clk, reset, regWrite, decOut1b, inR[31], outR[31]);
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
    register32bit r0  (clk, reset, 1'b0, decOut[0],  writeData, outR0);
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

module ALU(input signed [31:0] aluIn1, input signed [31:0] aluIn2, input [2:0] aluCtrl, 
           output reg [31:0] aluOut, output reg zero);
    always@(aluIn1, aluIn2, aluCtrl)
    begin
        case(aluCtrl)
            3'd0: aluOut = aluIn1 + aluIn2;
            3'd1: aluOut = aluIn1 - aluIn2;
            3'd2: aluOut = aluIn1 & aluIn2;
            3'd3: aluOut = aluIn1 | aluIn2;
            3'd4: aluOut = aluIn1 ^ aluIn2;
        endcase
        if(aluOut == 32'd0)
        begin
            zero = 1'b1;
        end
        else
        begin
            zero = 1'b0;
        end
    end
endmodule

module signExt16to32(input [15:0] in, output reg [31:0] signExtIn);
    // 
	 always @(in)
	 signExtIn = {{16{in[15]}},in};
	
endmodule

module zeroExt16to32(input [15:0] in, output reg [31:0] zeroExtIn);
     // 
	  always @(in)
		zeroExtIn = {16'b0, in};
	
endmodule

module adder(input [31:0] in1, input [31:0] in2, output reg [31:0] adderOut);
      // 
		always @(in1, in2)
			adderOut = in1 + in2;
	
endmodule

//IF select is 0 then muxout is in0. IF select is 1 then muxout is in1. 
module mux2to1_32bits(input [31:0] in0, input [31:0] in1, input select, output reg [31:0] muxOut);
      // 
		always @(in0, in1, select)
		begin
			case(select)
				1'b0: muxOut = in0;
				1'b1: muxOut = in1;
			endcase
		end
	
endmodule

//IF select is 0 then muxout is in0. IF select is 1 then muxout is in1. 
module mux2to1_5bits(input [4:0] in0, input [4:0] in1, input select, output reg [4:0] muxOut);
    // 
	 always @(in0, in1, select)
	 begin
		case(select)
			1'b0: muxOut = in0;
			1'b1: muxOut = in1;
		endcase
	 end
	
endmodule

//IF select is 0 then muxout is in0. IF select is 1 then muxout is in1. IF select is 2 then muxout is in2. IF select is 3 then muxout is in3. 
module mux4to1_32bits(input [31:0] in0, input [31:0] in1, input [31:0] in2, input [31:0] in3, 
                      input [1:0] select, output reg [31:0] muxOut);
    // 
	 always @(in0, in1, in2, in3, select)
	 begin
		case(select)
			2'd0: muxOut = in0;
			2'd1: muxOut = in1;
			2'd2: muxOut = in2;
			2'd3 : muxOut = in3;
		endcase
	 end
	
endmodule

// Control circuit. Generates the control signals. Default value for all the outputs is zero(0).
//Set aluOp as 0 - R type, 1 - add, 2 - sub, 3 - xor
module controlCircuit(input [5:0] opcode, output reg [1:0] aluOp, output reg [1:0] aluSrcB, 
                      output reg branch, output reg jump, output reg regDest, output reg regWrite);
   // 
	always @(opcode)
	begin
		case(opcode[3:0])
			4'b0: //r type
				begin
					aluOp = 2'b00;
					aluSrcB= 2'b 00;
					branch = 1'b0;
					jump = 1'b0;
					regDest = 1'b0;
					regWrite = 1'b1;
				end
			4'b1000: //addi
					begin
					aluOp = 2'b01;
					aluSrcB= 2'b01;
					branch = 1'b0;
					jump = 1'b0;
					regDest = 1'b1;
					regWrite = 1'b1;
					end
			4'b1110: //xori
					begin
					aluOp = 2'b11;
					aluSrcB= 2'b10;
					branch = 1'b0;
					jump = 1'b0;
					regDest = 1'b1;
					regWrite = 1'b1;
					end
			4'b0100: //beq
					begin
					aluOp = 2'b10;
					aluSrcB= 2'b00;
					branch = 1'b1;
					jump = 1'b0;
					regDest = 1'b0;
					regWrite = 1'b0;
					end
			4'b0010: //j
					begin
					aluOp = 2'b00;
					aluSrcB= 2'b00;
					branch = 1'b0;
					jump = 1'b1;
					regDest = 1'b0;
					regWrite = 1'b0;
					end
			default:
					begin
					aluOp = 2'b00;
					aluSrcB= 2'b00;
					branch = 1'b0;
					jump = 1'b0;
					regDest = 1'b0;
					regWrite = 1'b0;
					end
		endcase
	end
	
	
endmodule

//Set aluCtrl as 0 - add, 1 - subtract, 2 - AND, 3 - OR, 4 - XOR
module aluControl(input [1:0] aluOp, input [5:0] funct, output reg [2:0] aluCtrl);
	// 
	always @(aluOp, funct)
	begin
		case(aluOp)
			2'b00:
				begin
					case(funct)
					6'b010100: aluCtrl = 3'b000;
					6'b010110: aluCtrl = 3'b001;
					6'b011000: aluCtrl = 3'b010;
					6'b011001: aluCtrl = 3'b011;
					default: aluCtrl = 3'b000;
					endcase
				end
			2'b01: aluCtrl = 3'b000;
			2'b11: aluCtrl = 3'b100;
			2'b10: aluCtrl = 3'b001;

		endcase
	end
	
endmodule

//NOTE : PC should be instance of register32bit
module singleCycle(input clk, input reset, output [31:0] result);
	// 
	wire [31:0] newPc, currentPc, currentInstr;
	wire [1:0] aluOp, aluSrcB; 
	wire jump, regDest, regWrite, branch;
	wire zeroFlag;
	wire [31:0] pcPlus4;
	wire [31:0] writeDataFromAlu, regRs, regRt;
	wire [4:0] chooseRd;
	wire [31:0] sextOut;
	wire [31:0] zextOut;
	wire [31:0] btaOut;
	wire beqMuxSel;
	wire [31:0] bOrPc;
	wire [2:0] aluCtrl;
	wire [31:0] finalAluSrcB;
	
	register32bit pc(.clk(clk), .reset(reset), .regWrite(1'b1), .decOut1b(1'b1), .inR(newPc), .outR(currentPc));
	//pc adder
	
	adder pcAdder(.in1(currentPc), .in2(32'd4), .adderOut(pcPlus4));
	//mux before pc done
	
	//instruction memory
	IM instructionMemory(.clk(clk), .reset(reset), .pc_5bits(currentPc[6:2]), .IR(currentInstr));
	//ctrl signals
	controlCircuit mcu(.opcode(currentInstr[31:26]), .aluOp(aluOp), .aluSrcB(aluSrcB), 
                      .branch(branch), .jump(jump), .regDest(regDest), .regWrite(regWrite));
							 
	
	//jump shiftright
	//reg file
	
	//mux 2 to 1 5bits
	mux2to1_5bits muxRegDest(.in0(currentInstr[15:11]), .in1(currentInstr[20:16]), .select(regDest), .muxOut(chooseRd));
	registerFile regfile(.clk(clk), .reset(reset), .regWrite(regWrite), .rs(currentInstr[25:21]), .rt(currentInstr[20:16]),
								.rd(chooseRd),.writeData(writeDataFromAlu), .regRs(regRs), .regRt(regRt));
	
	//sext 15:0
	
	signExt16to32 sext(.in(currentInstr[15:0]), .signExtIn(sextOut));
	//zext 15:0
	
	zeroExt16to32 zext(.in(currentInstr[15:0]), .zeroExtIn(zextOut));
	
	//calculate BTA;
	//32 bit adder 
	//requires pc+4 output ;done
	
	adder btaAdder(.in1(sextOut<<2), .in2(pcPlus4), .adderOut(btaOut));
	
	//and gate for beq
	
	and beqGate(beqMuxSel, zeroFlag, branch);
	
	//mux for beq
	
	mux2to1_32bits muxBeq(.in0(pcPlus4), .in1(btaOut), .select(beqMuxSel), .muxOut(bOrPc));
	wire[27:0] concat;
assign concat	= currentInstr[25:0]<<2;
	//jump 
	mux2to1_32bits muxJ(.in0(bOrPc), .in1({pcPlus4[31:28], concat}), .select(jump), .muxOut(newPc));

      
	
	//ALU ctrl
	
	aluControl aluCtrlUnit(.aluOp(aluOp), .funct(currentInstr[5:0]), .aluCtrl(aluCtrl));
	
	//ALU
	//mux to choose aluSrcB 32 bits 4 to 1
	
	mux4to1_32bits muxAluSrcBChooser(.in0(regRt), .in1(sextOut),
												.in2(zextOut), .in3(32'd0), .select(aluSrcB),
												.muxOut(finalAluSrcB));
	
	
	
	ALU aluInstance(.aluIn1(regRs),.aluIn2(finalAluSrcB), .aluCtrl(aluCtrl), 
						.aluOut(writeDataFromAlu), .zero(zeroFlag));
	
	assign result = writeDataFromAlu;
	
endmodule

module testbench();
	reg clk;
	reg reset;
	wire [31:0] result;
	singleCycle SC(clk, reset, result);

	always
	#5 clk=~clk;
	
	initial
	begin
		clk=0; reset=1;
		#5  reset=0;	
		$monitor($time," %x ",result);
		#415 $finish;
	end
endmodule

