// synthesis verilog_input_version verilog_2001
module top_module ( 
    input [2:0] sel, 
    input [3:0] data0,
    input [3:0] data1,
    input [3:0] data2,
    input [3:0] data3,
    input [3:0] data4,
    input [3:0] data5,
    output reg [3:0] out   );//

    always@(*) begin  // This is a combinational circuit
        case(sel[2:0])
            3'b000: out[3:0] = data0[3:0];
            3'b001: out[3:0] = data1[3:0];
            3'b010: out[3:0] = data2[3:0];
            3'b011: out[3:0] = data3[3:0];
            3'b100: out[3:0] = data4[3:0];
            3'b101: out[3:0] = data5[3:0];
            3'b110: out[3:0] = 3'b000;
            3'b111: out[3:0] = 3'b000;
        endcase
    end

endmodule