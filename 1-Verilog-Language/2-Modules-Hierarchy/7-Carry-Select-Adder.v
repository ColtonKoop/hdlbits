module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    
    wire w1;
    wire[15:0] w2, w3;

    add16 add1( a[15:0], b[15:0], 1'b0, sum[15:0], w1 );
    add16 add2( a[31:16], b[31:16], 1'b0, w2);
    add16 add3( a[31:16], b[31:16], 1'b1, w3);
    
    assign sum[31:16] = w1 ? w3 : w2 ;
    
endmodule