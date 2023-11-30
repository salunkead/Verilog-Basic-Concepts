//Intra-assignment delay:R.H.S delay
/*
1.in verilog dealys are specified by using #(hash symbol)
2.if the delays are specified on the R.H.S of the assignment operator then it is called intra-assignment delay
3.such delay specifiction changes flow of activity in a different manner.
4.the main difference between regular delay and intra-assignment delay:-
  1.regular delay delays the execution of the entire assignment.
  2.intra-assignment delays compute the R.H.S expression at the current time and delays the assignment to L.H.S by the delay number specified.
  3.intra-assignment delays are like using regular delay with a temporary variable to store the current value of a right hand side expression.
*/

//Example- difference between regular and intra-assignment delay
//the difference is only evaluation of R.H.S
module intraDelay;
  reg x,y,z;
  //intra-assignment delay
  initial
    begin
      x=0;
      z=1;
      y=#5 x+z; //take value of x and z at the current time t=0
                //evaluate x+z at t=0 and then wait for 5 time units to assign value to L.H.S y
                //y=1 is assigned at t=5
      $display("intra delay executed at t=%0t y=%b",$time,y);
    end
endmodule

module regularDelay;
  reg x,y,z;
  initial
    begin
      x=0;
      z=1;
      #5 y=x+z; //take value of x and z at t=5,
                //evaluate the expression x+z at t=5 and assign it to y at t=5
      $display("regular delay executed at t=%0t y=%b",$time,y);
    end
endmodule
