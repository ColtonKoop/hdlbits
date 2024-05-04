module top_module( 
    input [2:0] in,
    output [1:0] out );

    assign out = (in[2] & 1'b1) + (in[1] & 1'b1) + (in[0] & 1'b1);
    
endmodule