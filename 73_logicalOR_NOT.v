//nuances in logical OR operator
module test;
  initial
    begin
      $display(2'b1x || 2'bxx); //treat x and z as 0 and check whether it becomes non-zero value or not,if it becomes non-zero value then result will be 1 else x
      $display(2'b0x || 2'bxx);
      $display("------------");
      $display(2'b1z || 2'bxx);
      $display(2'b0z || 2'bxx);
      $display("------------");
      $display(2'b1x || 2'bzz);
      $display(2'b0x || 2'bxz);
      $display("------------");
      $display(2'b1x || 2'bzz);
      $display(2'b0x || 2'bxz);
      $display("------------");
      $display(3'b1xx || 3'bxzz);
      $display(3'b0xx || 3'b1xz);
    end
endmodule

//nuances in logical NOT operator
module test;
  initial
    begin
      $display(!(2'b1x));
      $display(!(2'b0x));
      $display("-----------");
      $display(!(3'b11z));
      $display(!(3'b00z));
    end
endmodule
