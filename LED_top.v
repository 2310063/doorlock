`timescale 10ns/10ps
module LED_top();

reg clk_10hz_i;
reg rst_i;
reg led_sig_i;

wire [1 : 8] led_o

always@(*)
    #5 clk_10hz_i = ~clk_10hz_i;

initial begin
    rst_i <= 0;
    led_sig_i <= 0;
    #10 rst_i <= 1;
    #10 rst_i <= 0;
    #20 led_sig_i <= 1;
    #20 led_sig_i <= 2;
    #20 led_sig_i <= 3;
    #20 led_sig_i <= 1;
end

initial begin
    $monitor("LED : %d",led_o);
end

LED_intf LED_1(.clk_10hz_i(clk_10hz_i), .rst_i(rst_i), .led_sig_i(led_sig_i)
               .led_o(led_o)
              );

endmodule