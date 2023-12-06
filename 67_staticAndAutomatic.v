//Static and automatic task
/*
1.Static task:-> 
  1. static tasks 'shares the same memory location' for their every local variables accross multiple calls.single memory location is shared for every call.
  2. all the formal paramters of task or function are like local variables
  3. when you declare a local variable inside a static task,the variables retains it's value between task calls
  4. by default, all the task declared inside module are static. 
2.Automatic task:->
  1. automatic task 'doesnot shares same memory location',different memory location is used for every automatic task call.
  2. variables inside an automatic task starts fresh with each call.(formal parameters of the task also)
  3. they have a new memory location for each task call,the values are not shared between different calls to the task.
*/

//Code.1 - static task
module Static;
  task call(input integer a,input reg[7*10:0] st); //static task-a and st shares same memory location for every call and values of a and b are retained for every call
    begin
      $display("value of a=%0d st=%0s at t=%0t",a,st,$time);
      #5;
      $display("value of a=%0d st=%0s at t=%0t",a,st,$time);
      a=a*2;
      $display("a=%0d st=%0s",a,st);
    end
  endtask
  
  initial
    fork
      begin
        #6;
        $display("first call............................!");
        call(4,"first");
      end
      begin
        #7;
        $display("second call............................!");
        call(2,"second");
      end
    join
endmodule

//Code.2 - automatic task
module Automatic;
  task automatic call(input integer a,input reg[7*10:0] st);  //automatic task ->a and st will have new memory location for each task call, and values are not shared between different call.
    begin
      $display("value of a=%0d st=%0s at t=%0t",a,st,$time);
      #5;
      $display("value of a=%0d st=%0s at t=%0t",a,st,$time);
      a=a*2;
      $display("a=%0d st=%0s",a,st);
    end
  endtask
  
  initial
    fork
      begin
        #6;
        $display("first call............................!");
        call(4,"first");
      end
      begin
        #7;
        $display("second call............................!");
        call(2,"second");
      end
    join
endmodule
