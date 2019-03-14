library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MorseCode is
generic(ClockFrequency : integer := 20);
port(	clock	: IN STD_LOGIC;
	reset	: IN STD_LOGIC;
	morse	: OUT STD_LOGIC);
end MorseCode;

architecture Morse of MorseCode is
--HAI TRISTAN = .... .- ..    - .-. .. ... - .- -.
signal a : integer;
signal b : integer := 0;
signal c : integer := 0;

begin
process(clock,reset) is
begin
	if rising_edge(clock) then
		if reset = '0' then
			a <= 0;
			b <= 0;
			c <= 0;
		else
			if a = ClockFrequency - 1 then
				a <= 0;
				if b = 0 then			-- H = . . . .
					if c = 0 then 		-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '0';
						c <= c + 1;
					elsif c = 3 then	-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '1';
						c <= c + 1;
					elsif c = 5 then
						morse <= '0';
						c <= c + 1;
					elsif c = 6 then	-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 7 then
						morse <= '1';
						c <= c + 1;
					elsif c = 8 then
						morse <= '0';
						c <= c + 1;
					elsif c = 9 then	-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 10 then
						morse <= '1';
						c <= c + 1;
					elsif c = 11 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;

				elsif b = 1 then		-- A = .-
					if c = 0 then 		-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '0';
						c <= c + 1;
					elsif c = 3 then	-- -
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '1';
						c <= c + 1;
					elsif c = 5 then
						morse <= '1';
						c <= c + 1;
					elsif c = 6 then
						morse <= '1';
						c <= c + 1;
					elsif c = 7 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;

				elsif b = 2 then		-- I = . . 
					if c = 0 then 		-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '0';
						c <= c + 1;
					elsif c = 3 then	-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '1';
						c <= c + 1;
					elsif c = 5 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;

				elsif b = 3 then		-- SPASI =  ~ 
					if c = 0 then 		-- ()()()()
						morse <= '0';
						c <= c + 1;
					elsif c = 1 then
						morse <= '0';
						c <= c + 1;
					elsif c = 2 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
				end if;

				elsif b = 4 then		-- T = -
					if c = 0 then		-- -
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '1';
						c <= c + 1;
					elsif c = 3 then
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;
				
				elsif b = 5 then		-- R = .-.
					if c = 0 then 		-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '0';
						c <= c + 1;
					elsif c = 3 then	-- -
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '1';
						c <= c + 1;
					elsif c = 5 then
						morse <= '1';
						c <= c + 1;
					elsif c = 6 then
						morse <= '1';
						c <= c + 1;
					elsif c = 7 then
						morse <= '0';
						c <= c + 1;
					elsif c = 8 then 	-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 9 then
						morse <= '1';
						c <= c + 1;
					elsif c = 10 then
						morse <= '0';
						c <= c + 1;
					else 
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;

				elsif b = 6 then		-- I = . . 
					if c = 0 then 		-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '0';
						c <= c + 1;
					elsif c = 3 then	-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '1';
						c <= c + 1;
					elsif c = 5 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;

				if b = 7 then			-- S = . . .
					if c = 0 then 		-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '0';
						c <= c + 1;
					elsif c = 3 then	-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '1';
						c <= c + 1;
					elsif c = 5 then
						morse <= '0';
						c <= c + 1;
					elsif c = 6 then	-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 7 then
						morse <= '1';
						c <= c + 1;
					elsif c = 8 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;

				elsif b = 8 then		-- T = -
					if c = 0 then		-- -
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '1';
						c <= c + 1;
					elsif c = 3 then
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;

				elsif b = 9 then		-- A = .-
					if c = 0 then 		-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '0';
						c <= c + 1;
					elsif c = 3 then	-- -
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '1';
						c <= c + 1;
					elsif c = 5 then
						morse <= '1';
						c <= c + 1;
					elsif c = 6 then
						morse <= '1';
						c <= c + 1;
					elsif c = 7 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;

				elsif b = 10 then		-- N = -.
					if c = 0 then		-- -
						morse <= '1';
						c <= c + 1;
					elsif c = 1 then
						morse <= '1';
						c <= c + 1;
					elsif c = 2 then
						morse <= '1';
						c <= c + 1;
					elsif c = 3 then
						morse <= '1';
						c <= c + 1;
					elsif c = 4 then
						morse <= '0';
						c <= c + 1;
					elsif c = 5 then 		-- .
						morse <= '1';
						c <= c + 1;
					elsif c = 6 then
						morse <= '1';
						c <= c + 1;
					elsif c = 7 then
						morse <= '0';
						c <= c + 1;
					else
						morse <= '0';
						c <= 0;
						b <= b + 1;
					end if;
				end if;
			else
				a <= a + 1;
			end if;
		end if;
	end if;
end if;
end process;
end Morse;