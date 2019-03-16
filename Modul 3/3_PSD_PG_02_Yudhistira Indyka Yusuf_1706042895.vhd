library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sandirumput is
	port(
	txt	: in string (1 to 20) := "Hai Nana            ";
	trans	: out std_logic := '0');
end sandirumput;

architecture bhv of sandirumput is
	constant clock_period1	: time := 0.5 sec;
	constant clock_period2	: time := 0.2 sec;	
	signal clk1, clk2	: std_logic := '0';		
	signal cnt		: integer := 9;
	signal temp, dot, strip : std_logic := '0';
	
begin
	clk1 <= not clk1 after clock_period1;
	clk2 <= not clk2 after clock_period2;
	process 
	begin

		if txt(cnt) = 'a' or txt(cnt) = 'A' then
			cnt <= cnt + 1;
			temp <= '0';
			wait for 0.5 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1.5 sec;

		elsif txt(cnt) = 'h' or txt(cnt) = 'h' then
			cnt <= cnt + 1;
			temp <= '0';
			wait for 0.5 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1 sec;

		elsif txt(cnt) = 'i' or txt(cnt) = 'I' then
			cnt <= cnt + 1;
			temp <= '0';
			wait for 0.5 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1 sec;


		elsif txt(cnt) = 'k' or txt(cnt) = 'K' then
			cnt <= cnt + 1;
			temp <= '0';
			wait for 0.5 sec;
			temp <= '1';
			wait for 1.5 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1.5 sec;

	
		elsif txt(cnt) = 'r' or txt(cnt) = 'R' then
			cnt <= cnt + 1;
			temp <= '0';
			wait for 0.5 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1.5 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1 sec;

	elsif txt(cnt) = 's' or txt(cnt) = 'S' then
			cnt <= cnt + 1;
			temp <= '0';
			wait for 0.5 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1 sec;
			temp <= '0';
			wait for 0.2 sec;
			temp <= '1';
			wait for 1 sec;
	else 
			cnt <= cnt + 1;
			temp <= '0';
			wait for 1.5 sec;

	end if;

	end process;
	trans <= temp;
end bhv;
