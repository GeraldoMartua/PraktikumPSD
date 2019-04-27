library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tambah is
  port (
   DataIn		: INOUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	CLK			: IN STD_LOGIC;
	ADDRESS		: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	W_R			: IN STD_LOGIC;
	Data1, Data2: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	DataOut		: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
end entity tambah;

ARCHITECTURE Behav OF tambah IS
	TYPE MEM IS ARRAY (31 DOWNTO 0) OF STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL MEMORY: MEM;
	SIGNAL ADDR: INTEGER RANGE 0 TO 31;
	SIGNAL HASIL : STD_LOGIC_VECTOR(3 DOWNTO 0);	
	BEGIN
	PROCESS(ADDRESS, DataIn, W_R, CLK)
	BEGIN
		ADDR<=CONV_INTEGER(ADDRESS);
	IF (RISING_EDGE(CLK)) THEN	
		IF(W_R='1') THEN
			HASIL <= Data1 + Data2;
			DataIn <= HASIL;
		END IF;
	END IF;
		MEMORY(ADDR)<=DATAIN;
		DATAOUT <= MEMORY(ADDR);
	END PROCESS;
END ARCHITECTURE BEHAV;