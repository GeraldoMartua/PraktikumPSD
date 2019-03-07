LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY UDCount IS
	PORT( 	Num: in std_logic_vector(0 to 3);	--untuk memasukkan angka start
		Clk: in std_logic;			--clock
		Load: in std_logic;    			--input angka start
		Rst: in std_logic;			--reset
		Dir: in std_logic;			--menentukan up(0) atau down(1) counter
		Output: out std_logic_vector(0 to 3) );
END UDCount;

ARCHITECTURE step OF UDCount IS
	Signal temp: std_logic_vector(0 to 3);
	BEGIN
	process(Clk,Rst)
		BEGIN
		if Rst='1' then
		temp <= "0000";
		elsif ( Clk'event AND Clk='1') then
			if Load='1' then
			temp <= Num;
			elsif (Load='0' AND Dir='0') then
			temp <= temp + 1;
			elsif (Load='0' AND Dir='1') then
			temp <= temp - 1;
			END if;
		END if;
	END process;
	Output <= temp;
END step;
