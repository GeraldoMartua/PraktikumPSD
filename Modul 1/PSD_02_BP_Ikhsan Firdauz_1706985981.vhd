library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity input_to_7seg is
 port(

     input1,input2,input3,input4 : inout std_logic_vector (3 downto 0);
     select_0, select_1 : in std_logic;
     out_1 : inout std_logic_vector (3 downto 0);
     bcd_7seg : out std_logic_vector (6 downto 0));	
end input_to_7seg;

architecture MIXED of input_to_7seg is
begin
input1<="0000";
input2<="0001";
input3<="0010";
input4<="0011";
process (input1,input2,input3,input4,select_0,select_1) is
begin
  if (select_0 ='0' and select_1 = '0') then
      out_1 <= input1;
  elsif (select_0 ='1' and select_1 = '0') then
      out_1 <= input2;
  elsif (select_0 ='0' and select_1 = '1') then
      out_1 <= input3;
  else
      out_1 <= input4;
  end if;

end process;

process (out_1)
begin
  case out_1 is
	when "0000" =>
	bcd_7seg <= "0000001"; --- 0

	when "0001" =>
	bcd_7seg <= "1001111"; ---1

	when "0010" =>
	bcd_7seg <= "0010010"; ---2

	when "0011" =>
	bcd_7seg <= "0000110"; ---3

	when others =>
	bcd_7seg <= "1111111"; ---NULL

  end case;
end process;

end MIXED;

