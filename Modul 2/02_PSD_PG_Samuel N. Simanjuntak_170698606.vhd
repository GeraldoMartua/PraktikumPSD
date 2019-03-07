library IEEE;
        
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
        
entity counter is 
        
port(	Clock, reset, sub: in  std_logic;
	akhir : out std_logic_vector(3 downto 0));
	
        
end counter;
        
architecture logic of counter is  
	signal hasil: std_logic_vector(3 downto 0);
     
             begin
             process (Clock, reset,sub) 
             begin   
		
                   if (reset='1') then   

                          hasil <= "0000" ;
                   elsif (Clock'event and Clock='1' and sub= '0') then 
                          hasil <= hasil +1;
		   
		
                   end if; 

		if ( Clock'event and Clock='1' and sub= '1' and hasil>0)then
			hasil <= hasil -1;
		end if;    
             end process; 
        
	akhir <= hasil;
        
end logic;