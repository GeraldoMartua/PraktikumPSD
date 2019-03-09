library IEEE;	
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_counter is
port( 
	NUM	: in std_logic_vector(0 to 3);
	
	CLK	: in std_logic;
	LOAD	: in std_logic;
	RST	: in std_logic;
	UD	: in std_logic;
	OUTP	: out std_logic_vector(0 to 3) );
end updown_counter;

architecture behavioral of updown_counter is
signal temp: std_logic_vector(0 to 3);
	begin
	
	process(CLK,RST)
	begin
	if RST='1' then 
	temp <= "0000";

	elsif ( CLK'event and CLK='1') then

	if LOAD='1' then 
	temp <= NUM;
	
	elsif (LOAD='0' and UD='0') then 
	temp <= temp + 1;
	
	elsif (LOAD='0' and UD='1') then 
	temp <= temp - 1;

end if;
end if;
end process;
	OUTP <= temp;
end behavioral;
