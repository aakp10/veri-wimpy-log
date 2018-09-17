module decoder4to16(input [3:0] regDest, output reg [15:0] decOut);
    always@(regDest)
    begin
      case(regDest)
        4'd0:   decOut = 32'd1;
        4'd1:   decOut = 32'd1<<1;
        4'd2:   decOut = 32'd1<<2;
        4'd3:   decOut = 32'd1<<3;
        4'd4:   decOut = 32'd1<<4;
        4'd5:   decOut = 32'd1<<5;
        4'd6:   decOut = 32'd1<<6;
        4'd7:   decOut = 32'd1<<7;
        4'd8:   decOut = 32'd1<<8;
        4'd9:   decOut = 32'd1<<9;
        4'd10:  decOut = 32'd1<<10;
        4'd11:  decOut = 32'd1<<11;
        4'd12:  decOut = 32'd1<<12;
        4'd13:  decOut = 32'd1<<13;
        4'd14:  decOut = 32'd1<<14;
        4'd15:  decOut = 32'd1<<15;
      endcase
    end
endmodule