library IEEE;
--- Nama  : Hanif Imam
--- NPM   : 1706043273
--- Modul : Modul 02, Up Down Counter

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UDCount is
	port  ( clk  : in STD_LOGIC;
		arah : in STD_LOGIC;
		cout : out STD_LOGIC_VECTOR (7 downto 0));
end entity;

architecture menghitung of UDCount is
	signal itung   : STD_LOGIC_VECTOR (7 downto 0) := X"00";
begin

	process (clk, arah)
	begin
		if rising_edge(clk) then
			if (arah = '1') then
				itung <= itung + '1';
			elsif (arah = '0') then
				itung <= itung - '1';
			end if;
		end if;
	end process;
	
	cout <= not itung;
end architecture;