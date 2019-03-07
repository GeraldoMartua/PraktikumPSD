library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity UpDownCounter is
 port(
	input : in STD_LOGIC_VECTOR (0 to 3);
	clk : in STD_LOGIC;
	load : in STD_LOGIC;
	reset : in STD_LOGIC;
	direction : in STD_LOGIC;
	output : out STD_LOGIC_VECTOR (0 to 3)
 );
end UpDownCounter;

architecture bhv of UpDownCounter is
	signal temp : STD_LOGIC_VECTOR (0 to 3);
begin
process(clk, reset)
begin
	if reset = '1' then
		temp <= "0000";
	elsif(clk'event and clk = '1') then
		if load = '1' then
			temp <= input;
  		elsif(load = '0' and direction = '0') then
			temp <= temp + 1;
		elsif(load = '0' and direction = '1') then
			temp <= temp - 1;
		end if;
	end if;
end process;
output <= temp;
end bhv;