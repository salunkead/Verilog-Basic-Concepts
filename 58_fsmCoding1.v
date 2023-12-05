//FSM coding style1
/*

*/

//Example- Design Module-1001 mealy detector
module _1001detector(input clk,rst,input in,output out);
  parameter s0=2'b00,
            s1=2'b01,
            s2=2'b10,
            s3=2'b11;
  reg [1:0]pstate,nstate;
  
  //present state sequential always block
  always @(posedge clk)
    begin
      if(rst)
        pstate<=s0;
      else
        pstate<=nstate;
    end
  
  //next state combinational always block
  always@(*)
    begin
      case(pstate)
        s0:
          begin
            if(in)
              nstate=s1;
            else
              nstate=s0;
          end
        s1:
          begin
            if(!in)
              nstate=s2;
            else
              nstate=s1;
          end
        s2:
          begin
            if(!in)
              nstate=s3;
            else
              nstate=s1;
          end
        s3:
          begin
            if(in)
              begin
                nstate=s0;
              end
            else
              begin
                nstate=s0;
              end
          end
        default: nstate=s0;
      endcase
    end
  //continuous assignment outputs
  assign out=(pstate==s3 && in==1)?1'b1:1'b0;
endmodule
