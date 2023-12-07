//A simple example on how to take two numbers from command line(command line arguments)
module adder;
  integer x,y,sum;
  initial
    begin
      if($test$plusargs("x=%0d",x,"y=%0d",y))
        begin
          $display("value of x and y taken from command line are x:%0d y:%0d",x,y);
          sum=x+y;
          $display("sum of numbers x and y is sum:%0d",sum);
        end
      else
        begin
          $display("values of x and y are not provided through command line");
        end
    end
endmodule

/*
1.to use this,you would run your simulation with plusargs specifying the value
 ex- to pass x and y value +x=25 +y=67
*/
