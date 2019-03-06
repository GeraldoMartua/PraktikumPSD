library IEEE;
use IEEE.std_logic_1164.all;


architecture Behavioral of mux_4bit is
begin
  Z <= A when (SEL = "0011") else
  B when (SEL = "0010") else
  C when (SEL = "0001") else
  D when (SEL = "0000") else
  "0000";
  
end mux_4bit;

entity TEST is
port (
 A,B,C,D	: in std_logic_vector(3 downto 0);
 SEL 		: in std_logic_vector(3 downto 0);
 Z 		: out std_logic_vector(3 downto 0);
 ABC 		: in std_logic_vector (3 downto 0);
 Segment 	: out std_logic_vector (6 downto 0));
end proyek1;

architecture abc_to7segmen is
begin

process(ABC)
begin


 case ABC is
 when "0000" => Segment <= "0000001"; ---0
 when "0001" => Segment <= "1001111"; ---1
 when "0010" => Segment <= "0010010"; ---2
 when "0011" => Segment <= "0000110"; ---3
 when "0100" => Segment <= "1001100"; ---4
 when others => Segment <= "1111111"; ---null
 end case;
 
 
end process;
end xabc_to7segmen;
