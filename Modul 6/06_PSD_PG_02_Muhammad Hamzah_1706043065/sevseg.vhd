library ieee;
use ieee.std_logic_1164.all;

entity SevSeg_hex is
	port(
		hex : in std_logic_vector(3 downto 0);
		disp_out : out std_logic_vector(0 to 6)
	);
end SevSeg_hex;

architecture Bhv of SevSeg_hex is
begin
	process(hex)
	begin
		case (hex) is
			when "0000" => disp_out <= "0000001";
			when "0001" => disp_out <= "1001111";
			when "0010" => disp_out <= "0010010";
			when "0011" => disp_out <= "0000110";
			when "0100" => disp_out <= "1001100";
			when "0101" => disp_out <= "0100100";
			when "0110" => disp_out <= "1100000";
			when "0111" => disp_out <= "0001111";
			when "1000" => disp_out <= "0000000";
			when "1001" => disp_out <= "0001100";
			when "1010" => disp_out <= "0001000";
			when "1011" => disp_out <= "1100000";
			when "1100" => disp_out <= "0110001";
			when "1101" => disp_out <= "1000010";
			when "1110" => disp_out <= "0110000";
			when others => disp_out <= "0111000";
		end case;
	end process;
end Bhv;