library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UDCount is
	port  ( clk  : in STD_LOGIC;
		arah : in STD_LOGIC;
		cout : out STD_LOGIC_VECTOR (7 downto 0));
end entity;

architecture menghitung of UDCount is
	signal clk_div : STD_LOGIC_VECTOR (3 downto 0) := X"0";
	signal itung   : STD_LOGIC_VECTOR (7 downto 0) := X"00";
begin
	process (clk)
	begin
		if (clk'Event and clk = '1') then
			clk_div <= clk_div + '1';
		end if;
	end process;

	process (clk_div(3), arah)
	begin
		if (clk_div(3)'Event and clk_div(3) = '1') then
			if (arah = '1') then
				itung <= itung + '1';
			elsif (arah = '0') then
				itung <= itung - '1';
			end if;
		end if;
	end process;
	
	cout <= not itung;
end architecture;