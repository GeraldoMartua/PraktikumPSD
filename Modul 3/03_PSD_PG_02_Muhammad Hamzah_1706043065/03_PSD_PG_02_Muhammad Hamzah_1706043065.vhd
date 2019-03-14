library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity morsename is
	port(clk, fin_spc : in bit; -- space finish
		 MorseCode, go_spc : out bit); -- MorseCode generates morse code, go_ spc = space start
end morsename;

architecture state_transt of morsename is
	signal State, NextState : integer range 0 to 10000;
begin
	-- Memory Process:
	process(clk)
	begin
		if rising_edge(clk) then  -- Rising Edge Triggered
			State <= NextState;
		end if;
	end process;
	
	-- Combinational Logic Process
	process(State, fin_spc)
	begin
		go_spc <= '0';

-- state transition to generate "HAI RAFID"
	-- generate "H"
If State = 0 then MorseCode <= '1';  NextState <= 1;
elsif State = 1 then MorseCode <= '0';  NextState <= 2;
elsif State = 2 then MorseCode <= '1';  NextState <= 3;
elsif State = 3 then MorseCode <= '0';  NextState <= 4;
elsif State = 4 then MorseCode <= '1';  NextState <= 5;
elsif State = 5 then MorseCode <= '0';  NextState <= 6;
elsif State = 6 then MorseCode <= '1';  NextState <= 7;
elsif State = 7 then MorseCode <= '0';  NextState <= 8;
elsif State = 8 then MorseCode <= '0';  NextState <= 9;
elsif State = 9 then MorseCode <= '0';  NextState <= 10;

	--generate "A"
elsif State = 10 then MorseCode <= '1';  NextState <= 11;
elsif State = 11 then MorseCode <= '0';  NextState <= 12;
elsif State = 12 then MorseCode <= '1';  NextState <= 13;
elsif State = 13 then MorseCode <= '1';  NextState <= 14;
elsif State = 14 then MorseCode <= '1';  NextState <= 15;
elsif State = 15 then MorseCode <= '0';  NextState <= 16;
elsif State = 16 then MorseCode <= '0';  NextState <= 17;
elsif State = 17 then MorseCode <= '0';  NextState <= 18;

	-- generate "I"
elsif State = 18 then MorseCode <= '1';  NextState <= 19;
elsif State = 19 then MorseCode <= '0';  NextState <= 20;
elsif State = 20 then MorseCode <= '1';  NextState <= 21;

	-- generate space
elsif State = 21 then MorseCode <= '0';  NextState <= 22;
elsif State = 22 then MorseCode <= '0';  NextState <= 23;
elsif State = 23 then MorseCode <= '0';  NextState <= 24;
elsif State = 24 then MorseCode <= '0';  NextState <= 25;
elsif State = 25 then MorseCode <= '0';  NextState <= 26;
elsif State = 26 then MorseCode <= '0';  NextState <= 27;
elsif State = 27 then MorseCode <= '0';  NextState <= 28;

	-- generate "R"
elsif State = 28 then MorseCode <= '1';  NextState <= 29;
elsif State = 29 then MorseCode <= '0';  NextState <= 30;
elsif State = 30 then MorseCode <= '1';  NextState <= 31;
elsif State = 31 then MorseCode <= '1';  NextState <= 32;
elsif State = 32 then MorseCode <= '1';  NextState <= 33;
elsif State = 33 then MorseCode <= '0';  NextState <= 34;
elsif State = 34 then MorseCode <= '1';  NextState <= 35;
elsif State = 35 then MorseCode <= '0';  NextState <= 36;
elsif State = 36 then MorseCode <= '0';  NextState <= 37;
elsif State = 37 then MorseCode <= '0';  NextState <= 38;

	-- generate "A"
elsif State = 38 then MorseCode <= '1';  NextState <= 39;
elsif State = 39 then MorseCode <= '0';  NextState <= 40;
elsif State = 40 then MorseCode <= '1';  NextState <= 41;
elsif State = 41 then MorseCode <= '1';  NextState <= 42;
elsif State = 42 then MorseCode <= '1';  NextState <= 43;
elsif State = 43 then MorseCode <= '0';  NextState <= 44;
elsif State = 44 then MorseCode <= '0';  NextState <= 45;
elsif State = 45 then MorseCode <= '0';  NextState <= 46;

	--generate "F"
elsif State = 46 then MorseCode <= '1';  NextState <= 47;
elsif State = 47 then MorseCode <= '0';  NextState <= 48;
elsif State = 48 then MorseCode <= '1';  NextState <= 49;
elsif State = 49 then MorseCode <= '0';  NextState <= 50;
elsif State = 50 then MorseCode <= '1';  NextState <= 51;
elsif State = 51 then MorseCode <= '1';  NextState <= 52;
elsif State = 52 then MorseCode <= '1';  NextState <= 53;
elsif State = 53 then MorseCode <= '0';  NextState <= 54;
elsif State = 54 then MorseCode <= '1';  NextState <= 55;
elsif State = 55 then MorseCode <= '0';  NextState <= 56;
elsif State = 56 then MorseCode <= '0';  NextState <= 57;
elsif State = 57 then MorseCode <= '0';  NextState <= 58;

	-- generate "I"
elsif State = 58 then MorseCode <= '1';  NextState <= 59;
elsif State = 59 then MorseCode <= '0';  NextState <= 60;
elsif State = 60 then MorseCode <= '1';  NextState <= 61;
elsif State = 61 then MorseCode <= '0';  NextState <= 62;
elsif State = 62 then MorseCode <= '0';  NextState <= 63;
elsif State = 63 then MorseCode <= '0';  NextState <= 64;

	-- generate "D"
elsif State = 64 then MorseCode <= '1';  NextState <= 65;
elsif State = 65 then MorseCode <= '1';  NextState <= 66;
elsif State = 66 then MorseCode <= '1';  NextState <= 67;
elsif State = 67 then MorseCode <= '0';  NextState <= 68;
elsif State = 68 then MorseCode <= '1';  NextState <= 69;
elsif State = 69 then MorseCode <= '0';  NextState <= 70;
elsif State = 70 then MorseCode <= '1';  NextState <= 71;

	go_spc <= '1';
elsif State = 71 then 
	MorseCode <= '0';  
	if fin_spc = '1' then NextState <= 0; else NextState <= 71; end if;
else 
	NextState <= 0;  -- illegal status
end if;


	end process;
end state_transt;
