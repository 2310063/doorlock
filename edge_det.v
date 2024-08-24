module edge_det(input  clk_i, input btn_i, 
                     output btn_o
                    );
reg delay;

always@(posedge clk_i) 
    delay <= ~btn_i;

assign btn_o = btn_i & delay;

endmodule