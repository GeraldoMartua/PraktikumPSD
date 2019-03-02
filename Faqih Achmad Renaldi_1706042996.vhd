library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Multiplex is
 port(

     in0,in1,in2,in3 : inout std_logic_vector (3 downto 0);
     pilih1, pilih2 : in std_logic;
     output : inout std_logic_vector (3 downto 0);
     bcdto7seg : out std_logic_vector (6 downto 0)); 

end Multiplex;
architecture Multiplex1 of Multiplex is
begin

	in0<="0000";
	in1<="0001";
	in2<="0010";
	in3<="0011";

process (in0,in1,in2,in3,pilih1,pilih2) is
begin
  if (pilih1 ='0' and pilih2 = '0') then
      output <= in0;
  elsif (pilih1 ='1' and pilih2 = '0') then
      output <= in1;
  elsif (pilih1 ='0' and pilih2 = '1') then
      output <= in2;
  else
      output <= in3;
  end if;

end process;

process (output)
begin
  case output is
 when "0000" =>
 bcdto7seg <= "0000001"; --- 0

 when "0001" =>
 bcdto7seg <= "1001111"; ---1

 when "0010" =>
 bcdto7seg <= "0010010"; ---2

 when "0011" =>
 bcdto7seg <= "0000110"; ---3

 when others =>
 bcdto7seg <= "1111111"; ---NULL
  end case;

end process;

end Multiplex1;
