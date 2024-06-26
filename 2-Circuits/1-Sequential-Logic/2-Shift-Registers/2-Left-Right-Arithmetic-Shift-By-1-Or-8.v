module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    
    always @(posedge clk) begin
        if(load) begin
            q[63:0] <= data[63:0];
        end else begin
            if(ena) begin
                case(amount[1:0])
                    2'b00: q[63:0] <= {q[62:0],1'b0};
                    2'b01: q[63:0] <= {q[55:0], 8'b0};
                    2'b10: q[63:0] <= {q[63],q[63:1]};
                    2'b11: q[63:0] <= { { 8{q[63]} },q[63:8]};
                endcase
            end else begin
                q[63:0] <= q[63:0];
            end
        end
    end

endmodule