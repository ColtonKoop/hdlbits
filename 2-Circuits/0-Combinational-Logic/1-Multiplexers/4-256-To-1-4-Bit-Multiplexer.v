module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );
	
    always @(*) begin
        out[3:0] = (in >> 4*sel) & 4'b1111;
    end
    
endmodule