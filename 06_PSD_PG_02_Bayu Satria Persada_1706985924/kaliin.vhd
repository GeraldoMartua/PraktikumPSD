library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kaliin is
port( datain : in std_logic_vector(3 downto 0);
		datain2 : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		dataout : out std_logic_vector(7 downto 0));
end entity;

architecture mengali of kaliin is
begin
process (clk)
begin
	if clk'event and clk ='1' then
		dataout <= std_logic_vector(unsigned(datain) * unsigned(datain2));
	end if;
end process;
end architecture;
