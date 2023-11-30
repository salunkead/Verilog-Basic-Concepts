//Procedural assignment-Non-blocking assignment
/*
1.a non-blocking assignment is represented with the sign '<='
2.non-blocking assignment allows scheduling of assignment without blocking execution of the statements that follows in sequential block.
3.all the non-blocking assignment executes in parallel.
4.for all the non-blocking assignments in a block,the right hand side is evaluated first,later the specified assignments are scheduled. 
*/

//Example-behaviour of non-blocking assignment for regular and intra-assignment delay
//and it is different
//code-1-non-blocking assignment with regular delay
module Non_blocking1;
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
      $strobe("all above statement execute at t=%0t",$time);
      #15 a[2]<=1'b1;
      $strobe("a[2]=1'b1 execute at t=%0t",$time);
      #10 b[15:13]<={x,y,z};
      $strobe("b[15:13]={x,y,z} execute at t=%0t",$time);
      c<=c+1;
      $strobe("c=c+1 execute at t=%0t",$time); 
    end
endmodule

//code-2 non-blocking assignment with intra-assignment delay(see the waveforms for complete understanding)
module Non_blocking2;
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
      $strobe("all above statement execute at t=%0t",$time);
      a[2]<=#15 1'b1; //R.H.S of all the non-blocking assignment evaluated at t=0 and scheduled at their respective intra-assignment delay
      $strobe("a[2]=1'b1 execute at t=%0t",$time); //all the above and below statements execute at t=0 time unit
      b[15:13]<=#10 {x,y,z}; //b[15:13] is scheduled at t=10 time unit
      $strobe("b[15:13]={x,y,z} execute at t=%0t",$time);
      c<=c+1;
      $strobe("c=c+1 execute at t=%0t",$time);
      //below part is redundant-it was added just to get the value of a at t=15 time unit on waveform
      #20;
      z=0;
    end
  initial
    begin
      $dumpfile("non.vcd");
      $dumpvars;
    end
endmodule
