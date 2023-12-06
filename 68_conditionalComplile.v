//Conditional Compilation in verilog
/*
1.conditional compilation in verilog allows you to include or exclude certain portion of the your code during compilation process based certain conditions(if certain flag is set).
2.it's way to selectively include or exclude blocks of code or module etc.
3.conditional compilation can be achieved by using compiler directives
  
  1. `ifdef(if defined):- 
         1.it checks if a certain identifier is defined using previous `define directive.
         2.if identifier is defined then the block of code between `ifdef and `endif is included during compilation.
         3.if the identifier is not defined then the block of code is excluded from the compilation process.
  
  2. `else:-
         1.it is used with `ifdef,tells what to do if the condition specified in `ifdef is not true
         2.if the flag or identifier is defined using `define,the block of code between `ifdef and `else is included,
           otherwise the code between `else and `endif is included
           it is the way to include two conditions.
  
  3. `elseif:-
         1.it allows checking additional conditions in a sequence
         2.it is used when there are multiple conditions to be checked.
  
  4. `endif:-
         1.it is used to mark the end of conditional block started by `ifdef
*/

//code-1
`define flag
module Conditional;
  initial
    begin
      `ifdef flag
      $display("the flag is defined");  //if the flag is defined then this $display will included during compilation
      `else
      $display("the flag is not defined");
      `endif
    end
endmodule

//code-2
module Conditional2;
  initial
    begin
      `ifdef flag
      $display("the flag is defined");
      `else
      $display("the flag is not defined"); //here flag is not defined therefore this statement will be included during compilation
      `endif
    end
endmodule

//code-3
//module-1
module multipler(input[31:0] a,b,output integer y);
  always@(a or b)
    begin
      y=a*b;
    end
endmodule

//module-2
module substractor(input [31:0] a,b,output integer y);
  always@(a or b)
    begin
      y=a-b;
    end
endmodule

//testbench module
`define flag 
module top;
  integer a,b;
  wire[31:0]y;
  `ifdef flag
  multipler m1(a,b,y);  //if the flag is defined then this module will be included in compilation
  `else
  substractor m2(a,b,y); //if flag is not defined then this module will be included in compilation
  `endif
  
  initial
    begin
      $monitor("a=%0d b=%0d y=%0d",a,b,y);
      repeat(10)
        begin
          a=$urandom_range(200,256);
          b=$urandom_range(0,199);
          #10;
        end
    end
endmodule
