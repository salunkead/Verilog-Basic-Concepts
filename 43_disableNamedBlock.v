//Disabling named block
/*
1.the keyword disable provides a way to terminate the execution of a block.
2.disable can be used to get out of the loops,handle error conditions or control execution of piece of code,based on control signal
3.disable can be used to break multiple loops
*/

//code-1 without disable keyword observe execution
module withoutDisable;
  initial
    begin:block //named block ->begin:name_of_the_block
      $display("statement1");
      $display("statement2");
      $display("statement3");
      $display("statement4");
      $display("statement5");
    end
endmodule

//code-2 with disable observe keyword
module withDisable;
  initial
    begin:block //named block ->begin:name_of_the_block(: colon)
      $display("statement1");
      $display("statement2");
      $display("statement3");
      disable block;
      $display("statement4");
      $display("statement5");
    end
endmodule

//example:loop termination
//code-3 without disable
module loop;
  integer i;
  initial
    begin
      for(i=1;i<=100;i=i+1)
        begin
          $display("i=%0d",i);
        end
    end
endmodule

//code-4 with disable
module loopTermination;
  integer j;
  initial
    begin:loop //named block ->begin:name_of_the_block
      for(j=1;j<=100;j=j+1)
        begin
          if(j==51) //this loop will stop executing when j=51
            disable loop;
          else
            $display("j=%0d",j);
        end
    end
endmodule

//code-5 multiple loop
module multipleLoop;
  integer i,j;
  initial
    begin:loop
      for(i=0;i<5;i=i+1)
        begin
          for(j=0;j<5;j=j+1)
            begin
              $display("i=%0d j=%0d",i,j);
            end
        end
    end
endmodule

//code-6 disabling multiple loop
module loopTermination2;
  integer i,j;
  initial
    begin:loop
      for(i=0;i<5;i=i+1)
        begin
          for(j=0;j<5;j=j+1)
            begin
              if(i==3 && j==0)
                disable loop;
              else
                $display("i=%0d j=%0d",i,j);
            end
        end
    end
endmodule
