library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity coin is
	port ( 	clk	: in std_logic;		
		res	: in std_logic);
end entity;

architecture behavior of coin is
	signal	state		: 	integer range 0 to 4;
	signal  xstate		: 	integer range 0 to 4;
	signal	msk		:	std_logic;	-- Memasukkan koin
	signal	angkt		:	std_logic;	-- Telepon di angkat
	signal	isi		:	std_logic;	-- Mengisi nomor telepon
	signal	dura		:	std_logic;	-- Durasi menelepon masih aktif
	signal	telp		:	std_logic;	-- Telpon
	
	begin
	process(state) 	
	begin	
		if (state = 0) then
			isi <= '0';
			telp <= '0';
			if (angkt = '1') then
				xstate <= 1;
			end if;
			
		elsif (state = 1) then
			isi <= '0';
			telp <= '0';
			if (angkt = '0') then
				xstate <= 0;
			elsif (angkt = '1') then
				if (msk = '1') then
					xstate <= 2;
				elsif (msk = '0') then
					xstate <= 1;
				end if;
			end if;
		elsif (state = 2) then
			isi <= '1';
			telp <= '0';
			if (angkt = '0') then
				xstate <= 0;
			elsif (angkt = '1') then
				if (isi = '1') then
					xstate <= 3;
				elsif (isi = '0') then
					xstate <= 2;
				end if;
			end if;
		elsif (state = 3) then
			isi <= '0';
			telp <= '1';
			if (angkt = '0') then
				xstate <= 0;
			elsif (angkt = '1') then
				if (dura = '1') then
					xstate <= 3;
				elsif (dura = '0') then
					xstate <= 4;
				end if;
			end if;
		elsif (state = 4) then
			isi <= '0';
			telp <= '0';
			if (angkt = '1') then
				xstate <= 4;
			elsif (angkt = '0') then
				xstate <= 0;
			end if;
		end if;
	end process;

	process(clk, res)	
	begin
	if (res = '0') then
		if (rising_edge(clk)) then
			state <= xstate;
		end if;
	end if;
	end process;
	
end architecture;
