//array in verilog
/*
1.arrays are allowed in verilog for reg,integer,time and vector register data types
2.arrays are not allowed for real variables
3.arrays are accessed by <array_name>[<subscript>]
*/
//example
module array;
  integer in[0:2];     //an array of 3 in variables
  reg [2:0]reg1[0:2];  //array of 3 three-bit reg1 variables
  time t[0:2];        //array of 3 time variables
  initial
    begin
      //initialization of integer array 
      in[0]=25;
      in[1]=65;
      in[2]=100;
      //displaying initialized array
      for(integer i=0;i<3;i++)
        begin
          $display("i[%0d]=%0d",i,in[i]);
        end
      $display("----------------------------------------\n");
      //initialization of reg1 array
      reg1[0]=3'd4;
      reg1[1]=3'd7;
      reg1[2]=3'd2;
      //displaying initialized array
      for(integer i=0;i<3;i++)
        begin
          $display("reg1[%0d]=%0d",i,reg1[i]);
        end
      $display("----------------------------------------\n");
      //t array is initialized with simulation time 
      //this array stores the simulation time
      #5;
      t[0]=$time;
      #5;
      t[1]=$time;
      #5;
      t[2]=$time;
      //displaying initialized array
      for(integer i=0;i<3;i++)
        begin
          $display("t[%0d]=%0d",i,t[i]);
        end
    end
endmodule
