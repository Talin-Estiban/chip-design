module FA4_tb;
  reg [3:0] A,B;
  reg Cin;
  wire [3:0] S;
  wire C;
  
  FA4 test (.A(A),
            .B(B),
            .Cin(Cin),
            .s(S),
            .c(C));
  initial begin
    
    // 0+0=0
  	A=4'b0;
  	B=0;
  	Cin=0;
  	#10;
  	if (S!==0 || C!==0) 
    	$display("first test failed");
  	// 0+0+1(Cin)=1
  	A=0;
  	B=0;
  	Cin=1;
  	#10;
  	if (S!==1 || C!==0) 
    	$display("Second test failed");
  	// 1111+1111+1(Cin)=1111-1(Cout)
  	A=0;
  	B=0;
  	Cin=0;
  	#10;
  	if (S!==0 || C!==0) 
  	  $display("Third test failed");
  end

  
endmodule