library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity telepon is 
port(	koin : in std_logic;
	
	clock: in std_logic; 
	st  : in std_logic);
end telepon;

architecture work of telepon is
	type state_type is (down,numb,procc,bicara);
		signal PS,NS : state_type; 
		signal koin_temp:  std_logic;
		signal tutup: std_logic;
		signal koin_change: std_logic;
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

koin_temp <= koin;

process (PS,clock)
begin
	Case PS is	
		when down =>
			if koin_temp = '0' then						
				NS <= down;
			elsif koin_temp = '1' then
				NS <= numb;
			end if;
		when numb =>			
			NS <= procc;
		when procc =>
			if tutup = '0' then		
				NS <= down;
				koin_change <= '1';		
				koin_temp <= '0'
			elsif tutup = '1' then		
				NS <= bicara;			
				Countdown <= 30;		
				koin_change <= '0';
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
