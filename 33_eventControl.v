//Regular event control
/*
1.event-a change in the value of the register(reg,integer,real,time) or net(wire) datatype.
2.@ symbol is used to specify an event control(change in the value of the variable)
3.posedge means transition from 0 to x,z,or 1
4.negedge means transiton from 1 to x,z,or 0
ex. @(clock)q=d; //q=d is executed whenever signals clock changes value
    @(posedge clock)q=d; //q=d is executed whenever clock changes from 0 to 1,x,or z
    @(negedge clock)q=d; //q=d is executed whenever clock changes from 1 to 0,x,or z
    q=@(posedge clock) d; //d is evalued at current simulation time and assigned to q at posedge clock
*/

//Example-1
module change;
  reg [3:0]num;
  initial
    begin
      num=0; //changed from default value x to 0
      #10;
      num=0; //no change at t=10
      #10;
      num=5; //changed here at t=20
      #10;
      num=10; //changed here at t=30
      #10;
      num=5; //changed at t=40
      #10;
      num=5; //no change at t=50
      #10;
      num=15; //changed at t=60
    end
  //this always block gets executed only when num variable changes
  //if there is no change in the value of the variable then it won't execute
  always@(num)
    begin
      $display("num variable changed at t=%0d and it's value is %0d",$time,num);
    end
endmodule
