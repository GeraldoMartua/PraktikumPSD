LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY rumput IS
	PORT(
	--IN
	NAME	: IN STRING (9 DOWNTO 1) := "Hai Ridho";
	--OUT
	TEMP	: OUT STD_LOGIC := '0');
END rumput;

ARCHITECTURE Behaviour OF rumput IS

BEGIN
	PROCESS 
	BEGIN
		FOR k in 9 DOWNTO 1 LOOP

			IF NAME(k)='h' THEN
				--H
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
					WAIT FOR 0.5 SEC;

			ELSIF NAME(k)='a' THEN
				--a
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;

			ELSIF NAME(k)='i' THEN		
				--I
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;

			ELSIF NAME(k)=' ' THEN
				--Space
				TEMP <= '0';
					WAIT FOR 2 SEC;

			ELSIF NAME(k)='R' THEN
				--R
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 1.5 SEC;
				TEMP <= '1';
					WAIT FOR 0.2 SEC;
				TEMP <= '0';
					WAIT FOR 1.5 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 1 SEC;

			ELSIF NAME(k)='i' THEN
				--i
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 1 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
				

			ELSIF NAME(k)='d' THEN	
				--d
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 1 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
			ELSIF NAME(k)='h' THEN	
				--h
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
				TEMP <= '1';
					WAIT FOR 0.5 SEC;
				TEMP <= '0';
					WAIT FOR 1 SEC;
			
			ELSIF NAME(k)='o' THEN		
				--o
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
			
			END IF;
		END LOOP;

			TEMP <= '0';
				WAIT FOR 10 SEC;
	END PROCESS;
END Behaviour;
