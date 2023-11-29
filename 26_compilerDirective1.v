//Compiler directive `define
/*
1.all the compiler directives are defined by using `<keyword> construct
2.`define directive is used to define text macros in verilog program.
3.the defined constants or text macros are used in verilog code by preceding them with a `(back tick).the verilog compiler substitute the text of macro whereever it encounters `<macro_name>
*/

//Example
`define pi 3.14
`define display $display
`define finish $finish
module compiler;
  real area,r;
  initial
    begin
      r=2;
      area=`pi*r*r;
      `display("the area of circle is %0.4f",area);
      `finish;
    end
endmodule
