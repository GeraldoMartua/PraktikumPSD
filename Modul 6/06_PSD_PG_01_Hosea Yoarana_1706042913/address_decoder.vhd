LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY ADDRESS_DECODER IS

PORT( 	ADDRESS_IN 				    :IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		RAM_EN 				    :OUT STD_LOGIC;
		LED_SEL				    :OUT STD_LOGIC;
		LED_VAL			       	    :OUT STD_LOGIC;
		KEY_LINE1			    :OUT STD_LOGIC;
		KEY_LINE2		     	    :OUT STD_LOGIC;
		KEY_LINE3			    :OUT STD_LOGIC;
		KEY_LINE4			    :OUT STD_LOGIC;
		KEY_READ			    :OUT STD_LOGIC

	);


SIGNAL ADDRESS					:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL ROM					:STD_LOGIC;
SIGNAL RAM  					:STD_LOGIC;
SIGNAL KEY1					:STD_LOGIC;
SIGNAL KEY2					:STD_LOGIC;
SIGNAL KEY3					:STD_LOGIC;
SIGNAL KEY4					:STD_LOGIC;
SIGNAL LED_SELECT				:STD_LOGIC;
SIGNAL LED_VALUE				:STD_LOGIC;
SIGNAL KEY_RD					:STD_LOGIC;


END ADDRESS_DECODER;

ARCHITECTURE DECODE OF ADDRESS_DECODER IS

BEGIN
	ADDRESS <= ADDRESS_IN;
	ROM_EN <= ROM;
	RAM_EN <= RAM;
	KEY_LINE1 <= KEY1;
	KEY_LINE2 <= KEY2;
	KEY_LINE3 <= KEY3;
	KEY_LINE4 <= KEY4;
	LED_VAL <= LED_VALUE;
	LED_SEL <= LED_SELECT;
	KEY_READ <= KEY_RD;

PROCESS (ADDRESS)
	BEGIN
			IF (ADDRESS >= "0000000000000000" AND ADDRESS < "0100000000000000") THEN
				ROM <= '0';
				RAM <= '1';
				LED_SELECT <= '1';
				LED_VALUE <= '1';
				KEY1 <= '1';
				KEY2 <= '1';
				KEY3 <= '1';
				KEY4 <= '1';
				KEY_RD <= '1';
			ELSIF (ADDRESS >= "0100000000000000" AND ADDRESS < "1111000000000000") THEN
				RAM <= '0';
				ROM <= '1';
				LED_SELECT <= '1';
				LED_VALUE <= '1';
				KEY1 <= '1';
				KEY2 <= '1';
				KEY3 <= '1';
				KEY4 <= '1';
				KEY_RD <= '1';
			ELSIF (ADDRESS = "1111000000110001") THEN
				ROM <= '1';
				RAM <= '1';
				LED_SELECT <= '1';
				LED_VALUE <= '0';
				KEY1 <= '1';
				KEY2 <= '1';
				KEY3 <= '1';
				KEY4 <= '1';
				KEY_RD <= '1';
			ELSIF (ADDRESS = "1111000000110011") THEN
				ROM <= '1';
				RAM <= '1';
				LED_SELECT <= '0';
				LED_VALUE <= '1';
				KEY1 <= '1';
				KEY2 <= '1';
				KEY3 <= '1';
				KEY4 <= '1';
				KEY_RD <= '1';
			ELSIF (ADDRESS = "1111000000010001") THEN
				ROM <= '1';
				RAM <= '1';
				LED_SELECT <= '1';
				LED_VALUE <= '1';
				KEY1 <= '0';
				KEY2 <= '1';
				KEY3 <= '1';
				KEY4 <= '1';
				KEY_RD <= '0';
			ELSIF (ADDRESS = "1111000000010010") THEN
				ROM <= '1';
				RAM <= '1';
				LED_SELECT <= '1';
				LED_VALUE <= '1';
				KEY1 <= '1';
				KEY2 <= '0';
				KEY3 <= '1';
				KEY4 <= '1';
				KEY_RD <= '0';
			ELSIF (ADDRESS = "1111000000010011") THEN
				ROM <= '1';
				RAM <= '1';
				LED_SELECT <= '1';
				LED_VALUE <= '1';
				KEY1 <= '1';
				KEY2 <= '1';
				KEY3 <= '0';
				KEY4 <= '1';
				KEY_RD <= '0';
			ELSIF (ADDRESS = "1111000000010100") THEN
				ROM <= '1';
				RAM <= '1';
				LED_SELECT <= '1';
				LED_VALUE <= '1';
				KEY1 <= '1';
				KEY2 <= '1';
				KEY3 <= '1';
				KEY4 <= '0';
				KEY_RD <= '0';
			ELSE
				ROM <= '1';
				RAM <= '1';
				LED_SELECT <= '1';
				LED_VALUE <= '1';
				KEY1 <= '1';
				KEY2 <= '1';
				KEY3 <= '1';
				KEY4 <= '1';
				KEY_RD <= '1';
			END IF;
END PROCESS;
END DECODE;