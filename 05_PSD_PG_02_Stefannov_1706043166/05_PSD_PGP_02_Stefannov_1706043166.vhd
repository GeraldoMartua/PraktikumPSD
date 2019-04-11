library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Payphone is
 port  (coin	: inout std_logic; -- saat koin masuk, coin dapat dimuntahkan apabila nomor tidak tersedia
	number	: in std_logic;	-- input nomor tujuan, ada atau tidak nomor tersebut
	clk	: in std_logic;
	conv	: out std_logic); -- apakah conversation atau percakapan dapat dilaksanakan atau tidak
end Payphone;

architecture Behave of Payphone is
 type state_type is (idle, getnum, dial, conn, disc);
 --idle: tidak ada apa-apa
 --getnum: get number, meminta input nomor tujuan, melihat tersedia atau tidak
 --dial: mencoba menghubungi nomor tujuan
 --conn: connected, tersambung dengan nomor tujuan
 --disc: disconnected, koneksi diakhiri baik oleh timer maupun nomor tujuan

 signal state, next_state : state_type;
 signal timer 		  : std_logic; -- apakah masih ada durasi telepon tersedia
 signal answer		  : std_logic; -- apakah pihak yang ditelepon mengangkat atau tidak
 begin
	--F/F untuk ke next state
	process
	begin
	 wait until clk='1' and clk'event;
	 state <= next_state;
	end process;
	
	--Menentukan Next State
	process (state, coin, number, answer, timer)
	begin
	 case state is
		when idle =>
			if (coin='1') then next_state <= getnum;
			else next_state <= idle;
			end if;
		when getnum =>
			if (number='1') then next_state <= dial;
			else next_state <= idle;
			end if;
		when dial =>
			if (answer='1') then next_state <= conn;
			else next_state <= disc;
			end if;
		when conn =>
			if (timer='0' or answer='0') then next_state <= disc;
			else next_state <= conn;
			end if;
		when disc =>
			next_state <= idle;
	 end case;
	end process;
	
	--Menentukan Output
	process (state, coin, number, answer, timer)
	begin
	 case state is
		when idle =>
			conv <= '0'; timer <= '0'; answer <= '0';
		when getnum =>
			if (number='0') then coin <= '0'; conv <= '0';
			else coin <= '1';
			end if;
		when dial =>
			coin <= '0';
			if (answer='0') then conv <= '0';
			else timer <= '1';
			end if;
		when conn =>
			if (timer='0' or answer='0') then conv <= '0';
			else conv <= '1';
			end if;
		when disc =>
			conv <= '0'; timer <= '0'; answer <= '0';
	 end case;
	end process;
end Behave;