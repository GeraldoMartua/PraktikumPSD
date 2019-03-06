library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity multiplexer4in is 
	Port ( 
		select_in4 : in STD_LOGIC_VECTOR(3 downto 0);
		I1 : in STD_LOGIC_VECTOR(3 downto 0);
		I2 : in STD_LOGIC_VECTOR(3 downto 0);
		I3 : in STD_LOGIC_VECTOR(3 downto 0);
		I4 : in STD_LOGIC_VECTOR(3 downto 0);
		out_mux4: out STD_LOGIC_VECTOR(3 downto 0)
		);
end entity;

architecture mux4 of multiplexer4in is -- multiplexer 4 input
begin
	out_mux4 <= I1 when ( select_in4 = "0000" ) else
					I2 when ( select_in4 = "0001" ) else
					I3 when ( select_in4 = "0010" ) else
					I4;
end mux4;





