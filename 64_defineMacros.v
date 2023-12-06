//Define a macro in verilog
/*
1.in simple words, a macro is like a shortcut or a template in programming.
2.it allows you to define a set of instruction or code once and then use a short name to represent that code wherever you need it.
*/

//Example
`define square(x) (x*x)
`define pi 3.14 
 module test;
   integer r;
   real area;
   initial
     begin
       r=5;
       area=`pi*`square(r);
       $display("the area of the circle is %0.4f",area);
       r=16;
       area=`pi*`square(r);
       $display("the area of the circle is %0.4f",area);
     end
 endmodule
