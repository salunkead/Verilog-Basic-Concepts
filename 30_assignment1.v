//Continuous assignment
/*
1.assigns value to the nets(wire).it is typically used outside procedural block(i.e initial,always)
  syntax:-
    assign output_signal=operand1 operator operand2; or
    assign output_signal=input_signal1 operator input_signal2
2.characteristics of continuous assignment:-
  1.L.H.S of continuous assignment must always be net(wire)(1 bit wire type variable,vector(multibit) of wire type,part select of vector,concatination of nets(wire)) type.
  2.L.H.S cannot be register type
  3.continuous assignments are always active i.e assignment expression gets evaluated as soon as one of the R.H.S operand changes and value is assigned to L.H.S
  4.R.H.S of continuous assignment can be of any type i.e register,nets or function call
  5.delays are specified like this ex--> assign #delay_value y=a^b;
*/

//Example-1
module assign1;
  wire y;
  reg a,b;
  //R.H.S of continuous assignment can be wire or reg type
  assign y=a|b;
  initial
    begin
      a=0;b=0;
      #10;
      a=1; b=0;
      #20;
      a=0; b=1;
      #30;
      a=1; b=1;
    end
  initial
    begin
      $dumpfile("assign1.vcd");
      $dumpvars;
    end
endmodule

//Example-2
module assign2;
  wire[3:0] sum;
  wire carry;
  reg [3:0]in1,in2;
  //continuous assignment
  //concatination of two nets->scaler(1 bit wire) and vector(multibit wire)
  assign {carry,sum}=in1+in2;
  
  //inputs
  initial
    begin
      in1=0;
      in2=0;
      #10;
      in1=10;
      in2=10;
      #20;
      in1=20;
      #30;
      in2=50;
    end
  initial $monitor("in1=%0d in2=%0d --> sum=%0d",in1,in2,{carry,sum});
  initial
    begin
      $dumpfile("assign2.vcd");
      $dumpvars;
    end
endmodule

//Example-3 continuous assignment and delays
module assign3;
  reg a,b;
  wire y;
  //whenever any one of the operand on R.H.S changes
  //R.H.S will be computed after 2 time unit delay,then the result will be assigned to L.H.S
  assign #2 y=a^b;
  initial
    begin
      a=0;
      b=0;
      #10;
      a=1;
      b=0;
      #20;
      a=0;
      b=1;
      #20;
      a=1;
      b=1;
    end
  initial
    begin
      $dumpfile("assign3.vcd");
      $dumpvars;
    end
endmodule
