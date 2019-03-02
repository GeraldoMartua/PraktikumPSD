library IEEE;

use IEEE.STD_LOGIC_1164.ALL;

 

entity mux_7seg is
	Port ( SEL : in  STD_LOGIC_VECTOR (1 downto 0);     -- select input
        masuk   : in  STD_LOGIC_VECTOR (3 downto 0);     -- inputs
        keluar   : out STD_LOGIC;                        -- output
	B0,B1,B2,B3 : in STD_LOGIC;
	A,B,C,D,E,F,G : out STD_LOGIC);

end mux_7seg;

 

architecture mux_4to1 of mux_7seg is

begin
with SEL select
    keluar <= masuk(0) when "00",
         masuk(1) when "01",
         masuk(2) when "10",
         masuk(3) when "11",
         '0'  when others;
end mux_4to1;



architecture bcd_7seg of mux_7seg is

begin
A <= B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3);

B <= (NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3);

C <= B1 OR NOT B2 OR B3;

D <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0;

E <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3);

F <= B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1 AND NOT B3);

G <= B0 OR (B1 AND NOT B2) OR ( NOT B1 AND B2) OR (B2 AND NOT B3);

 

end bcd_7seg;

-- reference: https://allaboutfpga.com/bcd-to-7-segment-decoder-vhdl-code/
-- https://surf-vhdl.com/how-to-implement-digital-mux-in-vhdl/
