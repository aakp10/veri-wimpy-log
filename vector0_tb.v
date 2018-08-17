module vector0_tb;

    reg [2:0] vec;
    wire [2:0] outv;
    wire o2,o1,o0;
    top_module vec0(vec, outv, o2, o1, o0);
    initial
        begin
          $dumpfile("vec0.vcd");
          $dumpvars(0, vec, outv, o2, o1, o0);
          vec = 3'b000;
          repeat(7)
          #10 vec += 3'b001;
          #10 $finish;
        end
endmodule