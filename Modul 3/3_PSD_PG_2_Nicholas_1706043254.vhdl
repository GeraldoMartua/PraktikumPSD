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

	elsif (input(count) = 'B' or input(count)='b') then		
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
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'C' or input(count)='c') then		
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
		wait for 1 sec;		
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

	elsif (input(count) = 'E' or input(count)='e') then		
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

	elsif (input(count) = 'G' or input(count)='g') then		
		temp <= '1';
		wait for 1.5 sec;	
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

	elsif (input(count) = 'J' or input(count)='j') then		
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
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'K' or input(count)='k') then		
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

	elsif (input(count) = 'M' or input(count)='m') then		
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'N' or input(count)='n') then		
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'O' or input(count)='o') then	
		temp <= '1';
		wait for 1.5 sec;	
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

	elsif (input(count) = 'P' or input(count)='p') then	
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
		temp <= '1';
		wait for 1 sec;		
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'Q' or input(count)='q') then		-
		temp <= '1';
		wait for 1.5 sec;	
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
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'R' or input(count)='r') then		
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

	elsif (input(count) = 'S' or input(count)='s') then		
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

	elsif (input(count) = 'T' or input(count)='t') then		
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'U' or input(count)='u') then		
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

	elsif (input(count) = 'V' or input(count)='v') then	
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
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'W' or input(count)='w') then	
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

	elsif (input(count) = 'X' or input(count)='x') then		
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
		temp <= '1';
		wait for 1.5 sec;	
		temp <= '0';
		wait for 0.2 sec;	

	elsif (input(count) = 'Y' or input(count)='y') then		
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

	elsif (input(count) = 'Z' or input(count)='z') then		
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
	elsif (input(count) = '1') then
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
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '2') then
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
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '3') then
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
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '4') then
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
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '5') then
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
		temp <= '1';
		wait for 1 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '6') then
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
		temp <= '1';
		wait for 1 sec;
		temp <= '0';
		wait for 0.2 sec;
		temp <= '1';
		wait for 1 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '7') then
		temp <= '1';
		wait for 1.5 sec;	
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
		temp <= '1';
		wait for 1 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '8') then
		temp <= '1';
		wait for 1.5 sec;	
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
		temp <= '1';
		wait for 1 sec;
		temp <= '0';
		wait for 0.2 sec;
		temp <= '1';
		wait for 1 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '9') then
		temp <= '1';
		wait for 1.5 sec;	
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
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;
		temp <= '1';
		wait for 1 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = '0') then
		temp <= '1';
		wait for 1.5 sec;	
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
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;

	elsif (input(count) = ' ') then				
	        temp <= '0';
		wait for 2 sec;
	end if;
     end loop;
	
end process;
end behavioral;