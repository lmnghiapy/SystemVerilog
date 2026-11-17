class env;
    integer aqueue[$];

    function void push_fifo (integer ii);
        aqueue.push_back(ii);
    endfunction

    function integer pop_fifo ();
        pop_fifo = aqueue.pop_front();
    endfunction

    function void print_queue ();
        int n;
        int ii;
        int data;
        n = aqueue.size();
        for(ii = 0; ii < n; ii++) begin
            data = pop_fifo();
            $display("ii = %2d, %2d", data, ii);    
        end
    endfunction
endclass

module top;
    env env0;

    initial begin
        int i;
        env0 = new();
        
        for(i = 0; i < 10; i++)begin
            env0.push_fifo(i);
        end
        env0.print_queue();
    end
endmodule