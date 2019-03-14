
library ieee;
use ieee.std_logic_1164.all;
entity anddd is
 port(X,   Y:     in  std_logic;
      Z: out std_logic);
end entity;
architecture Behavioral of anddd is
begin
Z <=X and Y;
end Behavioral;
library ieee;
use ieee.std_logic_1164.all;

entity andd is
port(
A,B,C,D: in std_logic;
SUM: out std_logic);
end entity;
architecture Behavioral of andd is
component anddd
 port(X,   Y:     in  std_logic;
      Z: out std_logic);
end component;
signal U1_SUM, U0_SUM: std_logic;
begin
  U0: anddd port map (X => A, Y => B, Z => U0_SUM);
  U1: anddd port map (X => C, Y => D, Z => U1_SUM);
  U2: anddd port map (X => U1_SUM, Y => U0_SUM, Z => SUM);
end Behavioral;