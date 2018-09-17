module D_FF(input clk, input reset, input regWrite, input decOut1b, input d, output reg q);
    always@(negedge clk)
    begin
      if (reset == 1'b1)
        q = 0;
      else if (regWrite == 1'b1 && decOut1b == 1'b1)
        q = d;
    end
endmodule

module register32bit(input clk, input reset, input regWrite, input decOut1b,input [31:0] inR,
                        output [31:0] outR);
    D_FF d0(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[0]), .q(outR[0]));
    D_FF d1(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[1]), .q(outR[1]));
    D_FF d2(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[2]), .q(outR[2]));
    D_FF d3(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[3]), .q(outR[3]));
    D_FF d4(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[4]), .q(outR[4]));
    D_FF d5(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[5]), .q(outR[5]));
    D_FF d6(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[6]), .q(outR[6]));
    D_FF d7(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[7]), .q(outR[7]));
    D_FF d8(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[8]), .q(outR[8]));
    D_FF d9(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[9]), .q(outR[9]));
    D_FF d10(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[10]), .q(outR[10]));
    D_FF d11(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[11]), .q(outR[11]));
    D_FF d12(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[12]), .q(outR[12]));
    D_FF d13(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[13]), .q(outR[13]));
    D_FF d14(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[14]), .q(outR[14]));
    D_FF d15(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[15]), .q(outR[15]));
    D_FF d16(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[16]), .q(outR[16]));
    D_FF d17(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[17]), .q(outR[17]));
    D_FF d18(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[18]), .q(outR[18]));
    D_FF d19(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[19]), .q(outR[19]));
    D_FF d20(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[20]), .q(outR[20]));
    D_FF d21(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[21]), .q(outR[21]));
    D_FF d22(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[22]), .q(outR[22]));
    D_FF d23(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[23]), .q(outR[23]));
    D_FF d24(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[24]), .q(outR[24]));
    D_FF d25(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[25]), .q(outR[25]));
    D_FF d26(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[26]), .q(outR[26]));
    D_FF d27(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[27]), .q(outR[27]));
    D_FF d28(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[28]), .q(outR[28]));
    D_FF d29(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[29]), .q(outR[29]));
    D_FF d30(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[30]), .q(outR[30]));
    D_FF d31(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[31]), .q(outR[31]));
endmodule

module registerSet32(input clk, input reset, input regwrite, input [31:0] decOut, input [31:0] writeData,
                    output [31:0] outR0, output [31:0] outR1, output [31:0] outR2, output [31:0] outR3,
                    output [31:0] outR4, output [31:0] outR5, output [31:0] outR6, output [31:0] outR7,
                    output [31:0] outR8, output [31:0] outR9, output [31:0] outR10, output [31:0] outR11,
                    output [31:0] outR12, output [31:0] outR13, output [31:0] outR14, output [31:0] outR15
                    output [31:0] outR16, output [31:0] outR17, output [31:0] outR18, output [31:0] outR19,
                    output [31:0] outR20, output [31:0] outR21, output [31:0] outR22, output [31:0] outR23,
                    output [31:0] outR24, output [31:0] outR25, output [31:0] outR26, output [31:0] outR27,
                    output [31:0] outR28, output [31:0] outR29, output [31:0] outR30, output [31:0] outR31);

    register32bit R0(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[0]), .inR(writeData), .outR(outR0));
    register32bit R1(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[1]), .inR(writeData), .outR(outR1));
    register32bit R2(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[2]), .inR(writeData), .outR(outR2));
    register32bit R3(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[3]), .inR(writeData), .outR(outR3));
    register32bit R4(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[4]), .inR(writeData), .outR(outR4));
    register32bit R5(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[5]), .inR(writeData), .outR(outR5));
    register32bit R6(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[6]), .inR(writeData), .outR(outR6));
    register32bit R7(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[7]), .inR(writeData), .outR(outR7));
    register32bit R8(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[8]), .inR(writeData), .outR(outR8));
    register32bit R9(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[9]), .inR(writeData), .outR(outR9));
    register32bit R10(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[10]), .inR(writeData), .outR(outR10));
    register32bit R11(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[11]), .inR(writeData), .outR(outR11));
    register32bit R12(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[12]), .inR(writeData), .outR(outR12));
    register32bit R13(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[13]), .inR(writeData), .outR(outR13));
    register32bit R14(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[14]), .inR(writeData), .outR(outR14));
    register32bit R15(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[15]), .inR(writeData), .outR(outR15));
    register32bit R16(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[16]), .inR(writeData), .outR(outR16));
    register32bit R17(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[17]), .inR(writeData), .outR(outR17));
    register32bit R18(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[18]), .inR(writeData), .outR(outR18));
    register32bit R19(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[19]), .inR(writeData), .outR(outR19));
    register32bit R20(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[20]), .inR(writeData), .outR(outR20));
    register32bit R21(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[21]), .inR(writeData), .outR(outR21));
    register32bit R22(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[22]), .inR(writeData), .outR(outR22));
    register32bit R23(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[23]), .inR(writeData), .outR(outR23));
    register32bit R24(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[24]), .inR(writeData), .outR(outR24));
    register32bit R25(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[25]), .inR(writeData), .outR(outR25));
    register32bit R26(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[26]), .inR(writeData), .outR(outR26));
    register32bit R27(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[27]), .inR(writeData), .outR(outR27));
    register32bit R28(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[28]), .inR(writeData), .outR(outR28));
    register32bit R29(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[29]), .inR(writeData), .outR(outR29));
    register32bit R30(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[30]), .inR(writeData), .outR(outR30));
    register32bit R31(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[31]), .inR(writeData), .outR(outR31));
endmodule

module register16bit(input clk, input reset, input regWrite, input decOut1b,input [15:0] inR,
                        output [15:0] outR);
    D_FF d0(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[0]), .q(outR[0]));
    D_FF d1(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[1]), .q(outR[1]));
    D_FF d2(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[2]), .q(outR[2]));
    D_FF d3(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[3]), .q(outR[3]));
    D_FF d4(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[4]), .q(outR[4]));
    D_FF d5(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[5]), .q(outR[5]));
    D_FF d6(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[6]), .q(outR[6]));
    D_FF d7(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[7]), .q(outR[7]));
    D_FF d8(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[8]), .q(outR[8]));
    D_FF d9(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[9]), .q(outR[9]));
    D_FF d10(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[10]), .q(outR[10]));
    D_FF d11(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[11]), .q(outR[11]));
    D_FF d12(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[12]), .q(outR[12]));
    D_FF d13(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[13]), .q(outR[13]));
    D_FF d14(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[14]), .q(outR[14]));
    D_FF d15(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut1b), .d(inR[15]), .q(outR[15]));

endmodule

module registerSet16(input clk, input reset, input regwrite, input [15:0] decOut, input [15:0] writeData,
                    output [15:0] outR0, output [15:0] outR1, output [15:0] outR2, output [15:0] outR3,
                    output [15:0] outR4, output [15:0] outR5, output [15:0] outR6, output [15:0] outR7,
                    output [15:0] outR8, output [15:0] outR9, output [15:0] outR10, output [15:0] outR11,
                    output [15:0] outR12, output [15:0] outR13, output [15:0] outR14, output [15:0] outR15);

    register32bit R0(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[0]), .inR(writeData), .outR(outR0));
    register32bit R1(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[1]), .inR(writeData), .outR(outR1));
    register32bit R2(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[2]), .inR(writeData), .outR(outR2));
    register32bit R3(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[3]), .inR(writeData), .outR(outR3));
    register32bit R4(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[4]), .inR(writeData), .outR(outR4));
    register32bit R5(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[5]), .inR(writeData), .outR(outR5));
    register32bit R6(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[6]), .inR(writeData), .outR(outR6));
    register32bit R7(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[7]), .inR(writeData), .outR(outR7));
    register32bit R8(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[8]), .inR(writeData), .outR(outR8));
    register32bit R9(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[9]), .inR(writeData), .outR(outR9));
    register32bit R10(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[10]), .inR(writeData), .outR(outR10));
    register32bit R11(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[11]), .inR(writeData), .outR(outR11));
    register32bit R12(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[12]), .inR(writeData), .outR(outR12));
    register32bit R13(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[13]), .inR(writeData), .outR(outR13));
    register32bit R14(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[14]), .inR(writeData), .outR(outR14));
    register32bit R15(.clk(clk), .reset(reset), .regWrite(regWrite), .decOut1b(decOut[15]), .inR(writeData), .outR(outR15));
endmodule