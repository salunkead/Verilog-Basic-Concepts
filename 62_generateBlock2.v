//Generate block - generate if-else
/*
1.we can instantiate module based on parameter value using generate if-else
2.the following things can be declared inside generate block
  1.integer,real,time,wire,reg,event etc 
  2.function and task
  3.initial,always block
*/

//Design Module
module half_adder(input a,b,output sum,carry);
  assign sum=a^b;
  assign carry=a&b;
endmodule

module full_adder(input a,b,c,output sum,carry);
  assign {carry,sum}=a+b+c;
endmodule

module top(input a,b,c,output sum,carry);
  parameter sel=0;
  generate
    if(sel)
      half_adder s1(a,b,sum,carry); //if sel is 1 then half-adder module will be instantiated else full adder module will be instantiated
    else
      full_adder s0(a,b,c,sum,carry);
  endgenerate
endmodule

//testbench
module testbench;
  reg a,b,c;
  wire sum,carry;
  defparam dut.sel=1;  //we can chage the parameter value here
  top dut(a,b,c,sum,carry);
  initial
    begin
      repeat(20)
        begin
          {a,b,c}=$urandom;
          #10;
        end
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0,dut);
    end
endmodule
