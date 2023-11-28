//Shift operator
/*
1.shift operator are right shift(>>) and left shift(<<).
2.these operator shifts a vector operand to right or left by a specified number of bits.
3.operands are vector and number of bits to shift.
4.when the bits are shited,the vacants bit positions are filled with zeros.
*/

//Example
module shift;
  reg [3:0]a,b,c;
  reg[3:0]result;
  initial
    begin
      a=4'b1100;
      b=4'b1x10;
      c=4'b11z1;
      result=a>>1; //result is 4'b0110.shift right 1 bit.0 filled in M.S.B position
      $display("result %b",result);
      result=b>>1;
      $display("result %b",result);
      result=c>>1;
      $display("result %b",result);
      $display("------------------");
      result=a<<1; //result is 4'b100.shift left 1.0 filled in L.S.B
      $display("result %b",result);
      result=b<<1;
      $display("result %b",result);
      result=c<<1;
      $display("result %b",result);
      $display("------------------");
      result=a>>2; //result is 4'b0011.shift right 2.0's are filled in 3rd and 2nd position
      $display("result %b",result);
      result=a<<2; ////result is 4'b0000.shift left 2.0's are filled in 0th and 1st position
      $display("result %b",result);
    end
endmodule
