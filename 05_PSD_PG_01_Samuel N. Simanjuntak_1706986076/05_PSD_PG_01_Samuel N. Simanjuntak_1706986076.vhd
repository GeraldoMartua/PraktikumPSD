 --Alzy Maulana copy dari sini

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity payphone is 
port(
	
	koin : in std_logic;
	
	CLK: in std_logic; 
	st  : in std_logic);
end payphone;
architecture wayitworks of payphone is
type state_type is (down,inputnum,calling,talking);
signal PS,NS : state_type; 
signal koin_temp:  std_logic;
signal diangkat: std_logic;
signal kembalikankoin: std_logic;
signal timeout: std_logic := '0';
signal ditutup: std_logic := '0';



signal Countdown: integer;
begin

koin_temp <= koin;

process(CLK,NS)
begin
	if (rising_edge(CLK)) then
		PS<= NS;
	end if;
end process;


process (PS,CLK)
begin
	Case PS is	

		when down =>
			if koin_temp = '0' then		--semua koin dianggap sama untuk simplifikasi
				NS <= down;
			elsif koin_temp = '1' then
				NS <= inputnum;
			end if;
		when inputnum =>
				--state untuk meminta input nomor telepon
				-- asumsi no telp sudah dimasukan
			NS <= calling;
		when calling =>
			if diangkat = '0' then		-- jika tidak diangkat kembali ke state awal
				NS <= down;
				kembalikankoin <= '1';		--serta koin dikembalikan
				koin_temp <= '0';

			elsif diangkat = '1' then		--jika diangkat
				NS <= talking;			
				Countdown <= 30;		--durasi di set 30
				kembalikankoin <= '0';
			end if;
		when talking =>
			if ditutup = '1' then		--telepon ditutup
				NS <=  down;
			elsif Countdown = 0 then	--jika durasi sudah habis
				NS <=  down;
				
			elsif Countdown > 0 then
				NS <= talking;
				Countdown <= Countdown -1;	-- durasi dikurang 1 hingga 0
	
			end if;	
	end case;
end process;
end wayitworks;


