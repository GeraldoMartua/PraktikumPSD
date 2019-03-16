library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity roots is
	port(
		input: in string:="Hai Fanny";						--input your partner name here
		root : out std_logic :='0';	
		clock: in std_logic
		);
end roots;

architecture flow of roots is
		constant len : integer:= input'length;				--set length of string
begin
	process
	begin
	if clock'event and clock = '1' then						--decode string to root chiper
	for i in 1 to len loop									--use iteration method
		if input(i) = 'a' or input(i) = 'A' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'b' or input(i) = 'B' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'c' or input(i) = 'C' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'd' or input(i) = 'D' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'e' or input(i) = 'E' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'f' or input(i) = 'F' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'g' or input(i) = 'G' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'h' or input(i) = 'H' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'i' or input(i) = 'I' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'j' or input(i) = 'J' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'k' or input(i) = 'K' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'l' or input(i) = 'L' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'm' or input(i) = 'M' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'n' or input(i) = 'N' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'o' or input(i) = 'O' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'p' or input(i) = 'P' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'q' or input(i) = 'Q' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'r' or input(i) = 'R' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 's' or input(i) = 'S' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 't' or input(i) = 'T' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'u' or input(i) = 'U' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'v' or input(i) = 'V' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		elsif input(i) = 'w' or input(i) = 'W' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'x' or input(i) = 'X' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'y' or input(i) = 'Y' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
		elsif input(i) = 'z' or input(i) = 'Z' then
			root <= '0';
			wait for 0.5 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1.5 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
			root <= '0';
			wait for 0.2 sec;
			root <= '1';
			wait for 1 sec;
		else
			root <= '0';
			wait for 1.5 sec;
		end if;
	end loop;
	end if;
	root <= '0';
	end process;
end architecture;
				
