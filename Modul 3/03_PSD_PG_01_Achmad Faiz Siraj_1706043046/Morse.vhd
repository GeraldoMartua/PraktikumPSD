library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morse is
generic(ClockFrequencyHz : integer := 10);
port(
	clk     : in std_logic;		-- Clock
	reset   : in std_logic; 	-- Reset data
	output	: inout std_logic);	-- Output results
end entity;

architecture sandi of morse is

   signal atom  : integer;
   signal urutan  : integer := 0;
   signal sinyal  : integer := 0;
begin
process(clk) is
   begin
      if rising_edge(clk) then
	if reset  = '0' then 	-- reset 
		atom  <= 0;
		urutan  <= 0;
		sinyal  <= 0;
	else -- 
	if atom = ClockFrequencyHz - 1 then
		atom <= 0;
		if urutan = 0 then				-- Output huruf H
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 6 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 7 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 8 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 9 then	
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 10 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 11 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;
		elsif urutan = 1 then				-- Output huruf A
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then	
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 6 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 7 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;
		elsif urutan = 2 then				-- Output huruf I
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;

		elsif urutan = 3 then		--Ouput Spasi	
			if sinyal = 0 then 	
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;

                 elsif urutan = 4 then				-- Output huruf I
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;

		elsif urutan = 5 then				-- Output huruf N
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then	
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 6 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 7 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;

		elsif urutan = 6 then				-- Output huruf D
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then	
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 6 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 7 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 8 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 9 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 10 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;


		elsif urutan = 7 then				-- Output huruf I
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;

		elsif urutan = 8 then				-- Output huruf R
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 6 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 7 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 8 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 9 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 10 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;


		elsif urutan = 9 then				-- Output huruf A
			if sinyal = 0 then 		
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 1 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 2 then
				output <= '0';
				sinyal <= sinyal + 1;
			elsif sinyal = 3 then	
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 4 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 5 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 6 then
				output <= '1';
				sinyal <= sinyal + 1;
			elsif sinyal = 7 then
				output <= '0';
				sinyal <= sinyal + 1;
			else
				output <= '0';
				sinyal <= 0;
				urutan <= urutan + 1;
			end if;

		end if;
	else
		atom  <= atom  + 1;
	end if;
end if;
end if;
end process;
end architecture;