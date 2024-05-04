module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;
	
    assign next_state[0] = in;
    assign next_state[1] = ~in&state[0] | in&state[1]&~state[0];
    assign out = state[0]&state[1];

endmodule