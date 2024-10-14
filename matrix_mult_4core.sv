module matrix_mult_4core(
    input clk,
    input rst,
    input start,
    output reg done,
    // BRAM interfaces for matrices A, B, and result C
    output reg [15:0] bram_addr,
    inout [31:0] bram_data_a,
    inout [31:0] bram_data_b,
    inout [31:0] bram_data_c
);
    // Divide the computation among 4 cores
    reg [1:0] core_select;
    reg [7:0] row, col;
    reg [31:0] sum [0:3];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            done <= 0;
            row <= 0;
            col <= 0;
            core_select <= 0;
        end else if (start) begin
            // Simplified multiplication loop
            for (row = 0; row < 128; row = row + 1) begin
                for (col = 0; col < 128; col = col + 1) begin
                    sum[core_select] <= bram_data_a * bram_data_b;
                    bram_data_c <= sum[core_select];
                    core_select <= core_select + 1;
                end
            end
            done <= 1;
        end
    end
endmodule
