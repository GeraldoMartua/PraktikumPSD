--Ananda Rizky Duto Pamungkas
--1706985905
--PSD 01

Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counterku is
port (
	CLK, CLR, EN, U : in STD_LOGIC;
 	Cout   : out STD_LOGIC_VECTOR(3 downto 0));
end counterku;

architecture counter_punyaku of counterku is
signal countnow : STD_LOGIC_VECTOR(3 downto 0) :="0000";
begin
	process (CLR, CLK)
	begin
 		if CLR = '0' then
	 		countnow <= "0000";
	 	elsif CLK'event and CLK = '1' and EN = '0' then
	 		countnow <= countnow;
		elsif CLK'event and CLK = '1' and EN = '1' and U = '1' then
	 		countnow <= countnow + 1;
	 	elsif CLK'event and CLK = '1' and EN = '1' and U = '0' then
	 		countnow <= countnow-1;
	 	end if;
		Cout <= countnow;
	end process;
end counter_punyaku;