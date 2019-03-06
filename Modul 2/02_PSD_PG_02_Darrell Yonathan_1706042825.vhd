library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity COUNT_8B is
	port( RESET,CLK,LD,U	: in std_logic;
			DIN 	: in std_logic_vector (7 downto 0);
			COUNT	: out std_logic_vector (7 downto 0));
end COUNT_8B;
architecture my_count of COUNT_8B is
	signal t_cnt : unsigned(7 downto 0); -- internal counter signal
begin
	process (CLK, RESET)
	begin
		if (RESET = '1') then
			t_cnt <= (others => '0'); -- clear
		elsif (rising_edge(CLK)) then
			if (LD = '1') then t_cnt <= unsigned(DIN); -- load
			else
				if (UP = '1') then t_cnt <= t_cnt + 1; -- incr
				else t_cnt <= t_cnt - 1; -- decr
				end if;
			end if;
		end if;
	end process;
	COUNT <= std_logic_vector(t_cnt);
end my_count;