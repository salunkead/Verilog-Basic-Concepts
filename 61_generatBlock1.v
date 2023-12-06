//Generate Block - generate for loop
/*
1. the generate statement in Verilog is a very useful construct that generates synthesizable code
2. the generate block is used for following things
    1.To generate multiple module instances.
    2.Conditionally instantiate a block of code based on the Verilog parameter, however, the parameter is not permitted in the generate statement.
3. syntax:- generate
             //statements
            endgenerate
4. the generate loop is similar to the for loop statement, but it uses genvar keyword as a loop variable.
5. genvar is an integer variable which must be a positive value.they may only be used inside generate block.they can be declared inside or outside generate block.
6. the genvar keyword is only used during the evaluation of generate block and does not exist during the simulation of the design. It needs to be used by a generate loop.
7. generate loop provides flexibility to reduce code lines by replacing repetitive statements to a single statement like for loop.
8. similar to a for loop, generate loops also can be nested with different genvar as an index variable
*/

//Example- 10 bit substractor using full substractor
//Design Modules

//half-Substractor Design Module
module half_sub(input a,b,output borrow,y);
  assign y=a^b;
  assign borrow=~a&b;
endmodule

//full substractor design using structural modeling
module full_sub(input a,b,c,output borrow,y);
  wire w1,w2,w3;
  half_sub h1(a,b,w1,w2);
  half_sub h2(w2,c,w3,y);
  or gate(borrow,w1,w3);
endmodule

//top level design module
module top(input [9:0]a,b,output borrow,output [9:0]y);
  wire [8:0]w;
  genvar i;

  generate                      //generate block to generate 10 instances of module full_sub(full substractor)
    for(i=0;i<10;i=i+1)
      begin:sub
        if(i==0)
          full_sub s1(a[i],b[i],1'b0,w[i],y[i]);
        else if(i!=0 && i!=9)
             full_sub s2(a[i],b[i],w[i-1],w[i],y[i]);
        else if(i==9)
          full_sub s3(a[i],b[i],w[i-1],borrow,y[i]);
      end
  endgenerate
endmodule

//testbench for 10 bit substractor
//Testbench Module
module test;
  reg [9:0]a,b;
  wire borrow;
  wire [9:0]y;
  top dut(a,b,borrow,y);
  initial
    begin
      repeat(30)
        begin
          a=$urandom_range(1000,500);
          b=$urandom_range(499,1);
          #20;
        end
    end
  
  initial $monitor("a=%d b=%d result=%d",a,b,{borrow,y});
  
  initial
    begin
      $dumpfile("f.vcd");
      $dumpvars;
    end
endmodule
