//Multiway Branching- case statement
/*
1.nested if-else if is used to assign priority.
2.suppose if you donot want priority then you can go for case statement.
3.case is same as if-else if but without priority.
4.the keywords case,endcase and default are used in the case statement.
5.case statements can be nested. i.e case inside case
*/

//Example
//code-1
module alu_control;
  reg [1:0]control;
  integer a,b,y;
  always@(control)
    begin
      case(control)
        2'd0:          //if control=0 then this block of code will get executed
          begin
            y=a+b;
            $display("control is %0d and result is y=%0d at t=%0t",control,y,$time);
          end
        2'd1:       //if control=1 then this block of code will get executed
          begin
            y=a-b;
            $display("control is %0d and result is y=%0d at t=%0t",control,y,$time);
          end
        2'd2:     //if control=2 then this block of code will get executed
          begin
            y=a*b;
            $display("control is %0d and result is y=%0d at t=%0t",control,y,$time);
          end
        default:  //if control signal is 3 or x or z then this block will get executed
          begin
            $display("Invalid ALU control=%b at t=%0t",control,$time);
          end
      endcase
    end
  
  initial
    begin
      control=2'b1x; a=50;b=60;
      #10;
      control=2'bzz; a=20; b=30;
      #10;
      control=0;a=95;b=56;      
      #10;
      control=1;a=95;b=56;
      #10;
      control=2;a=5;b=56;
      #10;
      control=3;a=52;b=54;
    end
endmodule

//code-2 how to cover multiple condition in case alternative
module test;
  reg [2:0]control;
  always@(control)
    begin
      case(control)
        0,1:$display("case alternative is %0d",control);  //if value of control is 0 or 1 then this statement executes
        2,3:$display("case alternative is %0d",control);  //if value of control is 2 or 3 then this statement executes
        4,5:$display("case alternative is %0d",control);  //if value of control is 4 or 5 then this statement executes
        6,7:$display("case alternative is %0d",control);   //if value of control is 6 or 7 then this statement executes
        default:$display("case alternative is %0d",control);  //if value of control is x or z or any one bit of the control is x or z then this statement gets executed
      endcase
    end
  
  initial
    begin
      control=2'b1x;
      #10;
      control=2'bzz;
      #10;
      control=0;      
      #10;
      control=1;
      #10;
      control=2;
      #10;
      control=3;
      #10;
      control=4;
    end
endmodule
