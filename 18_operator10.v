//Arithmatic operator
/*
There are two types of operators: binary and unary.
1.binary operator:-
  1.binary arithmatic operators are multiply(*),divide(/),add(+),substract(-) and modulus(%).binary operators take two operands.
  2.if any operand bit is x or z,then the result of the entire expression is x(unknown).
2.the operators + and - can also work as unary operator.they are used to specify the positive or negative sign of the operand
  negative numbers are represented as 2's compliment internally in the verilog.negative numbers should be of type integer or real.
  avoid negative numbers of this type <size>'<base><number>,they are converted into unsigned 2's compliment number
*/

//Example
module arithmatic;
  reg [3:0]a,b;
  integer d,e;
  initial
    begin
      a=4'b0011;
      b=4'b0100;
      d=6;
      e=4;
      $display("a*b %0b",a*b);
      $display("d/e %0.4f",real'(d)/real'(e));
      $display("a+b %0d",a+b);
      $display("b-a %0d",b-a);
      a=4'b101x;
      b=4'b1010;
      $display("a+b %0d",a+b); //if any of the bit of operand is x or z then the result will be x(unknown)
      //modulus operator produce remainder from the division of two numbers
      $display("d modulus e %0d",d%e);
      //unary operator example
      $display("-d %0d",-d);
    end
endmodule
