module top_module(
    input clk,
    input reset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
		next_state = ~state&j | state&~k;
    end

    always @(posedge clk) begin
        // State flip-flops with asynchronous reset
        if(reset) begin
            state <= OFF;
        end else begin
            state <= next_state;
        end
    end

    // Output logic
    // assign out = (state == ...);
    assign out = state;

endmodule