module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
	
    reg [31:0] intermediate;
    
    always @(posedge clk) begin
       intermediate <= in; 
    end
    
    always @(posedge clk) begin
        if(reset)begin
           out <= 0;
        end else begin
           out <= out | intermediate&~in;
        end
    end
    
endmodule