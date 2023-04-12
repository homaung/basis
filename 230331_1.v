module tlqkf(
                        data                ,
                        sel_reg             ,
                        clk                 ,
                        input1              ,
                        input2              ,
                        input3              ,
                        input4              ,
                        input5              ,
                        input6              ,
                        input7

);

//Parameter    
 parameter              
                        R=8                 ,         //R : 2^A
                        A=3                 ,         // A : Adress width  
                        D=7                           // D : Data width                  
;      
                                                         
//wire&reg
input wire [D-1:0]  data
;
input wire [A-1:0]  sel_reg
;
wire [D-1:0]        sel_out
;
input wire          clk
;
output reg [D-1:0]  input1,
                    input2,
                    input3,
                    input4,
                    input5,
                    input6,
                    input7
;
//instance
decoder_3to7 decoder (
                        .in(sel_reg),
                        .out(sel_out)
);

register_7bits reg1 (   
                        .data(data),
                        .reset(rst),
                        .q(input1),
                        .select(sel1),
                        .clk(clk)
    );
    
register_7bits reg2 (   
                        .data(data),
                        .reset(rst),
                        .q(input2),
                        .select(sel2),
                        .clk(clk)
);
    
register_7bits reg3 (   
                        .data(data),
                        .reset(rst),
                        .q(input3),
                        .select(sel3),
                        .clk(clk)
);    

register_7bits reg4 (   
                        .data(data),
                        .reset(rst),
                        .q(input4),
                        .select(sel4),
                        .clk(clk)
);

register_7bits reg5 (   
                        .data(data),
                        .reset(rst),
                        .q(input5),
                        .select(sel5),
                        .clk(clk)
);

register_7bits reg6 (   
                        .data(data),
                        .reset(rst),
                        .q(input6),
                        .select(sel6),
                        .clk(clk)
);

register_7bits reg7 (   
                        .data(data),
                        .reset(rst),
                        .q(input7),
                        .select(sel7),
                        .clk(clk)
);


assign sel_out[0]=sel1;
assign sel_out[1]=sel2;
assign sel_out[2]=sel3;
assign sel_out[3]=sel4;
assign sel_out[4]=sel5;
assign sel_out[5]=sel6;
assign sel_out[6]=sel7;
endmodule