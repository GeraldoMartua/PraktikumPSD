LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY rumputcode IS
 PORT(
 --IN
 NAME : IN STRING (10 DOWNTO 1) := "Hai Aditiya!";
 --OUT
 TEMP : OUT STD_LOGIC := '0');
END rumputcode;

ARCHITECTURE Behaviour OF rumputcode IS

BEGIN
 PROCESS 
 BEGIN
  FOR x in 10 DOWNTO 1 LOOP

   IF NAME(x)='h' THEN
    --H
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;

   ELSIF NAME(x)='a' THEN
    --A
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1.5 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;

   ELSIF NAME(x)='i' THEN  
    --I
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;

   ELSIF NAME(x)=' ' THEN
    --Space
    TEMP <= '0';
     WAIT FOR 2 SEC;

   
   ELSIF NAME(x)='a' THEN
    --A
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1.5 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;

   ELSIF NAME(x)='d' THEN
    --D
    TEMP <= '1';
     WAIT FOR 1.5 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;
    
    
    ELSIF NAME(x)='i' THEN  
    --I
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;

   ELSIF NAME(x)='t' THEN 
    --T
    TEMP <= '1';
     WAIT FOR 1.5 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;

    ELSIF NAME(x)='i' THEN  
    --I
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;

   
   ELSIF NAME(x)='y' THEN  
    --Y
    TEMP <= '1';
     WAIT FOR 1.5 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1.5 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1.5 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;

    ELSIF NAME(x)='a' THEN
    --A
    TEMP <= '1';
     WAIT FOR 1 SEC;
    TEMP <= '0';
     WAIT FOR 0.2 SEC;
    TEMP <= '1';
     WAIT FOR 1.5 SEC;
    TEMP <= '0';
     WAIT FOR 0.5 SEC;
  
   END IF;
  END LOOP;

   TEMP <= '0';
    WAIT FOR 10 SEC;
 END PROCESS;
END Behaviour;
