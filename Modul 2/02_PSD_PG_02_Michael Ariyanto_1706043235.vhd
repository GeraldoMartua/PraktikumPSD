library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity Counter is
port(	clock	: in STD_lOGIC;
	clear	: in STD_LOGIC;
	updown	: in STD_LOGIC;
	count	: out STD_LOGIC_VECTOR(3 downto 0));
end Counter;

architecture count of Counter is
signal counting : STD_LOGIC_VECTOR(3 downto 0);
begin

process(clock,clear)
begin
if rising_edge(clock) then
	if clear = '0' then
	counting  <= "0000";
	elsif clear = '1' then
		if updown = '1' then
		counting <= counting + "0001";
		elsif updown = '0' then
		counting <= counting - "0001";
		end if;
	end if;
end if;

	count <= counting;

end process;
end count;
