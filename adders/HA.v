// Data flow half adder design style
module HA (input a,
           input b,
           output c,
           output s);
  assign c=a&b;
  assign s=a^b;
endmodule

// Behavioral half adder design style
module HA (input a,
           input b,
           output reg c,
           output reg s);
  always @(a,b) begin
    c=a&b;
    s=a^b;
  end
endmodule

// Structural half adder design style. Half adder isn't designed using structural design this example is just for learning purposes

module HA (input a,
           input b,
           output c,
           output s);
  xor xor1 (s,a,b); // gate-perimitar instance-name (output...,input...)
  and and1 (c,a,b);
endmodule