`timescale 1ns/1ps

// Exhaustive self-checking testbench for ripple_carry_adder_4bit
module ripple_carry_adder_4bit_tb;
    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    integer i, j, k;
    integer errors = 0;
    reg [4:0] expected;

    ripple_carry_adder_4bit dut (
        .a(a), .b(b), .cin(cin), .sum(sum), .cout(cout)
    );

    initial begin
        $dumpfile("waves.vcd");
        $dumpvars(0, ripple_carry_adder_4bit_tb);

        for (i = 0; i < 16; i = i + 1)
            for (j = 0; j < 16; j = j + 1)
                for (k = 0; k < 2; k = k + 1) begin
                    a = i; b = j; cin = k;
                    #1;
                    expected = i + j + k;
                    if ({cout, sum} !== expected) begin
                        $display("FAIL: %0d + %0d + %0d = %0d (expected %0d)",
                                 a, b, cin, {cout, sum}, expected);
                        errors = errors + 1;
                    end
                end

        if (errors == 0) $display("PASS: all 512 cases correct");
        else             $display("FAILED: %0d errors", errors);
        $finish;
    end
endmodule
