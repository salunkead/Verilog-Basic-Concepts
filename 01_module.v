/* 
in verilog,a module is the fundamental building block that represents a hardware component or a functional block within digital design
a complex design is made up of multiple modules
syntax:-
module module_name(port declaration);
statement 1;
statement 2;
........;
........;
endmodule
1. a module may or maynot have ports
2. a port can be input,output or inout port
3.module contains following things,
  1.declaration of wire,reg and other variable
  2.dataflow statements(assign)
  3.instantiation of lower module
  4. always and initial blocks
  5.task and functions
all the component except module,module_name and endmodule are optional
*/

//this example shows the different components of a module
//example-1
module and_gate(y,a,b);
  //port declaration
  input a,b;
  output y;
  assign y=a&b; //dataflow statement
endmodule

//example-2
module testbench;
  reg a,b;//declaration of reg and wire variable
  wire y;
  and_gate dut(y,a,b); //instantiation of lower level modules
  initial //behavioral block,initial
    begin
      #5 a=0; b=0;
      #5 a=0; b=1;
      #5 a=1; b=0;
      #5 a=1; b=1;
    end
endmodule
