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

module RECIP(N, G, R, RESET, CLK);
   parameter PRECISION=64, BITS_FRACTION=32;

   input [PRECISION-1:0] N, G;
   output [PRECISION-1:0] R;

   wire [PRECISION-1:0] R_next;
   wire [PRECISION-1:0] two;
   reg [PRECISION-1:0] R;

   input CLK, RESET;


   wire [PRECISION-1:0] RN, TRN;

   assign two=2<<BITS_FRACTION;

   MULTIPLY #(PRECISION, BITS_FRACTION) mult1 ( .A(R), .B(N), .O(RN));
   ADD #(PRECISION, BITS_FRACTION) add1 ( .A(two), .B(RN), .O(TRN), .S(1'b1));
   MULTIPLY #(PRECISION, BITS_FRACTION) mult2 ( .A(TRN), .B(R), .O(R_next));
   
   always @(posedge CLK) begin
      if (RESET)
	R <= G;
      else
	R <= R_next;
   end

endmodule // reciprocate

