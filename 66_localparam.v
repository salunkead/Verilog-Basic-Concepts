///The concept of localparam
/*
1. in simple words,localparam in verilog is used to declare a constant parameter that is only accessible within the module or block where it's defined.
2. localparam are similar to the parameter but their scope is local to the block or module where it is defined.
3. unlike parameter,we cannot change value of the localparam from outside module or block
*/

//Example-1

module Localparam;
  parameter depth=256;
  localparam width=32;
  initial
    begin
      $display("value of parameter,depth : %0d",depth);
      $display("value of the localparam,width : %0d",width);
    end
endmodule

module top;
  defparam l1.depth=556; //we can change the value of the parameter,but not localparam
  defparam l1.width=55;  //Error:-> A parameter override is not allowed for localparam 'width'
  Localparam l1();
endmodule
