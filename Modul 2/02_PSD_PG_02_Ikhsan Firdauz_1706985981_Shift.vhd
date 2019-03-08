library ieee;
use ieee.std_logic_1164.all;

entity shift is
	port ( 
		clk  : in std_logic;
		in_1 : in std_logic;
		reset : in std_logic;
		enabler : in std_logic;
		out_1 : inout std_logic_vector (2 downto 0));
end shift;

architecture behavior of shift is
	signal hold_in : std_logic_vector (2 downto 0);
begin
	process (clk, reset)
	begin
		if (reset = '0') then
			hold_in <= (others => '0');
		elsif rising_edge (clk)then
			if (enabler = '1') then
				hold_in (1 downto 0) <= hold_in (2 downto 1);
				hold_in (2) <= in_1;
			end if;
		end if;

end process;
out_1 <= hold_in;
end behavior;