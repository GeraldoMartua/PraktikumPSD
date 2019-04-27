LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY sevensegment IS
	PORT(	bcd	: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		sevseg	: OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
END sevensegment;


ARCHITECTURE decode OF sevensegment IS
BEGIN
	sevseg  <=  "1111110" WHEN bcd = "0000" ELSE
				"0110000" WHEN bcd = "0001" ELSE
				"1101101" WHEN bcd = "0010" ELSE
				"1111001" WHEN bcd = "0011" ELSE
				"0110011" WHEN bcd = "0100" ELSE
				"1011011" WHEN bcd = "0101" ELSE
				"0011111" WHEN bcd = "0110" ELSE
				"1110000" WHEN bcd = "0111" ELSE
				"1111111" WHEN bcd = "1000" ELSE
				"1110011" WHEN bcd = "1001" ELSE "0000000";

end decode;
