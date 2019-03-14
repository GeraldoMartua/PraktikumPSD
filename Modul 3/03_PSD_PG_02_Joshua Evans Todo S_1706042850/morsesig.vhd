-- Joshua Evans Todo Sidabutar

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morsesig is
generic(ClockFrequencyHz : integer := 10);
port(
	clk     : in std_logic;		-- Clock
	reset   : in std_logic; 	-- Reset data
	output	: inout std_logic);	-- Output results
end entity;

architecture esrom of morsesig is
	-- HAI MUSTOFA    
   signal atom  : integer;
   signal order  : integer := 0;
   signal unit  : integer := 0;
begin
process(clk) is
   begin
      if rising_edge(clk) then
	if reset  = '0' then 	-- reset 
		atom  <= 0;
		order  <= 0;
		unit  <= 0;
	else -- 
	if atom = ClockFrequencyHz - 1 then
		atom <= 0;
		if order = 0 then
			if unit = 0 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 3 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 5 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 6 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 7 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 8 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 9 then	
				output <= '1';
				unit <= unit + 1;
			elsif unit = 10 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 11 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;
		elsif order = 1 then				-- Output huruf A
			if unit = 0 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 3 then	
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 5 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 6 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 7 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;
		elsif order = 2 then				-- Output huruf I
			if unit = 0 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 3 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 5 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		elsif order = 3 then		--Ouput Spasi	
			if unit = 0 then 	
				output <= '0';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		elsif order = 4 then		--Ouput M	
			if unit = 0 then 	
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 3 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then 	
				output <= '0';
				unit <= unit + 1;
			elsif unit = 5 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 6 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 7 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 8 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 9 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		elsif order = 5 then		--Ouput U	
			if unit = 0 then 	
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then 	
				output <= '0';
				unit <= unit + 1;
			elsif unit = 3 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then 	
				output <= '1';
				unit <= unit + 1;
			elsif unit = 5 then 	
				output <= '0';
				unit <= unit + 1;
			elsif unit = 6 then 	
				output <= '1';
				unit <= unit + 1;
			elsif unit = 7 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 8 then 	
				output <= '1';
				unit <= unit + 1;
			elsif unit = 9 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 10 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		elsif order = 6 then				-- Output huruf S
			if unit = 0 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 3 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 5 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 6 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 7 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 8 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		elsif order = 7 then				-- Output huruf T
			if unit = 0 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 3 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		elsif order = 8 then				-- Output huruf O
			if unit = 0 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 3 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 5 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 6 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 7 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 8 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 9 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 10 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 11 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 12 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 13 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 14 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		elsif order = 9 then				-- Output huruf F
			if unit = 0 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 3 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 5 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 6 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 7 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 8 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 9 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 10 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 11 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 12 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 13 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		elsif order = 1 then				-- Output huruf A
			if unit = 0 then 		
				output <= '1';
				unit <= unit + 1;
			elsif unit = 1 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 2 then
				output <= '0';
				unit <= unit + 1;
			elsif unit = 3 then	
				output <= '1';
				unit <= unit + 1;
			elsif unit = 4 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 5 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 6 then
				output <= '1';
				unit <= unit + 1;
			elsif unit = 7 then
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;

		end if;
	else
		atom  <= atom  + 1;
	end if;
end if;
end if;
end process;
end architecture;
