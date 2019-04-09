module timer(clk, FAB_INT_OUT);
input clk;
output reg FAB_INT_OUT;

`define period 10000000

reg [31:0] count;

always @(posedge clk)
begin
    if (count == `period)
    begin
        FAB_INT_OUT <= 1;
        count[31:0] <= 0;
    end
    else
    begin
        FAB_INT_OUT <= 0;
        count <= count + 1;
    end
end
endmodule
