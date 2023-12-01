//casex,casez keywords
/*
1.there are two variations of the case statement.
  1.casex:- treates all x and z values in the case item or the case expression as don't care.
  2.casez:- treates all z values in the case alternatives or the case expression as don't cares.All bit positions with z can also be represented as ? in that position.
*/

//Example:-
//casex construct assigns priority based on the case values
//code-1 casex
module Casex;
  reg [3:0]encode;
  always@(encode)
    begin
      casex(encode)
        4'b1xxx:   //first priority
          begin
            $display("case item 1 is executed: when encode=%b",encode); //if M.S.B bit of encode is 1 then this statements will execute,M.S.B. should be 1 rest can be anything
            $display("-----------------------");
          end
        4'bx1xx:  //second priority
          begin
            $display("case item 2 is executed: when encode=%b",encode); //if bit no.2 of encode is 1 then this statement will execute, other bits can be anything.
            $display("-----------------------");
          end
        4'bxx1x: //third priority
          begin
            $display("case item 3 is executed: when encode=%b",encode); //if bit no.1 of encode is 1 then this statement will execute, other bits can be anything.
            $display("-----------------------");
          end
        4'bxxx1: //fourth priority
          begin
            $display("case item 4 is executed: when encode=%b",encode); //if L.S.B bit of encode is 1 then this statement will execute,other bits can be anything
            $display("-----------------------");
          end
        default:
          begin
            $display("default is executed: when encode=%b",encode);
            $display("-----------------------"); //if encode is 4'b000 then this statement will execute
          end
      endcase
    end
  
  initial
    begin
      encode=0;
      #10;
      encode=1;
      #10;
      encode=2;
      #10;
      encode=3;
      #10;
      encode=4;
      #10;
      encode=5;
      #10;
      encode=6;
      #10;
      encode=7;
      #10;
      encode=8;
      #10;
      encode=9;
      #10;
      encode=10;
      #10;
      encode=11;
      #10;
      encode=12;
      #10;
      encode=13;
      #10;
      encode=14;
      #10;
      encode=15;
      #10;
      encode=4'b10xz;
      #10;
      encode=4'bxxxx;
      #10;
      encode=4'bzzzz;
    end
endmodule

//code-2 casez
module Casez;
  reg [3:0]inputs;
  always@(inputs)
    begin
      casez(inputs)
        4'b0000:
          begin
            $display("exact match priority1:- inputs=%b",inputs);
          end
        4'b0xxx:
          begin
            $display("first bit 0 and rest are don't care-priority2:- inputs=%b",inputs);
          end
        4'b0zzz:
          begin
            $display("first bit 0 and reset are unknown('z')-lowest priority:- inputs=%b",inputs);
          end
        default:
          begin
            $display("None of the above:- inputs=%b",inputs);
          end
      endcase
    end
  
  initial
    begin
      inputs=4'b0000;
      #10;
      inputs=4'b0101;
      #10;
      inputs=4'b0xxx;
      #10;
      inputs=4'b0zzz;
      #10;
      inputs=4'b1001;
      #10;
      inputs=4'b1111;
      #10;
      inputs=4'b0101;
      #10;
      inputs=4'bx10x;
      #10;
      inputs=4'bz101;
      #10;
      inputs=4'b0101;
    end
endmodule
