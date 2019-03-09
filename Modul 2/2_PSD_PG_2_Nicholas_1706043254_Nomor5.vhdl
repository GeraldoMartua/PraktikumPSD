library ieee;
use ieee.std_logic_1164.all;
 
entity sbr is
 port(
 CLK : in std_logic;
 D: in std_logic_vector(3 downto 0);
 Q: out std_logic_vector(3 downto 0)
 );
end sbr;

architecture fungsi of sbr is
begin
 
process (clk)
begin
if (CLK'event and CLK='1') then
Q <= D;
end if;
end process;
end fungsi;