library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity countupdown is
port( num: in std_logic_vector(0 to 3);
cl: in std_logic;
load: in std_logic;
rst: in std_logic;
up_down: in std_logic;
output: out std_logic_vector(0 to 3) );
end countupdown;

architecture Behavioral of countupdown is
signal temp: std_logic_vector(0 to 3);
begin

process(cl,rst)

begin

if rst='1' then
temp <= "0000";
elsif ( cl'event and cl='1') then
if load='1' then
temp <= num;
elsif (load='0' and up_down='0') then
temp <= temp + 1;
elsif (load='0' and up_down='1') then
temp <= temp - 1;

end if;
end if;

end process;

output <= temp;
end Behavioral;