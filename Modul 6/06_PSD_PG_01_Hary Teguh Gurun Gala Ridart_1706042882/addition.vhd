library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity addition is
    Port ( NUM1 : in  STD_LOGIC_VECTOR (3 downto 0) := "1111";
           NUM2 : in  STD_LOGIC_VECTOR (3 downto 0) := "1111";
           SUM  : out STD_LOGIC_VECTOR (3 downto 0));
end addition;

architecture Behavioral of addition is
    signal A :  STD_LOGIC_VECTOR (3 downto 0);
    signal B :  STD_LOGIC_VECTOR (3 downto 0);
    signal X :  STD_LOGIC_VECTOR (3 downto 0);
begin
    
    X <= A + B;
    
    
    A <= not NUM1;
    B <= not NUM2;
    SUM <= not X;
    
end Behavioral;