library IEEE;	
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter_VHDL is
port( Number: in std_logic_vector(0 to 3);
	Clk: in std_logic;
	L: in std_logic;
	R: in std_logic;
	D: in std_logic;
	Ot: out std_logic_vector(0 to 3) );
end Counter_VHDL;

architecture Behavioral of Counter_VHDL is
signal temp: std_logic_vector(0 to 3);
begin
process(Clk,R)
begin
	if R='1' then
	temp <= "0000";
	elsif ( Clk'event and Clk='1') then
	if L='1' then
	temp <= Number;
	elsif (L='0' and D='0') then
	temp <= temp + 1;
	elsif (L='0' and D='1') then
	temp <= temp - 1;
	end if;
	end if;
end process;
Ot<= temp;
end Behavioral;
