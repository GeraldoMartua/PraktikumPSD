--CREATED BY ANANDWI GHURRAN MUHAJJALIN ARRETO
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY MORSE IS
	PORT(
	--IN
	NAME	: IN STRING (50 DOWNTO 1) := "Hai Zuhri                                         ";
	--OUT
	CODE	: OUT STD_LOGIC := '0');
END MORSE;

ARCHITECTURE BHV OF MORSE IS
	CONSTANT CLK_PRD1	: TIME := 0.5 SEC;
	CONSTANT CLK_PRD2	: TIME := 0.2 SEC;	
	SIGNAL CLK1, CLK2	: STD_LOGIC := '0';		
	SIGNAL COUNT		: INTEGER := 50;
	SIGNAL TEMP, DOT, STRIP : STD_LOGIC := '0';
	
BEGIN
	
	PROCESS 
	BEGIN
	IF COUNT > 0 THEN
		IF NAME(COUNT) = 'a' OR NAME(COUNT) = 'A' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'b' OR NAME(COUNT) = 'B' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'c' OR NAME(COUNT) = 'C' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'd' OR NAME(COUNT) = 'D' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'e' OR NAME(COUNT) = 'E' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'f' OR NAME(COUNT) = 'F' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'g' OR NAME(COUNT) = 'G' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'h' OR NAME(COUNT) = 'H' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'i' OR NAME(COUNT) = 'I' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'j' OR NAME(COUNT) = 'J' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'k' OR NAME(COUNT) = 'K' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'l' OR NAME(COUNT) = 'L' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'm' OR NAME(COUNT) = 'M' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'n' OR NAME(COUNT) = 'N' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'o' OR NAME(COUNT) = 'O' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'p' OR NAME(COUNT) = 'P' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'q' OR NAME(COUNT) = 'Q' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'r' OR NAME(COUNT) = 'R' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 's' OR NAME(COUNT) = 'S' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 't' OR NAME(COUNT) = 'T' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'u' OR NAME(COUNT) = 'U' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'v' OR NAME(COUNT) = 'V' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = 'w' OR NAME(COUNT) = 'W' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'x' OR NAME(COUNT) = 'X' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'y' OR NAME(COUNT) = 'Y' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = 'z' OR NAME(COUNT) = 'Z' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = '1' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = '2' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = '3' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = '4' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSIF NAME(COUNT) = '5' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = '6' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = '7' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = '8' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = '9' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1 SEC;
		ELSIF NAME(COUNT) = '0' THEN
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 0.5 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
			TEMP <= '0';
			WAIT FOR 0.2 SEC;
			TEMP <= '1';
			WAIT FOR 1.5 SEC;
		ELSE
			COUNT <= COUNT - 1;
			TEMP <= '0';
			WAIT FOR 1.5 SEC;

		END IF;
	END IF;
		
	END PROCESS;
	CODE <= TEMP;
END BHV;
