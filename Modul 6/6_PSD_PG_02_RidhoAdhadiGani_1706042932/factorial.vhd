library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity factorial is
port( 
		vals 	: in  std_logic_vector(3 downto 0);
		clock : in  std_logic := '1';
		get 	: out  std_logic_vector(7 downto 0)
);
end factorial;

architecture machine of factorial is
		signal fact : std_logic_vector(7 downto 0) := "00000001";
		signal count: std_logic_vector(3 downto 0) := "0010";

begin
process 
begin
		wait until clock = '1' and clock'event;
		if vals <= "0101" then
			if count <= vals then
				fact <= fact(4 downto 0)*count(2 downto 0);
			count <= count + 1;
			end if;
			else fact <= "00000000";
		end if;
   get <= fact;

end process;
end architecture;