# Designing-ALU-with-VHDL

In this project, I designed a 32 bit ALU (Arithmetic Logic Unit) with carry, zero and overflow signals. There is a 4 bit input control signal for the ALU, which controls and selects its function. The function of this ALU are listed below:

- Control signal = "0000" : Signed addition.
- Control signal = "0001" : Unsigned addition.
- Control signal = "0010" : Signed subtraction.
- Control signal = "0011" : Unsigned subtraction.
- Control signal = "0100" : If input1<input2 then S=1 else S=0 (SLT).
- Control signal = "0101" : Unsigned SLT.
- Control signal = "0110" : Logical and.
- Control signal = "0111" : Logical or.
- Control signal = "1000" : Logical nor.
- Control signal = "1001" : Logical xor.
