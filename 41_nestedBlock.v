//Nested block
//blocks can be nested.sequential and parallel blocks can be mixed
module nestedBlock;
  reg x,y;
  reg[1:0] w,z;
  initial
    begin
      x=1'b0; //executes at t=0
      fork
        #5 y=1'b1; //executes at t=5
        #10 z={x,y}; //executes at t=10
      join
      #20 w={y,x}; //executes at t=10+20=30
      $display("z=%b w=%b at t=%0t",z,w,$time); //executes at t=10+20+0=30
    end
endmodule
