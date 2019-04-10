LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY PUBLIC IS
PORT(
	CLK : IN STD_LOGIC;
	ANGKAT : IN STD_LOGIC;
	COIN : INOUT STD_LOGIC;
	SELESAIINPUT : IN STD_LOGIC;
	inputan : out std_logic;
	TELEFON : OUT STD_LOGIC;
	DURASI : OUT INTEGER);
end entity;

architecture KOIN of PUBLIC is
type keadaan is (idle,diangkat,inputangka,telepon,telepon2,telepon3,telepon4,telepon5,selesaitelepon);
signal state,nextstate : keadaan;
begin

process is
begin
wait until clk'event and clk='1';
state <= nextstate;
end process;

process (state,angkat,coin,selesaiinput)
begin
case state is
	when idle =>
		if Angkat ='1' 
			then nextstate<= diangkat;
		else
			nextstate <= idle;
		end if;
	when diangkat =>
		if angkat ='0'
			then nextstate <= idle;
		elsif coin ='1'
			then nextstate <= inputangka;
		else
			nextstate <= diangkat;
		end if;
	when inputangka =>
		if angkat ='0'
			then nextstate <= idle;
		elsif selesaiinput ='1'
			then nextstate <= telepon;
		else
			nextstate <= inputangka;
		end if;
	when telepon =>
		if angkat ='0'
			then nextstate <= idle;
		else
			nextstate <= telepon2;
		end if;
	when telepon2 =>
		if angkat ='0'
			then nextstate <= idle;
		else
			nextstate <= telepon3;
		end if;
	when telepon3 =>
		if angkat ='0'
			then nextstate <= idle;
		else
			nextstate <= telepon4;
		end if;
	when telepon4 =>
		if angkat ='0'
			then nextstate <= idle;
		else
			nextstate <= telepon5;
		end if;
	when telepon5 =>
		if angkat ='0'
			then nextstate <= idle;
		else
			nextstate <= selesaitelepon;
		end if;
	when selesaitelepon =>
		if angkat ='0'
			then nextstate <= idle;
		else
			nextstate <= diangkat;
		end if;
end case;
end process;

process (state)
begin
	case state is
		when idle =>
			telefon <= '0';
			coin <= '0';
			durasi <= 0;
			inputan <= '0';
		when diangkat =>
			durasi <= 0;
			INPUTAN <= '0';
		when inputangka =>
			inputan <= '1';
			DURASI <= 6;
		WHEN TELEPON =>
			TELEFON <='1';
			DURASI <= 5;
		WHEN TELEPON2 =>
			TELEFON <='1';
			DURASI <= 4;
		WHEN TELEPON3 =>
			TELEFON <='1';
			DURASI <= 3;
		WHEN TELEPON4 =>
			TELEFON <='1';
			DURASI <= 2;
		WHEN TELEPON5 =>
			TELEFON <='1';
			DURASI <= 1;
		WHEN SELESAITELEPON =>
			TELEFON <='0';
			DURASI <= 0;
			coin <= '0';
		END CASE;
	END PROCESS;
END ARCHITECTURE;

