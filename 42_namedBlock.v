//Named block
/*
blocks can be given names
  1.local variables can be declared inside named block
  2.variables can be accessed by using hierarchical name referencing
  3.named block can be disabled i.e their execution can be stoped
*/

//Example
module namedBlock;
  initial
    begin:block1
      integer i; //local variables of block1,private property of block1
      i=200;
    end
  initial
    begin:block2
      //$display("value of i=%0d",i); //throws an error-> Failed to find 'i' in hierarchical name 'i
      $display("value of i=%0d of block1 can be accessed like this",block1.i);
    end
endmodule
