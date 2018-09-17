module registerFile_tb;
    reg clk, reset, regWrite, select;
    reg [15:0] WriteData;
    reg [3:0] rs, rd1, rd2, rt;
    wire [15:0] regRs, regrt, regRd;

    registerFile regfile(.clk(clk), .reset(reset), .regWrite(regWite), .WriteData(WriteData), .rs(rs),
                            .rd1(rd1), .rd2(rd2), .rt(rt), .select(select), .regRs(regRs), .regRt(regRt), .regRd(regRd));
    always
    begin
      #5 clk = ~clk;
    end

    initial
    begin
      clk = 0; reset = 1; rs = 4'd0; rt = 4'd1; rd1 = 4'd10; rd2 = 4'd2;
      #5 reset = 0; select = 1; regWrite = 1; rd1 = 4'd1; WriteData = 16'b1;
      repeat(4)
      begin
        #10 rd1 = rd1 + 4'd2; WriteData = WriteData + 16'd2;
      end
      #10 select = 0;rd2 = 4'd2; WriteData = 16'd2;
      repeat(4)
      begin
        #10 rd2 = rd2 + 4'd2; WriteData = WriteData + 16'b2;
      end
      #10 regWrite = 0; select = 1; rs = 4'd0; rd1 = 4'd1; rd2 = 4'd3; rt = 4'd2;
      #10 $finsih;
    end
endmodule
