//The system task keyword $test$plusargs
/*
1.this system task allows you to access command line arguments provided during simulation
2.these command line arguments are commonly called as plusargs
3. $test$plusargs
  1. it is used to check for the presence of specific command line arguments during simulation
  2. returns a boolean value indicating whether a particular plusargs is specified
  3. it is often used for controlling simulation behavior based on user provided options
  4.it is used inside procedural block i.e always or initial
*/
//Example

module Testargs;
  integer a;
  initial
    begin
      a=252;
      if($test$plusargs("display"))  //on terminal if +display option is used then $test$plusargs returns logical 1 and then if block will be executed
        begin
          $display("+display option is used in command line");
          $display("value of a=%0d",a);
        end
      else
        begin
          $display("+display option is not used in command line");
          $display("cannot display value of a");
        end
    end
endmodule
