LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY MUX_41 IS
	PORT (
		S 			: in  std_logic_vector(1 downto 0);
		a,b,c,d  : in  std_logic_vector(3 downto 0);
		BCDin 	: inout std_logic_vector(3 downto 0);
		Seven_Segment	: out std_logic_vector(6 downto 0));
END ENTITY MUX_41;
 
ARCHITECTURE output of MUX_41 IS
BEGIN
	a when S = "00" else
   b when S = "01" else
   c when S = "10" else
	d;
					
	process(BCDin)
	
	begin
	 
		case BCDin is
		when "0000" =>
		Seven_Segment <= "0000001"; ---0
		when "0001" =>
		Seven_Segment <= "1001111"; ---1
		when "0010" =>
		Seven_Segment <= "0010010"; ---2
		when "0011" =>
		Seven_Segment <= "0000110"; ---3
		when "0100" =>
		Seven_Segment <= "1001100"; ---4
		when "0101" =>
		Seven_Segment <= "0100100"; ---5
		when "0110" =>
		Seven_Segment <= "0100000"; ---6
		when "0111" =>
		Seven_Segment <= "0001111"; ---7
		when "1000" =>
		Seven_Segment <= "0000000"; ---8
		when "1001" =>
		Seven_Segment <= "0000100"; ---9
		when others =>
		Seven_Segment <= "1111111"; ---null
		end case;

 
	end process;

END ARCHITECTURE output;