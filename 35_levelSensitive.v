//Level-sensitive event control
/*
1.The symbol @ provides edge sensitive control.
2.verilog allows level-sensitive control.i.e abitlity to wait for certain condition to be true before a statement or block of statement is executed.
3.the keyword wait is used for level-sensitive construct
*/

//Example:-code->Difference between edge sensitive event control and level sensitive event control
//always@(enable)->block will execute when enable changes from x to 0 or 1,from 1 to 0,x,from 0 to 1,x--> edge
//always wait(enable)-> will execute as long as enable is high(enable=1)-->level 1

module level;
  reg enable;
  always@(enable)
    begin
      $display("edge sensitive event executed at t=%0t",$time);
    end
  always
    begin
      wait(enable)
      begin
      $display("level sensitive event control executed at t=%0t",$time);
      end
      #1;
    end
  ///
  initial
    begin
      enable=0;
      #10;
      enable=1;
      #10;
      enable=0;
      #10;
      enable=1;
      #10;
      enable=1;
      #10;
      enable=0;
      #10;
      enable=1;
      #10;
      enable=1;
      #10;
      enable=1;
      #10;
      enable=1;
      #10;
      enable=0;
    end
  initial
    begin
      $dumpfile("level.vcd");
      $dumpvars;
      #100 $finish;
    end
endmodule
