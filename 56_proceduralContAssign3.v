//further on force and release
module test;
  wire out;
  reg a,b;
  assign out=a|b; //continuous assignment L.H.S is wire and written outside procedural block initial or always
  initial
    begin
      repeat(20)
        begin
          a=$random;
          b=$random;
          #10;
        end
    end
  initial
    begin
      #20 force out=a&b; //for t=20 to t=100,out will give and operation result between a and b
      #80 release  out;
    end
  initial
    begin
      $dumpfile("test.vcd");
      $dumpvars;
    end
endmodule
