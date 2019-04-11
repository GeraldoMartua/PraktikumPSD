--Darrell Yonathan / 1706042825
Library IEEE;
USE IEEE.Std_Logic_1164.all;

ENTITY SimpleFSM is
PORT (clock:    IN STD_LOGIC;
      ANGKAT:   IN STD_LOGIC;
      reset:    IN STD_LOGIC);
END SimpleFSM;

Architecture FSM of SimpleFSM is
TYPE State_type IS (IDLE, Koin, Durasi, Finish);  
	SIGNAL State : State_Type;    
							   
BEGIN 
  PROCESS (clock, reset) 
  BEGIN 
    If (reset = '1') THEN           
	State <= IDLE;
 
    ELSIF rising_edge(clock) THEN   

 

	CASE State IS

		WHEN IDLE => 
			IF ANGKAT='1' THEN 
				State <= Koin;
			ELSIF ANGKAT='0' THEN
				State <= IDLE;
			 
			END IF; 
 
		
		WHEN Koin => 
			IF ANGKAT='1' THEN 
				State <= Durasi; 
			ELSIF ANGKAT='0' THEN
				State <= IDLE;
			END IF; 
 
		
		WHEN Durasi => 
			IF ANGKAT='1' THEN 
				State <= Finish;

			ELSIF ANGKAT='0' THEN
				State <= Durasi;
			END IF; 
 
		
		WHEN Finish=> 
			IF ANGKAT='1' THEN 
				State <= IDLE; 
			ELSIF ANGKAT='0' THEN
				State <= Durasi;
		
			END IF; 
	
	END CASE; 
    END IF; 
  END PROCESS;
END FSM;
