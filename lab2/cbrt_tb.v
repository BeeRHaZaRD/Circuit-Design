`timescale 1ns / 1ps

module cbrt_tb;

reg clk, rst;
reg [7:0] in;
wire busy;
wire [2:0] out;

cbrt cbrt_test(
    .clk_i(clk),
    .rst_i(rst),
    .a_bi(in),
    .busy_o(busy),
    .y_bo(out)
);

initial begin
    clk = 1;
    forever
        #10
        clk = ~clk;
end

initial begin
    in <= 8;
    rst <= 0;
end

always @(posedge clk) begin
    if (rst) begin
        rst = 0;
    end
    
    if (!busy) begin
        $display("Output: 0x%h", out);
        
        if (!rst) begin
            rst <= 1;
        end
    end
end
    

endmodule
