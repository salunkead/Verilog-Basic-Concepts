//task in verilog
/*
1.task can call other task and function
2.task may execute in zero simulation time
3.task can have delay,event.
4.task can have zero or more arguments of type input,output,inout
5.task doesnot return any value but can pass multiple values through input,output or inout.
6. syntax:
     task task_name(input/inout/output arguments);
        //code to be executed;
     endtask
*/

//Example-1 task with 2-inputs and 1-output arguments
module Task;
  integer a,b,mul;
  task multiply;
    input integer x,y;
    output integer z;
    begin
      #3;
      z=x*y;
    end
  endtask
  
  initial
    begin
      a=63;
      b=4;
      multiply(a,b,mul); 
      $display("multiplication is %0d",mul);
    end
endmodule

//Example-2 task with 2 inputs and 4 outputs
module Task1;
  integer a,b,add,sub,mul,mod;
  task arithmatic_op;
    input integer x,y;
    output integer z1,z2,z3,z4;
    begin
      #1;
      z1=x+y;
      #1;
      z2=x-y;
      #1;
      z3=x*y;
      #1;
      z4=x%y;
    end
  endtask
  
  initial
    begin
      a=63;
      b=4;
      arithmatic_op(a,b,add,sub,mul,mod);
      $display("addition is %0d",add);
      $display("substraction is %0d",sub);
      $display("multiplication is %0d",mul);
      $display("modulo is %0d",mod);
    end
endmodule

//Example-3 task with inout argument
module Task2;
  integer i;
  task port;
    inout integer j;
    begin
      #1;
      j=j+20;
    end
  endtask
  
  initial
    begin
      i=32;
      port(i);
      $display("value of i=%0d",i);
    end
endmodule
