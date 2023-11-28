//$monitor system task
/*
1.$monitor is used to monitor a signal when it's value changes.
  usage:$monitor(p1,p2,p3....); p1,p2.. can be variable,signal name 
2.$monitor continously monitors the values of the signal specified in the parameter list and displays all the parameters in list whenever the value of any one variable/signal changes.
3.typically,$monitor is placed in the initial or always block to ensure that it start monitoring from the begining of the simulation
  placement in initial block
  initial
    begin
    $monitor(); //at the top,to monitor all the time stamps below
    //rest of the code
    end
4. $monitoroff and $monitoron:-
   $monitoron:-enables monitoring
   $monitoroff:- disables monitoring
*/

//Example:
module monitor;
  reg [1:0]a;
  initial
    begin
      a=2'b00;
      #5;
      a=2'b01;
      #5;
      a=2'b10;
      #5;
      a=2'b11;
    end
  initial
    begin
      $display("$display: value of a=%b",a);
      $display("-------------------------");
      $monitor("$monitor: value of a=%b",a);
    end
endmodule

//Example
module monitor1;
  reg [1:0]a;
  initial
    begin
      a=2'b00;
      #5;
      a=2'b01;
      #5;
      a=2'b10;
      #5;
      a=2'b11;
    end
  initial
    begin
      $monitor("$monitor: value of a=%b at t=%0t",a,$time); //doesnot displays changes between 5 to 15 
      #5;
      $monitoroff; //at time t=5 time unit disable monitoring
      #10;
      $monitoron; //at time t=10 time unit enable monitoring
    end
endmodule
