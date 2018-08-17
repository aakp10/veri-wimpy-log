module top_module(
    output wire [7:0] out_hi, out_lo,
    input wire [15:0] in);
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];
endmodule