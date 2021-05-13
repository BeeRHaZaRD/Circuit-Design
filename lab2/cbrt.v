`timescale 1ns / 1ps

module cbrt(
    
    input clk_i,
    input rst_i,
    
    input [7:0] x_bi,
    input start_i,
    
    output busy_o,
    output reg[2:0] res
    );
    
    reg [7:0] arg;
    wire mult_busy;
    reg[7:0] mult_a;
    reg[7:0] mult_b;
    wire [15:0] mult_out;
    reg [7:0] b, S;
    reg [4:0] state;
    reg mult_start;
    reg[2:0] y;
    
    localparam IDLE = 0;
    localparam WORK1 = 1;
    localparam WORK2 = 2;
    localparam WORK3 = 3;
    localparam WORK4 = 4;
    localparam WORK5 = 5;
    localparam WORK6 = 6;
        
    mult mult1(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .a_bi(mult_a),
        .b_bi(mult_b),
        .start_i(mult_start),
        .busy_o(mult_busy),
        .y_bo(mult_out)
    );
    
    assign busy_o = state > 0;
    
    always @(posedge clk_i)
        if (rst_i) begin
            res <= 0;
            arg <= 0;
            state <= IDLE;
        end else begin
            case (state)
                IDLE:
                    begin
                        if (start_i) begin
                            arg <= x_bi;
                            S <= 6;
                            b <= 0;
                            y <= 0;
                            state <= WORK1;
                        end
                    end
                WORK1:
                    begin
                        if ( S > 253 || S < 7) begin
                            y <= y << 1;
                            state <= WORK2;
                        end else begin
                            res <= y;
                            state <= IDLE;
                        end
                    end
                WORK2:
                    begin
                        mult_a <= y;
                        mult_b <= y + 1;
                        mult_start <= 1;
                        state <= WORK3;
                    end
                WORK3:
                    begin
                        if (mult_busy == 0 && mult_start == 0) begin
                            mult_a <= 3;
                            mult_b <= mult_out;
                            mult_start <= 1;
                            state <= WORK4;
                        end else begin
                            mult_start <= 0;
                        end
                    end
                WORK4:
                    begin
                        if (mult_busy == 0 && mult_start == 0) begin
                            b <= mult_out + 1;
                            state <= WORK5;
                        end else begin
                            mult_start <= 0;
                        end
                    end
                WORK5:
                    begin
                        b <= b << S;
                        state <= WORK6;
                    end
                WORK6:
                    begin
                        if (arg >= b) begin
                            arg <= arg - b;
                            y <= y + 1;
                        end
                        S = S - 3;
                        state <= WORK1;
                    end
            endcase
        end
endmodule
