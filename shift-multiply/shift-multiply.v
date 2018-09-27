module shiftD_ff(input clk, input load, input shift_d, input load_d, output reg q);
    always @(negedge clk)
    begin
        if(load == 1'b1)
            q = load_d;
        else
            q = shift_d;
    end
endmodule

module rShiftReg(input clk, input load, input [3:0] multiplier, input [3:0] adderOut, output reg [8:0] Q);
    shiftD_ff q0(.clk(clk), .load(load), .shift_d(Q[1]), .load_d(1'b0), .q(Q[0]));
    shiftD_ff q1(.clk(clk), .load(load), .shift_d(Q[2]), .load_d(multiplier[0]), .q(Q[1]));
    shiftD_ff q2(.clk(clk), .load(load), .shift_d(Q[3]), .load_d(multiplier[1]), .q(Q[2]));
    shiftD_ff q3(.clk(clk), .load(load), .shift_d(Q[4]), .load_d(multiplier[2]), .q(Q[3]));
    shiftD_ff q4(.clk(clk), .load(load), .shift_d(adderOut[0]), .load_d(multiplier[3]), .q(Q[4]));
    shiftD_ff q5(.clk(clk), .load(load), .shift_d(adderOut[1]), .load_d(1'b0), .q(Q[5]));
    shiftD_ff q6(.clk(clk), .load(load), .shift_d(adderOut[2]), .load_d(1'b0), .q(Q[6]));
    shiftD_ff q7(.clk(clk), .load(load), .shift_d(adderOut[3]), .load_d(1'b0), .q(Q[7]));
    shiftD_ff q8(.clk(clk), .load(load), .shift_d(adderOut[3]), .load_d(1'b0), .q(Q[8]));

endmodule

/*
module adder(input [3:0] multiplicand, input [3:0] A, input Q0, input Q1, output reg [3:0] adderOut);
    always @(multiplicand, A, Q0, Q1)
    begin
        if()
    end
endmodule
*/

module D_ff_cnt(input d, output reg q);
    always @(d)
    q = d;
endmodule

module counter(input clk, input load, output [2:0] cnt);
//why reg and could the - be done without this
//this will be used inside the always procedural block so it needs to be reg
// it's not a matter of fact of whether a wire or a reg can store the value.

    reg [2:0] d_in;
    D_ff_cnt d0(.d(d_in[0]), .q(cnt[0]));
    D_ff_cnt d1(.d(d_in[1]), .q(cnt[1]));
    D_ff_cnt d2(.d(d_in[2]), .q(cnt[2]));

    always@(negedge clk)
    begin
        if(load == 0)
            d_in = 3'b4;
        else
            d_in = d_in - 1;
    end
endmodule

module sext3to8(input [2:0] in3, output [7:0] out);
    always@(in3)
    out = {{5{in3[2]}},out};
endmodule

module ALU(input select, input [2:0] cnt, input [7:0] input1, input [7:0] input2, output reg[7:0] aluOut);
    always @(select, cnt, input1, input2)
    begin
        if(~cnt && select)
        begin
            aluOut = input1 + input2;
        end
        else if(~cnt & ~select)
        begin
            aluOut = input1 - input2;
        end
    end
endmodule