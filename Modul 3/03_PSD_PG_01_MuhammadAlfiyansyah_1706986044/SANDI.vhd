library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity morse is
generic(ClockFrequencyHz : integer := 10);
port(
    clk     : in std_logic;		
    reset   : in std_logic; 		
    code    : inout std_logic);	
end entity;
 
architecture HURUF of morse is
	
   
   signal frequency  : integer;
   signal sequence  : integer := 0;
   signal count  : integer := 0;
 
begin
 
    process(clk) is
    begin
        if rising_edge(clk) then
				-- reset 
            if reset  = '0' then
                frequency  <= 0;
		sequence  <= 0;
		count  <= 0;
					 
            else
               if frequency = ClockFrequencyHz - 1 then
						frequency <= 0;
							if sequence = 0 then				-- H = . . . .
								if count = 0 then 		-- .
									code <= '1';
									count <= count + 1;
								elsif count = 1 then
									code <= '1';
									count <= count + 1;
								elsif count = 2 then
									code <= '0';
									count <= count + 1;
								elsif count = 3 then	-- .
									code <= '1';
									count <= count + 1;
								elsif count = 4 then
									code <= '1';
									count <= count + 1;
								elsif count = 5 then
									code <= '0';
									count <= count + 1;
								elsif count = 6 then	-- .
									code <= '1';
									count <= count + 1;
								elsif count = 7 then
									code <= '1';
									count <= count + 1;
								elsif count = 8 then
									code <= '0';
									count <= count + 1;
								elsif count = 9 then	-- .
									code <= '1';
									count <= count + 1;
								elsif count = 10 then
									code <= '1';
									count <= count + 1;
								elsif count = 11 then
									code <= '0';
									count <= count + 1;
								else
									code <= '0';
									count <= 0;
									sequence <= sequence + 1;
								end if;
									
							elsif sequence = 1 then			-- A =  . - 
								if count = 0 then 		-- .
									code <= '1';
									count <= count + 1;
								elsif count = 1 then
									code <= '1';
									count <= count + 1;
								elsif count = 2 then
									code <= '0';
									count <= count + 1;
								elsif count = 3 then	-- -
									code <= '1';
									count <= count + 1;
								elsif count = 4 then
									code <= '1';
									count <= count + 1;
								elsif count = 5 then
									code <= '1';
									count <= count + 1;
								elsif count = 6 then
									code <= '1';
									count <= count + 1;
								elsif count = 7 then
									code <= '0';
									count <= count + 1;
								else
									code <= '0';
									count <= 0;
									sequence <= sequence + 1;
								end if;
							
							elsif sequence = 2 then			-- I =  . . 
								if count = 0 then 		-- .
									code <= '1';
									count <= count + 1;
								elsif count = 1 then
									code <= '1';
									count <= count + 1;
								elsif count = 2 then
									code <= '0';
									count <= count + 1;	-- .
								elsif count = 3 then
									code <= '1';
									count <= count + 1;
								elsif count = 4 then
									code <= '1';
									count <= count + 1;
								elsif count = 5 then
									code <= '0';
									count <= count + 1;
								else
									code <= '0';
									count <= 0;
									sequence <= sequence + 1;
								end if;
								
							elsif sequence = 3 then			-- SPASI =  ~ 
								if count = 0 then 		-- ()()()()
									code <= '0';
									count <= count + 1;
								elsif count = 1 then
									code <= '0';
									count <= count + 1;
								elsif count = 2 then
									code <= '0';
									count <= count + 1;
								else
									code <= '0';
									count <= 0;
									sequence <= sequence + 1;
								end if;
									
							elsif sequence = 4 then			-- A =  . -  
								if count = 0 then 		-- .
									code <= '1';
									count <= count + 1;
								elsif count = 1 then
									code <= '1';
									count <= count + 1;
								elsif count = 2 then
									code <= '0';
									count <= count + 1;
								elsif count = 3 then	-- -
									code <= '1';
									count <= count + 1;
								elsif count = 4 then
									code <= '1';
									count <= count + 1;
								elsif count = 5 then
									code <= '1';
									count <= count + 1;
								elsif count = 6 then
									code <= '1';
									count <= count + 1;
								elsif count = 7 then
									code <= '0';
									count <= count + 1;
								else
									code <= '0';
									count <= 0;
									sequence <= sequence + 1;
								end if;
									
									
							elsif sequence = 5 then			-- D = . -
								if count = 0 then 		-- .
									code <= '1';
									count <= count + 1;
								elsif count = 1 then
									code <= '1';
									count <= count + 1;
								elsif count = 2 then
									code <= '0';
									count <= count + 1;
								elsif count = 3 then	-- -
									code <= '1';
									count <= count + 1;
								elsif count = 4 then
									code <= '1';
									count <= count + 1;
								elsif count = 5 then
									code <= '1';
									count <= count + 1;
								elsif count = 6 then
									code <= '1';
									count <= count + 1;
								elsif count = 7 then
									code <= '0';
									count <= count + 1;
								else
									code <= '0';
									count <= 0;
									sequence <= sequence + 1;
								end if;
									
							elsif sequence = 6 then			-- R =  . - .
								if count = 0 then 		-- .
									code <= '1';
									count <= count + 1;
								elsif count = 1 then
									code <= '1';
									count <= count + 1;
								elsif count = 2 then
									code <= '0';
									count <= count + 1;
								elsif count = 3 then	-- .
									code <= '1';
									count <= count + 1;
								elsif count = 4 then
									code <= '1';
									count <= count + 1;
								elsif count = 5 then
									code <= '1';
									count <= count + 1;
								elsif count = 6 then
									code <= '1';
									count <= count + 1;
								elsif count = 7 then
									code <= '0';
									count <= count + 1;
								elsif count = 8 then
									code <= '1';
									count <= count + 1;
								elsif count = 9 then
									code <= '1';
									count <= count + 1;

								else
									code <= '0';
									count <= 0;
									sequence <= sequence + 1;
								end if;	
									
							elsif sequence = 7 then			-- I= . .
								if count = 0 then 		-- -
									code <= '1';
									count <= count + 1;
								elsif count = 1 then
									code <= '1';
									count <= count + 1;
								elsif count = 2 then	
									code <= '0';
									count <= count + 1;
								elsif count = 3 then
									code <= '1';
									count <= count + 1;
								elsif count = 4 then
									code <= '1';
									count <= count + 1;
								elsif count = 5 then	-- SPASI = ()()()() 
									code <= '0';
									count <= count + 1;
								elsif count = 6 then
									code <= '0';
									count <= count + 1;
								elsif count = 7 then
									code <= '0';
									count <= count + 1;
								else
									code <= '0';
									count <= 0;
									sequence <= 0;
								end if;
                
							end if;
					else
						frequency  <= frequency  + 1;
					end if;
            end if;
        end if;
    end process;
 
end architecture;
