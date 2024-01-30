//difference between case equality and equality operator

//Example-1 without using case equality operator
module test;
  initial
    begin
      if(3'b1x1 == 3'b1x1)
        $display("numbers are equal");
      else
        $display("numbers are not equal");
    end
endmodule

//Example-2 with case equality operator
module test;
  initial
    begin
      if(3'b1x1 === 3'b1x1)
        $display("numbers are equal");
      else
        $display("numbers are not equal");
    end
endmodule

//Example-3
module test;
  initial
    begin
      if(3'b1z1===3'b1z1)
        $display("numbers are equal");
      else
        $display("numbers are not equal");
    end
endmodule
