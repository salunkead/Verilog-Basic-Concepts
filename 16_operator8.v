//Relational operators
/*
1.relational operators are greater-than(>),less-than(<),greater-than-or-equal-to(>=),less-than-or-equal-to(<=).
2.if the relational operators are used in expression,the expression returns a logical value 1 if expression is true and
  0 if expression is false.
3.if there are any unknown or z bits in the operands,the expression takes x.
*/

//Example:-
module relational;
  integer a,b;
  reg[3:0]x,y,z;
  initial
    begin
      a=4;
      b=3;
      x=4'b1010;
      y=4'b1101;
      z=4'b1xxx;
      $display("a<=b %b",a<=b);   //as a is greater than b,a<=b results in 0(false)
      $display("a>b %b",a>b);    //as a>b,this results to 1(true)
      $display("y>=x %b",y>=x);  //as y is greater than x,this results to true
      $display("y<z %b",y<z);    //if there is any x or z in operands,result will be x(unknown)
    end
endmodule
