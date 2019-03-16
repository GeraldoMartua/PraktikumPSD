LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SANDIRUMPUT IS
 PORT(
 --IN
 NAME : IN STRING (10 DOWNTO 1) := "HAI FAKHRUL!";
 --OUT
 TEMP : OUT STD_LOGIC := '0');
END SANDIRUMPUT;

ARCHITECTURE Behaviour OF SANDIRUMPUT IS

BEGIN
	PROCESS 
	BEGIN
		FOR x in 10 DOWNTO 1 LOOP

		IF NAME(x)='H' THEN --H
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

	ELSIF NAME(x)='A' THEN --A
		TEMP <= '1';
			WAIT FOR 1 SEC;
		TEMP <= '0';
			WAIT FOR 0.2 SEC;
		TEMP <= '1';
			WAIT FOR 1.5 SEC;
		TEMP <= '0';
			WAIT FOR 0.5 SEC;

   ELSIF NAME(x)='I' THEN --I
		TEMP <= '1';
			WAIT FOR 1 SEC;
		TEMP <= '0';
			WAIT FOR 0.2 SEC;
		TEMP <= '1';
			WAIT FOR 1 SEC;
		TEMP <= '0';
			WAIT FOR 0.5 SEC;

   ELSIF NAME(x)=' ' THEN --Space
		TEMP <= '0';
			WAIT FOR 2 SEC;
   
	ELSIF NAME(X)='F' THEN --F
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
		TEMP <= '0';
			WAIT FOR 0.5 SEC;

   ELSIF NAME(x)='A' THEN --A
		TEMP <= '1';
			WAIT FOR 1 SEC;
		TEMP <= '0';
			WAIT FOR 0.2 SEC;
		TEMP <= '1';
			WAIT FOR 1.5 SEC;
		TEMP <= '0';
			WAIT FOR 0.5 SEC;
			
	ELSIF NAME(x)='K' THEN --K
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

	ELSIF NAME(x)='H' THEN --H
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

	ELSIF NAME(x)='R' THEN --R
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

   
	ELSIF NAME(x)='U' THEN --U
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
			WAIT FOR 0.5 SEC;

    ELSIF NAME(x)='L' THEN --L
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
		TEMP<= '1';
			WAIT FOR 1 SEC;
		TEMP <= '0';
			WAIT FOR 0.5 SEC;
  
	END IF;
END LOOP;

		TEMP <= '0';
			WAIT FOR 10 SEC;
	END PROCESS;
END Behaviour;