//nuances in logical AND operator in two bit operands
module test;
  initial
    begin
      $display(2'b10 && 2'bx1); //treat x,z as 0 and check whether it becomes non-zero value or not,if both values becomes non-zero then only result will be 1 else x
      $display(2'b01 && 2'bx1);
      $display(2'b10 && 2'b1x);
      $display("--------------------------");
      $display(2'b10 && 2'bx0);
      $display(2'b01 && 2'bx0);
      $display(2'b10 && 2'b0x);
      $display("--------------------------");
      $display(2'b10 && 2'bz1);
      $display(2'b01 && 2'bz1);
      $display(2'b10 && 2'b1z);
      $display("--------------------------");
      $display(2'b10 && 2'bz0);
      $display(2'b01 && 2'bz0);
      $display(2'b10 && 2'b0z);
      $display("--------------------------");
      $display(2'b1x && 2'bx1);
      $display(2'bx1 && 2'bx1);
      $display(2'b1x && 2'b1x);
      $display("--------------------------");
      $display(2'bx0 && 2'bx1);
      $display(2'b0x && 2'bx1);
      $display(2'bx0 && 2'b1x);
      $display("--------------------------");
      $display(2'b1z && 2'bx1);
      $display(2'bz1 && 2'bx1);
      $display(2'b1z && 2'b1x);
      $display("--------------------------");
      $display(2'bz0 && 2'bx1);
      $display(2'b0z && 2'bx1);
      $display(2'bz0 && 2'b1x);
      $display("--------------------------");
    end
endmodule
