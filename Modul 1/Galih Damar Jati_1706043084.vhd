library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX4 is
port  ( in0, in1, in2, in3 : in std_logic_vector (3 downto 0);
	sel1,sel2 : in std_logic;
	x : inout std_logic_vector (3 downto 0);
	bcd7 : out std_logic_vector(6 downto 0));
end MUX4;

architecture MUX41 of MUX4 is
begin
process (in0,in1,in2,in3,sel1,sel2) is
begin
  if (sel1 ='0' and sel2 ='0') then
      x <= in0;
  elsif (sel1 ='1' and sel2 ='0') then
      x <= in1;
  elsif (sel1 ='0' and sel2 ='1') then
      x <= in2;
  else
      x <= in3;
  end if;
end process;

	process (x)
	begin
		case x is
		when "0000" =>
		bcd7 <= "0000001"; ---0
		when "0001" =>
		bcd7 <= "1001111"; ---1
		when "0010" =>
		bcd7 <= "0010010"; ---2
		when "0011" =>
		bcd7 <= "0000110"; ---3
		when "0100" =>
		bcd7 <= "1001100"; ---4
		when "0101" =>
		bcd7 <= "0100100"; ---5
		when "0110" =>
		bcd7 <= "0100000"; ---6
		when "0111" =>
		bcd7 <= "0001111"; ---7
		when "1000" =>
		bcd7 <= "0000000"; ---8
		when "1001" =>
		bcd7 <= "0000100"; ---9
		when others =>
		bcd7 <= "1111111"; ---null
		end case;
	end process;
end MUX41;

