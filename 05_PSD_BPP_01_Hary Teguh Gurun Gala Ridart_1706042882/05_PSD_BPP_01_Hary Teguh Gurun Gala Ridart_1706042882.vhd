library ieee;
use ieee.std_logic_1164.all;


ENTITY mealyAdder IS
PORT (clk	: IN std_logic;	
	  x 	: IN std_logic_vector(1 downto 0);
	  z 	: OUT std_logic);
END mealyAdder;

ARCHITECTURE one OF mealyAdder IS
TYPE state_type IS (N,C,S);
SIGNAL state,next_state: state_type;
signal b : std_logic;
BEGIN
	PROCESS
	BEGIN
		WAIT UNTIL clk='1' AND clk'event;
		state <= next_state;
	END PROCESS;

PROCESS (state,x)
BEGIN		--Next State
	CASE state IS  
	WHEN N => IF (x="00" or x ="01" or x = "10") THEN 
			next_state <= N;
		elsif (x = "11") then
			next_state<= C;
		ELSE next_state <= S;
		END IF;
	WHEN C => IF (x="1" or x ="01" or x = "10") THEN 
			next_state <= C;
		elsif (x = "00") then
			next_state<= N;
		ELSE next_state <= S;
		END IF;
	WHEN S => next_state <= S;
	
	END CASE;
END PROCESS;

PROCESS (state,x)   --Output Logic
BEGIN
CASE state IS
WHEN N => IF (x="00") then 
			z <='0';
		elsif (x="01" or x = "10") then
			z<='1';
		else z<=b;
		end if;
		
WHEN C => IF (x="11") then 
			z <='1';
		elsif (x="01" or x = "10") then
			z<='0';
		else z<=b;
		end if;
WHEN S => next_state<=S;
END CASE;
END PROCESS;

end one; 