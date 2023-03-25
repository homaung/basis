module dff(clk,
reset,
d,
q
  
);
input clk;
  input reset;
  input d;
  output reg q;
  always @(posedge clk, negedge reset) begin
    if (reset == 1) begin
      q <= 0;
    end else begin
      q <= d;
    end
  end

endmodule
