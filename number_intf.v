module number_intf(input      [11 : 0] sw_sig_i, input              clk_i, input rst_i
                   output reg [ 1 : 0] mode_o,   output reg [3 : 0] num_o
                  )

always@(posedge clk_i) begin
    if(~rst_i) begin
        mode_o <= 0; num_o <= 0;
    end
    else begin
        case(sw_sig_i)
            11b'000_0000_0000 : begin mode_o <= 0; num_o <= 0;  end
            11b'000_0000_0001 : begin mode_o <= 0; num_o <= 1;  end
            11b'000_0000_0010 : begin mode_o <= 0; num_o <= 2;  end
            11b'000_0000_0100 : begin mode_o <= 0; num_o <= 3;  end
            11b'000_0000_1000 : begin mode_o <= 0; num_o <= 4;  end
            11b'000_0001_0000 : begin mode_o <= 0; num_o <= 5;  end
            11b'000_0010_0000 : begin mode_o <= 0; num_o <= 6;  end
            11b'000_0100_0000 : begin mode_o <= 0; num_o <= 7;  end
            11b'000_1000_0000 : begin mode_o <= 0; num_o <= 8;  end
            11b'001_0000_0000 : begin mode_o <= 0; num_o <= 9;  end
            11b'010_0000_0000 : begin mode_o <= 1; num_o <= 0;  end
            11b'100_0000_0000 : begin mode_o <= 2; num_o <= 0;  end
            default           : begin mode_o <= 3; num_o <= 10; end // dummy data
        endcase
    end
end
endmodule

// interface for number inputs