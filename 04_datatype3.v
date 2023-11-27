//integer,real and time register data types
/*
1. integer data type:-
   1.integer datatype is used to represent signed or unsigned integers.
   2.registers declared with reg data type stores values as unsigned quantities(only +),whereas integers stores values as signed quantities(+ and -).
   3.it is used as loop variables
   4.it is used for mathematical computation.
   5. default value is x

2. real data type:-
   1.real number constants or real register data types are declared with keyword real
   2.default value is 0.000

3. time 
   1. verilog simulation is done with respect to time.a special time register data type is used to store simulation time.
   2. default value is 0
   3. no of bits required to store time variable is 64 bits
*/

//example
module datatype;
  integer i; //syntax for declaring integer data type likewise real and time data type is declared
  real r;
  time t;
  initial
    begin
      $display("default value of integer data type %0d",i);
      $display("default value of real data type %0f",r);
      $display("default value of time data type %0t",t);
      //initialization
      i=123;
      r=23.2;
      #5;
      t=$time; //saves the current simulation time
      $display("value of i=%0d after initialization",i);
      $display("value of r=%0f after initialization",r);
      $display("current simulation time %0t",t);
    end
endmodule
