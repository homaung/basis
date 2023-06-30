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
input wire      clk;                       // Ŭ�� �Է�
input wire      reset;                     // ���� �Է�
input wire      count_enb;                 // Enable �Է�
wire q1 ;
output reg [N-1:0] count;               // ī���� �� ���



//logic
always @ (posedge clk, negedge reset)
    begin
        if (!reset) 
            begin                           // ������ �߻��� ���
                count <= 0;
            end
        else 
            if (count_enb) 
                begin // enable ��ȣ�� Ȱ��ȭ�� ��쿡�� ī��Ʈ
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