# Carry-Look-Ahead-Adder
This is my project for FPGA course

    Base on this truth table:
    A   B   Cin   Cout
    0   0    0     0
    0   0    1     0
    0   1    0     0
    0   1    1     1
    1   0    0     0
    1   0    1     1
    1   1    0     1
    1   1    1     1
   
Cout = (A and B) + ((A xor B) and Cin)
Define:
- carry generate : G = (A and B)
- carry propagate: P = (A xor B)

This is used to predict the carry out of the calculation
Sum:
S = A xor B xor Cin = P xor Cin
Cout = G + (P and Cin)
