library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity shift_register is
	port ( CLK : in std_logic;
		D: in std_logic;
		LED : in std_logic_vector (2 downto 0));
end shift_register;

architecture behavioral of shift_register is
	signal shift_reg : std_logic_vector (2 downto 0) := x"00";
begin
	process (clock_div(4))
	begin
		if (clock_div(4)'event and clock_div(4) = '1') then
			shift_reg(2) <= D;
			shift_reg(1) <= shift_reg(2);
			shift_reg(0) <= shift_reg(1);
		end if;
	end process
	LED <= shift_reg;
end behavioral;