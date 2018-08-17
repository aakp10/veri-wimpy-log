module top_module(output out, out_n,
                  input a, b, c, d);
    wire w1, w2;
    and (w1,a,b),
        (w2,c,d);
    or (out,w1,w2);
    assign out_n = ~out;
endmodule