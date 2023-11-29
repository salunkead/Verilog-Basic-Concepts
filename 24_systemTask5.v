//System task $time
/*
1.$time returns an integer that is a 64 bit time,scaled(multiplied) to the timescale unit of the module that invoked it
*/

//Example
//`timescale timescale_unit/precision
`timescale 1ns/1ns
module time1;
  time t;
  initial
    begin
      //in begin-end block delays gets added
      t=$time; //simulation time is 0*1ns=0 ns
      $display("simulation time is %0t ns",t);
      #12;
      t=$time; //simulation time is 12*1ns=1 ns
      $display("simulation time is %0t ns",t);
      #10;
      t=$time; //simulation time is 0+12+10=22*1ns=22 ns
      $display("simulation time is %0t ns",t);
      #22;
      t=$time; //simulation time is 0+12+10+22=44 ns
      $display("simulation time is %0t ns",t);
    end
endmodule
