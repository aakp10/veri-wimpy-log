module dff(input clk, input reset, input set, output reg q);
	initial
	begin
		q = 1'b0;
	end
	always @ (negedge clk)
	begin
		if (reset == 1'b1)
		begin
			q = 1'b0;
		end
		else if (set == 1'b1)
		begin
			q = 1'b1;
		end
	end
endmodule

module decoder3to8(input [2:0] select, output reg [7:0] decOut);
	always @ (select)
	begin
		case (select)
			3'b000: decOut = 8'b00000001;
			3'b001: decOut = 8'b00000010;
			3'b010: decOut = 8'b00000100;
			3'b011: decOut = 8'b00001000;
			3'b100: decOut = 8'b00010000;
			3'b101: decOut = 8'b00100000;
			3'b110: decOut = 8'b01000000;
			3'b111: decOut = 8'b10000000;
		endcase
	end
endmodule

module mux2to1(input [2:0] in0, input [2:0] in1, input select, output reg [2:0] muxOut);
	always @ (in0, in1, select)
	begin
		case (select)
			1'b0: muxOut = in0;
			1'b1: muxOut = in1;
		endcase
	end
endmodule

module nxn_dffs(input clk, input reset, input [7:0] decOut, output [7:0] nxn_dffOut);
	//   
	wire w0,w1,w2,w3,w4,w5,w6,w7;
	assign w0 = reset | decOut[0];
	assign w1 = reset | decOut[1];
	assign w2 = reset | decOut[2];
	assign w3 = reset | decOut[3];
	assign w4 = reset | decOut[4];
	assign w5 = reset | decOut[5];
	assign w6 = reset | decOut[6];
	assign w7 = reset | decOut[7];
	wire q00, q01, q02, q03, q04, q05, q06, q07;
	wire q10, q11, q12, q13, q14, q15, q16, q17;
	wire q20, q21, q22, q23, q24, q25, q26, q27;
	wire q30, q31, q32, q33, q34, q35, q36, q37;
	wire q40, q41, q42, q43, q44, q45, q46, q47;
	wire q50, q51, q52, q53, q54, q55, q56, q57;
	wire q60, q61, q62, q63, q64, q65, q66, q67;
	wire q70, q71, q72, q73, q74, q75, q76, q77;
	
	
	dff dff00(.clk(clk), .reset(w0), .set(decOut[0]), .q(q00));
	dff dff01(.clk(clk), .reset(w1), .set(decOut[0]), .q(q01));
	dff dff02(.clk(clk), .reset(w2), .set(decOut[0]), .q(q02));
	dff dff03(.clk(clk), .reset(w3), .set(decOut[0]), .q(q03));
	dff dff04(.clk(clk), .reset(w4), .set(decOut[0]), .q(q04));
	dff dff05(.clk(clk), .reset(w5), .set(decOut[0]), .q(q05));
	dff dff06(.clk(clk), .reset(w6), .set(decOut[0]), .q(q06));
	dff dff07(.clk(clk), .reset(w7), .set(decOut[0]), .q(q07));
	
	dff dff10(.clk(clk), .reset(w0), .set(decOut[1]), .q(q10));
	dff dff11(.clk(clk), .reset(w1), .set(decOut[1]), .q(q11));
	dff dff12(.clk(clk), .reset(w2), .set(decOut[1]), .q(q12));
	dff dff13(.clk(clk), .reset(w3), .set(decOut[1]), .q(q13));
	dff dff14(.clk(clk), .reset(w4), .set(decOut[1]), .q(q14));
	dff dff15(.clk(clk), .reset(w5), .set(decOut[1]), .q(q15));
	dff dff16(.clk(clk), .reset(w6), .set(decOut[1]), .q(q16));
	dff dff17(.clk(clk), .reset(w7), .set(decOut[1]), .q(q17));
	
	dff dff20(.clk(clk), .reset(w0), .set(decOut[2]), .q(q20));
	dff dff21(.clk(clk), .reset(w1), .set(decOut[2]), .q(q21));
	dff dff22(.clk(clk), .reset(w2), .set(decOut[2]), .q(q22));
	dff dff23(.clk(clk), .reset(w3), .set(decOut[2]), .q(q23));
	dff dff24(.clk(clk), .reset(w4), .set(decOut[2]), .q(q24));
	dff dff25(.clk(clk), .reset(w5), .set(decOut[2]), .q(q25));
	dff dff26(.clk(clk), .reset(w6), .set(decOut[2]), .q(q26));
	dff dff27(.clk(clk), .reset(w7), .set(decOut[2]), .q(q27));
	
	dff dff30(.clk(clk), .reset(w0), .set(decOut[3]), .q(q30));
	dff dff31(.clk(clk), .reset(w1), .set(decOut[3]), .q(q31));
	dff dff32(.clk(clk), .reset(w2), .set(decOut[3]), .q(q32));
	dff dff33(.clk(clk), .reset(w3), .set(decOut[3]), .q(q33));
	dff dff34(.clk(clk), .reset(w4), .set(decOut[3]), .q(q34));
	dff dff35(.clk(clk), .reset(w5), .set(decOut[3]), .q(q35));
	dff dff36(.clk(clk), .reset(w6), .set(decOut[3]), .q(q36));
	dff dff37(.clk(clk), .reset(w7), .set(decOut[3]), .q(q37));
	
	dff dff40(.clk(clk), .reset(w0), .set(decOut[4]), .q(q40));
	dff dff41(.clk(clk), .reset(w1), .set(decOut[4]), .q(q41));
	dff dff42(.clk(clk), .reset(w2), .set(decOut[4]), .q(q42));
	dff dff43(.clk(clk), .reset(w3), .set(decOut[4]), .q(q43));
	dff dff44(.clk(clk), .reset(w4), .set(decOut[4]), .q(q44));
	dff dff45(.clk(clk), .reset(w5), .set(decOut[4]), .q(q45));
	dff dff46(.clk(clk), .reset(w6), .set(decOut[4]), .q(q46));
	dff dff47(.clk(clk), .reset(w7), .set(decOut[4]), .q(q47));
	
	dff dff50(.clk(clk), .reset(w0), .set(decOut[5]), .q(q50));
	dff dff51(.clk(clk), .reset(w1), .set(decOut[5]), .q(q51));
	dff dff52(.clk(clk), .reset(w2), .set(decOut[5]), .q(q52));
	dff dff53(.clk(clk), .reset(w3), .set(decOut[5]), .q(q53));
	dff dff54(.clk(clk), .reset(w4), .set(decOut[5]), .q(q54));
	dff dff55(.clk(clk), .reset(w5), .set(decOut[5]), .q(q55));
	dff dff56(.clk(clk), .reset(w6), .set(decOut[5]), .q(q56));
	dff dff57(.clk(clk), .reset(w7), .set(decOut[5]), .q(q57));
	
	dff dff60(.clk(clk), .reset(w0), .set(decOut[6]), .q(q60));
	dff dff61(.clk(clk), .reset(w1), .set(decOut[6]), .q(q61));
	dff dff62(.clk(clk), .reset(w2), .set(decOut[6]), .q(q62));
	dff dff63(.clk(clk), .reset(w3), .set(decOut[6]), .q(q63));
	dff dff64(.clk(clk), .reset(w4), .set(decOut[6]), .q(q64));
	dff dff65(.clk(clk), .reset(w5), .set(decOut[6]), .q(q65));
	dff dff66(.clk(clk), .reset(w6), .set(decOut[6]), .q(q66));
	dff dff67(.clk(clk), .reset(w7), .set(decOut[6]), .q(q67));
	
	dff dff70(.clk(clk), .reset(w0), .set(decOut[7]), .q(q70));
	dff dff71(.clk(clk), .reset(w1), .set(decOut[7]), .q(q71));
	dff dff72(.clk(clk), .reset(w2), .set(decOut[7]), .q(q72));
	dff dff73(.clk(clk), .reset(w3), .set(decOut[7]), .q(q73));
	dff dff74(.clk(clk), .reset(w4), .set(decOut[7]), .q(q74));
	dff dff75(.clk(clk), .reset(w5), .set(decOut[7]), .q(q75));
	dff dff76(.clk(clk), .reset(w6), .set(decOut[7]), .q(q76));
	dff dff77(.clk(clk), .reset(w7), .set(decOut[7]), .q(q77));
	
	assign nxn_dffOut[0] = q00 | q01 | q02 | q03 | q04 | q05 | q06 | q07;
	assign nxn_dffOut[1] = q10 | q11 | q12 | q13 | q14 | q15 | q16 | q17;
	assign nxn_dffOut[2] = q20 | q21 | q22 | q23 | q24 | q25 | q26 | q27;
	assign nxn_dffOut[3] = q30 | q31 | q32 | q33 | q34 | q35 | q36 | q37;
	assign nxn_dffOut[4] = q40 | q41 | q42 | q43 | q44 | q45 | q46 | q47;
	assign nxn_dffOut[5] = q50 | q51 | q52 | q53 | q54 | q55 | q56 | q57;
	assign nxn_dffOut[6] = q60 | q61 | q62 | q63 | q64 | q65 | q66 | q67;
	assign nxn_dffOut[7] = q70 | q71 | q72 | q73 | q74 | q75 | q76 | q77;
	
endmodule

module priority_encoder(input reset, input [7:0] in, output reg [2:0] lruWay);
	//   
	always @(reset, in)
	begin
		if(reset == 1)
			lruWay = 3'd0;
		else
		begin
			/*if(in[7] == 0)
				lruWay = 3'd7;
			else if(in[6] == 0)
				lruWay = 3'd6;
			else if(in[5] == 0)
				lruWay = 3'd;*/
			casex(in)
			8'bxxxxxxx0: lruWay = 3'd0;
			8'bxxxxxx0x: lruWay = 3'd1;
			8'bxxxxx0xx: lruWay = 3'd2;
			8'bxxxx0xxx: lruWay = 3'd3;
			8'bxxx0xxxx: lruWay = 3'd4;
			8'bxx0xxxxx: lruWay = 3'd5;
			8'bx0xxxxxx: lruWay = 3'd6;
			8'b0xxxxxxx: lruWay = 3'd7;
			endcase
		end
	end
endmodule

module lru(input clk, input reset, input hit, input [2:0] lineIndex, output [2:0] lruWay);
	//   
	
	wire [2:0] PEOut;
	wire [2:0] statusMuxOut;
	wire [7:0] PEIn;
	//mux
	mux2to1 statusMux(.in0(lruWay), .in1(lineIndex), .select(hit), .muxOut(statusMuxOut));

	
	//decoder
	wire [7:0] lineDecoderOut;
	decoder3to8 lineDecoder(.select(statusMuxOut), .decOut(lineDecoderOut));

	
	//nxn
	nxn_dffs LRUMatrix(.clk(clk), .reset(reset), .decOut(lineDecoderOut), .nxn_dffOut(PEIn));
	//pe
	priority_encoder PE(.reset(reset), .in(PEIn), .lruWay(lruWay));
	
endmodule

module testbench;
	reg clk;
	reg reset;
	reg hit;
	reg [2:0] lineIndex;
	wire [2:0] lruWay;
	lru lruTest (clk, reset, hit, lineIndex, lruWay);

	always
		#5 clk=~clk;
	initial
	begin
		clk = 0;
		reset = 1;
		hit = 0;
		lineIndex = 0;	
		
		#8 hit=1;
		#2 reset=0; lineIndex=3'd0;
		#10 lineIndex=3'd1;
		#10 lineIndex=3'd2;
		#10 lineIndex=3'd3;
		#10 lineIndex=3'd5;
		#10 lineIndex=3'd7;
		#10 lineIndex=3'd6;
		#10 lineIndex=3'd4;
		#10 hit=0; lineIndex=3'd1;
		#10 lineIndex=3'd0;
		#10 hit=1; lineIndex=3'd3;
		#10 hit=0; lineIndex=3'd2;
		#10 lineIndex=3'd4;
		#10 lineIndex=3'd7;
		#10 hit=1; lineIndex=3'd1;
		#10 lineIndex=3'd3;
		#10 lineIndex=3'd6;
		#10 hit=0; lineIndex=3'd2;
		#10 lineIndex=3'd5;
		#10 hit=1; lineIndex=3'd0;
		#10 hit=0; lineIndex=3'd2;
		#10 lineIndex=3'd4;
		#10 $finish;
	end
endmodule
