//$timeformat system task
/*
1.$timeformat in verilog is like setting the format for displaying time during simulation.
2.it lets you decide how to show time values,like how many decimal places to display and what unit(like ns,ps) to use.
3.it makes simulation output more readable.
4. ex- $timeformat(-9,3,"ns",10);
   1.Here, -9:minimum field width for the number(negative means no padding on the left)
   2.'3':the number of decimal places to display
   3.'"ns"':the time unit(nano second in this case)
   4.'10':the radix or base (decimal in this case)
5.it should be written inside initial block
*/

//Example:

//code-1 without $timeformat
`timescale 1ns/1ps
module test1;
  integer i;
  initial i=1;
  always
    begin
      i=i+10;
      #5.52;
    end
  initial $monitor("i=%0d at t=%0t",i,$realtime);
  initial #100 $finish;
endmodule

//code-2 with $timeformat
`timescale 1ns/1ps
module test2;
  integer i;
  initial
    begin
      $timeformat(-9,2,"ns",10);
      i=1;
    end
  always
    begin
      i=i+10;
      #5.52;
    end
  initial $monitor("i=%0d at t=%0t",i,$realtime);
  initial #100 $finish;
endmodule
