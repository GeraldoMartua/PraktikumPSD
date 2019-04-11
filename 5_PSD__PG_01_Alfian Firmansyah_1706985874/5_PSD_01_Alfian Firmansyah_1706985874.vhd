library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.all;

--KM = koin ketika masuk; 
--AT = Angkat telepon; 
--SP = Selesai Isi Nomor Telepon 
--DT = Durasi Menelepon; 
--IX,IY = Isi nomor Telepon; 
--STA,STB,SE,SM = Ketika sedang menelepon; 
--ST,SU,CT = Selesai menelepon; 

entity Telpon_Umum is
port (
	CLK,S : IN STD_LOGIC;
	MULTIPLIER,MULTIPLICAND: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
	PRODUCT: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
	D: OUT STD_LOGIC
	);
END Telpon_Umum;

ARCHITECTURE BEHAVIORAL OF Telpon_Umum IS
SIGNAL STATE, NEXTSTATE: INTEGER RANGE 0 TO 4;
SIGNAL X,Y,TA,TB: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL ANDARRAY: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL ADDOUT: STD_LOGIC_VECTOR (4 DOWNTO 0);
SIGNAL MUXOUT: STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL KM,AT,SP,DT,IY,IX,STA,STB,SE,SM,ST,SU,CT: STD_LOGIC;
ALIAS Y3: STD_LOGIC IS Y(3);
ALIAS X3: STD_LOGIC IS X(3);
BEGIN
KM <='1' WHEN Y="0000" ELSE '0';		--state koin dimasukkan
MUXOUT <= TA WHEN SM='1' ELSE TB;
ANDARRAY <= X WHEN SE = '1' AND IX = '0' ELSE
NOT X WHEN SE ='1' AND IX = '1' ELSE
"1111" WHEN SE = '0' AND IX ='1' ELSE "0000";
ADDOUT <= ('0' & MUXOUT)+('0' & ANDARRAY)+("0000" & CT); 
PRODUCT <= TA & TB;

PROCESS(S,STATE,KM)
BEGIN
	SP<='0';
	AT<='0';
	DT<='0';
	IY<='0';
	SM<='0';
	ST<='0';
	SU<='0';
	SE<='0';
	IX<='0';
	STA<='0';
	STB<='0';
	D<= '0';

CASE STATE IS

WHEN 0 =>
	SP <= '1';
	AT <= '1';
	IF S='1' THEN 
		NEXTSTATE <=1;
	ELSE 
		NEXTSTATE <= 0; 
	END IF;
WHEN 1 =>
	NEXTSTATE <= 2;
	IF Y3 = '1' THEN 
		SU <='1';
	ELSE 
		ST <= '1'; 
	END IF;
WHEN 2 =>
	IF KM ='1' THEN 
		NEXTSTATE <=4;
	ELSE 
		NEXTSTATE <= 3; 
		STB <= '1'; 
		SE <='1';
	END IF;
	
	IF KM ='0' AND Y3 ='1' THEN 
		IX <= '1';
	END IF;
WHEN 3 =>
	STA <= '1'; 
	SM <= '1';
	NEXTSTATE <= 2;
	IF Y3='0' THEN 
		ST <= '1' ; 
		DT <= '1';
	ELSE 
		SU <= '1'; 
		IY <='1';
	END IF;
	IF (X3 XOR Y3) = '1' THEN 
		IX <= '1' ; 
	END IF;
WHEN 4 =>
	D<='1';
	IF S='1' THEN 
		NEXTSTATE <= 4;
	ELSE 
		NEXTSTATE <= 0; 
	END IF;
END CASE ;
END PROCESS;

PROCESS (CLK)
BEGIN
IF CLK'EVENT AND CLK='1'THEN
	IF AT ='1' THEN 
		Y <= MULTIPLIER;
		X <= MULTIPLICAND ; 
	END IF;
	IF SP ='1' THEN 
		TA <="0000";
		TB<= "0000"; 
	END IF;
	IF DT='1' THEN 
		Y <= Y - 1; 
	END IF;
	IF IY ='1' THEN 
		Y <= Y + 1; 
	END IF;
	IF STB ='1' THEN 
		TB <= ADDOUT (3 DOWNTO 0);
	END IF;
	IF ST='1' THEN 
		CT <='0';
	ELSIF SU ='1' THEN 
		CT <='1';
	ELSE CT <= ADDOUT (4); 
	END IF;
STATE <= NEXTSTATE;
END IF;
END PROCESS;
END BEHAVIORAL;

