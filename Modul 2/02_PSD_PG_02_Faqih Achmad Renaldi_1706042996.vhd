Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity count is
port (
 Clock : in STD_LOGIC; 
 CLR   : in STD_LOGIC;
 EN    : in STD_LOGIC;
 U     : in STD_LOGIC;
 Cout   : out STD_LOGIC_VECTOR(3 downto 0));
end count;

architecture my_count of count is
signal countnw : STD_LOGIC_VECTOR(3 downto 0) :="0000";
begin
process (CLR, Clock)
begin

 if CLR = '0' then
 countnw <= "0000";

 elsif Clock'event and Clock = '1' and EN = '0' then
 countnw <= countnw;

 elsif Clock'event and Clock = '1' and EN = '1' and U = '1' then
 countnw <= countnw + 1;

 elsif Clock'event and Clock = '1' and EN = '1' and U = '0' then
 countnw <= countnw-1;

 end if;
 Cout <= countnw;
end process;
end my_count;