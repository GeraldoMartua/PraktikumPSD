Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updowncounter is
port (
 clock, Clear, EN, U : in STD_LOGIC;
 cout   : out STD_LOGIC_VECTOR(3 downto 0));
end updowncounter;

architecture clrclk of updowncounter is
signal countnow : STD_LOGIC_VECTOR(3 downto 0) :="0000";
begin
process (Clear, Clock)
begin
 if Clear = '0' then
 countnow <= "0000";
 elsif Clock'event and Clock = '1' and EN = '0' then
 countnow <= countnow;
 elsif Clock'event and Clock = '1' and EN = '1' and U = '1' then
 countnow <= countnow + 1;
 elsif Clock'event and Clock = '1' and EN = '1' and U = '0' then
 countnow <= countnow-1;
 end if;
 Cout <= countnow;
end process;
end clrclk;