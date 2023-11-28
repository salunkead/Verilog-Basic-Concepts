//reg data type can store 1,0,x(unknown),z(high impedance)
//in below code,i have taken negative number and z(high impedance) and performed logical AND,OR operation 
module operator;
  reg x,y,z;
  integer i;
  initial
    begin
      i=-1;
      x=1'b1;
      y=i&&x;             //i and x are non-zero numbers,therefore result of this operation is 1(true)
      $display("y=%b",y); 
      $display("--------------------------------");
      x=1'bz;
      z=1'b1;
      y=x&&z;           //value of x is high impedance and z is non-zero number,result is x(unknown)
      $display("y=%b",y);
      $display("--------------------------------");
      y=x||z;         //in case of logical OR,if any input is non-zero,result is 1(true)
      $display("y=%b",y);
      $display("--------------------------------");
      z=1'b0;
      y=x||z;        //value of x=1'bz and z=1'b0,logical OR is x(unknown)
      $display("y=%b",y);
      $display("--------------------------------");
    end
endmodule
