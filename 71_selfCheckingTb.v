//Self-checking testbench of 4:1 mux
/*
1.a self-checking testbench in verilog is a simulation environment that automatically verifies if your design(module) behaves as expected.
2.instead of relying on a human to mannually inspect the simulation results,a self-checking testbench includes code to automatically compare the actual result with expected result
3.if there is mismatch between actual and expected values then error message will be generated,making it self-checking
*/

//Example
//Design module
module fourByOneMux(input s0,s1,i0,i1,i2,i3,output reg y);
  always@(*)
    begin
      case({s1,s0})
        2'b00:y=i0;
        2'b01:y=i1;
        2'b10:y=i2;
        2'b11:y=i3;
        default:y=0;
      endcase
    end
endmodule

//Self-checking testbench
module SelfCheck;
  reg s0,s1,i0,i1,i2,i3;
  wire y;
  fourByOneMux dut(s0,s1,i0,i1,i2,i3,y);
  initial
    begin
      repeat(10)
        begin
          {s1,s0}=$urandom;
          {i0,i1,i2,i3}=$urandom;
          #1;
          case({s1,s0})
            2'b00:
              begin
                if(y==i0)
                  $display("test passed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
                else
                  $display("test failed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
              end
            2'b01:
              begin
                if(y==i1)
                  $display("test passed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
                else
                  $display("test failed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
              end
            2'b10:
              begin
                if(y==i2)
                  $display("test passed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
                else
                  $display("test failed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
              end
            2'b11:
              begin
                if(y==i3)
                  $display("test passed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
                else
                  $display("test failed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
              end
            default:
              begin
                if(y==1'b0)
                  $display("test passed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
                else
                  $display("test failed:s0=%0b,s1=%0b,i0=%0b,i1=%0b,i2=%0b,i3=%0b-->y=%0b",s0,s1,i0,i1,i2,i3,y);
              end
          endcase
          #10;
        end
    end
  initial
    begin
      $dumpfile("mux.vcd");
      $dumpvars;
    end
endmodule
