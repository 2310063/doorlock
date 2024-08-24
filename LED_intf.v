module LED_intf(input clk_10hz_i, input rst_i, input led_sig_i
                output [1 : 8] led_o)
reg [1 : 8] led;
integer i;

always@(posedge clk_10hz_i) begin

    if(led_sig_i == 0) begin            // when ENT_CODE
        led <= 8b'1111_1111;
    end

    else if(led_sig_i == 1) begin       // when open
        led[1] <= 0;
        for(i = 2; i < 8 ; i = i + 1) begin
            led[i] <= led[i - 1];
        end
    end

    else if(led_sig_i == 2) begin       // when set done
            led[1] <= 1;
            for(i = 2; i < 8 ; i = i + 1) begin
                led[i] <= led[i - 1];
            end
        end

    else begin
        led <= 8b'0000_0000;            // when set
    end
end
endmodule

// interface for number inputs