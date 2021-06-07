/*
 * A small Verilog example to try out
 *  
 * Copyright 2020 James C. Hoe
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * "Software"), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 * 
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
 * OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

module top;
   reg 	      clk;
   reg 	      reset;

   reg [31:0] N_INT, N_FRAC; 
   reg [31:0] G_INT, G_FRAC;  // initial guess

   wire [31:0] I_INT, I_FRAC; // 1/N 


   initial clk = 0;
   
   always begin
     #5 clk = ~clk;
   end

   
   RECIP #(64,32) recip (.N({N_INT,N_FRAC}),
			 .G({G_INT,G_FRAC}),
			 .R({I_INT,I_FRAC}), 
			 .RESET(reset), 
			 .CLK(clk));

   always@(I_INT or I_FRAC) begin
      $display("%x.%x\n",I_INT,I_FRAC);
   end

   initial begin
      $dumpfile("Avlog.dmp");
      $dumpvars(0, top);

      $display("Start (3)^-1, initial guess 1/8\n");
      reset=1;
      N_INT=32'h00000003;
      N_FRAC=32'h00000000;
      G_INT=32'h00000000;
      G_FRAC=32'h20000000;
      #100;
      reset=0;
      #6000;

      $display("Start (3)^-1, initial guess 1/4\n");
      reset=1;
      N_INT=32'h00000003;
      N_FRAC=32'h00000000;
      G_INT=32'h00000000;
      G_FRAC=32'h40000000;
      #100;
      reset=0;
      #6000;

      $display("Start (3)^-1, initial guess 1/2\n");
      reset=1;
      N_INT=32'h00000003;
      N_FRAC=32'h00000000;
      G_INT=32'h00000000;
      G_FRAC=32'h80000000;
      #100;
      reset=0;
      #6000;

      $display("Start (1/3)^-1, initial guess 2\n");
      reset=1;
      N_INT=32'h00000000;
      N_FRAC=32'h55555555;
      G_INT=32'h00000002;
      G_FRAC=32'h00000000;
      #100;
      reset=0;
      #6000;

      $display("Start (1/3)^-1, initial guess 4\n");
      reset=1;
      N_INT=32'h00000000;
      N_FRAC=32'h55555555;
      G_INT=32'h00000004;
      G_FRAC=32'h00000000;
      #100;
      reset=0;
      #6000;

      $display("Start (7)^-1, initial guess 1/16\n");
      reset=1;
      N_INT=32'h00000007;
      N_FRAC=32'h00000000;
      G_INT=32'h00000000;
      G_FRAC=32'h10000000;
      #100;
      reset=0;
      #6000;

      $display("Start (-3)^-1, initial guess -1/4\n");
      reset=1;
      N_INT=32'hfffffffd;
      N_FRAC=32'h00000000;
      G_INT=32'hffffffff;
      G_FRAC=32'hc0000000;
      #100;
      reset=0;
      #6000;

      $display("Start (-1/3)^-1, initial guess -2\n");
      reset=1;
      N_INT=32'hffffffff;
      N_FRAC=32'haaaaaaaa;
      G_INT=32'hfffffffe;
      G_FRAC=32'h00000000;
      #100;
      reset=0;
      #6000;

      $finish;
   end
   
endmodule


