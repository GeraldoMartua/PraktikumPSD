library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity UpDownCounter is
    Port ( Clock: in std_logic; -- clock input
           Reset: in std_logic; -- reset input 
     	   UpDown: in std_logic; -- Untuk ditentukan akan menjadi counter up atau counter down
           Counter: out std_logic_vector(3 downto 0) -- output counter dengan 4-bit
     );
end UpDownCounter;

architecture Behavioral of UpDownCounter is
signal UpdownCounter: std_logic_vector(3 downto 0):="0000"; 
begin
-- down counter
process(Clock,Reset)
begin
if (rising_edge(Clock)) then
    if
    (Reset='1') then
    UpdownCounter <= x"0";
    elsif
    (UpDown='1') then         -- saat UpDown 1 akan menjadi counter down
    UpDownCounter <= UpdownCounter - x"1";
    else                      -- saat UpDown 0 akan menjadi counter down
    UpDownCounter <= UpDownCounter + x"1"; 
    end if;
end if;
end process;
Counter <= UpDownCounter;   -- Output pada variabel Counter
end Behavioral;
