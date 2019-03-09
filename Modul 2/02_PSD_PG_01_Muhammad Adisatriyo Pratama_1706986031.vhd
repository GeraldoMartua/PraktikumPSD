library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity updowncounter is
	port  (	number: in std_logic_vector(3 downto 0);
		clock: in std_logic;
		reset: in std_logic;
      		direct: in std_logic;
		led: in std_logic;
		output: out std_logic_vector(3 downto 0));
end updowncounter;

architecture Behavioral of updowncounter is
	signal tmp: std_logic_vector(3 downto 0);
begin
 	process(clock,reset)
 	begin
		if reset='1' then
		tmp <= "0000";
		elsif (clock'event and clock='1') then
			if led='1' then
			tmp <= number;
			elsif (led='0' and direct='0') then
			tmp <= tmp + 1;
			elsif (led='0' and direct='1') then
			tmp <= tmp - 1;
			end if;
		end if;
	end process;
	output <= tmp;
end Behavioral;
