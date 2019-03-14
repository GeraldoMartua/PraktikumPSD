library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity test_bench_morse is
generic(ClockFrequencyHz : integer := 10);
port(
    clk : in std_logic;		
    r   : in std_logic; 		
	 kode		: inout std_logic);	-- Hasil kode test_bench_morse
end entity;
 
architecture esrom of test_bench_morse is
   signal atm  : integer;
	signal x  : integer := 0;
	signal jeda  : integer := 0;	-- satu jeda setara 0.5 s
 
begin
 
    process(clk) is
    begin
        if rising_edge(clk) then
				
            if r  = '0' then
                atm  <= 0;
					 x  <= 0;
					 jeda  <= 0;
					 
            else
                -- aktif untuk tiap jeda
               if atm = ClockFrequencyHz - 1 then
						atm <= 0;
							if x = 0 then				-- H = . . . .
								if jeda = 0 then 		
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 1 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 2 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 3 then	-- .
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 4 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 5 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 6 then	-- .
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 7 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 8 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 9 then	-- .
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 10 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 11 then
									kode <= '0';
									jeda <= jeda + 1;
								else
									kode <= '0';
									jeda <= 0;
									x <= x + 1;
								end if;
									
							elsif x = 1 then			-- A =  . - 
								if jeda = 0 then 		
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 1 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 2 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 3 then	-- -
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 4 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 5 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 6 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 7 then
									kode <= '0';
									jeda <= jeda + 1;
								else
									kode <= '0';
									jeda <= 0;
									x <= x + 1;
								end if;
							
							elsif x = 2 then			-- I =  . . 
								if jeda = 0 then 		
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 1 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 2 then
									kode <= '0';
									jeda <= jeda + 1;	
								elsif jeda = 3 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 4 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 5 then
									kode <= '0';
									jeda <= jeda + 1;
								else
									kode <= '0';
									jeda <= 0;
									x <= x + 1;
								end if;
								
							elsif x = 3 then			-- SPASI =  ~ 
								if jeda = 0 then 		
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 1 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 2 then
									kode <= '0';
									jeda <= jeda + 1;
								else
									kode <= '0';
									jeda <= 0;
									x <= x + 1;
								end if;

							elsif x = 4 then			-- A =  . - 
								if jeda = 0 then 		
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 1 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 2 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 3 then	-- -
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 4 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 5 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 6 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 7 then
									kode <= '0';
									jeda <= jeda + 1;
								else
									kode <= '0';
									jeda <= 0;
									x <= x + 1;
								end if;
							
							elsif x = 5 then 			-- L = . - . .
								if jeda = 0 then 		
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 1 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 2 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 3 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 4 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 5 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 6 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 7 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 8 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 9 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 10 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 11 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 12 then
									kode <= '1';
									jeda <= jeda + 1;
									
							elsif x = 6 then			-- Z = - - . . 
								if jeda = 0 then 		
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 1 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 2 then	
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 3 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 4 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 5 then	-- -
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 6 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 7 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 8 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 9 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 10 then	-- .
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 11 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 12 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 13 then	-- .
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 14 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 15 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 16 then
									kode <= '0';
									jeda <= jeda + 1;

							elsif x = 6 then			-- Y = - . - - 
								if jeda = 0 then 		
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 1 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 2 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 3 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 4 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 5 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 6 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 7 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 8 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 9 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 10 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 11 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 12 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 13 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 14 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 15 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 16 then
									kode <= '1';
									jeda <= jeda + 1;
								elsif jeda = 17 then
									kode <= '1';
									jeda <= jeda + 1;

								elsif jeda = 17 then	-- SPASI = ()()()() 
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 18 then
									kode <= '0';
									jeda <= jeda + 1;
								elsif jeda = 19 then
									kode <= '0';
									jeda <= jeda + 1;
								else
									kode <= '0';
									jeda <= 0;
									x <= 0;
								end if;
                
							end if;
					else
						atm  <= atm  + 1;
					end if;
            end if;
        end if;
    end process;
 
end architecture;