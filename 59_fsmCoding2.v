//FSM coding style-2
module _1001detector(input clk,rst,input in,output reg out);
  parameter s0=2'b00,
            s1=2'b01,
            s2=2'b10,
            s3=2'b11;
  reg [1:0]pstate,nstate;
  
  //present state sequential block
  always @(posedge clk)
    begin
      if(rst)
        pstate<=s0;
      else
        pstate<=nstate;
    end
  //next state and outputs in single combinational block
  always@(*)
    begin
      case(pstate)
        s0:
          begin
            if(in)
              begin
                nstate=s1;
                out=1'b0;
              end
            else
              begin
                nstate=s0;
                out=1'b0;
              end
          end
        s1:
          begin
            if(!in)
              begin
                nstate=s2;
                out=1'b0;
              end
            else
              begin
                nstate=s1;
                out=1'b0;
              end
          end
        s2:
          begin
            if(!in)
              begin
                nstate=s3;
                out=1'b0;
              end
            else
              begin
                nstate=s1;
                out=1'b0;
              end
          end
        s3:
          begin
            if(in)
              begin
                nstate=s0;
                out=1'b1;
              end
            else
              begin
                nstate=s0;
                out=1'b0;
              end
          end
        default: nstate=s0;
      endcase
    end
endmodule

//testbench
module tb;
  reg clk,rst,in;
  wire out;
  reg [3:0] temp;
  _1001detector dut(clk,rst,in,out);
  initial clk=1'b0;
  always #10 clk=~clk;
  initial
    begin
      rst=1;
      in=0;
      #25;
      rst=0;
      temp=4'b1001;
      for(integer i=0;i<4;i=i+1)
        begin
          @(negedge clk)
          in=temp[i];
        end
    end
  initial
    begin
      $dumpfile("fsm.vcd");
      $dumpvars(0,dut);
      #150 $finish;
    end
endmodule
