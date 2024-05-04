module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset) begin
            q <= 1;
        end else begin
            if(q == 4'ha) begin
                q <= 1;
            end else begin
                q <= q + 4'h1;
            end
        end
    end

endmodule