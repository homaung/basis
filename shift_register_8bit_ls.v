module shift_register_8bit_ls(
dt,
mod,
clk,
dt1_md,
dt2_md,
dt3_md,
dt4_md,
dt_out


    );
    
input wire [7:0] dt,
dt1_md,
dt2_md,
dt3_md,
dt4_md
;
input wire [1:0] mod
;
input wire clk
;
output wire [7:0] dt_out
;

    
shift_register sreg_1bit (
            .rst(rst),
            .mod(mod),
            .clk(clk),
            .dt(dt[0]),
            .dt1_md(dt1_md[0]),
            .dt2_md(dt2_md[0]),
            .dt3_md(dt3_md[0]),
            .dt4_md(dt4_md[0]),
            .dt_out(dt_out[0])

);

shift_register sreg_2bit (
            .rst(rst),
            .mod(mod),
            .clk(clk),
            .dt(dt[1]),
            .dt1_md(dt1_md[1]),
            .dt2_md(dt2_md[1]),
            .dt3_md(dt3_md[1]),
            .dt4_md(dt4_md[1]),
            .dt_out(dt_out[1])

);

shift_register sreg_3bit (
            .rst(rst),
            .mod(mod),
            .clk(clk),
            .dt(dt[3]),
            .dt1_md(dt1_md[3]),
            .dt2_md(dt2_md[3]),
            .dt3_md(dt3_md[3]),
            .dt4_md(dt4_md[3]),
            .dt_out(dt_out[3])

);

shift_register sreg_4bit (
            .rst(rst),
            .mod(mod),
            .clk(clk),
            .dt(dt[0]),
            .dt1_md(dt1_md[3]),
            .dt2_md(dt2_md[3]),
            .dt3_md(dt3_md[3]),
            .dt4_md(dt4_md[3]),
            .dt_out(dt_out[3])

);

shift_register sreg_5bit (
            .rst(rst),
            .mod(mod),
            .clk(clk),
            .dt(dt[4]),
            .dt1_md(dt1_md[4]),
            .dt2_md(dt2_md[4]),
            .dt3_md(dt3_md[4]),
            .dt4_md(dt4_md[4]),
            .dt_out(dt_out[4])

);

shift_register sreg_6bit (
            .rst(rst),
            .mod(mod),
            .clk(clk),
            .dt(dt[5]),
            .dt1_md(dt1_md[5]),
            .dt2_md(dt2_md[5]),
            .dt3_md(dt3_md[5]),
            .dt4_md(dt4_md[5]),
            .dt_out(dt_out[5])

);

shift_register sreg_7bit (
            .rst(rst),
            .mod(mod),
            .clk(clk),
            .dt(dt[6]),
            .dt1_md(dt1_md[6]),
            .dt2_md(dt2_md[6]),
            .dt3_md(dt3_md[6]),
            .dt4_md(dt4_md[6]),
            .dt_out(dt_out[6])

);

shift_register sreg_8bit (
            .rst(rst),
            .mod(mod),
            .clk(clk),
            .dt(dt[0]),
            .dt1_md(dt1_md[7]),
            .dt2_md(dt2_md[7]),
            .dt3_md(dt3_md[7]),
            .dt4_md(dt4_md[7]),
            .dt_out(dt_out[7])

);



endmodule