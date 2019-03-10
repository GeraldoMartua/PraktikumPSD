--stopwatch and timer (using second only)
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity timer is
	port ( reset, clk, up : in std_logic;
			second : out integer
	);
end timer;

architecture counter of timer is
	signal cont : integer;
begin
	process (clk, reset)
	begin
		if (reset = '1') then 
			cont <= 0;
		elsif (rising_edge(clk)) then
			if (up = '1') then --if stopwatch, up = 1; if timer, up = 0, set timer time at second
				cont <= cont+1;
			else 
				cont <= cont-1;
			end if;
		end if;
	end process;
	second <= cont;

end counter;
