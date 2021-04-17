module majority(a, b, c, out) ;
    input a, b, c ;
    output out ;
    wire out ;
    assign out = (a & b)|(a & c)|(b & c) ;
endmodule
