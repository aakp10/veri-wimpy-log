//This module is used for creating register
module D_ff( input clk, input reset, input d, output reg q );
	 always @ (negedge clk)
		begin
			if(reset==1)
				q=0;
			else
				q=d;
		end
endmodule

//Module stores 8bit input (numberIn) in 8 - D_ffs. ( 1 sign bit, 3 exponent bits and 4 fraction bits)
module register8bit( input clk, input reset, input [7:0] numberIn, output [7:0] numberOut  );
	D_ff ff0(clk,reset,numberIn[0],numberOut[0]);
	D_ff ff1(.clk(clk), .reset(reset), .d(numberIn[1]), .q(numberOut[1]));
	D_ff ff2(.clk(clk), .reset(reset), .d(numberIn[2]), .q(numberOut[2]));
	D_ff ff3(.clk(clk), .reset(reset), .d(numberIn[3]), .q(numberOut[3]));
	D_ff ff4(.clk(clk), .reset(reset), .d(numberIn[4]), .q(numberOut[4]));
	D_ff ff5(.clk(clk), .reset(reset), .d(numberIn[5]), .q(numberOut[5]));
	D_ff ff6(.clk(clk), .reset(reset), .d(numberIn[6]), .q(numberOut[6]));
	D_ff ff7(.clk(clk), .reset(reset), .d(numberIn[7]), .q(numberOut[7]));
endmodule

//Module finds the signed difference (diffExpo  = number1OutExpo- number2OutExpo) between two exponents.
module signDiffExpo( input [2:0] number1OutExpo, input [2:0] number2OutExpo, output reg[3:0] diffExpo);
	always @(number1OutExpo, number2OutExpo)
	begin
		diffExpo = number1OutExpo - number2OutExpo;
	end
endmodule

//Module finds the absolute value (2's complement if the number is negative) - absDiff and the sign (diffExpo[3]) of diffExpo.
module signToUnsign4b( input [3:0] diffExpo, output reg sign, output reg [2:0] absDiff);
	reg [3:0] complement2;
	always @(diffExpo)
	begin
	sign = diffExpo[3];
		if(diffExpo[3]==1)
		begin
			complement2 = (~diffExpo)+1'b1;
		end
		else
		begin
			complement2 =  diffExpo;
		end
		
		absDiff = complement2[2:0];
	end
endmodule

//Module selects the 6 bit operand in1 as output Op if selOp is 0 otherwise it selects  6 bit operand in2 as output.
module muxInputFrac(input [5:0] in1, input [5:0] in2, input selOp, output reg [5:0] Op);
	always @(in1, in2, selOp)
	begin
		if(selOp==0)
		begin
			Op=in1;
		end
		else
		begin
			Op=in2;
		end
	end
endmodule

//Module selects  input s1 as output resultSign if selSign is 0 otherwise it selects  input s2 as resultSign.
module muxSign( input s1, input s2, input selSign, output reg resultSign);
	always @(s1, s2, selSign)
	begin
		if(selSign == 0)
		begin
			resultSign = s1;
		end
		else
		begin
			resultSign = s2;
		end
	end

endmodule

//Module selects  input numberOut1Expo as output resultExpo if selSign is 0 otherwise it selects  input numberOut2Expo as resultExpo.
module muxGreaterExpo( input [2:0] numberOut1Expo, input [2:0] numberOut2Expo, input sign, output reg[2:0] resultExpo );
	always @(numberOut1Expo, numberOut2Expo, sign)
	begin
		if(sign == 0)
			begin
				resultExpo = numberOut1Expo;
			end
		else
			begin
				resultExpo = numberOut2Expo;
			end
	end
endmodule

//Based on input sign this module converts unsigned input in6bUnsigned to signed 2's complement form output out7bSigned
module unsignToSign6b( input [5:0] in6bUnsigned, input sign, output reg [6:0] out7bSigned );

	always @(in6bUnsigned, sign)
	begin
		if(sign == 1)
			begin
				out7bSigned = ~({2'b00,in6bUnsigned[4:0]})+ 1'b1;
			end
		else
			begin
				out7bSigned = {1'b0, in6bUnsigned[5:0]};
			end
	end
	
endmodule

//Operand1(tempOp) is shifted to right by absDiff .
module shiftRightOp1( input [5:0] tempOp, input [2:0] absDiff, output reg [5:0] shiftOp );
		always @(tempOp, absDiff)
		begin
			shiftOp = tempOp>>>absDiff;
		end
endmodule

//Module finds signed addition (ALUout=ALUin1 + ALUin2) of ALUin1 and ALUin2.
module bigALU( input [6:0] ALUin1, input [6:0] ALUin2, output reg [6:0] ALUout);
		always @(ALUin1, ALUin2)
		begin
			ALUout = ALUin1 + ALUin2;
		end
endmodule

//Based on input ALUop, this module finds the sign bit sign and six bits fraction resultFraction6bits
module signToUnsign7b( input [6:0] ALUop, output reg sign, output reg [5:0] resultFraction6bits );
	reg [6:0] complement2;
	always @(ALUop)
	begin
		sign = ALUop[6];
		if(sign == 1)
		begin
			complement2 = ~(ALUop) + 1'b1;
			resultFraction6bits = complement2[5:0];
		end
		else
			begin
				resultFraction6bits = ALUop[5:0];
			end
	end
endmodule

//Module adds 2 floating point numbers represented using 8-bits. It finds 1 bit sign as ResultSign1bit, 3 bits exponent as ResultExponent3bits and 6 bits fraction (not a normalized fraction) as ResultFraction6bits of the resultant value.
module floatingPointAdder( input [7:0] in1, input [7:0] in2, input clk, input reset, output resultSign1bit, output [2:0]resultExponet3bits, output [5:0]resultFraction6bits );

	wire [7:0] out1, out2;
	wire [3:0] expDiffOut;
	//reg afterExpDiffSign;
	wire afterExpDiffSign;
	//reg [2:0] expAbsDiff;
	wire [2:0] expAbsDiff;
	register8bit reg8bit1(clk, reset, in1, out1);
	register8bit reg8bit2(.clk(clk), .reset(reset), .numberIn(in2), .numberOut(out2));
	
	signDiffExpo s_diff_expo1(.number1OutExpo(out1[6:4]), .number2OutExpo(out2[6:4]), .diffExpo(expDiffOut));
	signToUnsign4b sToU4b( .diffExpo(expDiffOut), .sign(afterExpDiffSign), .absDiff(expAbsDiff));
	
	//muxSign muxFinalSignSel( .s1(out1[7]), .s2(out2[7]), .selSign(afterExpDiffSign), .resultSign(resultSignlbit));
	
	muxGreaterExpo muxGexpo( .numberOut1Expo(out1[6:4]), .numberOut2Expo(out2[6:4]), .sign(afterExpDiffSign), .resultExpo(resultExponet3bits));
	
	wire [5:0] frac1_conc, frac2_conc;
	//reg [5:0] fracToShiftRight, fracToNotShift;
	wire [5:0] fracToShiftRight, fracToNotShift;
	assign frac1_conc = {2'b01,out1[3:0]};
	assign frac2_conc = {2'b01,out2[3:0]};
	muxInputFrac muxFracToShiftRight(.in1(frac2_conc), .in2(frac1_conc), .selOp(afterExpDiffSign), .Op(fracToShiftRight));
	muxInputFrac muxFracToNotShift(.in1(frac1_conc), .in2(frac2_conc), .selOp(afterExpDiffSign), .Op(fracToNotShift));
	
	//reg [5:0] afterShiftFrac;
	wire [5:0] afterShiftFrac;
	shiftRightOp1 shiftRight(.tempOp(fracToShiftRight), .absDiff(expAbsDiff), .shiftOp(afterShiftFrac));
	
	wire signForFrac1, signForFrac2;
	muxSign muxSignRightShiftedFrac( .s1(out2[7]), .s2(out1[7]), .selSign(afterExpDiffSign), .resultSign(signForFrac1));
	muxSign muxSignNonShiftedFrac( .s1(out1[7]), .s2(out2[7]), .selSign(afterExpDiffSign), .resultSign(signForFrac2));
	
	//reg [6:0] frac1Signed, frac2Signed;
	wire [6:0] frac1Signed, frac2Signed;
	unsignToSign6b ShiftedFracSign( .in6bUnsigned(afterShiftFrac), .sign(signForFrac1), .out7bSigned(frac1Signed));
	unsignToSign6b NonShiftedFracSign( .in6bUnsigned(fracToNotShift), .sign(signForFrac2), .out7bSigned(frac2Signed));
	
	//reg [6:0] ALUout;
	wire [6:0] ALUout;
	bigALU ALU1( .ALUin1(frac1Signed), .ALUin2(frac2Signed), .ALUout(ALUout));
	
	signToUnsign7b ALUSignResult(.ALUop(ALUout), .sign(resultSign1bit), .resultFraction6bits(resultFraction6bits));
	

endmodule

module testfloatingPointAdder();
	 //inputs
	 reg [7:0] in1,in2;
	 reg clk;
	 reg reset;
	 //output
	 wire ResultSign1bit;
	 wire [2:0]ResultExponet3bits;
	 wire [5:0]ResultFraction6bits;
	 floatingPointAdder FPA( in1,in2,clk,reset, ResultSign1bit,ResultExponet3bits,ResultFraction6bits);

	always 
	#10 clk=~clk;
	
	initial begin
	//Initialize Inputs
	in1 = 0;
	in2 = 0;
	clk = 0;
	reset = 1;

	$monitor($time," %d %d %d ",ResultSign1bit,ResultExponet3bits,ResultFraction6bits);
	#20	reset = 0;
			in1=8'b0_101_0010; in2=8'b0_100_0010; 
			//4.5+2.25 ResultSign1bit =0, ResultExponent3bits =101, ResultFraction6bits = 011011
	#20	in1=8'b1_101_0010; in2=8'b0_100_0010;
			//-4.5+2.25 ResultSign1bit =1, ResultExponent3bits =101, ResultFraction6bits = 001001
	#20	in1=8'b0_101_0010; in2=8'b1_100_0010;
			//4.5-2.25 ResultSign1bit =0, ResultExponent3bits =101, ResultFraction6bits = 001001
	#20	in1=8'b1_101_0010; in2=8'b1_100_0010;
			//-4.5-2.25 ResultSign1bit =1, ResultExponent3bits =101, ResultFraction6bits = 011011
	#20	in1=8'b1_100_0010; in2=8'b1_101_0010;
			//-2.25-4.5 ResultSign1bit =1, ResultExponent3bits =101, ResultFraction6bits = 011011	
	#20 $finish;
	end
endmodule
