library ieee;
use ieee.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
 
 entity idiotic is
  port(	clk:in std_logic;
	rst:in std_logic;
	coinState:inout std_logic;
	x:inout integer  range 0 to 999999999;
	number:out integer range 0 to 999999999);
TYPE state_Type IS(Coincheck,Calling);
SIGNAL State : State_type;
end entity;

architecture whyer of idiotic is


begin

process(clk,rst)
	begin
	if (rst='1') then
		state<=Coincheck;
		x<=0;
		coinState<='0';
		
	elsif(clk'event and clk='1') then
		CASE State IS
			WHEN Coincheck=>
				if(coinState='1') then
					state<=Calling;
				else
					state<=Coincheck;
					number<=0;
				end if;
			WHEN Calling=>								
				number <= x;
				
				if (coinState='0') then
					state<=Coincheck;
				else
					state<=Calling;
				end if;			
		end Case;
	end if;
end process;
end whyer;
			