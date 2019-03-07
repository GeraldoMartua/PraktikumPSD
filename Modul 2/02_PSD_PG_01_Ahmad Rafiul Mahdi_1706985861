library IEEE;	
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counterupdown is
port( Angka: in std_logic_vector(0 to 3);

Clock: in std_logic; 
Load: in std_logic;
Reset: in std_logic;
naikturun: in std_logic;
Output: out std_logic_vector(0 to 3) );

end counterupdown;

architecture Behavioral of counterupdown is

signal temp: std_logic_vector(0 to 3);
begin
process(Clock,Reset)
begin
if Reset='1' then

temp <= "0000";

elsif ( Clock'event and Clock='1') then

if Load='1' then

temp <= Angka;
elsif (Load='0' and naikturun='0') then
temp <= temp + 1;
elsif (Load='0' and naikturun='1') then
temp <= temp - 1;
end if;
end if;
end process;
Output <= temp;
end Behavioral;
