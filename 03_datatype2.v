//vectors
/*
nets or reg data type can be declared as vectors(multiple bit width).
vector can be decalared at [high:low] or [low:high],but left number is always the most significant bit of the vector
*/

//example 
module vector;
  wire a;               //width of a is 1 bit
  wire [7:0]bus;        //width of bus is 8 bits
  wire [31:0]bus1,bus2; //three buses of width 32 bits
  reg clk;              //default,1 bit 
  reg [0:5]addr;        //6 bit addr variable,m.s.b bit position is 0 and l.s.b is 5
  reg [5:0]addr1;       //6 bit addr1 variable,m.s.b bit position is 5 and l.s.b is 0
  reg [2:0]v;
  initial
    begin
      addr=6'd56;
      addr1=6'd56;
      $display("addr=%b",addr);
      $display("addr1=%b",addr1);
      $display("m.s.b bit position is 0 and value %b",addr[0]);
      $display("m.s.b bit position is 5 and value %b",addr1[5]);
      //it is possible to assign bits or parts of the vector to another variable
      v=addr1[5:3];
      $display("value of v=%b",v);
    end
endmodule
