module mux2to1_4bit(input [3:0] in0, input [3:0] in1, input sel, output reg [3:0] out);
    always @(in1, in2, sel)
    begin
        if (sel == 1'b0)
            out = in0;
        else
            out = in1;
    end
endmodule

module mux16to1_16bit(input [15:0] in0, input [15:0] in1, input [15:0] in2, input [15:0] in3, input [15:0] in4,
                        input [15:0] in5, input [15:0] in6, input [15:0] in7, input [15:0] in8, input [15:0] in9, input [15:0] in10,
                        input [15:0] in11, input [15:0] in12,input [15:0] in13, input [15:0] in14, input [15:0] in15, input [3:0] sel,
                        output reg [15:0] out);
    always @(in0, in1, in2, in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in 13, in14, in15, sel)
    begin
      case(sel)
        4'd0: out = in0;
        4'd1: out = in1;
        4'd2: out = in2;
        4'd3: out = in3;
        4'd4: out = in4;
        4'd5: out = in5;
        4'd6: out = in6;
        4'd7: out = in7;
        4'd8: out = in8;
        4'd9: out = in9;
        4'd10: out = in10;
        4'd11: out = in11;
        4'd12: out = in12;
        4'd13: out = in13;
        4'd14: out = in14;
        4'd15: out = in15;
      endcase
    end
endmodule