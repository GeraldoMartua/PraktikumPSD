library ieee;
use ieee.std_logic_1164.all;

entity sandi_rumput is
	port(	grass  : out std_logic := '0');
end sandi_rumput;

architecture behavior of sandi_rumput is
	signal rep	: std_logic_vector (6 downto 0); -- Represent the character on ASCII of the grass code

	begin

	process
	begin
	
	rep <= "1001000";
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf H
	
	rep <= "1000001";
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1.5 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf A

	rep <= "1001001";
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf I

	rep <= "0000000";
	wait for 2 sec; -- interval antar kata
	
	rep <= "1000110";	
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1.5 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;	
	-- end huruf F

	rep <= "1000101";
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf E
	
	rep <= "1010010";
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1.5 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf R

	rep <= "1001100";
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1.5 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf L

	rep <= "1001001";
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf I


	rep <= "1001110";
	grass <= '1';
		wait for 1.5 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf N

	rep <= "1000100";
	grass <= '1';
		wait for 1.5 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf D

	rep <= "1000001";
	grass <= '1';
		wait for 1 sec;
	grass <= '0';
		wait for 0.2 sec;
	grass <= '1';
		wait for 1.5 sec;
	grass <= '0';
		wait for 0.5 sec;
	-- end huruf A

	end process;

end behavior;

