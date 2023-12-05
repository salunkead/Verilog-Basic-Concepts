//Overriding the parameters - defparam
/*
1.paramters can be defined inside the module,we can change the parameter values during module instantiation.
2.there are two ways to change the parameter value 
  1. using defparam statement
  2.during module instantiation(discussed in parameter file)
3.defparam statement:-
  1.parameter values can be changed in any module instance in the design with the keyword 'defparam'
  2.the hierarchical name of the moudule instance can be used to override the parameter values.
*/

//Example-
module test;
  parameter id=0;
  initial
    begin
      $display("the value of the id is %0d",id);
    end
endmodule

module top;
  defparam m1.id=256;
  defparam m2.id=965;
  test m1();
  test m2();
endmodule
