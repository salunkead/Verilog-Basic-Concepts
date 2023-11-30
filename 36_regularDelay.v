//Procedural assignment delay-delays used in initial and always blocks-Regular delay
/*
1.Regular Delay:- defined on L.H.S
  1.in any verilog code the delay is specified by using #(hash symbol). i.e #5-> delay of 5 time unit
  2.when the delay is specified on the L.H.S of the procedural assignment operator,it means that execution of a procedural assignment is delayed by the number specified by the # operator.
  
*/

//Example-Regular delay
module regulardelay;
  parameter latency=20;
  parameter delta=2;
  reg x,y,z,p,q;
  initial
    begin
      x=0; //no delay
      $display("above statement x=0 is executed at t=%0t",$time); //at t=0 time unit
      #10 y=1; //delay execution of y=1 by 10 time unit
      $display("above statement y=1 is executed at t=%0t",$time); //at t=0+10=10 time unit
      #latency z=0; //delay control with identifier.delay of 20 time unit 
      $display("above statement z=0 is executed at t=%0t",$time); //at t=0+10+20=30 time unit
      #(latency+delta) p=1; //delay control with expression
      $display("above statement p=1 is executed at t=%0t",$time); //at t=0+10+20+22=52 time unit
    end
endmodule
