library ieee;
use ieee.std_logic_1164.all;

entity mux4_2 is 
port (in1, in2, in3, in4 : inout std_logic_vector (3 downto 0);
	s0, s1 : in std_logic;
	o1: inout std_logic_vector (3 downto 0);
	bcd7seg : out std_logic_vector (6 downto 0)
);
end mux4_2;

architecture mux_1 of mux4_2 is
begin
 in1<="0000";
 in2<="0001";
 in3<="0010";
 in4<="0011";
process(in1, in2, in3, in4, s0, s1) is
begin
	if(s0='0' and s1='0') then
	o1<=in1;
	elsif(s0='1' and s1='0') then
	o1<=in2;
	elsif(s0='0' and s1='1') then
	o1<=in3;
	else
	o1<=in4;
	end if;
end process;

process(o1)
begin
 case o1 is 
    when "0000"=> bcd7seg <="0000001";
    when "0001"=> bcd7seg <="1001111";    
    when "0010"=> bcd7seg <="0010010";
    when "0011"=> bcd7seg <="0000110";
    when others=> bcd7seg <="1111111";
end case;
end process;

end mux_1;
    