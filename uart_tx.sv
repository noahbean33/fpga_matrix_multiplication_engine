module uart_tx(
    input clk,
    input rst,
    input [7:0] data_in,
    input data_valid,
    output reg tx,
    output reg ready
);
    reg [3:0] bit_idx;
    reg [9:0] tx_shift_reg;
    reg [15:0] clk_div;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tx <= 1;
            ready <= 1;
            bit_idx <= 0;
        end else if (data_valid && ready) begin
            tx_shift_reg <= {1'b1, data_in, 1'b0};
            ready <= 0;
        end else begin
            clk_div <= clk_div + 1;
            if (clk_div == 434) begin
                clk_div <= 0;
                tx <= tx_shift_reg[bit_idx];
                if (bit_idx == 9) begin
                    bit_idx <= 0;
                    ready <= 1;
                end else begin
                    bit_idx <= bit_idx + 1;
                end
            end
        end
    end
endmodule
