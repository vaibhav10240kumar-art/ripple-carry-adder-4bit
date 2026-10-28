// 1-bit full adder
// sum  = a XOR b XOR cin
// cout = carry out when at least two inputs are 1
module full_adder (
    input  a,
    input  b,
    input  cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (a & cin);
endmodule
