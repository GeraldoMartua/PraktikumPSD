library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY FSM_V is
PORT (clock		:  IN STD_LOGIC;
	  input		:  INOUT integer;
      sel		:  IN STD_LOGIC_VECTOR(1 downto 0) ;
      reset		:  IN STD_LOGIC;
      change 	:  INOUT integer;  --kembalian
	  minuman1	:  INOUT STD_LOGIC;
	  minuman2	:  INOUT STD_LOGIC;
	  minuman3	:  INOUT STD_LOGIC;
	  minuman4	:  INOUT STD_LOGIC);
	  
END FSM_V;

Architecture RTL of FSM_V is
TYPE State_type IS (check, idle, need_4000, need_3000, need_2000, need_1000, choose, change_mon); 
	SIGNAL State : State_Type;     
							      
BEGIN 
  PROCESS (clock, reset) 
  BEGIN 
    If (reset = '1') THEN      
	State <= idle;
	input <= 0;
	change <= 0;
	minuman1 <= '0';
	minuman2 <= '0';
	minuman3 <= '0';
	minuman4 <= '0';
 
    ELSIF rising_edge(clock) THEN    
	CASE State IS
 
		
		WHEN idle => 
			IF (input>= 1000) THEN 
				State <= check;
			END IF;
			
			IF (input < 1000) THEN
				State <= change_mon;
			END IF;
			
		WHEN check => 
			IF (input = 1000) THEN 
				State <= need_4000;
			END IF;
			
			IF (input = 2000) THEN 
				State <= need_3000;
			END IF;
			
			IF (input = 3000) THEN 
				State <= need_2000;
			END IF;
	
			IF (input = 4000) THEN 
				State <= need_1000;
			END IF;
			
			IF (input >= 5000) THEN 
				State <= choose;
			END IF;
	
		WHEN need_4000 =>
			IF (input = 1000) THEN 
				State <= need_3000;
			END IF;
			
			IF (input = 2000) THEN 
				State <= need_2000;
			END IF;
			
			IF (input = 3000) THEN 
				State <= need_1000;
			END IF;
			
			IF (input = 4000) THEN 
				State <= choose;
			END IF;
		
		WHEN need_3000 =>
			IF (input = 1000) THEN 
				State <= need_2000;
			END IF;
			
			IF (input = 2000) THEN 
				State <= need_1000;
			END IF;
			
			IF (input = 3000) THEN 
				State <= choose;
			END IF;
			
		WHEN need_2000 =>
			IF (input = 1000) THEN 
				State <= need_1000;
			END IF;
			
			IF (input = 2000) THEN 
				State <= choose;
			END IF;	
			
		WHEN need_1000 =>
			IF (input = 1000) THEN 
				State <= choose;
			END IF;	
			
		WHEN choose =>
			CASE sel IS
				WHEN "00" =>
					minuman1 <= '1';
					minuman2 <= '0';
					minuman3 <= '0';
					minuman4 <= '0';
					
				WHEN "01" =>
					minuman1 <= '0';
					minuman2 <= '1';
					minuman3 <= '0';
					minuman4 <= '0';

				WHEN "10" =>
					minuman1 <= '0';
					minuman2 <= '0';
					minuman3 <= '1';
					minuman4 <= '0';

				WHEN OTHERS =>
					minuman1 <= '0';
					minuman2 <= '0';
					minuman3 <= '0';
					minuman4 <= '1';	
			END CASE;
			State <= change_mon;
		
		
		WHEN change_mon =>
			IF (input >= 5000) THEN
				change <= input - 5000;
				State <= idle;
			ELSE
				change <= input;
				State <= idle;
			END IF;		
	END CASE; 
    END IF; 
  END PROCESS;

END rtl;
