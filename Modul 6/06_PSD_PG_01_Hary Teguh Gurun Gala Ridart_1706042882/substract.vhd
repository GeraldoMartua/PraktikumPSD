library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity substract is
    Port ( NUM1 : in  STD_LOGIC_VECTOR (4 downto 0) := "11111";
           NUM2 : in  STD_LOGIC_VECTOR (4 downto 0) := "11111";
           hasil  : out STD_LOGIC_VECTOR (4 downto 0));
end substract;

architecture Behavioral of substract is
    signal A :  STD_LOGIC_VECTOR (4 downto 0);
    signal B :  STD_LOGIC_VECTOR (4 downto 0);
    signal X :  STD_LOGIC_VECTOR (4 downto 0);
begin
    
    X <= A - B;
    
    
    A <= not NUM1;
    B <= not NUM2;
    hasil <= not X;
    
end Behavioral;