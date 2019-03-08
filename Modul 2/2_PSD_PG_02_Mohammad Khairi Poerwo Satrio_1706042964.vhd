library ieee;	
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity counter is
	port( num: in std_logic_vector(0 to 3);
	clk: in std_logic;
	load: in std_logic;
	rst: in std_logic;
	dir: in std_logic;
	outp: out std_logic_vector(0 to 3) );
end counter;

architecture behave of counter is
	signal temp: std_logic_vector(0 to 3);
	begin
	process(clk,rst)
	begin
	if rst='1' then temp <= "0000";
	elsif ( clk'event and clk='1') then
	if load='1' then temp <= num;
	elsif (load='0' and dir='0') then temp <= temp + 1;
	elsif (load='0' and dir='1') then temp <= temp - 1;
end if;
end if;
end process;
	outp <= temp;
end behave;
