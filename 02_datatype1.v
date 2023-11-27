/*
data types in verilog:-
1.net 
  1.net data type is used to represent wire.wires are used for connection between different hardware component.
  2.nets have values continously driven on them by the output of the device that they are connected to. i.e net data type require driver
  3.nets are declared with keyword 'wire'
  4.nets are 1 bit values by default
  5.default value of a net is z(high impedance)
  6 nets get the output value of their driver,if it doesnot have driver,it gets the value z
  syntax:-wire variable_name;
2.register:-
  1.register data type represents data storage elements.registers retain value until another value is placed onto them.
  2.register data type doesnot need any driver.
  3.register data type is declared by keyword 'reg'
  4.default value of reg is x(unknown)
  syntax:- reg variable_name;
*/

//an example of how registers and nets are used
module regwire;
  wire w;
  reg reset;
  initial
    begin
      $display("default value of wire data type %b",w);
      $display("default value of reg data type %b",reset);
      reset=1'b1; //initialized reset to 1
      $display("value after initialization reset=%b",reset);
    end
endmodule
