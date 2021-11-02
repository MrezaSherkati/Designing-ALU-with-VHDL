--Mohammadreza Sherkati
--A code for 32 bit ALU with overflow and carry out and zero signals
--Home work number four for VHDL course

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu32b is
  port( a,b: in std_logic_vector(31 downto 0);
    m: in std_logic_vector(3 downto 0);
    s: out std_logic_vector(31 downto 0);
    z,c,ovf: out std_logic);
  end alu32b;
  
architecture behave of alu32b is
  signal sum,sumu,diff,diffu: std_logic_vector(32 downto 0);
  begin
    
    sum<= std_logic_vector(resize(signed(a),33)+resize(signed(b),33));
    sumu<= std_logic_vector(resize(unsigned(a),33)+resize(unsigned(b),33));
    diff<= std_logic_vector(resize(signed(a),33)-resize(signed(b),33));
    diffu<= std_logic_vector(resize(unsigned(a),33)-resize(unsigned(b),33));
    
    s<= sum(31 downto 0) when (m="0000") else
        sumu(31 downto 0) when (m="0001") else
        diff(31 downto 0) when (m="0010") else
        diffu(31 downto 0) when (m="0011") else
        "00000000000000000000000000000001" when (m="0100" and signed(a)<signed(b)) else
        "00000000000000000000000000000000" when (m="0100" and signed(a)>=signed(b)) else
        "00000000000000000000000000000001" when (m="0101" and unsigned(a)<unsigned(b)) else
        "00000000000000000000000000000000" when (m="0101" and unsigned(a)>= unsigned(b)) else
        a and b when (m="0110") else
        a or b when (m="0111") else
        a nor b when (m="1000") else
        a xor b;
        
    z<= '1' when (m="0010" and signed(a)=signed(b)) else '0';
    
    c<= sum(32) when (m="0000") else
        sumu(32) when (m="0001") else
        diff(32) when (m="0010") else
        diffu(32) when (m="0011") else
        '0';
        
        
    ovf<= '1' when (m="0000" and a(31)='1' and b(31)='1' and sum(31)='0') else
          '1' when (m="0000" and a(31)='0' and b(31)='0' and sum(31)='1') else
          '1' when (m="0010" and a(31)='0' and b(31)='1' and diff(31)='1') else
          '1' when (m="0010" and a(31)='1' and b(31)='0' and diff(31)='0')  else
          '0';
          
  end behave;