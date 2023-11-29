//System task $dumpfile and $dumpvars()
/*
1.V.C.D(Value Change Dump) file:-
  1.vcd file is the file format used in digital simulation to record changes in signal values over time.
  2.it's like keeping a log of how the signals in your digital design changes during simulation.
  3.system task -->$dumpfile("file_name.vcd"); //dump all the simulation information into file_name.vcd file
  4.system task -->$dumpvars(scope,variables); //it is used to specify which variables or signals you want to include in v.c.d file during simulation
    scope-an optional argument that specifies the hierarchical scope of the variable
    variables:-list of variables or signals that you want to include in the v.c.d file

  let's break the words in vcd:-
  1.value change:-it records when the value of a digital signal changes,such as a flip flop toggling from 0 to 1
  2.dump:-it's like taking a snapshot or dumping the current values of all the signals at specific times
  so,a VCD file is the timeline or a movie script that captures how the signals in your digital design evolve during simulation.
  tools like waveform viewer use this file to graphically display the signals in your design

  syntax:
  initial $dumpfile("dump.vcd"); //simulation information dumped into the file dump.vcd
  initial $dumpvars; //no arguments means dump all the signals of the design 
*/

//Example
module example;
  reg [7:0]data,data1,data2;
  initial
    begin
      data=0;
      data1=50;
      data2=100;
      #20;
      data=20;
      #20;
      data=30;
      data1=60;
      #20;
      data=40;
      data2=200;
      #20;
      data=60;
      data1=70;
    end
  initial
    begin
      $dumpfile("example.vcd");
      $dumpvars; //no arguments means dump all the variables of module
      //$dumpvars(0,data,data1); //dump only data and data1 into the v.c.d file
      //$dumpvars(0,data); //dump only data into the v.c.d file
    end
endmodule
