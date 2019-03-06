LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY COUNTER1 IS
PORT(

NAIK,TURUN : IN STD_LOGIC;
CLK : IN STD_LOGIC;
KELUARAN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END ENTITY COUNTER1;

ARCHITECTURE COUNT OF COUNTER1 IS
SIGNAL PENAIK : UNSIGNED(3 DOWNTO 0) := B"0000";

BEGIN
PROCESS (NAIK,TURUN,CLK)
BEGIN
	IF RISING_EDGE(CLK) THEN
		IF (NAIK ='1' AND TURUN ='1') THEN
		PENAIK <= PENAIK;
		ELSIF NAIK = '1' THEN
		 PENAIK<= PENAIK + 1;
			IF PENAIK = "1001" THEN
			PENAIK <= "0000";
			END IF;
		ELSIF TURUN = '1' THEN
		 PENAIK <= PENAIK -1;
			IF PENAIK = "0000" THEN
			PENAIK <= "1001";
			END IF;
		END IF;
	END IF;
END PROCESS;
KELUARAN <= STD_LOGIC_VECTOR(PENAIK);
END ARCHITECTURE;

