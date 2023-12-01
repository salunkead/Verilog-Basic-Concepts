//Conditional Statement-if-else
/*
1.conditional statements are used to make decision based on certain conditions.
2.these conditions are used to decide whether or not a statement should be executed.
3.the keyword 'if' and 'else' are used for conditional statements.
4.three type of conditional statements
  1.only if(expression) 
      true_statements;
  2.if(expression) 
       true statements; 
    else 
       false_statements;
  3. if-else if is used for priority
    if(expression) 
       true_statements; 
    else if(expression) 
       true_statements; 
    else 
       default_statements;
5. first the expression is evaluated.if it is true(1 or non-zero value) the true_statements get executed.if it is false(0,x,z) then false statement gets executed 
*/

//Example
//code-1
module If;
  integer age;
  always@(age)
    begin
      if(age>=18)
        $display("your age is %0d and you can vote",age);
    end
  initial
    begin
      age=20;
      #10;
      age=18;
      #10;
      age=12;
      #10;
      age=10;
    end
endmodule

//code-2 non zero value as an expression
module ifElse1;
  initial
    begin
      if(32'd23)
        $display("non-zero value in expression");
      else
        $display("zero value in expression");
    end
endmodule

//code-3 zero value as an expression
module ifElse2;
  initial
    begin
      if(32'd0)
        $display("non-zero value in expression");
      else
        $display("zero value in expression");
    end
endmodule

//code-4
module ifElse3;
  integer a,b;
  initial
    begin
      a=20;
      b=23;
      $display("a>b=%b",a>b);
      if(a>b) 
        $display("a is greater than b"); //a>b is equal to true(logical 1),then this block will execute 
      else
        $display("a is less than b"); //a>b is equal to false(logical 0),then this block will execute
    end
endmodule

//code-5
module ifElse4;
  integer a,b;
  initial
    begin
      a=32'bx;
      b=23;
      $display("a>b=%b",a>b);
      if(a>b) 
        $display("a is greater than b"); //a>b is equal to true(logical 1),then this block will execute 
      else
        $display("a is less than b"); //a>b is equal to false(logical 0,x),then this block will execute
    end
endmodule

//code-6
module ifElse5;
  integer a,b;
  always@(a or b)
    begin
      if(a==b)
        $display("a and b are equal at t=%0t",$time);
      else if(a>b)
        $display("a greater than b at t=%0t",$time);
      else
        $display("a less than b at t=%0t",$time);
    end
  initial
    begin
      a=1;b=1;
      #10;
      a=20; b=30;
      #10;
      a=10; b=5;
    end
endmodule















