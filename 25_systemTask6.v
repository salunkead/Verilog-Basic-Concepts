//Random number generation in verilog $random
/*
syntax:- variable=$random(seed);
1.$random is used to generate random numbers.
2.this function returns 32 bit random number each time it is called.
3.$random generates signed integers i.e it can be positive or negative
4.seed parameter controls the number that $random returns i.e if $random(12) called two time with same seed=12 then it will produce same number both the times.
5.seed is optional, and if seed is not provided simulator uses a default seed 
6. $random%b :- generates numbers in the range -(b-1) to +(b-1)
7.{$random}%b :- generates numbers in the range 0 to +(b-1)
*/

//Example
module random;
  integer i;
  initial
    begin
      //$random
      i=$random; //generates 32 bit signed number i.e positive or negative number
      $display("i=%0d",i);
      $display("------------------");
      //$random%10 
      i=$random%10; //generates one random number in the range -(10-1) to +(10-1)=-9 to 9
      $display("i=%0d",i);
      $display("------------------");
      //{$random}%10
      i={$random}%10; ////generates one random number in the range 0 to +(10-1)=0 to 9
      $display("i=%0d",i);
      $display("------------------");
    end
endmodule
