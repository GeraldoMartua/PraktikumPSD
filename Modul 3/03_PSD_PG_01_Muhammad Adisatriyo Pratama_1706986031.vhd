--Muhammad Adisatriyo Pratama
--1706986031
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
--Referensi dari praktikan PSD hari rabu tentang Kode Morse

ENTITY sandirumput IS
	PORT(
	NAME	: IN STRING (10 DOWNTO 1) := "Hai Hilman";
	TEMP	: OUT STD_LOGIC := '0');
END sandirumput;

ARCHITECTURE Behavioural OF sandirumput IS
	
BEGIN
	PROCESS 
	BEGIN
		FOR COUNT in 10 DOWNTO 1 LOOP
		
			IF NAME(COUNT)='h' OR NAME(COUNT) = 'H' THEN
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
				
			ELSIF NAME(COUNT)='a' OR NAME(COUNT) = 'A' THEN
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
			
			ELSIF NAME(COUNT)='i' OR NAME(COUNT) = 'I' THEN		
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
			
			ELSIF NAME(COUNT)=' ' THEN
				TEMP <= '0';
					WAIT FOR 2 SEC;
			
			ELSIF NAME(COUNT)='l' OR NAME(COUNT) = 'L'  THEN
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
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
			
			ELSIF NAME(COUNT)='m' OR NAME(COUNT) = 'M'  THEN
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
					
			ELSIF NAME(COUNT)='n' OR NAME (COUNT) = 'N' THEN
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
END Behavioural;
