//Structured procedures-initial block
/*
1.there are two structured procedures in verilog:initial and always
2.these two statements are most basic statements in behavioral modeling.
1) initial block
   1.an initial block starts at time 0,executes only once during simulation and then doesnot execute again.
   2.if there are multiple initial blocks,each block start to execute parallely at time 0 and each block finishes execution independently of other block.
   3. begin-end statements are used to group the multiple statements.if there is single statement inside initial block then begin-end is not necessary.
   4. initial blocks are typically used for initialization,monitoring,waveforms and other process that must be executed only once during entire simulation.
*/

//Example
module initial1;
  reg x,y,a,b,m;
  initial
    begin //multiple statements needs to be grouped by begin-end
      $display("first initial block start executing at time: %0t",$time);
      m=1'b0;
      $display("first initial block finish execution at time: %0t",$time);
    end
  initial
    begin
      $display("second initial block start executing at time: %0t",$time);
      #5 a=1'b1;
      #25 b=1'b0;
      $display("second initial block finish execution at time: %0t",$time);
    end
  initial
    begin
      $display("third initial block start executing at time: %0t",$time);
      #10 x=1'b0;
      #25 y=1'b1;
      $display("third initial block finish execution at time: %0t",$time);
    end
  initial //single statement; doesnot need to be grouped 
    #50 $finish;
endmodule
