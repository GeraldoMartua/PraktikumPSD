library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY Telepon_Coin is
PORT (clock:    IN STD_LOGIC;
      Angkat:        IN STD_LOGIC;
      Coin:        IN STD_LOGIC;
      Selesai_Input:        IN STD_LOGIC;
      reset:    IN STD_LOGIC;
      R :       OUT STD_LOGIC);
END Telepon_Coin;

Architecture FSM of Telepon_Coin is
TYPE State_type IS (IDLE, DIANGKAT,INPUT_ANGKA, TELEPON);  
	SIGNAL State : State_Type;  
BEGIN 
  PROCESS (clock, reset) 
  BEGIN 
    If (reset = '1') THEN
	State <= IDLE;
 
    ELSIF rising_edge(clock) THEN    
	CASE State IS
 

		WHEN IDLE => 
			IF Angkat='1' THEN 
				State <= DIANGKAT; 
			ELSIF Angkat='0' THEN
				State <= IDLE; 
			END IF; 
 
		WHEN DIANGKAT => 
			IF Coin='1' THEN 
				State <= INPUT_ANGKA; 
			ELSIF Coin='0' THEN
				State <= DIANGKAT; 
			END IF; 
 
		WHEN INPUT_ANGKA => 
			IF SELESAI_INPUT='1' THEN 
				State <= TELEPON; 
			ELSIF SELESAI_INPUT='0' THEN
				State <= INPUT_ANGKA; 
			END IF;
		WHEN TELEPON => 
			IF ANGKAT='1' THEN 
				State <= IDLE; 
			ELSIF ANGKAT='0' THEN
				State <= TELEPON; 
			END IF;
		 
	END CASE; 
    END IF; 
  END PROCESS;

END rtl;