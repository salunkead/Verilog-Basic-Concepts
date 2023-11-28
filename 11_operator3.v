//Bitwise operator
/*
1.bitwise operator performs bit-by-bit operation on two operands
2.bitwise operators in verilog are negation(~),and(&),or(|),xor(^),xnor(~^)
3.a z(high impedance) is treated as x(unknown) in bitwise operation.
4.negation(~)- operator take only one operand(negation is not operation)
*/

//Example
 module bitwise;
  reg [3:0]a,b,c,d;
  initial
    begin
      a=4'b1010;
      b=4'b1101;
      c=4'b10x1;
      d=4'b10z1;
      $display("bitwise AND1 %b",a&b);    //normal and operation
      $display("bitwise AND2 %b",a&c);    //in case bitwise AND,if any one input is 0,output will be 0,if input is 1 and other input is x or z then output will be x
      $display("bitwise AND3 %b",a&d);
      $display("--------------------------");
      $display("bitwise OR1 %b",a|b);     //normal or operation between a and b
      $display("bitwise OR2 %b",a|c);    //in case of bitwise OR,if any one input is 1,output will be 1,if input is 0 and other input i x or z then output will be x
      $display("bitwise OR3 %b",a|d);
      $display("--------------------------");
      $display("bitwise negation(~) %b",~a);  //normal not operation
      $display("bitwise negation(~) %b",~b);
      $display("bitwise negation(~) %b",~c);  //not(~) of x or z is x
      $display("bitwise negation(~) %b",~d);
      $display("-------------------------");
      $display("bitwise xor(^) %b",a^b);
      $display("bitwise xor(^) %b",a^c);
      $display("bitwise xor(^) %b",a^d);
      $display("---------------------");
      $display("bitwise xnor(~^) %b",a~^b);
      $display("bitwise xnor(~^) %b",a~^c);
      $display("bitwise xnor(~^) %b",a~^d);
    end
endmodule
