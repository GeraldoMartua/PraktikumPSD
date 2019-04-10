--- Hanif Imam, 1706043273
--- Payphone

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity payphone is
	port ( 	clk	: in std_logic;		
		res	: in std_logic);
end entity;

architecture modul5 of payphone is
	
	signal	sta, nsta	: integer range 0 to 4;	-- state
	signal	coin	:	std_logic;	-- koin masuk
	signal	angk	:	std_logic;	-- angkat telepon
	signal 	seit	:	std_logic;	-- Selesai isi nomor telepon
	signal	dura	:	std_logic;	-- Durasi menelepon masih aktif

	signal	iste	:	std_logic;	-- isi nomor telepon
	signal	tele	:	std_logic;	-- sedang menelepon

	begin
	
	process(sta) 	--State
	begin	
		if (sta = 0) then
			iste <= '0';
			tele <= '0';
			if (angk = '1') then
				nsta <= 1;
			end if;
			
		elsif (sta = 1) then
			iste <= '0';
			tele <= '0';
			if (angk = '0') then
				nsta <= 0;
			elsif (angk = '1') then
				if (coin = '1') then
					nsta <= 2;
				elsif (coin = '0') then
					nsta <= 1;
				end if;
			end if;
		elsif (sta = 2) then
			iste <= '1';
			tele <= '0';
			if (angk = '0') then
				nsta <= 0;
			elsif (angk = '1') then
				if (iste = '1') then
					nsta <= 3;
				elsif (iste = '0') then
					nsta <= 2;
				end if;
			end if;
		elsif (sta = 3) then
			iste <= '0';
			tele <= '1';
			if (angk = '0') then
				nsta <= 0;
			elsif (angk = '1') then
				if (dura = '1') then
					nsta <= 3;
				elsif (dura = '0') then
					nsta <= 4;
				end if;
			end if;
		elsif (sta = 4) then
			iste <= '0';
			tele <= '0';
			if (angk = '1') then
				nsta <= 4;
			elsif (angk = '0') then
				nsta <= 0;
			end if;
		end if;
	end process;

	process(clk, res)	--next state
	begin
	if (res = '0') then
		if (rising_edge(clk)) then
			sta <= nsta;
		end if;
	end if;
	end process;
	
end architecture;