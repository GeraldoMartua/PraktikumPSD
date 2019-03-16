LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY rumps IS
	PORT(
	--IN
	NAME	: IN STRING (10 DOWNTO 1) := "hai ikhsan";
	--OUT
	TEMP	: OUT STD_LOGIC := '0');
END rumps;

ARCHITECTURE BHV OF rumps IS
	
BEGIN
	PROCESS 
	BEGIN
		FOR k in 10 DOWNTO 1 LOOP
		
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
			
			ELSIF NAME(k)='k' THEN
				--K
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
					WAIT FOR 0.5 SEC;
			
			ELSIF NAME(k)='s' THEN
				--S
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
					
			ELSIF NAME(k)='n' THEN	
				--N
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
			END IF;
		END LOOP;
		
			TEMP <= '0';
				WAIT FOR 10 SEC;
	END PROCESS;
END BHV;