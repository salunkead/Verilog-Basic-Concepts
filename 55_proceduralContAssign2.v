//Procedural continuous assignments - force and release
/*
1.force and release can be used to override the assignment on nets and register
2.force and release statements are generally used for debuging process,where certain registers or nets are forced to a value and the effect on other registers and nets are noted.
3.force and release should not be used inside design block
*/

//Example-1
//T flip flop design block
module tff(reset,q,q_bar,t,clk);
  input t,clk,reset;
  output reg q;
  output q_bar;
  always@(posedge clk)
    begin
      if(reset)
        begin
          q<=1'b0;
        end
      else
        begin
          if(t)
            q<=~q;
          else
            q<=q;
        end
    end
  assign q_bar=~q; //continuous assignment not a procedural continuous assignment. L.H.S is wire type
endmodule

//testbench for t flip flop
module testbench;
  reg clk,reset,t;
  wire q,q_bar;
  tff dut(reset,q,q_bar,t,clk); //position based module instantiation
  initial clk=1'b0;
  always #5 clk=~clk;
  initial
    begin
      reset=1;
      #20;
      reset=0;
      repeat(20)
        begin
          @(negedge clk);
          t=$random;
        end
    end
  initial
    begin
      #25 force dut.q=1; //when simulation time is 25 time unit then value of the q is forced to 1
      #75 release dut.q; //when simulation time is 25+75=100 time unit then the forced value is released and normal operation of the design takes place
    end
  initial
    begin
      $dumpfile("assign.vcd");
      $dumpvars(0,dut);
      #200 $finish;
    end
endmodule
