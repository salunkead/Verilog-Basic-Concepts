//$strobe system task
/*
1.$strobe displays simulation data at the end of current simulation time,when all the simulation events that have occurred for that simulation time
*/
module strobe;
  reg a;
  initial
    begin
      //current simulation time is 0 time unit(no delay)
      //therefore $strobe prints value of a as 1
      a=1'b0;
      $strobe("strobe: value of a is %b",a);
      $display("display: value of a is %b",a);
      a=1'b1;
      //simulation time ends 
    end
endmodule
