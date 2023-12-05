//FSM coding style - 3
/*
1.there are three always blocks used in this coding style of fsm
2.coding FSM with registered outputs eliminate combinational output logic.
3.coding FSM with registered outputs will ensure that the output will be glitch free
*/

//Example-1001 mealy sequence dectector
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
              nstate=s0;
            else
              nstate=s0;
          end
        default: nstate=s0;
      endcase
    end
  //Registered outputs sequential always block
  always@(posedge clk)
    begin
      if(rst)
        out<=1'b0;
      else
        begin
          case(pstate)
            s0:out<=1'b0;
            s1:out<=1'b0;
            s2:out<=1'b0;
            s3:
              begin
                if(in)
                  out<=1'b1;
                else
                  out<=1'b0;
              end
            default:out<=1'b0;
          endcase
        end
    end
endmodule
