module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //
	
    reg [3:0] temp1, temp2, temp3;
    
    assign c_enable[0] = 1'b1;
    assign c_enable[1] = (temp1 == 4'b1001) ? 1'b1 : 1'b0;
    assign c_enable[2] = (temp1 == 4'b1001 & temp2 == 4'b1001) ? 1'b1 : 1'b0;
    assign OneHertz = (temp1 == 4'b1001 & temp2 == 4'b1001 & temp3 == 4'b1001) ? 1'b1 : 1'b0;
    
    bcdcount counter0 (clk, reset, c_enable[0], temp1);
    bcdcount counter1 (clk, reset, c_enable[1], temp2);
    bcdcount counter2 (clk, reset, c_enable[2], temp3);

endmodule