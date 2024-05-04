module FA( 
    input a, b, cin,
    output cout, sum );
    
    assign sum = a ^ b ^ cin;
    assign cout = a&b | cin&b | cin&a;

endmodule

module top_module( 
    input [99:0] a, b,
    input cin,
    output cout,
    output [99:0] sum );
    
    FA FA0(.a(a[0]), .b(b[0]), .cin(cin), .cout(cout_vec[0]), .sum(sum[0])); 
    
    wire [99:0] cout_vec;
    genvar i;
    
    generate
        for(i = 1; i < 100; i = i+1) begin : fa_block
            FA FAi(.a(a[i]), .b(b[i]), .cin(cout_vec[i-1]), .cout(cout_vec[i]), .sum(sum[i])); 
        end
    endgenerate
    
    assign cout = cout_vec[99];
    
endmodule