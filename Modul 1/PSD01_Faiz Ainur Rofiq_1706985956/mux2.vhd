library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiplexer2in is 
	Port (
		select_in2 : in STD_LOGIC;
		I1 : in STD_LOGIC_VECTOR(3 downto 0);
		I2 : in STD_LOGIC_VECTOR(3 downto 0);
		out_mux : out STD_LOGIC_VECTOR(3 downto 0));
end entity;

architecture mux2 of multiplexer2in is --multiplexer 2 input
begin
	out_mux <= I1 when ( select_in2 = '0' ) else I2;
end mux2;