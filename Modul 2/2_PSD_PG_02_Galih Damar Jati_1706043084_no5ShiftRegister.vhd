library ieee;
use ieee.std_logic_1164.all;
 
entity parralel_in_out is
 port(C : in std_logic;
      D: in std_logic_vector(2 downto 0);
      Q: out std_logic_vector(2 downto 0));
end parralel_in_out;
 
architecture funct of parralel_in_out is
begin
 process (C)
 begin
  if rising_edge (C) then
  Q <= D;
  end if;
 end process;

end funct;