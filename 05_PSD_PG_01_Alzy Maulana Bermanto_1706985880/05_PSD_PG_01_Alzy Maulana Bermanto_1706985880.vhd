library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity payp is 
port(
	
	coin : in std_logic;
	
	clock: in std_logic; 
	st  : in std_logic);
end payp;

architecture work of payp is
	type state_type is (down,numb,hanging,talks);
		signal PS,NS : state_type; 
		signal coin_temp:  std_logic;
		signal hang_up: std_logic;
		signal coin_change: std_logic;
		signal timeout: std_logic := '0';
		signal closed: std_logic := '0';

	signal Countdown: integer;
begin

coin_temp <= coin;

process(clock,NS)
begin
	if (rising_edge(clock)) then
		PS<= NS;
	end if;
end process;

process (PS,clock)
begin
	Case PS is	

		when down =>
			if coin_temp = '0' then						
				NS <= down;
			elsif coin_temp = '1' then
				NS <= numb;
			end if;
		when numb =>
				
			NS <= hanging;
		when hanging =>
			if hang_up = '0' then		
				NS <= down;
				coin_change <= '1';		
				coin_temp <= '0';

			elsif hang_up = '1' then		
				NS <= talks;			
				Countdown <= 30;		
				coin_change <= '0';
			end if;
		when talks =>
			if closed = '1' then		
				NS <=  down;
			elsif Countdown = 0 then	
				NS <=  down;
				
			elsif Countdown > 0 then
				NS <= talks;
				Countdown <= Countdown -1;	
	
			end if;	
		end case;
	end process;
end work;