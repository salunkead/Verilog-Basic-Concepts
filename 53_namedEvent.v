//Named event control 
/*
1.a named event is declared by the keyword event.
  syntax:-event event_name;
2.an event is triggered by the symbol (->)
3.the triggered event is recognized by the symbol @
*/

//Example-1
module Event;
  event ev;
  integer i;
  initial
    begin:block
      for(i=1;i<50;i=i+1)
        begin
          if(i==25)
            begin
              ->ev;
              disable block;
            end
          else
            $display("i=%0d at t=%0t",i,$time);
          #20;
        end
    end
  initial
    begin
      @(ev); //waits for the event to be triggered
      $display("named event trigger detected when i=%0d at t=%0t",i,$time);
    end
endmodule

//Example -2 
module Event;
  event ev;
  integer i;
  initial
    begin:block
      for(i=1;i<50;i=i+1)
        begin
          if(i==25)
            begin
              ->ev;
              disable block;
            end
          else
            $display("i=%0d at t=%0t",i,$time);
          #20;
        end
    end

  //using always block
  always@(ev)
    begin
      $display("named event trigger detected when i=%0d at t=%0t",i,$time);
    end
  
endmodule
