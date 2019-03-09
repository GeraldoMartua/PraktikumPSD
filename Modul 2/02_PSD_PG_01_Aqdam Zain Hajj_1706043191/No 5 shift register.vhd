---------------------------------------
         -- Shift Register --
      -- 3 bit parallel input --
---------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
 -- entity
entity shift_reg is
port ( Clock,D_IN,Load : in std_logic;
Load_Data : in std_logic_vector (2 downto 0);
D_OUT : out std_logic
);
end shift_reg;
 -- architecture
architecture shift of shift_reg is
signal REG_tmp: std_logic_vector(2 downto 0);
---------------------------------------------
begin
process (Clock)
begin
if (rising_edge(Clock)) then
if (Load = '1') then
REG_tmp <= Load_Data;
else
REG_tmp <= REG_tmp(1 downto 0) & D_IN;
end if;
end if;
D_OUT <= REG_tmp(2);
end process;
end shift;
