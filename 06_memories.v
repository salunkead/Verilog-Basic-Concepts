//memories in verilog
/*
1.in verilog,memories are used to model storage elements that can store and retrieve digital data.
2.memories can represent various types of storage structures such as registers,RAM,ROM etc
3.verilog provides several construct to describe memories at different level of abstraction 
*/

module memory;
  //array can be used to model memory elements with multiple locations
  reg [7:0]mem[0:255]; //256 locations of 8 bit wide memory element
  initial
    begin
      mem[0]=8'd120;  //assigns 120 to the first element of mem
      mem[1]=8'd212;  //assigns 212 to the second element of mem
      $display("data at memory location 0 is %0d",mem[0]);
      $display("data at memory location 1 is %0d",mem[1]);
    end
endmodule
