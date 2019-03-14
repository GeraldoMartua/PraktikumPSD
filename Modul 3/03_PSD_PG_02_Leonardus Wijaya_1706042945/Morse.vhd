library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity kode_morse is
generic(ClockFrequencyHz : integer := 10);
port(
    cl     : in std_logic;		
    rst    : in std_logic; 	
    kode   : inout std_logic);	
end entity;
 
architecture tutam of kode_morse is
   	signal awal  : integer;
	signal urut  : integer := 0;
	signal unit  : integer := 0;
 
begin
 
process(cl) is
begin
if rising_edge(cl) then
				 
if rst  = '0' then
awal  <= 0;
urut  <= 0;
unit  <= 0;			 
            else
               if awal = ClockFrequencyHz - 1 then
						awal <= 0;
							if urut = 0 then				-- H = . . . .
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 3 then	
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 4 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 5 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 6 then	
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 7 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 8 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 9 then	
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 10 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 11 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;
									
							elsif urut = 1 then			-- A =  . - 
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 3 then	
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 4 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 5 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 6 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 7 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;
							
							elsif urut = 2 then			-- I =  . . 
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;	

								elsif unit = 3 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 4 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 5 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;
								
							elsif urut = 3 then			-- SPASI 
								if unit = 0 then 		
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;
									
							elsif urut = 4 then			-- H = . . . . 
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 3 then	-- .
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 4 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 5 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 6 then	-- .
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 7 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 8 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 9 then	-- .
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 10 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 11 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;
									
							elsif urut = 5 then			-- O = - - -
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 2 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 3 then	
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 4 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 5 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 6 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 7 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 8 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 9 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 10 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 11 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 12 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 13 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 14 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;
									
								elsif urut = 6 then			-- S =  . . .
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 3 then	
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 4 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 5 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 6 then	
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 7 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 11 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;

								elsif urut = 7 then			-- E =  .
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;
									
								elsif urut = 8 then			-- A = . -
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 2 then	
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 3 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 4 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 5 then	
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 6 then
									kode <= '1';
									unit <= unit + 1;

								elsif unit = 7 then
									kode <= '0';
									unit <= unit + 1;

								elsif unit = 8 then	 
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 9 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 10 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= 0;
								end if;
                
							end if;
					else
						awal  <= awal  + 1;
					end if;
            end if;
        end if;
    end process;
 
end architecture;