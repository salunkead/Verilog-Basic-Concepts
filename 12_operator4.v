//Reduction Operator
/*
1.reduction operators are and(&),nand(~&),or(|),nor(~|),xor(^) and xnor(~^)
2.reduction operator takes single operand and performs bitwise operation on single vector operand and produce single bit(1 bit) result
3.the main difference between reduction operator and bitwise operator is bitwise operations are on bits from two different operands,
  whereas reduction operation are on bits of same operand(single operand)
4.reduction operator works bit by bit from right to left
*/

module reduction;
  reg [3:0]a,b,c,d;
  initial
    begin
      a=4'b1010;
      b=4'b1101;
      c=4'b10x1;
      d=4'b1z01;
      $display("reduction and %b",&a);//1 & 0 & 1 & 0
      $display("reduction and %b",&b);
      $display("reduction and %b",&c);
      $display("reduction and %b",&d);
      $display("--------------------");
      $display("reduction or %b",|a);//1 | 0 | 1 | 0
      $display("reduction or %b",|b);
      $display("reduction or %b",|c);
      $display("reduction or %b",|d);
      $display("--------------------");
      $display("reduction nand %b",~&a);//1 ~& 0 ~& 1 ~& 0
      $display("reduction nand %b",~&b);
      $display("reduction nand %b",~&c);
      $display("reduction nand %b",~&d);
      $display("--------------------");
      $display("reduction nor %b",~|a);//1 ~| 0 ~| 1 ~| 0
      $display("reduction nor %b",~|b);
      $display("reduction nor %b",~|c);
      $display("reduction nor %b",~|d);
      $display("--------------------");
      $display("reduction xor %b",^a);//1 ^ 0 ^ 1 ^ 0
      $display("reduction xor %b",^b);
      $display("reduction xor %b",^c);
      $display("reduction xor %b",^d);
      $display("--------------------");
      $display("reduction xnor %b",~^a);//1 ~^ 0 ~^ 1 ~^ 0
      $display("reduction xnor %b",~^b);
      $display("reduction xnor %b",~^c);
      $display("reduction xnor %b",~^d);
      $display("--------------------");
    end
endmodule
