module led_shifter_Concatenation(
                clk,
                rst,
                btn,
                led_out
);
    

input wire      
                clk,
                rst,
                btn
;

output wire [3:0] 
                led_out
; 

reg 
                rst_delay_1, 
                rst_delay_2,
                btn_delay_1,
                btn_delay_2  
; 
reg [3:0] 
                shift_reg
;
wire        
                v
;
wire            rst_edge_detector
;



always@(posedge clk)
    begin
        rst_delay_1 <= 1'b0;          //rst_delay = 0
        rst_delay_2 <= 1'b0;          //rst_delay_2 = 0
    end

    
assign rst_edge_detector = ~rst_delay_1 & rst_delay_2;
    




always@(posedge clk) 
    begin
        btn_delay_1 <= btn;          //btn_delay = 0
        btn_delay_2 <= btn_delay_1;  //btn_delay_2 = 0
    end






    wire btn_edge_detector;   
    assign btn_edge_detector =  ~btn_delay_1 & btn_delay_2;
    assign v = |shift_reg;
    assign led_out = shift_reg;

always@(posedge clk) 
    begin
        if (rst_edge_detector) 
            begin
                shift_reg <= 4'b0001;
            end
        else 
            if (btn_edge_detector) 
                begin
                    if(!v) 
                        begin
                            shift_reg <= 4'b0001;
                        end
                    else 
                        begin
                            shift_reg <= {shift_reg[2:0], 1'b0};
                        end
                end
    end

endmodule