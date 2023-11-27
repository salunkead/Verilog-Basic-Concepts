//parameters in verilog
/*
1.verilog allows constants to be defined in module by using the keyword parameter
2.parameters are not variables,they are constants
3.parameters can be changed at module instantiation
*/

//Example
module module1;
  parameter width=8;
  parameter depth=256;
  initial
    begin
      $display("width=%0d",width);
      $display("depth=%0d",depth);
    end
endmodule

module module2;
  //changing a module paramter during instantiation
  //assignment by ordered list
  //changing both width and depth
  module1 #(16,512) inst();
  //changing only width
  module1 #(32)inst1();
  //assignment by name
  //changing only depth
  module1 #(.depth(1024)) inst2();
endmodule
