LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY Sevseg IS
  PORT (
    S : in  std_logic_vector(1 downto 0);
    i0  : in  std_logic_vector(3 downto 0);
    i1  : in  std_logic_vector(3 downto 0);
    i2  : in  std_logic_vector(3 downto 0);
    i3  : in  std_logic_vector(3 downto 0);
    bcdin : inout std_logic_vector(3 downto 0);
    Seg7 : out std_logic_vector(6 downto 0));

END ENTITY Sevseg;
 
ARCHITECTURE output of Sevseg IS
BEGIN
	BCDin <= i0 when S = "00" else
             	 i1 when S = "01" else
             	 i2 when S = "10" else
             	 i3;
	process(bcdin)
	begin
	 
	case bcdin is
	when "0000" =>
	Seg7 <= "0000001"; ---0
	when "0001" =>
	Seg7 <= "1001111"; ---1
	when "0010" =>
	Seg7 <= "0010010"; ---2
	when "0011" =>
	Seg7 <= "0000110"; ---3
	when "0100" =>
	Seg7 <= "1001100"; ---4
	when "0101" =>
	Seg7 <= "0100100"; ---5
	when "0110" =>
	Seg7 <= "0100000"; ---6
	when "0111" =>
	Seg7 <= "0001111"; ---7
	when "1000" =>
	Seg7 <= "0000000"; ---8
	when "1001" =>
	Seg7 <= "0000100"; ---9
	when others =>
	Seg7 <= "1111111"; ---null
	end case;
 
	end process;

END ARCHITECTURE output;