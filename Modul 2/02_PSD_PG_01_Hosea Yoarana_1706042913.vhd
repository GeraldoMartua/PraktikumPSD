library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity count is

	PORT(   CLK	: IN STD_LOGIC;
	        RST	: IN STD_LOGIC;
	        LOAD	: IN STD_LOGIC;
		ANGKA	: IN STD_LOGIC_VECTOR(3 downto 0);
		Q	: OUT STD_LOGIC_VECTOR(3 downto 0);
		ARAH	: IN STD_LOGIC
	     );
end count;

architecture behavioral of count is

signal temp : STD_LOGIC_VECTOR(3 downto 0);
begin

	process(CLK,RST)
		begin
		if RST = '1' then
		temp <= "0000";
		elsif(CLK'event and CLK = '1') then
			if LOAD = '1' then
			temp <= ANGKA;
		elsif(LOAD = '0' and ARAH = '0') then
		temp <= temp + 1;
		elsif(LOAD = '0' and ARAH = '1') then
		temp <= temp - 1;
		end if;
		end if;
	end process;

Q <= temp;
end behavioral;
