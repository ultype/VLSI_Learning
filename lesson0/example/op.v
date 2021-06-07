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

module MULTIPLY(A, B, O);
   parameter PRECISION=64, BITS_FRACTION=32;

   input [PRECISION-1:0] A, B;
   output [PRECISION-1:0] O;

   wire [2*PRECISION-1:0] AA, BB, OO;

   assign AA={{PRECISION{A[PRECISION-1]}},A};
   assign BB={{PRECISION{B[PRECISION-1]}},B};
   assign OO=AA*BB;
   assign O=OO[PRECISION+BITS_FRACTION-1:BITS_FRACTION];
endmodule // multiply

module ADD(A, B, O, S);
   parameter PRECISION=64, BITS_FRACTION=32;

   input S;
   input [PRECISION-1:0] A, B;
   output [PRECISION-1:0] O;

   assign O=S?(A-B):(A+B);
endmodule 




