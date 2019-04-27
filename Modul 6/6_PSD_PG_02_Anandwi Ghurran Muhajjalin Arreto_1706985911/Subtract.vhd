LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY Subtract IS
	PORT(	NUM1, NUM2	:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			CLK	: 	IN		STD_LOGIC := '1';
			EN		:	IN		STD_LOGIC;
			RES	: 	OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0));
END Subtract;

ARCHITECTURE SUB OF Subtract IS
	SIGNAL SUM	: 	STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	BEGIN
		PROCESS	
		BEGIN
			WAIT UNTIL CLK = '1' AND CLK'EVENT;
			IF EN = '1' THEN
				IF NUM1 >= NUM2 THEN
					SUM <= NUM1 - NUM2;
				ELSE
					SUM <= "0000";
				END IF;
			END IF;
		END PROCESS;
		RES <= SUM;		
END SUB;