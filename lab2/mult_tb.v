`timescale 1ns / 1ps

module mult_tb;

reg clk, rst, start;
reg [7:0] a, b;
wire busy;
wire [15:0] y;
integer i;

mult mult_test(
    .clk_i(clk),
    .rst_i(rst),
    .start_i(start),
    .a_bi(a),
    .b_bi(b),
    .busy_o(busy),
    .y_bo(y)
);

initial begin
    clk = 1;
    forever
        #10
        clk = ~clk;
end

always @(posedge clk) begin
    rst <= 0;
    a <= 5;
    b <= 3;
    start <= 1;
    
    $display("5 * 3 = %b", y);
    
end



endmodule