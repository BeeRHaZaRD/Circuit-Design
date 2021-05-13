`timescale 1ns / 1ps

module main_tb;
    
    reg clk;
    reg reset;
    reg start;
    reg [7:0] a;
    reg [7:0] b;
    wire busy;
    wire [15:0] res;
    
    initial begin
        reset <= 1;
        a <= 2;
        b <= 9;
    end
    
    initial begin
        clk <= 1;
        forever
            #10 clk <= ~clk;
    end
    
    reg [15:0] expected;
    
    main main(
        .clk_i(clk),
        .rst_i(reset),
        .start_i(start),
        .busy_o(busy),
        .a_in(a),
        .b_in(b),
        .result(res)
    );
    
    always @(posedge clk) begin
        
        if (reset) begin
            expected <= 0;
            reset <= 0;
            start <= 1;
        end else if (!busy && start == 0) begin
            if (b == 0) begin
                expected <= 0;
            end else if (b < 8) begin
                expected <= 1 * a;
            end else if (b < 27) begin
                expected <= 2 * a;
            end else if (b < 64) begin
                expected <= 3 * a;
            end else if (b < 125) begin
                expected <= 4 * a;
            end else if (b < 216) begin
                expected <= 5 * a;
            end else if (b < 343) begin
                expected <= 6 * a;
            end
            #1
            $display("%d * cbrt(%d) = %d, expected = %d", a, b, res, expected);
            if (!reset) begin
                a <= a + 1;
                b <= b + 1;
                reset <= 1;
            end
        end else begin
            start <= 0;
        end
    end
endmodule
