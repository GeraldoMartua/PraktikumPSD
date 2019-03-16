library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TheRumputs is

	port(	rumput  : out std_logic := '0');

end TheRumputs;

architecture behavior of TheRumputs is

	signal temp	: std_logic_vector (6 downto 0); 

begin
process
begin

	temp <= "1001000"; 	-- Huruf H
	rumput <= '1'; 		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.5 sec;

	temp <= "1000001";	-- Huruf A
	rumput <= '1'; 		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1.5 sec;
	rumput <= '0';		wait for 0.5 sec;

	temp <= "1001001";	-- Huruf I
	rumput <= '1'; 		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.5 sec;

	temp <= "0000000";
	wait for 2 sec; -- Jarak waktu antar kata

	temp <= "1000001";	-- Huruf A
	rumput <= '1'; 		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1.5 sec;
	rumput <= '0';		wait for 0.5 sec;

	temp <= "1001100";	-- Huruf L
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1.5 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.5 sec;

	temp <= "1010110";	-- Huruf V
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1.5 sec;
	rumput <= '0';		wait for 0.5 sec;

	temp <= "1001001";	-- Huruf I
	rumput <= '1'; 		wait for 1 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.5 sec;

	temp <= "1001110";	-- Huruf N
	rumput <= '1';		wait for 1.5 sec;
	rumput <= '0';		wait for 0.2 sec;
	rumput <= '1';		wait for 1 sec;
	rumput <= '0';		wait for 0.5 sec;

	end process;
end behavior;
