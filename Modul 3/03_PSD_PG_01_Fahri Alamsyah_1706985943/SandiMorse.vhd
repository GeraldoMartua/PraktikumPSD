library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity morsesandi is
generic(ClockFrequencyHz : integer := 10);
port(
    clk     : in std_logic;		-- Clock
    reset   : in std_logic; 		-- reset data
    kode    : inout std_logic);	-- Hasil kode Morse
end entity;
 
architecture mosre of morsesandi is
	-- HAI HARY    | = PER KATA, ~ = SPASI
	-- . . . . | . - | . . | ~ | . . - . | . - | . . | - - . . 
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
							if urut = 0 then				-- H = . . . .
								if unit = 0 then 		-- .
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
									
							elsif urut = 1 then			-- A =  . - 
								if unit = 0 then 		-- .
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
							
							elsif urut = 2 then			-- I =  . . 
								if unit = 0 then 		-- .
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 1 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 2 then
									kode <= '0';
									unit <= unit + 1;	-- .
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
								
							elsif urut = 3 then			-- SPASI =  ~ 
								if unit = 0 then 		-- ()()()()
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
									
							elsif urut = 4 then			-- H =  . . - . 
								if unit = 0 then 		-- .
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
								elsif unit = 6 then	-- -
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 7 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 8 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 9 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 10 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 11 then	-- .
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 12 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 13 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= urut + 1;
								end if;	
									
							elsif urut = 5 then			-- A = . -
								if unit = 0 then 		-- .
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
									
							elsif urut = 6 then			-- R =  . .
								if unit = 0 then 		-- .
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
									
							elsif urut = 7 then			-- Y = - - . . 
								if unit = 0 then 		-- -
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
								elsif unit = 10 then	-- .
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 11 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 12 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 13 then	-- .
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 14 then
									kode <= '1';
									unit <= unit + 1;
								elsif unit = 15 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 16 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 17 then	-- SPASI = ()()()() 
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 18 then
									kode <= '0';
									unit <= unit + 1;
								elsif unit = 19 then
									kode <= '0';
									unit <= unit + 1;
								else
									kode <= '0';
									unit <= 0;
									urut <= 0;
								end if;
                
							end if;
					else
						atom  <= atom  + 1;
					end if;
            end if;
        end if;
    end process;
 
end architecture;

