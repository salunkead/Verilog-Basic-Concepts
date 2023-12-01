//observe the waveforms
//code-1
module blocking;
  reg a,b,c;
  initial
    begin
      a=1'b1;
      b=1'b0;
      b= #10 a; //blocking assignment,take the value of a at t=0 and assign it to L.H.S at t=10 time unit
      c=b;      //as the above statement is blocking,this statement will get executed at t=10 time unit
      #15;
      a=1'b0;
    end
  initial
    begin
      $dumpfile("mixed.vcd");
      $dumpvars;
    end
endmodule

//code-2
module mixed1;
  reg a,b,c;
  initial
    begin
      a=1'b1;
      b=1'b0;
      b<= #10 a; //executes at t=0 time unit and schedule b value equal to a at t=10 time unit
      c<=b;      //as the above statement is non-blocking,this statement will also get executed at t=0 time unit
      #15;
      a<=1'b0;
    end
  initial
    begin
      $dumpfile("mixed.vcd");
      $dumpvars;
    end
endmodule

//code-3
module swap;
  integer a,b;
  initial
    begin
      a<=10;
      b<=20;
      a<=b;  //all the statements are non-blocking,R.H.S of non-blocking assignment is evaluated first the assigned to L.H.S
      b<=a;  //a and b will get default value of integer i.e a=x b=x
    end
  initial $monitor("a=%0d b=%0d",a,b);
endmodule

//code-4
module test1;
  integer a,b;
  initial
    begin
      a<=10;//current time stamp is t=0,at NBA region value of a=10 and b=20
      b<=20;
      #1 a<=b; //current time stamp is t=1,at NBA region value is assigned to L.H.S of non-blocking i.e a=20
      #2 b<=a; //current time stamp is t=2,at NBA region value is assigned to L.H.S of non-blocking i.e b=20
    end
  initial $monitor("a=%0d b=%0d",a,b);
endmodule

//code-5
module test2;
  integer a,b;
  initial
    begin
      a<=10;
      b<=20;
      a<=#1 b; 
      b<=#2 a; 
    end
  initial $monitor("a=%0d b=%0d at t=%0t",a,b,$time);
endmodule
/*
1. all the statements are executed at t=0 time unit as it is non-blocking and assignment to L.H.S is scheduled at their respective intra-assignment delay
2.all the R.H.S of non-blocking assignment is evaluated at t=0,and value of b=X and a=X
  therefore,at t=1 time unit value of a=x and b=20
            at t=2 time unit value of a=x and b=x
*/

//code-6
module test3;
  integer a,b;
  initial
    begin
      a=10;
      b=20;
      a<=b; //all the non-blocking assignment gets executed after the execution of blocking assignment
      b<=a; 
    end
  initial $monitor("a=%0d b=%0d at t=%0t",a,b,$time);
endmodule
/*
1.begin-end block is sequential block,all the statements are executed sequentially
2.a=10 is blocking assignemt i.e until a=10 is executed all the statements below it will not execute
  a will get 10
  b will get 20
3.when above all blocking assignment gets executed then non-blocking executes.
4.blocking statements executes in active region and non-blocking assignment gets the value at L.H.S in NBA region
5.therefore a=20 b=10
*/

//code-7
module test3;
  integer a,b;
  initial
    begin
      a<=b;
      b<=a;
      a=10;
      b=20;
    end
  initial $monitor("a=%0d b=%0d at t=%0t",a,b,$time);
endmodule

/*
1.as begin-end block is sequential,
  R.H.S of all the non-blocking is evaluated at current time stamp and assignment is scheduled,the value of b and a at t=0 is a=x and b=x(default value of integer) 
2.then blocking assignments are executed
3.therefore value of a=x and b=x
*/

//code-8
module test3;
  integer a,b;
  initial
    begin
      repeat(2)
        begin
          a<=b;
          b<=a;
          a=10;
          b=20;
        end
    end
  initial $monitor("a=%0d b=%0d at t=%0t",a,b,$time);
endmodule

/*
1.in first iteration,a=x and b=x then a=10 and b=20 executed
2.in second iteration,when non-blocking assignment is encountered
   look at the previous value of R.H.S of non-blocking i.e b=20 a=10
   is assigned to L.H.S in NBA region i.e a=20 and b=10
*/


