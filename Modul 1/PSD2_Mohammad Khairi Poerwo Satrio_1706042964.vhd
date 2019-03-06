library IEEE;
use IEEE.std_logic_1164.all;

entity muxto7 is
 port(
 in0,in1,in2,in3 : inout std_logic_vector (3 downto 0);
 sel0, sel1 : in std_logic;
 BCD : inout std_logic_vector (3 downto 0);
 seg7 : out std_logic_vector (6 downto 0)
 );

end muxto7;

architecture mux of muxto7 is
begin
 in0<="0000";
 in1<="0001";
 in2<="0010";
 in3<="0011";

process (in0,in1,in2,in3,sel0,sel1) is
begin
 if (sel0 ='0' and sel1 = '0') then
 BCD <= in0;
 elsif (sel0 ='1' and sel1 = '0') then
 BCD <= in1;
 elsif (sel0 ='0' and sel1 = '1') then
 BCD <= in2;
 else
 BCD <= in3;
end if;

end process;

process (BCD)
begin
 case BCD is
 when "0000" => seg7 <= "0000001"; ---0
 when "0001" => seg7 <= "1001111"; ---1
 when "0010" => seg7 <= "0010010"; ---2
 when "0011" => seg7 <= "0000110"; ---3
 when others => seg7 <= "1111111";
end case;

end process;
end mux;