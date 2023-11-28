//Replication operator
/*
1.repetitive concatination of same number can be expressed by using a replication constant.
2.a replication constant specifies how many timesto replicate the number inside the bracket({})
*/

//Example
module replication;
  reg a;
  reg[1:0] b,c;
  reg[2:0]d;
  initial
    begin
      a=1'b1;
      b=2'b00;
      c=2'b10;
      d=3'b110;
      $display("result y=%b",{4{a}}); //y=4'b1111
      $display("result y=%b",{{4{a}},{2{b}}}); //y=8'b11110000
      $display("result y=%b",{{4{a}},{2{b}},c}); //y=8'b1111000010
      $display("result y=%b",{{2{c}},{2{d}}});  //y=10'b1010110110
    end
endmodule
