Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY FSM_Sederhana is
PORT (clock	: IN STD_LOGIC;
      P		: IN STD_LOGIC;
      reset	: IN STD_LOGIC;
      R		: OUT STD_LOGIC);
END FSM_Sederhana;

Architecture BHV of FSM_Sederhana is
TYPE State_type IS (A, B, C, D); 
	SIGNAL State : State_Type;  

BEGIN 
  PROCESS (clock, reset) 
  BEGIN 
    If (reset = ?1?) THEN            
	State <= A;
 
    ELSIF rising_edge(clock) THEN

	CASE State IS

		WHEN A => 
			IF P='1' THEN 
				State <= B; 
			END IF; 
 
		WHEN B => 
			IF P='1' THEN 
				State <= C; 
			END IF; 

		WHEN C => 
			IF P='1' THEN 
				State <= D; 
			END IF; 

		WHEN D=> 
			IF P='1' THEN 
				State <= B; 
			ELSE 
				State <= A; 
			END IF; 
		WHEN others =>
			State <= A;
	END CASE; 
    END IF; 
  END PROCESS;

R <= ?1? WHEN State=D ELSE ?0?;
END BHV;