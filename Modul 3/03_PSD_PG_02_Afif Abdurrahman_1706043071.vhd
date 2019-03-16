LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY pramuka IS
 PORT(
 --IN
nama : IN STRING (9 DOWNTO 1) := "Hai Surya";
 --OUT
temp : OUT STD_LOGIC := '0');
END pramuka;

ARCHITECTURE Behaviour OF pramuka IS

BEGIN
 PROCESS 
 BEGIN
  FOR x in 10 DOWNTO 1 LOOP

   IF nama(x)='h' THEN
    --H
    		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	

   ELSIF nama(x)='a' THEN
    --A
    		temp <= '1'; 		
		wait for 1 sec;		
		temp <= '0'; 
		wait for 0.2 sec;	
		temp <= '1'; 
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;

   ELSIF nama(x)='i' THEN  
    --I
   		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';		
		wait for 1 sec;			
		temp <= '0';
		wait for 0.2 sec;

   ELSIF nama(x)=' ' THEN
    --Spasi
    		temp <= '0';
     		wait for 2 sec;

   
   ELSIF nama(x)='s' THEN
    --S
  		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	

   ELSIF nama(x)='u' THEN
    --U
 		temp <= '1';
		wait for 1 sec;	
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;	
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;
    
    ELSIF nama(x)='r' THEN  
    --R
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	

   ELSIF nama(x)='y' THEN 
    --y
   		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;

   ELSIF nama(x)='a' THEN
    --A
    		temp <= '1'; 		
		wait for 1 sec;		
		temp <= '0'; 
		wait for 0.2 sec;	
		temp <= '1'; 
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;

   END IF;
  END LOOP;

   TEMP <= '0';
  WAIT FOR 10 SEC;
 END PROCESS;
END Behaviour;
