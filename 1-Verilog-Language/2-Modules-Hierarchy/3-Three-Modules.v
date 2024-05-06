module top_module ( input clk, input d, output q );
	
    wire w1, w2;
    
    my_dff dff1( clk, d, w1 );
    my_dff dff2( clk, w1, w2 );
    my_dff dff3( clk, w2, q );
    
endmodule