library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity telepon_coin is 
port(	coin : in std_logic;
	
	clock: in std_logic; 
	st  : in std_logic);
end telepon_coin;

architecture work of telepon_coin is
	type state_type is (down,numb,procc,bicara);
	signal PS,NS : state_type; 
	signal coin_temp, tutup, coin_change :  std_logic;
	signal timeout: std_logic := '0';
	signal closed: std_logic := '0';
	signal Countdown: integer;



begin

process(clock,NS)
begin
	if (rising_edge(clock)) then
		PS<= NS;
	end if;
end process;



coin_temp <= coin;

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
			NS <= procc;
		when procc =>
			if tutup = '0' then		
				NS <= down;
				coin_change <= '1';		
				coin_temp <= '0'
			elsif tutup = '1' then		
				NS <= bicara;			
				Countdown <= 30;		
				coin_change <= '0';
			end if;
		when bicara =>
			if closed = '1' then		
				NS <=  down;
			elsif Countdown = 0 then	
				NS <=  down;
				
			elsif Countdown > 0 then
				NS <= bicara;
				Countdown <= Countdown -1;	
			end if;	
		end case;
	end process;
end work;
