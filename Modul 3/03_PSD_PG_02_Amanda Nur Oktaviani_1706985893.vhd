library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sandi_rumput is
	port(
	--IN
	nama	: in string (8 downto 1) := "hai koku";
	--OUT
	temp	: out std_logic := '0');
end sandi_rumput;

architecture behavior of sandi_rumput is
	
begin
	process 
	begin
		for a in 8 downto 1 loop
		
			if nama(a)='h' then
				--h
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
					wait for 0.5 sec;
				
			elsif nama(a)='a' then
				--a
				temp <= '1';
					wait for 1 sec;
				temp <= '0';
					wait for 0.2 sec;
				temp <= '1';
					wait for 1.5 sec;
				temp <= '0';
					wait for 0.5 sec;
			
			elsif nama(a)='i' then		
				--i
				temp <= '1';
					wait for 1 sec;
				temp <= '0';
					wait for 0.2 sec;
				temp <= '1';
					wait for 1 sec;
				temp <= '0';
					wait for 0.5 sec;
			
			elsif nama(a)=' ' then
				--spasi
				temp <= '0';
					wait for 2 sec;
			
			elsif nama(a)='k' then
				--k
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
					wait for 0.5 sec;
			
			elsif nama(a)='o' then
				--o
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
					wait for 0.5 sec;

elsif nama(a)='k' then
				--k
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
					wait for 0.5 sec;
					
			elsif nama(a)='u' then	
				--u
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
			end if;
		end loop;
		
			temp <= '0';
				wait for 10 sec;
	end process;
end behavior;
