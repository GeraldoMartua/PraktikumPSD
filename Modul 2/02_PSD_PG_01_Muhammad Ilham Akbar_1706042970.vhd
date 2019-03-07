--COUNTER UPDOWN
-- Muhammad Ilham Akbar/1706042970

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity Counter_Up_Down1 is
    Port ( clock		: in std_logic; -- input Clock
	   up_down		: in std_logic; -- up atau down
           reset		: in std_logic; -- input Reset 
           counter_out	: out std_logic_vector(3 downto 0) -- output 4-bit
     );
end entity;

architecture Behavioral of Counter_Up_Down1 is
signal count_updown: std_logic_vector(3 downto 0)
:="0000";

begin
process(clock,reset) 
begin
if(rising_edge(clock)) then
	if(reset='1') then
        count_updown <= x"0";
		elsif(up_down='0') then
			count_updown <= count_updown - x"1"; -- counter down
		else 
			count_updown <= count_updown + x"1"; -- counter up
    end if;
 end if;
end process;
counter_out <= count_updown;
end architecture;
