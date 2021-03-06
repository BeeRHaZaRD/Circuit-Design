`timescale 1ns / 1ps

module encoder_tb;
    
    reg[7:0] x;
    wire y1, y2, y3;
    
    encoder encoder_1(
        .x1(x[0]),
        .x2(x[1]),
        .x3(x[2]),
        .x4(x[3]),
        .x5(x[4]),
        .x6(x[5]),
        .x7(x[6]),
        .x8(x[7]),
        .y1(y1),
        .y2(y2),
        .y3(y3)
    );
    
    integer i = 0;
    initial begin
        for (i = 0; i < 8; i = i + 1) begin
            x = 2**i;
            
            #10
            
            $display("Input: 0x%0h Output: y3=%b, y2=%b, y1=%b",x, y3, y2, y1); 
            if (i == 0 && y3 == 0 && y2 == 0 && y1 == 0) begin
                $display("The encoder output for x1 = 1 is correct!");
            end 
            
            if (i == 1 && y3 == 0 && y2 == 0 && y1 == 1) begin
                $display("The encoder output for x2 = 1 is correct!");
            end
            
            if (i == 2 && y3 == 0 && y2 == 1 && y1 == 1) begin
                $display("The encoder output for x3 = 1 is correct!");
            end 
            
            if (i == 3 && y3 == 0 && y2 == 1 && y1 == 0) begin
                $display("The encoder output for x4 = 1 is correct!");
            end
            
            if (i == 4 && y3 == 1 && y2 == 1 && y1 == 0) begin
                $display("The encoder output for x5 = 1 is correct!");
            end
            
            if (i == 5 && y3 == 1 && y2 == 1 && y1 == 1) begin
                $display("The encoder output for x6 = 1 is correct!");
            end
            
            if (i == 6 && y3 == 1 && y2 == 0 && y1 == 1) begin
                $display("The encoder output for x7 = 1 is correct!");
            end
            
            if (i == 7 && y3 == 1 && y2 == 0 && y1 == 0) begin
                $display("The encoder output for x8 = 1 is correct!");
            end
        end
        x = 0;
        $stop;
    end
    
endmodule