library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_7segment is
	Port (
	selector : in STD_LOGIC_VECTOR(3 downto 0);
	A : in STD_LOGIC_VECTOR(3 downto 0);
	B : in STD_LOGIC_VECTOR(3 downto 0);
	C : in STD_LOGIC_VECTOR(3 downto 0);
	D : in STD_LOGIC_VECTOR(3 downto 0);
	-- bcd_input : in STD_LOGIC_VECTOR(3 downto 0);
	out_seg : out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture display of display_7segment is
	SIGNAL bcd_input : STD_LOGIC_VECTOR(3 downto 0);
begin
	MUX4 : entity work.multiplexer4in(mux4)
		PORT MAP(I1 => A, I2 => B, 
				I3 => C, I4 => D,
				out_mux4 => bcd_input,
				select_in4 => selector);
	
	DECODER : entity work.decoder_bcd_7seg(decoder7seg)
		PORT MAP(bcd_in => bcd_input,
					out_seg => out_seg);
end display;


