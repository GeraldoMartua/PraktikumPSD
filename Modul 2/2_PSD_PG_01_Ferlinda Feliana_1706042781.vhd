library IEEE;	
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity C_updown is
port( 
		Num: in std_logic_vector(0 to 3);
		Clk: in std_logic;
		Load: in std_logic;
		Rst: in std_logic;
		Dir: in std_logic;
		Output: out std_logic_vector(0 to 3);
		LED_BAR: out std_logic_vector(0 to 4)
	);
end C_updown;

architecture Bhv of C_updown is
	signal temp: std_logic_vector(0 to 3);
	signal sinyal: std_logic_vector(0 to 3);
	begin
	
	process(Clk,Rst)
	begin
		if Rst='1' then
			temp <= "0000";
		elsif ( Clk'event and Clk='1') then
			if Load='1' then
				temp <= Num;
			elsif (Load='0' and Dir='0') then
			-- memberikan limit 5 pada temp karena memakai 5 mode nyala LED yang bisa dilihat pada case di bawah
				if temp<5 then
					temp <= temp + 1;
				elsif temp>4 then
					temp<="0000";
				end if;
			elsif (Load='0' and Dir='1') then
				if temp>0 then
					temp <= temp - 1;
				elsif temp<0 then
					temp<="0000";
				end if;
			end if;
		end if;
	
	Output <= temp;
	sinyal <= temp;
	-- Program ini mengatur nyala 5 buah LED
		case sinyal is
			when X"1" => LED_BAR <= "10000";
			when X"2" => LED_BAR <= "11000";
			when X"3" => LED_BAR <= "11100";
			when X"4" => LED_BAR <= "11110";
			when X"5" => LED_BAR <= "11111";
			when others => LED_BAR <= "00000";
		end case;
	end process;
	
end Bhv;	