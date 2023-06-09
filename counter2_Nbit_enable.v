`timescale 1ns / 1ps

module counter2_Nbit_enable(
                clk,
                reset,
                count_enb,
                count
);

//Parameter
parameter       N =32;
//wire&reg
input wire      clk;                       // 클럭 입력
input wire      reset;                     // 리셋 입력
input wire      count_enb;                 // Enable 입력
wire q1 ;
output reg [N-1:0] count;               // 카운터 값 출력



//logic
always @ (posedge clk, negedge reset)
    begin
        if (!reset) 
            begin                           // 리셋이 발생한 경우
                count <= 0;
            end
        else 
            if (count_enb) 
                begin // enable 신호가 활성화된 경우에만 카운트
                    if (q1)
                        begin
                            count <= 0;
                        end
                    else 
                        begin
                            count <= count + 2;
                        end
                end
    end

assign q1 = &count;


endmodule