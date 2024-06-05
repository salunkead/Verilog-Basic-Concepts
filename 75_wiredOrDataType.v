//wired-OR data type in verilog
/*
1.in a wor declaration,the value of the output is determined by logical or of the inputs
2.this means two or more values are driven to the wor variable,the final value will be logical OR of all the driven values.
3.in below example,two variables a and b drive the variable y,the value of the variable y is determined by logical OR of a and b
*/

//Example
module test;
  reg a,b;
  wor y;
  assign y=a;
  assign y=b;
  initial
    begin
      repeat(20)
        begin
          a=$random;
          b=$random;
          #(5+{$random}%6);
        end
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
    end
endmodule
