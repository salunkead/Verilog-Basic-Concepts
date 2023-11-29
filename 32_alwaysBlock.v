//Structured procedures-always block
/*
1.the always statement starts at time 0 and executes the statements inside it continuously in looing fashon
2.always block is like inifinite loop(which never stops till infinite time) unless $finish or $stop is used in simulation.
3.if there are more than one always statements present in code then each always block executes at time t=0 and all the always blocks runs parallely.
4.L.H.S of assignment operator inside always or initial block must be of register type (reg,integer,real,time etc).
*/

//Example-1 difference between initial and always block
module always1;
  initial //executes only once
    begin
      $display("initial block");  
    end
  always //executes repeatedly until simulation is finished
    begin
      $display("always block");
      #1;
    end
  initial 
    #50 $finish; //$finish is used to terminate simulation at t=50 time unit
endmodule

//Example-2
module always2;
  //all the always block executes parallely
  always
    begin
      $display("always block1 starts at t=%0t",$time);
      #2;
    end
  always 
    begin
      $display("always block2 starts at t=%0t",$time);
      #1;
    end
  initial 
    #50 $finish; //$finish is used to terminate simulation at t=50 time unit
endmodule

//Example-3 Generation of clock of time period 10 time unit using always block
module always3;
  reg clock;
  initial clock=1'b0;
  always #5 clock=~clock;
  initial
    begin
      $dumpfile("clock.vcd");
      $dumpvars;
      #50 $finish; //$finish is used to terminate simulation at t=50 time unit
    end
endmodule
