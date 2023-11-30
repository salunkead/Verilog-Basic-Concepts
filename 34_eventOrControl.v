//Event or control-sensitivity list
/*
1.sometimes transition on any one of multiple signals or events can trigger the execution of a statement or block of statements.
2.this is expressed as OR of events or signals.the list of signals or events expressed as an OR is also known as a sensitivity list
3.the keyword or is used to specify multiple triggers.
4.sensitivity list is used in always loop,without sensitivity list always block will loop continuously without waiting for triggering event. 
*/

//Example
module sensitivity;
  reg[1:0]a,b;
  always@(a or b) //if any one variable or both changes it's value then only this always block will be executed
    begin
      $display("variable a or b has changed it's value: a=%0d b=%0d at t=%0t",a,b,$time);
    end
  //////////
  initial
    begin
      a=0;b=0; //changed from default value a=x to b=x to a=0 b=0,therefore always block will be executed at t=0 time unit
      #10;
      a=0;b=1; //b changed from b=0 to b=1,therefore always block will get executed at t=10 time unit
      #10;
      a=1;b=1; //a changed from a=0 to a=1,therefore always block will get executed at t=20 time unit
      #20;
      a=1;b=1; //no change therefore always block will not execute at t=40 time unit
      #30;  
      a=2;b=3; //both value of a and b changed from a=1 b=1 to a=2 b=3,therefore always block will get executed at t= 70 time unit
    end
endmodule

//Example-implicit event expression list
//@(*) means if any signals declared inside procedural block changes it's value then always block will get executed
//in case of expression,if any one R.H.S variable changes it's value then always block will be executed i.e y=a^b R.H.S variables are a and b,if any one or both changes it's value then always block will be executed

module sensitivity1;
  reg[1:0]a,b;
  always@(*) //instead of a or b,we can use * operator to include all the variables as sensitivity list.always@(*) is same as always@(a or b)
    begin
      $display("variable a or b has changed it's value: a=%0d b=%0d at t=%0t",a,b,$time);
    end
  //////////
  initial
    begin
      a=0;b=0; //changed from default value a=x to b=x to a=0 b=0,therefore always block will be executed at t=0 time unit
      #10;
      a=0;b=1; //b changed from b=0 to b=1,therefore always block will get executed at t=10 time unit
      #10;
      a=1;b=1; //a changed from a=0 to a=1,therefore always block will get executed at t=20 time unit
      #20;
      a=1;b=1; //no change therefore always block will not execute at t=40 time unit
      #30;  
      a=2;b=3; //both value of a and b changed from a=1 b=1 to a=2 b=3,therefore always block will get executed at t= 70 time unit
    end
endmodule
