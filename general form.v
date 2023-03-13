always @ (posedge clk, negedge reset)
    begin
    if (!reset)
         ps <= S0;
    else
         ps <= ns;
    end

always @ ()
   case()
      S0 : if()
              begin
                                
              end
           else
              begin
                                                                    
              end
      S1 : if()
              begin
                                            
              end
           else
              begin
                                        
              end
      S2 : if()
              begin
                                   
              end
           else
              begin
                                    
              end
      S3 : if()
              begin
                                   
              end
           else
              begin
                                    
              end
   endcase





always @ (sel)
   begin
      if(sel)
         q1<=a;
      else             
         q1<=b;
   end        


module compare_adr_csu(
               data1,
               data2,
               reset1,
               reset2,
               clk,
               select1,
               select2,
               q4,
               q5,
               same             
    );
    
    
input wire [4:0] data1; // 검색 시작 주소1 레지스터 입력
input wire [4:0] data2; // 검색 시작 주소2 레지스터 입력

input wire reset1;      //주소1 레지스터 리셋
input wire reset2;      //주소2 레지스터 리셋

input wire clk;

wire [4:0] q1;          //검색 주소1 레지스터 출력
wire [4:0] q2;          //검색 주소2 레지스터 출력
reg q3;
output wire q4;         //최종 검색 시작 주소
output wire q5;         //최종 검색 끝   주소
output reg same;
input  wire select1;
input  wire select2;


register utt5(.data(data1), .reset(reset1),.q(q1), .select(select1), .clk(clk));
register utt6(.data(data2), .reset(reset2),.q(q2), .select(select2), .clk(clk)); 
mux_1 utt7 (.a(q1), .b(q2), .sel(q3), .out(q4));
mux_1 utt8 (.a(q2), .b(q1), .sel(q3), .out(q5));



always@(q1,q2)
   begin        
      if(q1>q2)
         begin
            q3<=1'b1;
         end
      else
         begin         
            q3<=1'b0;
         end
   end
               
   
          
always @ (q1,q2)
   begin
      if(q1==q2)
         same<=1'b1;
      else             
         same<=1'b0;
   end        


endmodule



