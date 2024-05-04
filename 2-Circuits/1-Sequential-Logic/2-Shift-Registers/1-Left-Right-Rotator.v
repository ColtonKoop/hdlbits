module top_module(
    input clk,
    input load,
    input [1:0] ena,
    input [99:0] data,
    output reg [99:0] q); 

    always @(posedge clk) begin
        if(load) begin
            q[99:0] <= data[99:0];
        end else begin
            case(ena[1:0])
                2'b00, 2'b11: q[99:0] <= q[99:0];
                2'b01: q[99:0] <= {q[0], q[99:1]};
                2'b10: q[99:0] <= {q[98:0], q[99]};
            default:
                q[99:0] <= q[99:0];
            endcase 
        end
    end
    
endmodule