//Count down timer
module cnt_dwn (input [3:0] in, 
                input latch, 
                input dec, 
                input clk, 
                output zero);
 
  reg [3:0] count;
  always @ (posedge clk) begin
    if (latch) count<=in;
    if (latch && !zero && dec) count<=count-1'b1;
  end
  assign zero = (count==4'b0);
endmodule 
    