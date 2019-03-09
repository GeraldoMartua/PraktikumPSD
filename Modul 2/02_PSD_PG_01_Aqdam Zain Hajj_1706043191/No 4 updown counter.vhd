---------------------------------------
   -- Syschronous Up/Down COunter --
            -- 8 bit input --
---------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 -- entity
entity counter8bit is
port ( RESET,Clock,Load,UP : in std_logic;
D_IN : in std_logic_vector (7 downto 0);
COUNT : out std_logic_vector (7 downto 0)
);
end counter8bit;
 -- architecture
architecture up_down of counter8bit is
signal t_cont : unsigned(7 downto 0);
begin
process (Clock, RESET)
begin
if (RESET = '1') then
t_cont <= (others => '0'); -- clear atau reset counter
elsif (rising_edge(Clock)) then
if (Load = '1') then t_cont <= unsigned(D_IN); -- load
else
if (UP = '1') then t_cont <= t_cont + 1; -- increment (counter up)
else t_cont <= t_cont - 1; -- decrement (counter down)
end if;
end if;
end if;
end process;
COUNT <= std_logic_vector(t_cont);
end up_down;
