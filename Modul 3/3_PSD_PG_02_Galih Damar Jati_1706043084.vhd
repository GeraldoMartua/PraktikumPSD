library ieee;
use ieee.std_logic_1164.all;


entity pramuka is
	port ( pesan : in string (10 downto 1) := "Hai Zafran";
		Q : out std_logic);
		
end pramuka;

architecture behavior of pramuka is
begin
		process
		begin
			if pesan (10) = 'H' or pesan (10) = 'h' then
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q<= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.5 sec;
	
			elsif pesan (9) = 'A' or pesan (9) = 'a' then
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1.5 sec;
			Q <= '0';
				wait for 0.5 sec;
	

			elsif pesan (8) = 'I' or pesan (8) = 'i' then
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.5 sec;

			elsif pesan (7) = ' ' then
			Q <= '0';
				wait for 2 sec;

			elsif pesan (6) = 'Z' or pesan (6) = 'z' then
			Q <= '1';
				wait for 1.5 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1.5 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q<= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.5 sec;	

			elsif pesan (5) = 'A' or pesan (5) = 'a' then
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1.5 sec;
			Q <= '0';
				wait for 0.5 sec;

			elsif pesan (4) = 'F' or pesan (4) = 'f' then
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q<= '1';
				wait for 1.5 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.5 sec;

			elsif pesan (3) = 'R' or pesan (3) = 'r' then
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1.5 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.5 sec;
		
			elsif pesan (2) = 'a' or pesan (2) = 'a' then
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1.5 sec;
			Q <= '0';
				wait for 0.5 sec;

			elsif pesan (1) = 'N' or pesan (1) = 'n' then
			Q <= '1';
				wait for 1.5 sec;
			Q <= '0';
				wait for 0.2 sec;
			Q <= '1';
				wait for 1 sec;
			Q <= '0';
				wait for 0.5 sec;
			end if;
		end process;
end behavior;
