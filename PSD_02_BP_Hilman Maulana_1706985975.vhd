library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity Muxto7Seg is
	port(
	A1, A2, A3, A4 : in std_logic_vector (3 downto 0);
	SLC	       : in std_logic_vector (3 downto 0);
	BCD	       : in std_logic_vector (3 downto 0);	
	OUTPUT	       : out std_logic_vector (3 downto 0);
	7Segment       : out std_logic_vector (6 downto 0);
end Muxto7Seg;

architecture design of Muxto7Seg is
begin
	Output <= A1 when SLC = "0011") else
  	A2 when (SLC = "0010") else
	A3 when (SLC = "0001") else
	A4 when (SLC = "0000") else
	"0000";
end design;

architecture BCDtosegment of Muxto7Seg is
begin
	
	process(BCD)
	begin

		case BCD is
			when "0000" => 7Segment <= "0000001"; ---0
			when "0001" => 7Segment <= "1001111"; ---1
			when "0010" => 7Segment <= "0010010"; ---2
			when "0011" => 7Segment <= "0000110"; ---3
			when others => 7Segment <= "1111111"; ---null
		end case;

	end process;

end BCDtosegment;