library ieee;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vending is
port (	clk 	: in std_logic; 
 	reset 	: in std_logic; 
 	input 	: in std_logic_vector (1 downto 0);
	kopikap	: inout std_logic;
	granita	: inout std_logic;
	goodday	: inout std_logic;
	nescafe	: inout std_logic; 
 	output 	: out std_logic_vector (1 downto 0) 
 );
end entity;

architecture behavior of vending is

type state_type is (idle, check, min_3000, min_2000, min_1000, min_0, choice
 );
signal next_state: state_type;

begin

process(clk,reset)
begin
 	if (reset='1') then
		next_state <= IDLE;
		input <= 0;
		kopikap <= '0';
		granita <= '0';
		goodday <= '0';
		nescafe <= '0';
 	elsif rising_edge(clk) then 
		case next_state is 
			when idle => 
			if (input > 0 ) then 
				next_state <= check;
			end if;
				
			when check =>
			if (input = 1) then
				next_state <= min_4000;
			elsif (input = 2) then
				next_state <= min_3000;
			elsif (input >= 3) then
				next_state <= min_2000;
			elsif (input >= 4) then
				next_state <= min_1000;
			elsif (input >= 5) then
				next_state <= choice;
			end if;
					
			when min_4000 =>
			if (input = 1) then
				next_state <= min_3000;
			elsif (input = 2) then
				next_state <= min_2000;
			elsif (input >= 3) then
				next_state <= min_1000;
			elsif (input >= 4) then
				next_state <= choice;
			end if;
					
			when min_3000 =>
			if (input = 1) then
				next_state <= min_2000;
			elsif (input = 2) then
				next_state <= min_1000;
			elsif (input >= 3) then
				next_state <= choice;
			end if;

			when min_2000 =>
			if (input = 1) then
				next_state <= min_1000;
			elsif (input >= 2) then
				next_state <= choice;
			end if;
			
			when min_1000 =>
			if (input = 1) then
				next_state <= choice;
			end if;

			when choice =>
				case choose is
	 			when "00" =>
					Kopikap <= '1';
					Granita <= '0';
					Goodday <= '0';
					Nescafe <= '0';
					
				when "01" =>
					Kopikap <= '0';
					Granita <= '1';
					Goodday <= '0';
					Nescafe <= '0';
						
				when "10" =>
					Kopikap <= '0';
					Granita <= '0';
					Goodday <= '1';
					Nescafe <= '0';
						
				when "11" =>
					Kopikap <= '0';
					Granita <= '0';
					Goodday <= '0';
					Nescafe <= '1';
				end case;

			next_state <= output;
			
			when output =>
			if (input = 5) then
				next_state <= idle;
			end if;
		end case;
	end if;
end process;

end behavior;
