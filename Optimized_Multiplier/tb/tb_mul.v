//`timescale 1ns

module tb_mul ();

   wire CLK_i;
   wire [31:0] DIN_i;
   wire [31:0] FP_Z_i;

   clk_gen CG(.CLK(CLK_i));

   data_maker SM(.CLK(CLK_i),
		 .DATA(DIN_i));

   FPmul UUT(.FP_A(DIN_i),
		 .FP_B(DIN_i),
	     .clk(CLK_i),
         .FP_Z(FP_Z_i));

   data_save DS(.CLK(CLK_i),
		.DIN(FP_Z_i));   

endmodule
