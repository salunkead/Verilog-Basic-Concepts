//Block statement-fork join
/*
1.parallel blocks are specified using fork and join keywords
2.statements inside fork-join block executes parallely.
3.order of execution of statements is controlled by the delay or event control assigned to each statement.
4.if the delay is specified,it is relative to the time the block was entered.
5.order of the statement in which they are written is not important as all the statements execute parallel
*/

//Example-The difference betwen begin-end and fork-join 
//code-1
module beginEnd;
  reg x,y;
  reg[1:0]z,w;
  initial
    begin    //sequential block used to group statements
      x=1'b0;  //executes at t=0
      #5  y=1'b1; //executes at t=5
      #10 z={x,y}; //executes at t=0+5+10=15
      #20 w={y,x}; //executes at t=0+5+10+20=35
      #21 $display("begin-end block: z=%0d w=%0d at t=%0t",z,w,$time); //executes at t=0+5+10+20+21=56
    end
endmodule

//code-2
module forkJoin;
  reg x,y;
  reg[1:0]z,w;
  initial
    fork    //parallel block used to group statements
      x=1'b0;  //executes at t=0
      #5  y=1'b1; //executes at t=5
      #10 z={x,y}; //executes at t=10
      #20 w={y,x}; //executes at t=20
      #21 $display("fork-join block: z=%0d w=%0d at t=%0t",z,w,$time); //executes at t=21
    join
endmodule

//code-order is not important in fork-join
module orderInForkJoin;
  initial
    fork
      #20 $display("executing first statement at t=%0t",$time); //this first statement executes at t=20,at last
      #2 $display("executing second statement at t=%0t",$time);
      #1 $display("executing third statement at t=%0t",$time);
      $display("executing last statement at t=%0t",$time); //this last statement executes at t=0,at first
    join
endmodule

