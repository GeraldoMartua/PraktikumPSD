library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity morse is
generic(ClockFrequencyHz : integer := 10);
port(
    clk     : in std_logic;		-- Clock
    reset   : in std_logic; 		-- reset data
	 kode		: inout std_logic);	-- Hasil kode Morse
end entity;
 
architecture esrom of morse is
   -- Sinyal periode clock
   signal atom  : integer;
	signal urut  : integer := 0;
	signal unit  : integer := 0;
 
begin
 
    process(clk) is
    begin
        if rising_edge(clk) then
				-- reset 
            if reset  = '0' then
                atom  <= 0;
					 urut  <= 0;
					 unit  <= 0;
					 
            else
                -- aktif untuk tiap unit
               if atom = ClockFrequencyHz - 1 then
						atom <= 0;
							if urut = 0 then				-- Output huruf H
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
									
							elsif urut = 1 then				-- Output huruf A
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 3 then	-- -
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
							
							elsif urut = 2 then				-- Output huruf I
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
								
							elsif urut = 3 then				-- (SPASI)
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
									
							elsif urut = 4 then				-- Output huruf M
								elsif unit = 0 then	
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
								elsif unit = 5 then	-- -
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
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;	
									
							elsif urut = 5 then				-- Output huruf I
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
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;	

							elsif urut = 6 then				-- Output huruf C
								elsif unit = 0 then	-- -
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
								elsif unit = 5 then	-- .
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 6 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 7 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 8 then	-- -
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 9 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 10 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 11 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 12 then
									kode <= '0';
									unit <= unit + 1;

							elsif urut = 7 then				-- Output huruf H
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

							elsif urut = 8 then				-- Output huruf A
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 3 then	-- -
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

							elsif urut = 9 then				-- Output huruf E
								if unit = 0 then 		
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									output <= '1';
									unit <= unit + 1;
								elsif unit = 2 then
									output <= '0';
									unit <= unit + 1;
								else
									output <= '0';
									unit <= 0;
									urut <= urut + 1;
							end if;

							elsif urut = 10 then				-- Output huruf L
								if unit = 0 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit +1; --keluaran titik
								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 3 then
									kode <= '1';
									unit <= unit +1; 
								elsif unit = 4 then
									kode <= '1';
									unit <= unit +1; 
								elsif unit = 5 then
									kode <= '1';
									unit <= unit +1; 
								elsif unit = 6 then
									kode <= '1';
									unit <= unit +1; 
								elsif unit = 7 then
									kode <= '1';
									unit <= unit +1; 
								elsif unit = 8 then
									kode <= '1';
									unit <= unit +1; 
								elsif unit = 9 then
									kode <= '1';
									unit <= unit +1; 
								elsif unit = 10 then
									kode <= '1';
									unit <= unit +1; 
								elsif unit = 11 then
									kode <= '0';
									unit <= unit + 1; --keluaran garis
								elsif unit = 12 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 13 then
									kode <= '1';
									unit <= unit +1; --keluaran titik
								elsif unit = 14 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 15 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 16 then
									kode <= '1';
									unit <= unit +1; --keluaran titik
								elsif unit = 17 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;
					else
						atom  <= atom  + 1;
					end if;
            end if;
        end if;
    end process;
 
end architecture;