LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
ENTITY program IS
	PORT
	(
		clk       : IN std_logic;
		reset     : IN std_logic;
		uang      : IN std_logic_vector (1 DOWNTO 0);
		kembalian : OUT std_logic_vector (1 DOWNTO 0);
		minuman   : OUT std_logic
	);
END program;
ARCHITECTURE vending_machine OF program IS
	TYPE state_type IS (idle, enter_money, in_1, in_2, in_3, in_4, minuman_out);
	SIGNAL state, next_s : state_type;
BEGIN
	PROCESS (clk, reset)
	BEGIN
		IF (reset = '0') THEN
			state <= idle;
		ELSIF (clk'EVENT AND clk = '1') THEN
			state <= next_s;
		END IF;
	END PROCESS;
	PROCESS (state, uang)
		BEGIN
			CASE state IS
				WHEN idle =>
					minuman   <= '0';
					kembalian <= "00";
					next_s    <= enter_money;
				WHEN enter_money =>
					IF (uang = "00") THEN
						minuman   <= '0';
						kembalian <= "00";
						next_s    <= enter_money;
					ELSIF (uang = "01") THEN
						minuman   <= '0';
						kembalian <= "00";
						next_s    <= in_1;
					ELSIF (uang = "10") THEN
						minuman   <= '0';
						kembalian <= "00";
						next_s    <= minuman_out;
					ELSIF (uang = "11") THEN
						minuman   <= '0';
						kembalian <= "00";
						next_s    <= in_2;
					END IF;
				WHEN in_1 =>
					IF (uang = "00") THEN
						minuman   <= '0';
						kembalian <= "00";
						next_s    <= in_1;
					ELSIF (uang = "01") THEN
						minuman   <= '0';
						kembalian <= "00";
						next_s    <= minuman_out;
					ELSIF (uang = "10") THEN
						minuman   <= '0';
						kembalian <= "01";
						next_s    <= in_4;
					ELSIF (uang = "11") THEN
						minuman   <= '0';
						kembalian <= "01";
						next_s    <= in_3;
					END IF;
				WHEN in_2 =>
					minuman   <= '0';
					kembalian <= "10";
					next_s    <= minuman_out;
				WHEN in_3 =>
					minuman   <= '0';
					kembalian <= "01";
					next_s    <= in_2;
				WHEN in_4 =>
					minuman   <= '0';
					kembalian <= "01";
					next_s    <= minuman_out;
				WHEN minuman_out =>
					minuman   <= '1';
					kembalian <= "00";
					next_s    <= enter_money;
			END CASE;
		END PROCESS;
END vending_machine;