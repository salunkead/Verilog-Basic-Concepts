//$value$plusargs()
//A simple example on how to take number from command line(command line arguments)

module adder;
  integer x;
  initial
    begin
      $value$plusargs("x=%0d",x);
      case(x)
        1:$display("1 Entered from command line");
        2:$display("2 Entered from command line");
        3:$display("3 Entered from command line");
        4:$display("4 Entered from command line");
        5:$display("5 Entered from command line");
        6:$display("6 Entered from command line");
        7:$display("7 Entered from command line");
        8:$display("8 Entered from command line");
        9:$display("9 Entered from command line");
        10:$display("10 Entered from command line");
        default:$display("value entered from command line is greater than 10");
      endcase
    end
endmodule

