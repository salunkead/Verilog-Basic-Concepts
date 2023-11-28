//Conditional operator
/*
1.The conditional operator(:?) takes three operands.
  condition_expr?true_expr:false_expr;
  the condition expression is evaluated first,if it results in logical 1(true) then true_expr is executed,if the result is false(logical 0),then false_expr is executed.
2.conditional operators can be nested.each true_expr or false_expr can itself be a conditional operation
*/

//Example-1
module conditional_op;
  integer a,b,y;
  reg control;
  initial
    begin
      a=10;
      b=20;
      control=1'b1;
      //control value is non-zero(true),y will get value of a=10
      y=control?a:b;
      $display("y=%0d",y);
      control=1'b0;
      //control value is zero(false),y will get value of b=20
      y=control?a:b;
      $display("y=%0d",y);
      control=1'bx;
      //if control value is x or z,y will get x(unknown)
      y=control?a:b;
      $display("y=%0d",y);
      control=1'bz;
      y=control?a:b;
      $display("y=%0d",y);
    end
endmodule

//Example-2
module nested_conditional;
  integer a,b,c,x,y,z;
  reg control;
  initial
    begin
      a=10;
      b=20;
      c=30;
      x=40;
      z=50;
      control=1'b1;
      //as a is not greater than b i.e false(logical 0) then second part of the conditional operator gets executed,where there is another conditional operator,as control value is 1,condition expression results in logical 0,therefore y=30
      y=(a>b)?((control==1'b1)?x:z):((control==1'b0)?z:c);
      $display("y=%0d",y);
    end
endmodule
