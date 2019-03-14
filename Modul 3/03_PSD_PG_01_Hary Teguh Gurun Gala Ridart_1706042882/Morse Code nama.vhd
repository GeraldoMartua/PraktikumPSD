library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity morse is
generic(ClockFrequencyHz : integer := 10);
port(
    clk     : in std_logic;		-- Clock
    reset   : in std_logic; 		-- reset data
    kode    : inout std_logic);	-- Hasil kode Morse
end entity;
 
architecture esrom of morse is
	
   	signal dummy  : integer;
	signal urut  : integer := 0;
	signal diskrit  : integer := 0;
 
begin
 
    process(clk) is
    begin
        if rising_edge(clk) then
				-- reset 
            if reset  = '0' then
                dummy  <= 0;
		urut  <= 0;
		diskrit  <= 0;
					 
            else
                -- aktif untuk tiap diskrit
               if dummy = ClockFrequencyHz - 1 then
		  dummy <= 0;
			if urut = 0 then			-- H = . . . .
				if diskrit = 0 then 		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 1 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 3 then		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 4 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 5 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 6 then		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 7 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 8 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 9 then		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 10 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 11 then
					kode <= '0';
					diskrit <= diskrit + 1;
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;
									
			elsif urut = 1 then			--Huruf A =  . - 
				if diskrit = 0 then 		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 1 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 3 then		-- Create(-)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 4 then
					kode <= '1';
				diskrit <= diskrit + 1;
				elsif diskrit = 5 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 6 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 7 then
					kode <= '0';
					diskrit <= diskrit + 1;
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;
							
			elsif urut = 2 then			-- Huruf I =  . . 
				if diskrit = 0 then 		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 1 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;	
				elsif diskrit = 3 then		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 4 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 5 then
					kode <= '0';
					diskrit <= diskrit + 1;
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;
								
			elsif urut = 3 then			-- SPACE 
				if diskrit = 0 then 		
					kode <= '0';
					diskrit <= diskrit + 1;
					elsif diskrit = 1 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;
						
			elsif urut = 4 then			-- Haruf F =  . . - . 
				if diskrit = 0 then 		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 1 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 3 then		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 4 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 5 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 6 then		-- Create(-)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 7 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 8 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 9 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 10 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 11 then		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 12 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 13 then
					kode <= '0';
					diskrit <= diskrit + 1;
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;	
									
			elsif urut = 5 then			-- Huruf A = . -
				if diskrit = 0 then 		-- Create(.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 1 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 3 then		-- Create(-)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 4 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 5 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 6 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 7 then
					kode <= '0';
					diskrit <= diskrit + 1;
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;
						
			elsif urut = 6 then			-- Huruf H = . . . .
				if diskrit = 0 then 		-- Create (.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 1 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 3 then	        -- Create (.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 4 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 5 then
					kode <= '0';
						diskrit <= diskrit + 1;
				elsif diskrit = 6 then	         -- Create (.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 7 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 8 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 9 then	         -- Create (.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 10 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 11 then
					kode <= '0';
					diskrit <= diskrit + 1;
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;	
							
		elsif urut = 7 then			         --Huruf R =  . - .
				if diskrit = 0 then 		-- Create (.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 1 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 3 then	       --Create (-)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 4 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 5 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 6 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 7 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 8 then        --Create (.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 9 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 10 then
					kode <= '0';
					diskrit <= diskrit + 1;
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;
			
			elsif urut = 8 then			-- Untuk I =  . .
				if diskrit = 0 then 		-- Create (.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 1 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 2 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 3 then	        -- Create (.)
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 4 then
					kode <= '1';
					diskrit <= diskrit + 1;
				elsif diskrit = 5 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 6 then	-- Signal untuk SPACE  
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 7 then
					kode <= '0';
					diskrit <= diskrit + 1;
				elsif diskrit = 8 then
					kode <= '0';
					diskrit <= diskrit + 1;	
				else
					kode <= '0';
					diskrit <= 0;
					urut <= urut + 1;
				end if;	
			end if;		
							
	else
		dummy  <= dummy  + 1;
		end if;
            end if;
        end if;
    end process;
 
end architecture;
