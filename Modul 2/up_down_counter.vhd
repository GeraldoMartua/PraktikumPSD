library ieee;
	use ieee.std_logic_1164.all;
	use ieee.std_logic_unsigned.all;

entity up_down_counter is
port(
	cout	: out std_logic_vector (7 downto 0);
	up_down	: in std_logic;
	clk	: in std_logic;
	reset	: in std_logic
);
end entity;

architecture rt1 of up_down_counter is
	signal count	: std_logic_vector (7 downto 0);
begin
	process (clk,reset) begin
		if (reset = '1') then
			count <= (others=>'0');
		elsif (rising_edge(clk)) then
			if (up_down = '1') then
				count <= count + 1;
			else
				count <= count - 1;
			end if;
		end if;
	end process;
	cout <= count;
end architecture;
