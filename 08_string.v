/*
1.a string is a sequence of characters enclosed by double quote("") and contained on single line
2.8 bit is required to store one character
3.string can be stored in reg
4.the width of register variable must be large enough to store the string
*/
module string;
  reg [8*12:0]name;
  initial
    begin
      //12 characters requires a 12*8 or 96 bits wide register
      name="Amol Salunke";//12 characters
      $display("name=%s",name);
    end
endmodule
