library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity tomorse is
generic(ClockFrequencyHz : integer := 10);
port(
    clk     : in std_logic;		
    res    : in std_logic; 	
    kmorse   : inout std_logic);	
end entity;
 
architecture morseedit of tomorse is
   	signal start  : integer;
	signal count1  : integer := 0;
	signal count2  : integer := 0;
 
begin
 
process(clk) is
begin
if rising_edge(clk) then
				 
if res  = '0' then
start  <= 0;
count1  <= 0;
count2  <= 0;			 
            else
               if start = ClockFrequencyHz - 1 then
						start <= 0;
							if count1 = 0 then				-- H = . . . .
								if count2 = 0 then 		
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 2 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 3 then	
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 4 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 5 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 6 then	
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 7 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 8 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 9 then	
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 10 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 11 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= count1 + 1;
								end if;
									
							elsif count1 = 1 then			-- A =  . - 
								if count2 = 0 then 		
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 2 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 3 then	
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 4 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 5 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 6 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 7 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= count1 + 1;
								end if;
							
							elsif count1 = 2 then			-- I =  . . 
								if count2 = 0 then 		
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 2 then
									kmorse <= '0';
									count2 <= count2 + 1;	

								elsif count2 = 3 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 4 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 5 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= count1 + 1;
								end if;
								
							elsif count1 = 3 then			-- SPASI 
								if count2 = 0 then 		
									kmorse <= '0';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '0';
									count2 <= count2 + 1;
								elsif count2 = 2 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= count1 + 1;
								end if;
									
							elsif count1 = 4 then			-- H = . . . . 
								if count2 = 0 then 		
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 2 then
									kmorse <= '0';
									count2 <= count2 + 1;
								elsif count2 = 3 then	-- .
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 4 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 5 then
									kmorse <= '0';
									count2 <= count2 + 1;
								elsif count2 = 6 then	-- .
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 7 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 8 then
									kmorse <= '0';
									count2 <= count2 + 1;
								elsif count2 = 9 then	-- .
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 10 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 11 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= count1 + 1;
								end if;
									
							elsif count1 = 5 then			-- O = - - -
								if count2 = 0 then 		
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 2 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 3 then	
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 4 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 5 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 6 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 7 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 8 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 9 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 10 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 11 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 12 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 13 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 14 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= count1 + 1;
								end if;
									
								elsif count1 = 6 then			-- S =  . . .
								if count2 = 0 then 		
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 2 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 3 then	
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 4 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 5 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 6 then	
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 7 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 11 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= count1 + 1;
								end if;

								elsif count1 = 7 then			-- E =  .
								if count2 = 0 then 		
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 2 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= count1 + 1;
								end if;
									
								elsif count1 = 8 then			-- A = . -
								if count2 = 0 then 		
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 1 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 2 then	
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 3 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 4 then
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 5 then	
									kmorse <= '1';
									count2 <= count2 + 1;
								elsif count2 = 6 then
									kmorse <= '1';
									count2 <= count2 + 1;

								elsif count2 = 7 then
									kmorse <= '0';
									count2 <= count2 + 1;

								elsif count2 = 8 then	 
									kmorse <= '0';
									count2 <= count2 + 1;
								elsif count2 = 9 then
									kmorse <= '0';
									count2 <= count2 + 1;
								elsif count2 = 10 then
									kmorse <= '0';
									count2 <= count2 + 1;
								else
									kmorse <= '0';
									count2 <= 0;
									count1 <= 0;
								end if;
                
							end if;
					else
						start  <= start  + 1;
					end if;
            end if;
        end if;
    end process;
 
end architecture;