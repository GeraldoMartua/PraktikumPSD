library ieee;
use ieee.std_logic_1164.all;

entity seseg is
port(
		bcd_seseg : in std_logic_vector(3 downto 0);
		out_seseg : out std_logic_vector(6 downto 0)
	  );
end entity;

architecture machine of seseg is
begin
process(bcd_seseg)
begin
case bcd_seseg is
		when "0000" => out_seseg <= "1111110";
		when "0001" => out_seseg <= "0110000";
		when "0010" => out_seseg <= "1101101";
		when "0011" => out_seseg <= "1111001";
		when "0100" => out_seseg <= "0110011";
		when "0101" => out_seseg <= "1011011";
		when "0110" => out_seseg <= "1011111";
		when "0111" => out_seseg <= "1110000";
		when "1000" => out_seseg <= "1111111";
		when "1001" => out_seseg <= "1111011"; 
		when "1010" => out_seseg <= "1110111"; 
		when "1011" => out_seseg <= "1111111";
		when "1100" => out_seseg <= "1001110";
		when "1101" => out_seseg <= "1111110";
		when "1110" => out_seseg <= "1001111";
		when "1111" => out_seseg <= "1000111";
		when others => out_seseg <= "0000000";
end case;
end process;
end architecture;