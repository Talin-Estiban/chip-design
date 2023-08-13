// MUX 
module mux (
  input [1:0] in1, in2, in3, in4, // Corrected range direction
  input c1, c2,
  output reg [1:0] out // Corrected range direction
);
  always @ (c1, c2) begin
    case ({c1, c2})
      2'b00 : out = in1;
      2'b01 : out = in2;
      2'b10 : out = in3;
      2'b11 : out = in4;
      default : out = 2'bzz;
    endcase
  end
endmodule

      
         
    