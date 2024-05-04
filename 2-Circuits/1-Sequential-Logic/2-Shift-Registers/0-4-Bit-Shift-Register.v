module top_module(
    input clk,
    input areset,  // async active-high reset to zero
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q); 
    
    always @(posedge clk, posedge areset) begin
        if(areset) begin
            q[3:0] <= 4'b0;
        end else begin
            case({load, ena})
                2'b00: q[3:0] <= q[3:0];
                2'b01: q[3:0] <= q[3:0] >> 1;
                2'b10: q[3:0] <= data[3:0];
                2'b11: q[3:0] <= data[3:0];
            endcase  
            end
        end

endmodule