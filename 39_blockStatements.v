//Block statements-begin-end
/*
1.Block statements are used to group multiple statements to act together as one.
2.Block Types:-
 1.sequential block(begin-end):-
   1.the keywords begin and end are used to group statements into sequential blocks.
   2.statements inside begin-end block execute sequentially(one after another).
   3.the statements inside begin-end executes in the order in which they are written.
   4.delays gets added into the sequential block except for non-blocking intra-assignment delay i.e y<= #10 a;
*/

//Example 1 sequential block without delay
/*
the statements inside begin-end block executes in order(only for blocking assignment '=')
the final values are x=0,y=0,z=1,w=2 at t=0 time unit
*/
module beginAndEnd;
  reg x,y;
  reg[1:0]z,w;
  initial
    begin    //sequential block used to group statements
      x=1'b0;
      y=1'b1;
      z={x,y};
      w={y,x};
      $display("z=%0d w=%0d at t=%0t",z,w,$time);
    end
endmodule

//Example-2 sequential block with delay
/*
the statements inside begin-end block executes in order(only for blocking assignment '=')
the final values are x=0,y=0,
z=1,w=2 at t=35 time unit
*/
module beginAndEnd1;
  reg x,y;
  reg[1:0]z,w;
  initial
    begin    //sequential block used to group statements
      x=1'b0;      //completes execution at t=0 time unit
      #5   y=1'b1; //completes execution at t=0+5=5 time unit
      #10 z={x,y}; //completes execution at t=0+5+10=15 time unit
      #20 w={y,x}; //completes execution at t=0+5+10+20=35 time unit
      $display("z=%0d w=%0d at t=%0t",z,w,$time); //completes execution at t=0+5+10+20=35 time unit
    end
endmodule
