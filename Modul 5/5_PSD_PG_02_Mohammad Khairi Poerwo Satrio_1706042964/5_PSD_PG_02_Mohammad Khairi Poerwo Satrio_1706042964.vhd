library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity machine is 
	port(clk:in std_logic;
	rst:in std_logic;
	input:inout integer;
	choose:in std_logic_vector (1 downto 0);
	drink1:inout std_logic;
	drink2:inout std_logic;
	drink3:inout std_logic;
	drink4:inout std_logic;
	change:inout integer);
end machine;

architecture vending of machine is 
type state is (idle, check, need_2, need_1, pickdrink, final);
	signal next_state : state;  

begin			
	process(clk, rst)
	begin
	if (rst='1') then
		next_state <= idle;
		input <= 0;
		drink1 <= '0';
		drink2 <= '0';
		drink3 <= '0';
		drink4 <= '0';
		change <= 0;
			
	elsif rising_edge(clk) then
		case next_state is 
			when idle => 
				if (input > 0 ) then 
					next_state <= check;
				end if;
				
			when check =>
				if (input = 1) then
					next_state <= need_2;
				elsif (input = 2) then
					next_state <= need_1;
				elsif (input >= 3) then
					next_state <= pickdrink;
				end if;
					
			when need_2 =>
				if (input = 1) then
					next_state <= need_1;
				elsif (input = 2) then
					next_state <= pickdrink;
				end if;
					
			when need_1 =>
				if (input = 1) then 
					next_state <= pickdrink;
				end if;

			when pickdrink =>
				case choose is
					when "00" =>
						drink1 <= '1';
						drink2 <= '0';
						drink3 <= '0';
						drink4 <= '0';
					when "01" =>
						drink1 <= '0';
						drink2 <= '1';
						drink3 <= '0';
						drink4 <= '0';
					when "10" =>
						drink1 <= '0';
						drink2 <= '0';
						drink3 <= '1';
						drink4 <= '0';
					when others =>
						drink1 <= '0';
						drink2 <= '0';
						drink3 <= '0';
						drink4 <= '1';
				end case;
					
				next_state <= final;
					
			when final =>
				if (input = 3) then
					next_state <= idle;
				end if;
		end case;
	end if;
end process;
end vending;
