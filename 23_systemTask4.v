//Simulation control system task,$stop,$finish
/*
1.the task $stop is provided to stop during a simulation.
  $stop task is used to whenever the designer wants to suspend the simulation and examine the values of the signals in the design.
2.the $finish task terminates the simulation
*/

//Example
module simulation_control;
  reg clk,rst;
  initial
    begin
      //stop at time 100 in simulation and examine the results
      //finish the simulation at time 500 time unit
      clk=1'b0;
      rst=1'b1;
      #100 $stop; //this will suspend the simulation
      #400 $finish; //this will terminate the simulation
    end
endmodule
