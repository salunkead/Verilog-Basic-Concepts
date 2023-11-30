//Zero control delay #0 delay
/*
1.procedural statements in different always-initial blocks may be evaluated at the same simulation time.the order of execution of these statements in different always-initial blocks is non-deterministic.
2.zero control delay is the method to ensure that the statements is executed last,after all other statements in that simulation time are executed.
3.this is used to eliminate race condition.
4.#0 delay provides a useful mechanism to control the order of the execution of the statements in simulation
*/
/*
1.race condition:-race condition happens when multiple processes or procedural block try to modify the same variable without proper synchronization
 in below code there are two initial blocks and both trying to update value of i at the same time i.e at t=0 time unit.
 the final value of i is unpredictable.the result depends upon order of execution of two process, and it may not be consistent acrosss different simulator.
*/
//Example-Race condition
module raceCondition;
  integer i;
  initial //process 1
    begin
      i=10;
    end
  initial //process 2
    begin
      i=20;
    end
  initial $display(i);
endmodule

//Example-zero delay
//to remove the race condition zero delay can be used
module zeroDelay;
  integer i;
  initial
    begin
      i=10;
    end
  initial
    begin
      #0 i=20;
    end
  initial $strobe("value of i=%0d",i);
endmodule
