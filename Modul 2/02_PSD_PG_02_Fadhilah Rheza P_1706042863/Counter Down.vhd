library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;        

entity counter_up is 
port(
   Clk,CLR : in  std_logic;  
   Q : out std_logic_vector(2 downto 0)
);       
end counter_up;        

architecture bhv of counter_up is  
   signal tmp: std_logic_vector(2 downto 0);       

begin      
   process (Clk, CLR)        
   begin   
   if (CLR = '1') then   
   tmp <= "111";  
   elsif (Clk'event and Clk = '1') then 
   tmp <= tmp - 1;      
   end if;         
   end process;       
Q <= tmp;        
end bhv;

