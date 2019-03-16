LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

 -- entity
ENTITY rumput IS
	PORT(
	sandi : OUT STD_LOGIC
);
END rumput;

 -- architecture
ARCHITECTURE sandi_rumput OF rumput IS


BEGIN

Process
begin 
		

		 -- H
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.5 sec;

		 -- A
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1.5 sec;
		sandi <= '0'; 
		wait for 0.5 sec;
		
		-- I
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1 sec;


		-- space
		sandi <= '0'; 
		wait for 2 sec;

		-- S
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1';
		wait for 1 sec;
		sandi <= '0';
		wait for 0.5 sec;

		 -- U
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1';
		wait for 1.5 sec;
		sandi <= '0';
		wait for 0.5 sec;

		-- L
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1.5 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 
		wait for 0.2 sec;
		sandi <= '1';
		wait for 1 sec;
		sandi <= '0';
		wait for 0.5 sec;

		-- E
		sandi <= '1'; 
		wait for 1 sec;
		sandi <= '0'; 	
	

END process;
END sandi_rumput;