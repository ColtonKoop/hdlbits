module top_module (
    input clk,
    input slowena,
    input reset,      // Synchronous active-high reset
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset) begin
            q <= 0;
        end else begin
            if(q == 4'h9 & slowena) begin
                q <= 0;
            end else if (slowena) begin
                q <= q + 4'h1;
            end else begin
                q <= q;
            end
        end
    end

endmodule