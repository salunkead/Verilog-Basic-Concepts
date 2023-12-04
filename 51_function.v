//Function in verilog
/*
1.functions are used when common verilog code is purely combinational and executes in zero simulation time and provides exactly one output.
2.functions are commonly used for conversion and commonly used calculations
3.function can have input ports and register variables(integer,real,time,reg etc) as local variables
4.task or function cannot have wires
5.function or task do not contain initial or always block but they can be called from these block.
6.important points about functions
  1.function can call another function but not task
  2.function always executes in zero simulation time
  3.function must not contain delay,event
  4.functions must have one input argument
  5.function returns single value.function cannot have output,inout arguments.
9.syntax: 
         function width function_name(input inputs_arguments);
           //code to be executed when called
         endfunction
10.both task and function must befined inside module and are local to the module
*/

//code-1 A simple example of the function
module Functions;
  reg [4:0]r1;
  reg [7:0]r2;
  //there are two methods of declaring  function
  //method-1
  function [4:0] adder(input reg [3:0]a,b);
    adder=a+b;
  endfunction
  //method-2
  function [7:0] multiplier;
    input [3:0]a,b;
    begin
      multiplier=a*b;
    end
  endfunction
  initial
    begin
      r1=adder(12,7);
      $display("result of addition is r1=%0d",r1);
      r2=multiplier(12,13);
      $display("result of multiplier is r2=%0d",r2);
    end
endmodule

//code-2 function must have single input argument
module Function2;
  reg r;
  function display(input reg b);
    $display("this function is valid function in verilog");
  endfunction
  /*
  //THIS IS NOT VALID VERILOG FUNCTION AS IT DOESNOT HAVE ANY INPUT ARGUMENT
  function display1();
    $display("this function is not a valid function in verilog");
  endfunction
  */
  
  initial
    begin
      r=display(1'b1);
      //display1(); //throws error
    end
endmodule

//code-3  error: functions cannot have delay statements.
//it is must to group multiple statements in verilog function with begin-end
module Functions3;
  reg r;
  function display(input reg b);
    begin
      #2;  //error: functions cannot have delay statements.
      $display("this function is not valid function in verilog");
    end
  endfunction

  initial
    begin
      r=display(1'b1); //throws error
    end
endmodule
