// Data flow full adder design style
module FA (input a,
           input b,
           input cin,
           output cout,
           output s);
  assign s=a^b^cin;
  assign c=a&b|a&cin|b&cin;
  
endmodule

// Behavioral full adder design style
module FA (input a,
           input b,
           input cin,
           output reg cout,
           output reg s);
  always @(a,b,cin) begin
    s=a^b^cin;
    c=a&b|a&cin|b&cin
  end
endmodule

// Structural full adder design style (1). full adder isn't designed using structural design this example is just for learning purposes
module FA (input a,
           input b,
           input cin,
           output cout,
           output s);
  wire w1,w2,w3,w4;
  xor xor1 (w1,a,b);
  xor xor2 (s,w1,cin);
  and and1 (w2,a,b);
  and and2 (w3,b,cin);
  and and3 (w4,a,cin);
  or or1 (c,w2,w3,w4);
endmodule

// Structural full adder design style. Building FA from 2HA

//1
module FA (input a,
           input b,
           input cin,
           output cout,
           output s);
  wire w1,w2,w3;
  HA ha1 (w1,w2,a,b); // modulr-name instance name (output..,input...)
  HA ha2 (s,w3,w2,cin);
  or or1 (c,w3,w1);
  
endmodule

//2 connecting the current module to the HA module
module FA (input a,
           input b,
           input cin,
           output cout,
           output s);
  wire w1,w2,w3;
  HA ha1 (.c(w1),.s(w2),.a(a),.b(b)); 
  HA ha2 (.s(s),.c(w3),.a(w2),.b(cin));
  or or1 (c,w3,w1);
  
endmodule
