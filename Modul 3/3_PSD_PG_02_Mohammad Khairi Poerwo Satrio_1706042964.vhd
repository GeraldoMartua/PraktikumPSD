library ieee;
use ieee.std_logic_1164.all;

entity rumput is
	port( sandi : in string (9 downto 1) := "Hai Titus";
	Q : out std_logic);
end rumput;

architecture bhv of rumput is
	begin
		process
		begin
			
		if sandi (9) = 'H' then
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.2 sec;
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.2 sec;
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.2 sec;
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.5 sec;
	
		elsif sandi (8) = 'A' then
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.2 sec;
		Q <= '1';
			wait for 1.5 sec;
		Q <= '0';
			wait for 0.5 sec;

		elsif sandi (7) = 'I' then
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.2 sec;
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.5 sec;


		elsif sandi (6) = ' ' then
		Q <= '0';
			wait for 2 sec;


		elsif sandi (5) = 'T' then 
    		Q <= '1';
     			wait for 1.5 sec;
    		Q <= '0';
     			wait for 0.5 sec;

		elsif sandi (4) = 'I' then
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.2 sec;
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.5 sec;

		elsif sandi (3) = 'T' then 
    		Q <= '1';
     			wait for 1.5 sec;
    		Q <= '0';
     			wait for 0.5 sec;

		elsif sandi (2) = 'U' then
		Q <= '1'; 
			wait for 1 sec;
		Q <= '0'; 
			wait for 0.2 sec;
		Q <= '1'; 
			wait for 1 sec;
		Q <= '0'; 
			wait for 0.2 sec;
		Q <= '1';
			wait for 1.5 sec;
		Q <= '0';
			wait for 0.5 sec;

		elsif sandi (1) = 'S' then
		Q <= '1'; 
			wait for 1 sec;
		Q <= '0'; 
			wait for 0.2 sec;
		Q <= '1'; 
			wait for 1 sec;
		Q <= '0'; 
			wait for 0.2 sec;
		Q <= '1';
			wait for 1 sec;
		Q <= '0';
			wait for 0.5 sec;

		end if;
	end process;
end bhv;
