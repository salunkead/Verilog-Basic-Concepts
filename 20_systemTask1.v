//system task in verilog
/*
1.verilog provides standard system task to do certain routine operations
2.All the system task appear in the form $<keyword>
3.$display and $write system task is used to display specified variables
  main difference between $display and $write:-
  $display- adds new line character(\n) automatically
  $dwrite- doesnot add new line character
*/
//$display & $write system task and format specifier in verilog
/*
format specifier:-it is like template or code that tells compiler how to display different type of data
format specifier   |    meaning
---------------------------------------
        %d         | display variable in decimal
        %b         | display variable in binary  
        %h         | display variable in hexa-decimal 
        %o         | display variable in octal 
        %t         | display in current time format
        %f         | display real number
        %m         | display hierarchical name
        %s         | display string
        %e         | display real number in scientific format(e.g 3.14e10)   
*/

//Example-1
module display;
  reg [7:0] var1;
  time t;
  real r;
  initial
    begin
      var1=125;
      r=0.0000421;
      $display("var1 in decimal format %d",var1);
      $display("var1 in binary format %b",var1);
      $display("var1 in hexa-decimal %h",var1);
      $display("var1 in octal %o",var1);
      $display("real number %f",r);
      $display("real number in scientific format %e",r);
      $display("hierarchical name=%m");
      #5;         //delay of 5 time unit
      t=$time;   //$time return current simulation time
      $display("t=%t",t);
      $display("-------------------------------");
      ///difference between $write() and $display
      $display("Amol");
      $display("Salunke");
      $write("Amol");
      $write("Salunke");
    end
endmodule
