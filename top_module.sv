module top_module(
    input clk,
    input rst,
    input rx,
    output tx
);
    wire [7:0] rx_data;
    wire rx_valid;
    wire [7:0] tx_data;
    wire tx_ready;
    reg start_mult;
    reg [31:0] bram_a [0:65535];
    reg [31:0] bram_b [0:65535];
    reg [31:0] bram_c [0:65535];
    uart_rx uart_receiver(.clk(clk), .rst(rst), .rx(rx), .data_out(rx_data), .data_valid(rx_valid));
    uart_tx uart_transmitter(.clk(clk), .rst(rst), .data_in(tx_data), .data_valid(tx_ready), .tx(tx));
    matrix_mult_4core mult_core(.clk(clk), .rst(rst), .start(start_mult), .done(), .bram_data_a(), .bram_data_b(), .bram_data_c());
    // Control logic to handle data reception, computation, and transmission
endmodule
