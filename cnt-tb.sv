// testbench
module cnt_tb ;
  reg [3:0] in;
  reg latch, clock, dec;
  wire zero;
  reg count;
  cnt_dwn cnt 
  ( .in(in), .latch(latch),
   .dec(dec), .clk(clock), .zero(zero) );
  always begin
    clock = 1'b0;
    #10;
    clock = ~clock;
    #10;
  end
  
  always @ (posedge clock) begin
    //some corner cases
  
    // latch is low
    in=4'b0001;
    latch=1'b0;
    dec=1'b1;
    #20
    if ( cnt.count == 4'b0001 || zero )
      $display ("test failed for low latch");
	// dec is low + in=0001 
    in=4'b0001;
    latch=1'b1;
    dec=1'b0;
    #20;
    if  ( zero || cnt.count!==4'b0001)
      $display("test failed for dec 1");
    // test functionality 
    in=4'b0001;
    latch=1'b1;
    dec=1'b1;
    #20;
    if  ( !zero || cnt.count==4'b0001)
      $display("test failed functionality");
    // in = 0
    in= 4'b0;
    latch=1'b1;
    dec=1'b1;
    #20;
    if ( cnt.count != 4'b0 || !zero)
      $display ("test failed for input 0000");
  end 
endmodule 
    
    
    