//logical operator in verilog
/*
1.logical operators are &&(AND),||(OR),!(NOT)
2.evaluates to single bit value (1-true 0-false x-unknown)
3.in case of logical operator,keep in mind disable condition of AND gate,OR gate
  in case of logical operator,any non-zero value is considered as '1' and zero as '0'
  for AND gate--> any input is 0,don't look another input--> output=0
  for OR gate--> any input is 1,don't look another input--> output=1
4.logical AND of non-zero value with unknown(x)-->x(unknown)
5.logical OR of unknown(x) with 0-->x (unknown)
6.logical not of unknown(x) is -->x (unknown)
*/

//Example
module logical_op;
  reg [2:0]a,b,c;
  reg x,y,z,j;
  initial
    begin
      a=3'd5;
      b=3'b111;
      c=3'bx;
      //logical AND operator
      x=a&&b;
      y=b&&c;
      z=a&&3'd0;
      j=c&&3'd0;
      $display("a&&b=%b",x);
      $display("b&&c=%b",y);
      $display("a&&3'd0=%b",z);
      $display("c&&3'd0=%b",j);
      $display("---------------------------------------");
      //logical OR operator
      x=a||b;
      y=b||c;
      z=a||3'd0;
      j=c||3'd0;
      $display("a||b=%b",x);
      $display("b||c=%b",y);
      $display("a||3'd0=%b",z);
      $display("c||3'd0=%b",j);
      $display("----------------------------------------");
      //logical not operator
      $display("!c=%b",!c);
      $display("!a=%b",!a);
    end
endmodule
