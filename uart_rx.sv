module uart_rx(
    input clk,
    input rst,
    input rx,
    output reg [7:0] data_out,
    output reg data_valid
);
    reg [3:0] bit_idx;
    reg [9:0] rx_shift_reg;
    reg [15:0] clk_div;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_idx <= 0;
            data_valid <= 0;
        end else begin
            clk_div <= clk_div + 1;
            if (clk_div == 434) begin // 100MHz / 115200 baud rate
                clk_div <= 0;
                rx_shift_reg <= {rx, rx_shift_reg[9:1]};
                if (bit_idx == 9) begin
                    data_out <= rx_shift_reg[8:1];
                    data_valid <= 1;
                    bit_idx <= 0;
                end else begin
                    bit_idx <= bit_idx + 1;
                    data_valid <= 0;
                end
            end
        end
    end
endmodule
