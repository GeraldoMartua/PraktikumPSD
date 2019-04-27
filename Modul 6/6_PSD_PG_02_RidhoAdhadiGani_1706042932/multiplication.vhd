library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplication is
port (
			input0 : in std_logic_vector(3 downto 0);
			input1 : in std_logic_vector(3 downto 0);
			clock	 : in std_logic;
			output : out std_logic_vector(7 downto 0)
		);
end entity;

architecture machine of multiplication is
begin
process(clock)
begin
			if clock'event and clock ='1' then
				output <= std_logic_vector(unsigned(input0) * unsigned(input1));
			end if;
end process;
end architecture;