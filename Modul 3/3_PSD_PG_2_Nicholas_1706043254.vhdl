library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tutam is
port (input  : in string  (9 downto 1):= "HAI FADHIL";      
      output : out std_logic
      );
end tutam;

architecture behavioral of tutam is
signal temp : std_logic;

begin
process
  begin

      for count in 9 downto 0 loop 
	temp <= '0';
	wait for 0.5 sec;		-
	if (input(count) = 'A' or input(count) = 'a') then		
		temp <= '1'; 		
		wait for 1 sec;		
		temp <= '0'; 
		wait for 0.2 sec;	
		temp <= '1'; 
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;			

	elsif (input(count) = 'D' or input(count)='d') then		
		temp <= '1';
		wait for 1.5 sec;	
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

	elsif (input(count) = 'F' or input(count)='f') then		
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
		temp <= '1';		
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'H' or input(count)='h') then		
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

	elsif (input(count) = 'I' or input(count)='i') then		
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';		
		wait for 1 sec;			
		temp <= '0';
		wait for 0.2 sec;		

	elsif (input(count) = 'L' or input(count)='l') then		
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
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;			

	elsif (input(count) = ' ') then				
	        temp <= '0';
		wait for 2 sec;
	end if;
     end loop;
	
end process;
end behavioral;
