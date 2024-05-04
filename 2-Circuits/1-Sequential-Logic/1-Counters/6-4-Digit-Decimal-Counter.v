module count10 (
    input clk,
    input reset, // Synchronous active-high reset
    input en,
    output [3:0] q);
    
    always @(posedge clk) begin
        if(reset) begin
            q <= 0;
        end else if(en) begin
            if(q == 4'h9) begin
                q <= 0;
            end else begin
                q <= q + 4'h1;
            end
        end else begin
            q <= q;
        end
    end
    
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    wire [3:0] temp1, temp2, temp3, temp4;
    
    assign ena[1] = (temp1 == 4'h9);
    assign ena[2] = (temp1 == 4'h9) & (temp2 == 4'h9);
    assign ena[3] = (temp1 == 4'h9) & (temp2 == 4'h9) & (temp3 == 4'h9);
    assign q[3:0] = temp1;
    assign q[7:4] = temp2;
    assign q[11:8] = temp3;
    assign q[15:12] = temp4;
    
    count10 c1(clk, reset, 1'b1, temp1);
    count10 c2(clk, reset, ena[1], temp2);
    count10 c3(clk, reset, ena[2], temp3);
    count10 c4(clk, reset, ena[3], temp4);

endmodule