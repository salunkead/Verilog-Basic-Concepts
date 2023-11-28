//Equality operators
/*
1.Equality operators are logical equality(==),logical inequality(!=),case equality(===),case inequality(!==).
2.when used in an expression,equality operators returns logical value 1 if expression is true,0 if false
3.the logical equality operator(==,!=) will give x(unknown) if any operands has x,z in it's bits.
4.the case equality operator(===,!==) compare both the operands bit by bit and compare all the bits including x and z bits,
  the result is 1 if both operands match,0 if both operands do not match
5. case equality operator never results in an x.
*/

//Example
module equality;
  integer a,b;
  reg [3:0]x,y,z,m,n;
  initial
    begin
      a=4;
      b=3;
      x=4'b1010;
      y=4'b1101;
      z=4'b1xxz;
      m=4'b1xxz;
      n=4'b1xxx;
      $display("a==b %b",a==b); //results in logical 0,as a and b are not equal
      $display("x!=y %b",x!=y); //results in logical 1,as x and y are not equal
      $display("x==z %b",x==z); //if any operands has x or z,result will be x(unknown)
      $display("see this z==m %b",z==m); //in case of equality,if any operands has x or z,result will be x(unknown)
      $display("see this z===m %b",z===m); //in case of case equality,all the bits match including x and z,therefore results in logical 1
      $display("z===n %b",z===n);
      $display("m!==n %b",m!==n);
    end
endmodule
