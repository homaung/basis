module counter_8bit_enable(
clk,
reset,
count_enb,
count

);
  input wire clk;          // 클럭 입력
  input wire reset;        // 리셋 입력
  
  input wire count_enb;    // Enable 입력
  
  output reg [7:0] count;  // 카운터 값 출력
  
always @ (posedge clk, negedge reset)
begin
  if (!reset) begin        // 리셋이 발생한 경우
    count <= 8'b00000000;
  end
  else 
  if (count_enb)
   begin                   // enable 신호가 활성화된 경우에만 카운트
    count <= count + 1;
  end
end

endmodule