LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sevseg IS
PORT ( values : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	 disp : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));

END sevseg;

ARCHITECTURE display OF sevseg IS
BEGIN
PROCESS (values)
BEGIN
CASE values IS

		WHEN "0000" => disp <= "1111110"; --0
		WHEN "0001" => disp <= "0110000"; --1
		WHEN "0010" => disp <= "1101101"; --2
		WHEN "0011" => disp <= "1111001"; --3
		WHEN "0100" => disp <= "0110011"; --4
		WHEN "0101" => disp <= "1011011"; --5
		WHEN "0110" => disp <= "1011111"; --6
		WHEN "0111" => disp <= "1110000"; --7
		WHEN "1000" => disp <= "1111111"; --8
		WHEN "1001" => disp <= "1111011"; --9
		WHEN OTHERS => disp <= "0000000";
END CASE;
END PROCESS;
END display;