//Wired AND data type in verilog
/*
1.the wand data type is a specific type of wire that uses the AND function to find the resulting value when multiple drivers are present.
2.in a wand declaration,the value of the output is determined by the logical AND of the inputs.this means that if two or more values are driven to wand variable,the final value 
  will be logical AND of all the driven value.
3.in case of multibit value,each bit in the output is the logical and of corresponding bits in the inputs.
*/

//Example
module test;
  reg clk1,clk2;
  wand main_clk;
 
  always #5 clk1=~clk1;
  
  assign main_clk=clk1;
  assign main_clk=clk2;
  
  initial
    begin
      clk1=0;
      clk2=0;
    end
  
  initial
    begin
      #8;
      forever
        #5 clk2=~clk2;
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #100 $finish;
    end
endmodule
