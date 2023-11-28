//Concatination operator
/*
1.the concatination operator({}) provides a mechanism to append multiple operands.
2.the operands must be sized,unsized operands are not allowed because the size of operands must be known for computation of the size of the result.
3.concatination are expressed as operands within curly braces,with commas separating the operands.
4.operands can be 1 bit nets or registers,vector nets or vector registers,bit select,part select or sized constants
*/

//Example
module concatenation;
  reg a;
  reg[1:0] b,c;
  reg[2:0]d;
  initial
    begin
      a=1'b1;
      b=2'b00;
      c=2'b10;
      d=3'b110;
      $display("result is 4 bit y=%b",{b,c}); //concatination of b and c
      $display("result is 11 bit y=%b",{a,b,c,d,3'b001}); //concatination of a,b,c,d and 3 bit number(sized number)
      $display("result is %b",{a,b[0],c[1]}); //concatination of a,l.s.b bit of b and 1st bit of c
    end
endmodule
