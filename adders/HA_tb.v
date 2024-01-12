module HA_tb;
  reg a, b;
  wire c, s;
  HA test (
    .a(a),
    .b(b),
    .c(c),
    .s(s)
  );

  initial begin
    // 0 + 0 = 0
    a = 0;
    b = 0;
    #10;
    if (s !== 0 || c !== 0)
      $display("first test failed");
    // 1 + 0 = 1
    a = 1;
    b = 0;
    #10;
    if (s !== 1 || c !== 0)
      $display("second test failed");
    
    // 0 + 1 = 1
    a = 0;
    b = 1;
    #10;
    if (s !== 1 || c !== 0)
      $display("third test failed");
    
    // 1 + 1 = 01
    a = 1;
    b = 1;
    #10;
    if (s !== 0 || c !== 1)
      $display("fourth test failed");
    
  end
endmodule