module cov( x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,
            h0,h1,h2,h3,h4,h5,h6,h7,h8,h9,
            y

    );
input  wire [31:0] x0, x1, x2, x3, x4, x5, x6, x7, x8, x9 ;  
input  wire [31:0] h0, h1, h2, h3, h4, h5, h6, h7, h8, h9 ;  
output wire [31:0] y;
wire [31:0] x [0:9];
wire [31:0] h [0:9];
reg  [31:0] e [0:9];
wire [31:0] w [0:7];
integer i;
always @ *
begin
    for (i = 0; i < 10; i = i + 1) 
        begin
            e[i] <= x[i]*h[i];

        end
        
end

assign w[0] = e[0] + e[1];
assign w[1] = e[2] + e[3];
assign w[2] = e[4] + e[5];
assign w[3] = e[6] + e[7];
assign w[4] = e[8] + e[9];
assign w[5] = w[0] + w[1];
assign w[6] = w[2] + w[3];
assign w[7] = w[5] + w[4];
assign y = w[6] + w[7];


assign x[0] = x0;
assign x[1] = x1;
assign x[2] = x2;
assign x[3] = x3;
assign x[4] = x4;
assign x[5] = x5;
assign x[6] = x6;
assign x[7] = x7;
assign x[8] = x8;
assign x[9] = x9;

assign h[0] = h0;
assign h[1] = h1;
assign h[2] = h2;
assign h[3] = h3;
assign h[4] = h4;
assign h[5] = h5;
assign h[6] = h6;
assign h[7] = h7;
assign h[8] = h8;
assign h[9] = h9;
endmodule
