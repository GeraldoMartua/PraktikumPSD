library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX is
 port(

     din1,din2,din3,din4 : inout std_logic_vector (3 downto 0);
     s0, s1 : in std_logic;
     out_1 : inout std_logic_vector (3 downto 0);
     bcd_7seg : out std_logic_vector (6 downto 0)); 
end MUX;

architecture MUX_1 of MUX is
begin
	din1<="0000";
	din2<="0001";
	din3<="0010";
	din4<="0011";
process (din1,din2,din3,din4,s0,s1) is
begin
  if (s0 ='0' and s1 = '0') then
      out_1 <= din1;
  elsif (s0 ='1' and s1 = '0') then
      out_1 <= din2;
  elsif (s0 ='0' and s1 = '1') then
      out_1 <= din3;
  else
      out_1 <= din4;
  end if;

end process;
-------------------------------------------
process (out_1)
begin
  case out_1 is  -----Kode 7_seg invers, pake kaki katoda.
 when "0000" =>
	 bcd_7seg <= "0000001";
 when "0001" =>
 	bcd_7seg <= "1001111"; 
 when "0010" =>
 	bcd_7seg <= "0010010"; 
 when "0011" =>
 	bcd_7seg <= "0000110"; 
 when "0100" =>
 	bcd_7seg <= "1001100"; 
 when "0101" =>
	 bcd_7seg <= "0100100";
 when "0110" =>
 	bcd_7seg <= "0100000"; 
 when "0111" =>
 	bcd_7seg <= "0001111"; 
 when others =>
 	bcd_7seg <= "1111111"; 

  end case;
end process;

end MUX_1;

