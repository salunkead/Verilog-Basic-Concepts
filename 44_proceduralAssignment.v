//Procedural Assignment(used inside initial,always block)
/*
1.procedural assignment update the values of reg ,integer,real and time datatype variables.
2.the value assigned to the variable remain unchanged until updated with other value.
3.these assignments are used inside initial,always block.
4.left hand side of the procedural assignment can be of the following
  1.reg,integer,real or time datatype variable.
  2.a bit select of these variables i.e addr[0]
  3.part select of these variables i.e add[31:16]
  4.concatination of any of above.
5.L.H.S of procedural assignment cannot be of net type(wire type) i.e wire a,b,c; initial c=a+b;
6.R.H.S of procedural assignment can be of any type net or register
7.there are two types of procedural assignment
  1.blocking assignment
  2.non-blocking assignment
*/
/*
1.Blocking assignment:-
  1.blocking assignment are represented with sign '='
  2.blocking assignment statements are executed in the order in which they are written inside a sequential block(begin-end)
  3.one statement blocks the execution of the other statement until it is executed
  4.any delay attached is also got added to delay in execution of next statement.
  5.(imp) a blocking assignment will not block the execution of statement that follow in parallel block
*/

//Example:in case of blocking assignment behaviour of regular and intra-assignment delay is same inside sequential block(begin-end)
//code-1 blocking assignment with regular delay
module blocking;
  reg x,y,z;
  reg [15:0]a,b;
  integer c;
  initial
    begin //sequential block-statement inside it execute in sequence
      x=0;
      y=1; //y=1 is executed only after x=0 is executed
      z=1;
      c=0;
      a=0;
      b=a;
      $display("all above statement execute at t=%0t",$time);
      #15 a[2]=1'b1;
      $display("a[2]=1'b1 execute at t=%0t",$time);
      #10 b[15:13]={x,y,z};
      $display("b[15:13]={x,y,z} execute at t=%0t",$time);
      c=c+1;
      $display("c=c+1 execute at t=%0t",$time); //this statement execute at last because all above statements block it's execution,therefore it execute at t=25 time unit
    end
endmodule

//code-2 blocking assignment with intra-assignment delay
module blocking;
  reg x,y,z;
  reg [15:0]a,b;
  integer c;
  initial
    begin //sequential block
      x=0;
      y=1;
      z=1;
      c=0;
      a=0;
      b=a;
      $display("all above statement execute at t=%0t",$time);
      a[2]= #15 1'b1;
      $display("a[2]=1'b1 execute at t=%0t",$time);
      b[15:13]=#10 {x,y,z};
      $display("b[15:13]={x,y,z} execute at t=%0t",$time);
      c=c+1;
      $display("c=c+1 execute at t=%0t",$time); //this statement execute at last because all above statements block it's execution,therefore it execute at t=25 time unit
    end
endmodule



















