// structural 4-bit full adder design style. Building 4 bit FA from 4 FA
module FA4 (input [3:0] A,B,
                input Cin,
                output [3:0]s,
                output c);
  wire w0,w1,w2
  FA fa1(.cout(w0),.s(s[0]),.a(A[0]),.b(B[0]),.cin(Cin));
  FA fa2(.cout(w1),.s(s[1]),.a(A[1]),.b(B[1]),.cin(w0));
  FA fa3(.cout(w2),.s(s[2]),.a(A[2]),.b(B[2]),.cin(w1));
  FA fa4(.cout(c),.s(s[3]),.a(A[3]),.b(B[3]),.cin(w2));
  
endmodule

// Data flow  4-bit full adder design style
module FA4 (input [3:0] A,B,
                input Cin,
                output [3:0]s,
                output c);
  assign {c,s} =A+B+Cin;
  
endmodule
           
// Behavioral 4-bit full adder design style
module FA4 (input [3:0] A,B,
                input Cin,
                output reg [3:0]s,
                output reg c);
  always @(A,B,Cin)
    assign {c,s} =A+B+Cin;
  
endmodule
           