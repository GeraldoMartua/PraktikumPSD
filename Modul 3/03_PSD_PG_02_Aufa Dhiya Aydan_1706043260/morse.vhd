--Aufa Dhiya Aydan
--1706043260
--Tutam PSD

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morse is
generic(ClockFrequencyHz : integer := 10);
port(
	clk     : in std_logic;		
	reset   : in std_logic; 	
	output	: inout std_logic
	);	
end entity;

architecture esrom of morse is
	--HAI GILI--
	signal order  : integer := 0;
   	signal unit   : integer := 0;   
	signal atom   : integer;

begin
process(clk) is
   begin
      if rising_edge(clk) then
	if reset  = '0' then 	
		atom  <= 0;
		order <= 0;
		unit  <= 0;
	else -- 
	if atom = ClockFrequencyHz - 1 then
		atom <= 0;
		if order = 0 then				-- Huruf H
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

		elsif order = 1 then				-- Huruf A
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

		elsif order = 2 then				-- Huruf I
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

		elsif order = 3 then				-- Spasi	
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

		elsif order = 4 then				-- Huruf G
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
				output <= '0';
				unit <= unit + 1;
			else
				output <= '0';
				unit <= 0;
				order <= order + 1;
			end if;


		elsif order = 5 then				-- Huruf I
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
				order <= urut + 1;
			end if;	

		elsif order = 6 then				-- Huruf L
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
				order <= urut + 1;
			end if;	


		elsif order = 7 then				-- Huruf I
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
				order <= urut + 1;
			end if;	
		end if;
	else
		atom  <= atom  + 1;
	end if;
end if;
end if;
end process;
end architecture;
