module registerFile(input clk, input reset, input regWrite, input [15:0]WriteData, input [3:0] rs,
                    input [3:0] rd1, input [3:0] rd2, input [4:0] rt, input select, output [15:0] regRs, regRt, regRd);
    wire [3:0] muxRdOut;
    wire [15:0] decOut;
    wire [15:0] outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15;

    mux2to1_4bit muxRd(.in0(rd1), .in1(rd2), .sel(select), .out(muxRdOut));
    decoder4to16 decRd(.regDest(muxRdOut), .decOut(decOut));
    registerSet16 regSet(.clk(clk), .reset(reset), .regwrite(regWrite), .decOut(decOut), .writeData(writeData),
                            .outR0(outR0), .outR1(outR1), .outR2(outR2), .outR3(outR3), .outR4(outR4), .outR5(outR5),
                            .outR6(outR6), .outR7(outR7), .outR8(outR8), .outR9(outR9), .outR10(outR10), .outR11(outR11),
                            .outR12(outR12), .outR13(outR13), .outR14(outR14), .outR15(outR15));

    mux16to1_16bit muxRegRs(.in0(outR0), .in1(outR1), .in2(outR2), .in3(outR3), .in4(outR4), .in5(outR5), .in6(outR6),
                            .in7(outR7), .in8(outR8), .in9(outR9), .in10(outR10), .in11(outR11), .in12(outR12),
                            .in13(outR13), .in14(outR14), .in15(outR15), .sel(rs), .out(regRs));

    mux16to1_16bit muxRegRt(.in0(outR0), .in1(outR1), .in2(outR2), .in3(outR3), .in4(outR4), .in5(outR5), .in6(outR6),
                            .in7(outR7), .in8(outR8), .in9(outR9), .in10(outR10), .in11(outR11), .in12(outR12),
                            .in13(outR13), .in14(outR14), .in15(outR15), .sel(rt), .out(regRt));

    mux16to1_16bit muxRegRd(.in0(outR0), .in1(outR1), .in2(outR2), .in3(outR3), .in4(outR4), .in5(outR5), .in6(outR6),
                            .in7(outR7), .in8(outR8), .in9(outR9), .in10(outR10), .in11(outR11), .in12(outR12),
                            .in13(outR13), .in14(outR14), .in15(outR15), .sel(muxRdOut), .out(regRd));
endmodule