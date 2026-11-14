class trans;
    rand bit[31:0] addr;
    constraint c_align {
        addr[2:0] == 3'b000;
    };

    constraint c_dist {
        addr dist{
            [32'h0000_0000 : 32'h1fff_ffff] :/ 20,
            [32'h2000_0000 : 32'h4fff_ffff] :/ 20,
            [32'h5000_0000 : 32'h7fff_ffff] :/ 20,
            [32'h8000_0000 : 32'hafff_ffff] :/ 20,
            [32'hb000_0000 : 32'hffff_ffff] :/ 20
        };
    }

endclass

class env;
    trans trans0;
    function void print_addr();
        trans0 = new;
        for(int i =0; i < 10; i++) begin
            if(!trans0.randomize()) begin
                $display("i = %2d RANDOMIZE FAILED", i);
            end else begin
                $display("i = %2d %X", i, trans0.addr);
            end
        end
    endfunction
endclass

module top;
    env env0;
    initial begin
        env0 = new;
        env0.print_addr();
    end
endmodule