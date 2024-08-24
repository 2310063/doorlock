module FSM(
            input  rst_i,   input clk_i,
            input  [1 : 0] mode_i, input corr_i, input set_i,
            output [1 : 0] state_o, output [2 : 0] led_sig_o
          )

parameter number_size = 1d'6;

parameter A         = 1'b1;
parameter B         = 1'b2;

parameter IDLE      = 3b'00;
parameter ENT_CODE  = 3b'01;
parameter OPEN      = 3b'11;
parameter SET       = 3b'10;

reg [1:0] prs_state;
reg [1:0] next_state = IDLE;


reg [2:0] led_sig;

assign led_sig_o   = led_sig;
assign state_o     = prs_state;


always@(posedge clk_i) begin
    if(rst_i)
        prs_state  <= IDLE;
    else
        prs_state  <= next_state;
end


always@(posedge clk_i) begin
    if(rst_i) begin
        led_sig <= 0;
    end
    else begin
        case(prs_state)
            IDLE        : begin 
                led_sig <= 3;    // 0000_0000

            end

            ENT_CODE    : begin 
                led_sig <= 0;    // 1111_1111

            end

            OPEN        : begin 
                led_sig <= 1;
                @(posedge clk_i)
                    led_sig <= 3; //0000_0000

                
            end

            SET         : begin
                led_sig <= 2;
                @(posedge clk_i)
                    led_sig <= 0; //1111_1111

                
            end
        endcase
    end
end

always@(*) begin
    case(prs_state)
        IDLE        : begin
            if(mode_i == A)
                next_state <= ENT_CODE;
            else
                next_state <= IDLE;                
        end
        
        ENT_CODE    : begin
            if(corr_i)
                next_state  <= OPEN;
            else
                next_state <= ENT_CODE;
        end

        OPEN        : begin
            case(mode_i)
                A : next_state          <= ENT_CODE;
                B : next_state          <= SET;
                default : next_state    <= OPEN;
            endcase
        end

        SET         : begin
            case(set_i)
                0 : next_state  <= SET;
                1 : next_state  <= ENT_CODE;  // close led
            endcase
        end
    endcase
end

endmodule