library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity MorseCode is
generic(Frequency : integer := 10);
port(
    clock     : in std_logic;		
    reset   : in std_logic; 		
    cod    : inout std_logic);	
end entity;
 
architecture esrom of MorseCode is
	-- HAIEKO    
	-- . . . . | . - | . . | . | - . - | - - - |

   signal sum  : integer;
   signal list  : integer := 0;
   signal jenis  : integer := 0;
 
begin
 
    process(clock) is
    begin
        if rising_edge(clock) then
				 
        if reset  = '0' then
           sum  <= 0;
		list  <= 0;
		jenis  <= 0;
					 
        else
                -- aktif untuk tiap jenis
        if sum = Frequency - 1 then
   	   sum <= 0;
		if list = 0 then				-- H = . . . .
			if jenis = 0 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 1 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 2 then
				cod <= '0';
				jenis <= jenis + 1;
			elsif jenis = 3 then	
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 4 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 5 then
				cod <= '0';
				jenis <= jenis + 1;
			elsif jenis = 6 then	
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 7 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 8 then
				cod <= '0';
				jenis <= jenis + 1;
			elsif jenis = 9 then	
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 10 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 11 then
				cod <= '0';
				jenis <= jenis + 1;
					else
						cod <= '0';
						jenis <= 0;
							list <= list + 1;
						end if;
									
		elsif list = 1 then			-- A =  . - 
			if jenis = 0 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 1 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 2 then
				cod <= '0';
				jenis <= jenis + 1;
			elsif jenis = 3 then	
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 4 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 5 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 6 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 7 then
				cod <= '0';
				jenis <= jenis + 1;
			else
				cod <= '0';
				jenis <= 0;
				list <= list + 1;
			end if;

							
		elsif list = 2 then			-- I =  . . 
			if jenis = 0 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 1 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 2 then
				cod <= '0';
				jenis <= jenis + 1;	
			elsif jenis = 3 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 4 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 5 then
				cod <= '0';
				jenis <= jenis + 1;
			else
				cod <= '0';
				jenis <= 0;
				list <= list + 1;
					end if;
																					
		elsif list = 3 then			-- E =  .  
			if jenis = 0 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 1 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 2 then
				cod <= '0';
				jenis <= jenis + 1;
			else
				cod <= '0';
				jenis <= 0;
				list <= list + 1;
					end if;	
									
		elsif list = 4 then			-- K = - . -
			if jenis = 0 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 1 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 2 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 3 then	
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 4 then
				cod <= '0';
				jenis <= jenis + 1;
			elsif jenis = 5 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 6 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 7 then
				cod <= '0';
				fjenis <= jenis + 1;
			elsif jenis = 8 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 9 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 10 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 11 then	
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 12 then
				cod <= '0'
				jenis <= jenis + 1;
			else
				cod <= '0';
				jenis <= 0;
				list <= list + 1;
					end if;
									
		elsif list = 5 then			-- O =  - - -
			if jenis = 0 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 1 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 2 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 3 then	
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 4 then
				cod <= '0';
				jenis <= jenis + 1;
			elsif jenis = 5 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 6 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 7 then
				cod <= '1';
				fjenis <= jenis + 1;
			elsif jenis = 8 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 9 then
				cod <= '0';
				jenis <= jenis + 1;
			elsif jenis = 10 then
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 11 then	
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 12 then
				cod <= '1'
				jenis <= jenis + 1;
			elsif jenis = 13 then 		
				cod <= '1';
				jenis <= jenis + 1;
			elsif jenis = 14 then
				cod <= '0';
				jenis <= jenis + 1;
			else
				cod <= '0';
				jenis <= 0;
				list <= list + 1;
					end if;	
								
		end if;
			else
				sum  <= sum  + 1;
		end if;
            end if;
        end if;
    end process;
 
end architecture;