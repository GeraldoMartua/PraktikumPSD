LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity rumput is
port (input  : in string  (10 downto 1):= "HAI FARHAN";      
      output : out std_logic
      );
end rumput;

architecture bhv_rumput of rumput is
signal temp : std_logic;

begin
process
  begin

      for count in 10 downto 0 loop 
	temp <= '0';
	wait for 0.5 sec;
	if (input(count) = 'A' or input(count) = 'a') then
		temp <= '1'; 		
		wait for 1 sec;
		temp <= '0'; 
		wait for 0.2 sec;
		temp <= '1'; 
		wait for 1.5 sec;
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

	elsif (input(count) = 'N' or input(count)='n') then
		temp <= '1';
		wait for 1.5 sec;
		temp <= '0';
		wait for 0.2 sec;
		temp <= '1';
		wait for 1 sec;
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
	
	elsif (input(count) = ' ') then
	        temp <= '0';
		wait for 2 sec;
	end if;
     end loop;
	
end process;
end bhv_rumput;
	
	