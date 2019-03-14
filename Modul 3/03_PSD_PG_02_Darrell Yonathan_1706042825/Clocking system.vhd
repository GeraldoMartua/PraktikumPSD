
library ieee;

use ieee.std_logic_1164.all;

entity ANDS is

 port(X,   Y:     in  std_logic;

      Z: out std_logic);

end entity;

architecture DataFlow of ANDS is

begin

Z <=X and Y;

end DataFlow;

library ieee;

use ieee.std_logic_1164.all;


entity ANDand is

port(

A,B,C,D: in std_logic;

SUM: out std_logic);

end entity;

architecture Data of ANDand is

component ANDS

 port(X,   Y:     in  std_logic;

      Z: out std_logic);

end component;

signal U1_SUM, U0_SUM: std_logic;

begin

  U0: ANDS port map (X => A, Y => B, Z => U0_SUM);

  U1: ANDS port map (X => C, Y => D, Z => U1_SUM);

  U2: ANDS port map (X => U1_SUM, Y => U0_SUM, Z => SUM);

end Data;