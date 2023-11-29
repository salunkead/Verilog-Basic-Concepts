//`timescale compiler directive
/*
1.the `timscale compiler directive is used to set the time unit and time precision for the simulation
  syntax:- `timescale time_unit/time_precision
  1.time_unit:-specifies the basic time unit used in the simulation
  2.time_precision:-specifies the time precision
  time unit:-1.this represents base unit for simulation time.
             2.common value are 1ns(nano second),1us(micro second),1ms(millisecond) etc
             3.all the delays are multiplied with time unit.
  time precision:-specifies delay values are rounded off before being used in simulation.common value are 1ps(pico second),1ns(nano second)
  3. time_unit>=time_precision
     ex-`timescale 1ns/1ns:- time unit is 1 nano second and time precision is 1 nano second
  4.note:- `timescale 1ns/1ns--> divide-> time_unit/time_precision=1ns/1ns=10 raise to 0 then fractional part of the delay will be ignored.
           #12.5; delay will be rounded of to 13.
           `timescale 1ns/1ps--> divide->time_unit/time_precision=1ns/1ps=10^3 i.e three places will be there after a decimal point i.e ._ _ _
           #12.5; delay will be 12.5
*/

//example
`timescale 10ns/10ns
module test;
  reg reset;
  initial
    begin
      reset=0;
      #10; //delay=time_unit*delay_time=10ns*10=100ns
      //at 100 ns reset will become 1
      reset=1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #20 $finish;
    end
endmodule

//code-1 and code-2 ,explains point number 4
//code-1
`timescale 1ns/1ns
module test;
  initial
    begin
      #12.5;
      $display($realtime);
      //$time -returns integer time
      //$realtime -returns real time i.e time in decimal point
    end
endmodule

//code-2
`timescale 1ns/1ps
module test;
  initial
    begin
      #12.5;
      $display($realtime);
    end
endmodule


