`timescale 1ns / 1ps

module main(

    input clk_i,
    input rst_i,

    input start_i,
    input [7:0] a_in,
    input [7:0] b_in,
    
    output busy_o,
    output [15:0] result
    );
    
    reg [7:0] a;
    reg [7:0] b;
    reg [2:0] state;
    reg cbrt_start;
    reg mult_start;
    wire mult_busy;
    wire cbrt_busy;
    wire [2:0] cbrt_result;
    wire [7:0] mult2_b;
    
    localparam IDLE = 1;
    localparam WORK1 = 2;
    localparam WORK2 = 3;
    
    assign busy_o = state > 1;
    assign mult2_b = cbrt_result;
    
    cbrt cbrt1(
        .clk_i(clk_i),
        .rst_i(rst_i),
        .x_bi(b),
        .start_i(cbrt_start),
        .busy_o(cbrt_busy),
        .res(cbrt_result)
    );
    
    mult mult2(clk_i, rst_i, a, mult2_b, mult_start, mult_busy, result);
    
    always @(posedge clk_i)
        if (rst_i) begin
            state <= IDLE;
        end else begin
            case(state)
                IDLE: begin
                    if (start_i) begin
                        a <= a_in;
                        b <= b_in;
                        cbrt_start <= 1;
                        state <= WORK1;
                    end
                end
                WORK1:
                    if (cbrt_busy == 0 && cbrt_start == 0) begin
                        cbrt_start <= 0;
                        mult_start <= 1;
                        state <= WORK2;
                    end else begin
                        cbrt_start  <= 0;
                    end
                WORK2:
                    if (mult_busy == 0 && mult_start == 0) begin
                        mult_start <= 0;
                        state <= IDLE;
                    end else begin
                        mult_start <= 0;
                    end
            endcase
        end
endmodule
