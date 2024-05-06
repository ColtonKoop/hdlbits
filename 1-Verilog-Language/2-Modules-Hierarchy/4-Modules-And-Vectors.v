module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
	
    wire[7:0] w1, w2, w3;
    
    my_dff8 dff1( clk, d[7:0], w1[7:0] );
    my_dff8 dff2( clk, w1[7:0], w2[7:0] );
    my_dff8 dff3( clk, w2[7:0], w3[7:0] );
    
    always @(*) begin
        case(sel[1:0])
            2'b00: q[7:0] = d[7:0];
            2'b01: q[7:0] = w1[7:0];
            2'b10: q[7:0] = w2[7:0];
            2'b11: q[7:0] = w3[7:0];
        endcase
    end
    
endmodule