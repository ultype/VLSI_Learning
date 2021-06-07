module test_majority ;
    reg [2:0] count ;     // input - three bit counter
    wire out ;            // output of majority

    // instantiate the gate
    majority m(count[0],count[1],count[2],out) ;
    // generate all eight input patterns
    initial begin
        count = 3'b000 ;
        repeat (8) begin
            #100
            $display("in = %b, out = %b",count,out) ;
            count = count + 3'b001 ;
        end
    end
endmodule

