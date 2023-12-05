//Procedural continuous assignments-assign and deassign
/*
1.procedural assignment is used to assign value to the register i.e integer,real,reg,time etc
2.value of the register doesnot change until the value is updated with another value
3.the procedural continuous assignment behave differently
4.it allows value of the expression to be driven continuously onto the register or nets for limited period of time
5.procedural continuous assignments override existing assignments to the nets or register
6.the left hand side of the assign and deassign statement should be of reg type only.it cannot be of the type net.
*/

//Example-1

//Design module
module dff(reset,q,q_bar,d,clk);
  input d,clk,reset;
  output reg q,q_bar;
  always@(posedge clk)
    begin
      q=d;
      q_bar=~d;
    end
  always@(reset)                //when ever the value of the reset changes then this always block will execute
    begin
      if(reset)                 //if reset goes high then override the values of q and q_bar with q=0 and q_bar=1
        begin
          assign q=1'b0;          //procedural continuous assignment
          assign q_bar=1'b1;
        end
      else                      //if reset goes low then donot override the values 
        begin
          deassign q;
          deassign q_bar;
        end
    end
endmodule

//testbench module
module testbench;
  reg clk,reset,d;
  wire q,q_bar;
  dff dut(reset,q,q_bar,d,clk); //position based module instantiation
  initial clk=1'b0;
  always #5 clk=~clk;
  initial
    begin
      repeat(20)
        begin
          @(negedge clk);
          reset=$random;
          d=$random;
        end
    end
  initial
    begin
      $dumpfile("assign.vcd");
      $dumpvars(0,dut);
      #200 $finish;
    end
endmodule
