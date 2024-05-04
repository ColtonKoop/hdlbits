module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        case({state, j,k}) 
            3'b000: next_state = OFF;
            3'b001: next_state = OFF;
            3'b010: next_state = ON;
            3'b011: next_state = ON;
            3'b100: next_state = ON;
            3'b101: next_state = OFF;
            3'b110: next_state = ON;
            3'b111: next_state = OFF;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    // Output logic
    // assign out = (state == ...);
    assign out = state;

endmodule