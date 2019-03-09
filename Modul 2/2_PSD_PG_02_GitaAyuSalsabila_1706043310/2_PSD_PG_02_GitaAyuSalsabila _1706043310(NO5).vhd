-- Serial 3-bit shift-right register
LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;

entity shiftR is
	port(	clk, clr, input, load : in std_logic;
		output: out std_logic_vector (2 downto 0)
		);
end shiftR;

architecture cara4 of shiftR is
	signal shift : std_logic_vector (2 downto 0);
begin
process (clk, clr, input, load,shift)
	begin
		if clr='1' then shift <= "000";
		else
			if load='1' then
				if (clk' event and clk ='1') then
				shift(1 downto 0) <= shift(2 downto 1);
				shift(2)<=input;
				end if;
			end if;
		end if;
	end process;
output <= shift;
end cara4;