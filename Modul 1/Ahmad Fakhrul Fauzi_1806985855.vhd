LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY gabungan3sistem IS
PORT (

 A0, A1, A2, A3 : IN std_logic_vector(3 DOWNTO 0);
 SELECTOR 	:IN std_logic_vector(3 DOWNTO 0);
 O 		: OUT std_logic_vector(3 DOWNTO 0);
 BCD		: IN std_logic_vector (3 DOWNTO 0);
 Z 		: OUT std_logic_vector (6 DOWNTO 0)
	);
END gabungan3sistem;

ARCHITECTURE mux OF gabungan3sistem IS
BEGIN

 O  <= 	A0 WHEN (SELECTOR = "0011") ELSE
  	A1 WHEN (SELECTOR = "0010") ELSE
 	A2 WHEN (SELECTOR = "0001") ELSE
  	A3 WHEN (SELECTOR = "0000") ELSE
  	"0000";
  
END mux;


ARCHITECTURE BCDtoSEVSEG OF gabungan3sistem IS
BEGIN

PROCESS(BCD)
BEGIN


 CASE BCD IS
 WHEN "0000" => Z <= "0000001"; 
 WHEN "0001" => Z <= "1001111"; 
 WHEN "0010" => Z <= "0010010"; 
 WHEN "0011" => Z <= "0000110"; 
 WHEN OTHERS => Z <= "1111111";
 END CASE;
 
 
END PROCESS;
END BCDtoSEVSEG;
