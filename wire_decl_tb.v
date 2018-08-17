module top_module_tb;
    reg a,b,c,d;
    wire out,out_n;
    top_module TP1(out,out_n,a,b,c,d);
    initial
        begin
          $dumpfile("test.vcd");
          $dumpvars(0,a,b,c,d,out,out_n);

          a = 0; b = 0;c = 0;d =0;
          #10 a = 1; b =1 ;
          #10 c = 1; d =0;
          #10 $finish;
        end
    initial
        $monitor("Time= %t a= %h, b=%h,c=%h,out=%h,out_n=%h", $time, a, b, c, d, out, out_n);

endmodule