module register_7bits_tb;
    
    // Inputs
    wire [6:0] data;
    reg reset;
    reg select;
    reg clk;
    reg count_enb;
    // Outputs
    wire [6:0] q;

    // Instantiate the Unit Under Test (UUT)
    register_7bits uut (
        .data(data), 
        .reset(reset), 
        .select(select),
        .clk(clk), 
        .q(q)
    );

    counter_7bit_enable cnt1_tb_register (
        .clk(clk),
        .reset(reset),
        .count_enb(count_enb),
        .count(data)
    );  

    // Clock generation
    initial
        begin
            clk = 0;
            forever #5 clk = ~clk;
        end

 // Reset assertion
    initial
        begin
            select = 0;
            forever #80 select = ~select;
        end
    initial 
        begin
            reset = 1;
            count_enb = 1;   
            #80 reset = 0;
            #80 reset = 1;

            #2000 $finish;
        end
endmodule