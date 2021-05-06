`timescale 1ns / 1ps

module cbrt (
	input clk_i,
	input rst_i ,
	input [7:0] a_bi,
	output busy_o,
	output reg [3:0] y_bo
);

	localparam IDLE = 0;
	localparam WORK = 1;

    reg [7:0] a;
    reg [3:0] res;
    reg state;
    
	assign busy_o = rst_i | state;

    always @(posedge clk_i) begin
        if (rst_i) begin
            a <= a_bi;
            y_bo <= 0;
            state <= WORK;
        end else begin
	        case (state)
	           IDLE:
                   begin
                       y_bo <= res;
                   end
               WORK:
                   begin
                       if (a == 0) begin
                           res <= 0;
                       end else if (a >= 0 && a < 8) begin
                           res <= 1;
                       end else if (a >= 8 && a < 27) begin
                           res <= 2;
                       end else if (a >= 27 && a < 64) begin
                           res <= 3;
                       end else if (a >= 64 && a < 125) begin
                           res <= 4;
                       end else if (a >= 125 && a < 215) begin
                           res <= 5;
                       end else begin
                           res <= 6;
                       end
                       state <= IDLE;
                   end
	        endcase
        end
    end
endmodule
