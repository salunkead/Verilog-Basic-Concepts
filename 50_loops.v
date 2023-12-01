//Loops in verilog
/*
1.if something is to be done repeatedly then loops are used.
2.there are four looping statements in verilog
  1.while,for,repeat and forever
  2.all loops must be used inside initial or always block.
  3.loops may contain delay expression.
*/

//Example:-
//code-1 simple code of while loop
/*
while(condition)
   begin
     //code to be repeated
   end
*/
module whileLoop;
  integer i;
  initial
    begin
      i=0;                       
      while(i<=15)               //if this expression becomes false(logical 0) then loop doesnot executes
        begin                   //begin-end is used to group multiple statements
          $display("i=%0d",i); //prints 0 to 15 numbers
          i=i+1;               //addition is to be done multiple time then we do use loop
        end
    end
endmodule

//code-2 simple code for for loop
/*
1.the keyword for is used to specify for loop.
2.for loop contains three parts
 1.initialization:- executed once at the begining to initialize loop control variables
 2.condition:-checked before each iteration.if false loop exits
 3.update:-loop variable is updated after every iteration
*/
module forLoop;
  integer i;
  initial
    begin                       
      for(i=0;i<=15;i=i+1)  //begin-end is optional for single statement
        begin
          $display("i=%0d",i);
        end
    end
endmodule

//code-3 simple code for repeat loop
/*
1.the keyword repeat is used for this loop.
2.the repeat construct executes the statements inside it for fixed number of times.
3.syntax:- repeat(integer_number)
4.logical expression can not be used inside repeat loop i.e repeat(a<=15)--NO
5.it must contain a number,,which can be a constant,a variable or signal value.
*/
module repeatLoop;
  integer i,j;
  parameter variable=16;
  initial
    begin                       
      i=0;
      j=0;
      repeat(16)
        begin
          $display("i=%0d",i);
          i=i+1;
        end
      //both repeat loops are same except in first loop constant is used and in second variable is used
      $display("------------------");
      repeat(variable)
        begin
          $display("j=%0d",j);
          j=j+1;
        end
    end
endmodule

//code-4 forever loop-an infinite loop
/*
1.the keyword forever is used to express this loop.
2.this loop doesnot contain any expression and executes until the $finish task is called.
*/
module foreverLoop;
  reg clock;
  initial
    begin
      clock=1'b0;
      forever #10 clock=~clock;
    end
  initial
    begin
      $dumpfile("clock.vcd");
      $dumpvars;
      #100 $finish;
    end
endmodule
