module compare(input a,b,c,d,e,
               output [24:0] out);
wire [24:0] comp1 , comp2;
assign comp1 = {5{a,b,c,d,e}};
assign comp2 = {{5{a}}, {5{b}}, {5{c}}, {5{d}}, {5{e}}};
assign out = ~(comp2^comp1);
endmodule