// this module is for saving passcode number
module passcode(input  [3 : 0] number_i, input [1 : 0] state_i, input clk_i,
                output reg corr_o, output set_o
               )
parameter A         = 1'b1;
parameter B         = 1'b2;

parameter IDLE      = 3b'00;
parameter ENT_CODE  = 3b'01;
parameter OPEN      = 3b'11;
parameter SET       = 3b'10;

reg [3 : 0] passcode [0 : 5] = 0;
reg [1 : 0] state;
integer i = 0;

always@(*)
    state <= state_i;

always@ (posedge clk_i) begin
    case(state)
        IDLE        : begin  end
        ENT_CODE    : begin passcode[i] <= number_i;
                            i           <= i + 1; end
        OPEN        : begin  end
        SET         : begin  end
        default     : begin  end
    endcase
end

endmodule