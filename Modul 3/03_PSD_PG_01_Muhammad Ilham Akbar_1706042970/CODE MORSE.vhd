library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morse is
generic(frekuensi : integer := 10);
port(
	clk    	: in std_logic;		-- Clock
	rst   		: in std_logic; 	-- Reset
	output		: inout std_logic 	-- Output
	);	
end morse;

architecture behavioral of morse is
	signal x : integer;
	signal y : integer;
	signal z : integer;

begin
process (clk) is
		begin 
			if (clk'event and clk='1') then
				if rst = '0' then
				--insialisasi nama:
				--diisi
					if (x= frekuensi -1) then
						x<= 0;
						--H
						if (y = 0) then				
							if (z = 0) then
								z <= z+1;
								output <= '1';
							elsif (z = 1) then
								z<=z+1;
								output <= '1';
							elsif (z = 2) then	
								z <= z +1;
								output <= '0';
							elsif (z = 3) then	
								z <= z + 1;
								output <= '1';
							elsif (z = 4) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 5) then
								z <= z + 1;
								output <= '0';
							elsif (z = 6) then
								z <= z + 1;
								output <= '1';
							elsif (z = 7) then
								z <= z + 1;
								output <= '1';
							elsif (z = 8) then
								z <= z + 1;
								output <= '0';
							elsif (z = 9) then
								z <= z + 1;
								output <= '1';
							elsif (z = 10) then
								z <= z + 1;
								output <= '1';
							elsif (z = 11) then
								z <= z + 1;
								output <= '0';
							else
								output <= '0';
								z <= 0;
								y <= y + 1;
							end if;
						--A	
						elsif (y = 1) then				
							if (z = 0) then
								z <= z+1;
								output <= '1';
							elsif (z = 1) then
								z<=z+1;
								output <= '1';
							elsif (z = 2) then	
								z <= z +1;
								output <= '0';
							elsif (z = 3) then	
								z <= z + 1;
								output <= '1';
							elsif (z = 4) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 5) then
								z <= z + 1;
								output <= '1';
							elsif (z = 6) then
								z <= z + 1;
								output <= '1';
							elsif (z = 7) then
								z <= z + 1;
								output <= '0';
							else
								output <= '0';
								z <= 0;
								y <= y + 1;
							end if;
						--I	
						elsif (y = 2) then				
							if (z = 0) then
								z <= z+1;
								output <= '1';
							elsif (z = 1) then
								z<=z+1;
								output <= '1';
							elsif (z = 2) then	
								z <= z +1;
								output <= '0';
							elsif (z = 3) then	
								z <= z + 1;
								output <= '1';
							elsif (z = 4) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 5) then
								z <= z + 1;
								output <= '0';
							else
								output <= '0';
								z <= 0;
								y <= y + 1;
							end if;
						--SPASI	
						elsif (y = 3) then				
							if (z = 0) then
								z <= z+1;
								output <= '0';
							elsif (z = 1) then
								z<=z+1;
								output <= '0';
							elsif (z = 2) then	
								z <= z +1;
								output <= '0';
							else
								output <= '0';
								z <= 0;
								y <= y + 1;
							end if;
						--D
						elsif (y = 4) then				
							if (z = 0) then
								z <= z+1;
								output <= '1';
							elsif (z = 1) then
								z<=z+1;
								output <= '1';
							elsif (z = 2) then	
								z <= z +1;
								output <= '1';
							elsif (z = 3) then	
								z <= z + 1;
								output <= '1';
							elsif (z = 4) then		
								z <=z + 1;
								output <= '0';
							elsif (z = 5) then
								z <= z + 1;
								output <= '1';
							elsif (z = 6) then
								z <= z + 1;
								output <= '1';
							elsif (z = 7) then
								z <= z + 1;
								output <= '0';
							elsif (z = 8) then
								z <= z + 1;
								output <= '1';
							elsif (z = 9) then
								z <= z + 1;
								output <= '1';
							elsif (z = 10) then
								z <= z + 1;
								output <= '0';
							else
								output <= '0';
								z <= 0;
								y <= y + 1;
							end if;
						--U	
						elsif (y = 5) then				
							if (z = 0) then
								z <= z+1;
								output <= '1';
							elsif (z = 1) then
								z<=z+1;
								output <= '1';
							elsif (z = 2) then	
								z <= z +1;
								output <= '0';
							elsif (z = 3) then	
								z <= z + 1;
								output <= '1';
							elsif (z = 4) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 5) then
								z <= z + 1;
								output <= '0';
							elsif (z = 6) then
								z <= z + 1;
								output <= '1';
							elsif (z = 7) then
								z <= z + 1;
								output <= '1';
							elsif (z = 8) then
								z <= z + 1;
								output <= '1';
							elsif (z = 9) then
								z <= z + 1;
								output <= '1';
							elsif (z = 10) then
								z <= z + 1;
								output <= '0';
							else
								output <= '0';
								z <= 0;
								y <= y + 1;
							end if;
						--T	
						elsif (y = 6) then				
							if (z = 0) then
								z <= z+1;
								output <= '1';
							elsif (z = 1) then
								z<=z+1;
								output <= '1';
							elsif (z = 2) then	
								z <= z +1;
								output <= '1';
							elsif (z = 3) then	
								z <= z + 1;
								output <= '1';
							elsif (z = 4) then		
								z <=z + 1;
								output <= '0';
							else
								output <= '0';
								z <= 0;
								y <= y + 1;
							end if;
						--o
						elsif (y = 7) then				
							if (z = 0) then
								z <= z+1;
								output <= '1';
							elsif (z = 1) then
								z<=z+1;
								output <= '1';
							elsif (z = 2) then	
								z <= z +1;
								output <= '1';
							elsif (z = 3) then	
								z <= z + 1;
								output <= '1';
							elsif (z = 4) then		
								z <=z + 1;
								output <= '0';
							elsif (z = 5) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 6) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 7) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 8) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 9) then		
								z <=z + 1;
								output <= '0';
							elsif (z = 10) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 11) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 12) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 13) then		
								z <=z + 1;
								output <= '1';
							elsif (z = 14) then		
								z <=z + 1;
								output <= '0';
							else
								output <= '0';
								z <= 0;
								y <= y + 1;
							end if;
								
						end if;
					else
						x<=x+1;
					end if;				
				else
					x <=0;
					y <=0;
					z <=0;
				end if;
			end if;
end process;
end behavioral;
--OUTPUT HAI DUTO			
				
			
			
