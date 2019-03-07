library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Counter is
Port(clk : in STD_LOGIC;
   Reset : in STD_LOGIC;
   Count : out STD_LOGIC_VECTOR (2 downto 0));
end Counter;
architecture Behavioral of Counter is
signal count_int : std_logic_vector(2 downto 0);
begin
process (reset, clk)
begin
 if reset = '1' then
  count_int <= "111";
 elsif clk'event and clk = '1' then
  if count_int <= "111" and count_int > "010" then
    count_int <= count_int - "1";
  else
    count_int <= "111";
  end if;
 end if;
end process;
count <= count_int;
end Behavioral;