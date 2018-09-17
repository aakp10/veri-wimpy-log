module decoder4to16_tb;
    reg [3:0] regDest;
    wire [15:0] decOut;
    decoder4to16 decInstance(.regDest(regDest), .decOut(decOut));
    initial
    begin
        $dumpfile("decoder.vcd");
        $dumpvars(0, regDest, decOut);
        regDest = 4'b0;
        repeat(15)
        begin
            #10 regDest = regDest + 1'b1;
        end
        #170 $finish;
    end
endmodule