library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Factor is
  port (
    	MEMDATA		: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	ADDRESS		: in INTEGER RANGE 0 TO 31;
	CLOCK		: IN STD_LOGIC;
	INPUT1		: inout INTEGER RANGE 0 TO 100;
	DATAOUT		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
end entity Factor;

ARCHITECTURE BEV OF Factor IS
	TYPE MEM IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL MEMORY: MEM;
	signal FACTORIAL : INTEGER := 1;
	signal count : integer := 2;
	BEGIN
	PROCESS(ADDRESS, MEMDATA, CLOCK, INPUT1)

	BEGIN
		IF(RISING_EDGE(CLOCK)) THEN
			FOR i in 1 to INPUT1 LOOP
				factorial <= factorial * count;
				count <= count + 1;
				input1 <= factorial;
				if input1 = count then	MEMDATA <= std_logic_vector(to_unsigned(INPUT1, 4)); end if;
				END LOOP;
			

			
		END IF;
		DATAOUT <= MEMORY(ADDRESS);
		MEMORY(ADDRESS)<= MEMDATA;
	END PROCESS;
END ARCHITECTURE BEV;