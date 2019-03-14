library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morse is
generic(FrekuensiClock : integer := 10);
port(
	clk     : in std_logic;		
	reset   : in std_logic; 	
	output	: inout std_logic);
end entity;

architecture dari of morse is
	
   signal inti  : integer;
   signal urutan  : integer := 0;
   signal unit  : integer := 0;
begin
process(clk) is
   begin
      if rising_edge(clk) then
	if reset  = '0' then 	
		inti  <= 0;
		urutan  <= 0;
		unit  <= 0;
	else -- 
	if inti = FrekuensiClock - 1 then
		inti <= 0;
		if urutan = 0 then				-- Output huruf H
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
				urutan <= urutan + 1;
			end if;
		elsif urutan = 1 then				-- Output huruf A
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
				urutan <= urutan + 1;
			end if;
		elsif urutan = 2 then				-- Output huruf I
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
				urutan <= urutan + 1;
			end if;

		elsif urutan = 3 then		--Ouput Spasi	
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
				urutan <= urutan + 1;
			end if;

		elsif urutan = 4 then				-- Output huruf T
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
				output <= '0';
				unit <= unit + 1;
			elsif unit = 8 then
				output <= '1' ;
				unit <= unit + 1;
			elsif unit = 9 then
				output <= '1' ;
				unit <= unit + 1;
			elsif unit = 10 then
				output <= '0' ;
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				urutan <= urutan + 1;
			end if;

		elsif urutan = 5 then				-- Output huruf E
			if unit = 0 then 		
				output <= '1';
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
				urutan <= urutan + 1;
			end if;

		elsif urutan = 6 then				-- Output huruf U
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
				output <= '0';
				unit <= unit + 1;
			elsif unit = 8 then
				output <= '1' ;
				unit <= unit + 1;
			elsif unit = 9 then
				output <= '1' ;
				unit <= unit + 1;
			elsif unit = 10 then
				output <= '0' ;
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				urutan <= urutan + 1;
			end if;

		elsif urutan = 7 then				-- Output huruf K
			if unit = 0 then 		
				output <= '1';
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
				urutan <= urutan + 1;
			end if;

		elsif urutan = 8 then				-- Output huruf U
			if unit = 0 then 		
				output <= '1';
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
				urutan <= urutan + 1;
			end if;


		end if;
	else
		inti  <= inti  + 1;
	end if;
end if;
end if;
end process;
end architecture;
