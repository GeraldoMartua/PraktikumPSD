LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SANDIRUMPUT IS
PORT( 
NAME : IN STRING (10 DOWNTO 1) := "HAI FAKHRUL!";
SRUMPUT : OUT STD_LOGIC := '0');
END SANDIRUMPUT;

ARCHITECTURE Behaviour OF SANDIRUMPUT IS

BEGIN
	PROCESS 
	BEGIN
		FOR x in 10 DOWNTO 1 LOOP

	IF NAME(x)='H' THEN --H
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.5 SEC;

	ELSIF NAME(x)='A' THEN --A
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1.5 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.5 SEC;

	ELSIF NAME(x)='I' THEN --I
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.5 SEC;

   	ELSIF NAME(x)=' ' THEN --Space
		SRUMPUT <= '0';
			WAIT FOR 2 SEC;
   
	ELSIF NAME(X)='F' THEN --F
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1.5 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.5 SEC;

   	ELSIF NAME(x)='A' THEN --A
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1.5 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.5 SEC;
			
	ELSIF NAME(x)='K' THEN --K
		SRUMPUT <= '1';
			WAIT FOR 1.5 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1.5 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.5 SEC;

	ELSIF NAME(x)='H' THEN --H
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
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
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1.5 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.5 SEC;

    	ELSIF NAME(x)='L' THEN --L
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1.5 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.2 SEC;
		SRUMPUT <= '1';
			WAIT FOR 1 SEC;
		SRUMPUT <= '0';
			WAIT FOR 0.5 SEC;
  
	END IF;
END LOOP;

		SRUMPUT <= '0';
			WAIT FOR 100 SEC;
	END PROCESS;
END Behaviour;
