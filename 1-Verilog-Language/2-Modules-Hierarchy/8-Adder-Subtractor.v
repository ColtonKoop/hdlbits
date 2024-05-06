module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire cout;
    wire[31:0] w_b;
	
    assign w_b[31:0] = sub ? ~b+1 : b ;
    
    add16 add1( a[15:0], w_b[15:0], 1'b0, sum[15:0], cout );
    add16 add2( a[31:16], w_b[31:16], cout, sum[31:16]);

endmodule