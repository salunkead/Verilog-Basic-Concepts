//Generate Block - generate case
/*
1.generate case statment can be used as an alternative to the if-elseif for conditional instantiation of module
*/

//Design Module
module adder(input [6:0]a,b,output [7:0]y);
  assign y=a+b;
endmodule

module substractor(input [6:0]a,b,output [7:0]y);
  assign y=a-b;
endmodule

module top(input [6:0]a,b,output[7:0]y);
  parameter sel=0;
  generate
    case(sel)
      0:adder s0(a,b,y);
      1:substractor s1(a,b,y);
    endcase
  endgenerate
endmodule

//Testbench module
module tb;
  reg [6:0]a,b;
  wire [7:0]y;
  defparam dut.sel=1;
  top dut(a,b,y);
  initial
    begin
      repeat(20)
        begin
          a=$urandom_range(200,255);
          b=$urandom_range(0,199);
          #10;
        end
    end
  initial $monitor("a=%0d b=%0d y=%0d",a,b,y);
  
endmodule
