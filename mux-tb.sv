
module mux_tb;
  reg [1:0] in1, in2, in3, in4; // Corrected range direction
  reg c1, c2;
  wire [1:0] out; // Corrected range direction
  mux test (
    .in1(in1), .in2(in2), .in3(in3), .in4(in4),
    .c1(c1), .c2(c2),
    .out(out) // Added .out port connection
  );
  
  initial begin
    in1 = 2'b11;
    in2 = 2'b00;
    in3 = 2'b01;
    in4 = 2'b10;
    c1 = 1'b0;
    c2 = 1'b0;
    if (out != 2'b11)
      $display("first test failed");
    #5;
    
    in1 = 2'b00;
    in2 = 2'b11;
    in3 = 2'b01;
    in4 = 2'b10;
    c1 = 1'b0;
    c2 = 1'b1;
    if (out != 2'b11)
      $display("second test failed");
    
    #5;
    
    in1 = 2'b10;
    in2 = 2'b01;
    in3 = 2'b11;
    in4 = 2'b00;
    c1 = 1'b1;
    c2 = 1'b0;
    if (out != 2'b11)
      $display("third test failed");
    
    #5;
    
    in1 = 2'b10;
    in2 = 2'b01;
    in3 = 2'b00;
    in4 = 2'b11;
    c1 = 1'b1;
    c2 = 1'b1;
    if (out != 2'b11)
      $display("fourth test failed");
    
    #5;
  end
endmodule

    
    
    