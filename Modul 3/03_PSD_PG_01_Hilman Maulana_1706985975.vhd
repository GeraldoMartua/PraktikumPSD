LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY Sandi_rumput IS
	PORT(
	Nama	: IN STRING (10 DOWNTO 1) := "Hai Roy (panggilan Adisatriyo)";
	TEMP	: OUT STD_LOGIC := '0');
END Sandi_rumput;

ARCHITECTURE Behavioural OF Sandi_rumput IS
	
BEGIN
	PROCESS 
	BEGIN
		FOR COUNT in 7 DOWNTO 1 LOOP
		
			IF NAME(COUNT)='h' OR NAME(COUNT) = 'H' THEN --H
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
				
			ELSIF NAME(COUNT)='a' OR NAME(COUNT) = 'A' THEN --a
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1.5 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
			
			ELSIF NAME(COUNT)='i' OR NAME(COUNT) = 'I' THEN	 --i	
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.2 SEC;
				TEMP <= '1';
					WAIT FOR 1 SEC;
				TEMP <= '0';
					WAIT FOR 0.5 SEC;
			
			ELSIF NAME(COUNT)=' ' THEN --spasi
				TEMP <= '0';
					WAIT FOR 2 SEC;
			
			
			ELSIF NAME(COUNT)='r' OR NAME(COUNT) = 'R'  THEN
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
					WAIT FOR 0.5 SEC;

			ELSIF NAME(COUNT)='o' OR NAME(COUNT) = 'O'  THEN
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
					WAIT FOR 0.5 SEC;
					
			ELSIF NAME(COUNT)='y' OR NAME (COUNT) = 'Y' THEN
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
				TEMP <= '0';
					WAIT FOR 0.5 SEC;

			END IF;
		END LOOP;
		
			TEMP <= '0';
				WAIT FOR 7 SEC;
	END PROCESS;
END Behavioural;
