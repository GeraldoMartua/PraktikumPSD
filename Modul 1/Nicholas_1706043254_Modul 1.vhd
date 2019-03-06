library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity muxto7seg is
	port (sel : in std_logic_vector (1 downto 0);
	      input : in std_logic_vector (3 downto 0);
	      output : out std_logic;
	      B0,B1,B2,B3 : in std_logic;
              A,B,C,D,E,F,G : out std_logic;

end muxto7seg;




architecture  mux of muxto7seg is

begin
with sel select
	output <= input(0) when "00",
	input(1) when "01",
	input(2) when "10",
	input(3) when "11",
	'0' when others;

end mux;

architecture bcd of muxto7seg is
begin
	process(A,B,C,D, sel)
	begin
	
	if (sel="0000") then result <= D;
	elsif (sel = "0001") then result <= C;
	elsif (sel = "0010") then result <= B;
	else result <= A;
end if;
end process;

architecture bcdto7seg of muxto7seg is
begin

A <= B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3);

B <= (NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3);

C <= B1 OR NOT B2 OR B3;

D <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0;

E <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3);

F <= B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1 AND NOT B3);

G <= B0 OR (B1 AND NOT B2) OR ( NOT B1 AND B2) OR (B2 AND NOT B3);

end bcdto7seg;