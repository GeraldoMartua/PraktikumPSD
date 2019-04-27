library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity perkalian is
    Port ( NUM1 : in  STD_LOGIC_VECTOR (3 downto 0);
           NUM2 : in  STD_LOGIC_VECTOR (3 downto 0);
           MUL  : out STD_LOGIC_VECTOR (3 downto 0));
end perkalian;

architecture Behavioral of perkalian is
    
begin
    
 MUL <= std_logic_vector(to_unsigned(to_integer(unsigned(num1) - unsigned(num2)),4)); 

end Behavioral;