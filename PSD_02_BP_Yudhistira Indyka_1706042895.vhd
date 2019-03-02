library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX42 is
	port(

     	A,B,C,D : inout std_logic_vector (3 downto 0);
     	S0, S1 : in std_logic;
     	out_1 : inout std_logic_vector (3 downto 0);
     	bcd_7seg : out std_logic_vector (6 downto 0)); 
	end MUX42;

architecture MUX_1 of MUX42 is
	begin
	A<="0000";
	B<="0001";
	C<="0010";
	D<="0011";

process (A,B,C,D,S0,S1) is
	begin
	  if (S0 ='0' and S1 = '0') then
	      out_1 <= A;
	  elsif (S0 ='1' and S1 = '0') then
	      out_1 <= B;
	  elsif (S0 ='0' and S1 = '1') then
	      out_1 <= C;
	  else
	      out_1 <= D;
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

end MUX_1;
