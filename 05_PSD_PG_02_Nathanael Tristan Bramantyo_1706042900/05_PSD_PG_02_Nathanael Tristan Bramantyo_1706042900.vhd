lIbrary ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.all;
--IC = Insert Coin;
--LP = Line pickup;
--FN = Finished insert number;
--CD = Call duration;
--IR,IU = Insert number;
--WC,WIL,EA,MS = When in call;
--FC,SC,C = Finished call;

entity multelp is
port (
	CLK,S : IN STD_LOGIC;
	MULTIPLIER,MULTIPLICAND: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	PRODUCT: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
	D: OUT STD_LOGIC);
END multelp;

ARCHITECTURE BEHAVIORAL OF multelp IS
	SIGNAL STATE, NEXTSTATE: INTEGER RANGE 0 TO 4;
	SIGNAL A,B,PU,PL: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL ANDARRAY: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL ADDOUT: STD_LOGIC_VECTOR (4 DOWNTO 0);
	SIGNAL MUXOUT: STD_LOGIC_VECTOR (3 DOWNTO 0);
	SIGNAL IC,LP,FN,CD,IR,IU,WC,WIL,EA,MS,FC,SC,C: STD_LOGIC;
	ALIAS B3: STD_LOGIC IS B(3);
	ALIAS A3: STD_LOGIC IS A(3);

BEGIN
	IC <='1' WHEN B="0000" ELSE '0';
	MUXOUT <= PU WHEN MS='1' ELSE PL;
	ANDARRAY <= A WHEN EA = '1' AND IU = '0' ELSE
	NOT A WHEN EA ='1' AND IU = '1' ELSE
	"1111" WHEN EA = '0' AND IU ='1' ELSE "0000";
	ADDOUT<=('0'&MUXOUT)+('0'&ANDARRAY)+("0000"&C); 
	PRODUCT <= PU & PL;

PROCESS(S,STATE,IC)
BEGIN
	FN<='0';LP<='0';CD<='0';IR<='0';MS<='0';FC<='0';
	SC<='0';EA<='0';IU<='0';WC<='0';
	WIL <='0';D<= '0';
	CASE STATE IS
		WHEN 0 =>
		FN <= '1';LP <= '1';
		IF S='1' THEN NEXTSTATE <=1;
			ELSE NEXTSTATE <= 0;
		END IF;

		WHEN 1 =>
		NEXTSTATE <= 2;
		IF B3 = '1' THEN SC <='1';
			ELSE FC <= '1';
		END IF;

		WHEN 2 =>
		IF IC ='1' THEN NEXTSTATE <=4;
			ELSE NEXTSTATE <= 3; WIL <= '1'; EA <='1';
		END IF;
		IF IC ='0' AND B3 ='1' THEN IU <= '1';
		END IF;

		WHEN 3 =>
		WC <= '1'; MS<= '1';NEXTSTATE <= 2;
		IF B3='0' THEN FC <= '1' ; CD <= '1';
			ELSE SC <= '1'; IR <='1';
		END IF;
		IF (A3 XOR B3) = '1' THEN IU <= '1' ;
		END IF;

		WHEN 4 =>
		D<='1';
		IF S='1' THEN NEXTSTATE <= 4;
		ELSE NEXTSTATE <= 0;
		END IF;
	END CASE ;
END PROCESS;

PROCESS (CLK)
BEGIN
	IF CLK'EVENT AND CLK='1'THEN
	IF LP ='1' THEN B <= MULTIPLIER ;
		A <= MULTIPLICAND ; END IF;
	IF FN ='1' THEN PU <="0000";
		PL<= "0000";
	END IF;

	IF CD='1' THEN B <=B-1;
	END IF;

	IF IR ='1' THEN B <= B+1;
	END IF;

	IF WIL ='1' THEN PL <= ADDOUT (3 DOWNTO 0);
	END IF;

	IF FC='1' THEN C <='0';ELSIF SC ='1' THEN C <='1';
		ELSE C <= ADDOUT (4);
	END IF;

		STATE <= NEXTSTATE;
END IF;
END PROCESS;
END BEHAVIORAL;