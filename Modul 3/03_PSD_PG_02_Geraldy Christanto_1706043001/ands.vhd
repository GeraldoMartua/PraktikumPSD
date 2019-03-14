library ieee;
use ieee.std_logic_1164.all;
entity AND1 is
 port(X,   Y:     in  std_logic;
      Z: out std_logic);
end entity;
architecture DataFlow of AND1 is
begin
Z <=X and Y;
end DataFlow;
library ieee;
use ieee.std_logic_1164.all;

entity AND2 is
port(
	A,B,C,D: in std_logic;
	SUM: out std_logic);
end entity;
architecture Data of AND2 is
component AND1
 port(X,   Y:     in  std_logic;
      Z: out std_logic);
end component;
signal U1_SUM, U0_SUM: std_logic;
begin
  U0: AND1 port map (X => A, Y => B, Z => U0_SUM);
  U1: AND1 port map (X => C, Y => D, Z => U1_SUM);
  U2: AND1 port map (X => U1_SUM, Y => U0_SUM, Z => SUM);
end Data;