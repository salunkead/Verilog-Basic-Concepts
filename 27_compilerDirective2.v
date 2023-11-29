//Compiler directive `include
/*
1. what is compiler directive?
   compiler directive is the command or instruction in your code that provides guidance to the compiler,compiler is the software that translate your code into machine code
2.`include compiler directive tells the compiler to include contents of the another file in your program.
*/

//Example
//note:- create new file named module_1.v and copy below code and paste it there
module module1(input wire in,output wire out);
  assign out=~in;
endmodule

//create another file and copy and paste below code there,here we are going to include module_1.v file 
`include "module_1.v"
module test;
  reg x;
  wire y;
  //module1 dut(x,y); //this is order based instantiation of module1
  //same order must be used as of design module
  //the signals to be connnected must appear in the module instantiation in the same order as the ports in the port list in design module defination
  module1 dut(.in(x),.out(y)); //this is the name based instantiation of module1
  //module dut(.design_varaible_name(testbench_variable_name))
  initial
    begin
      x=1'b1;
      #10;
      x=1'b0;
      #20;
      x=1'b1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule
