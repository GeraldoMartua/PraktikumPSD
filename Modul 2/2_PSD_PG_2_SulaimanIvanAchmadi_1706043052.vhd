library ieee;
use ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.ALL;

entity up_down_counter is
    Port ( CLK : in  std_logic;
           DIR : in  std_logic;
           LED : out  std_logic_vector (7 downto 0));
end up_down_counter;

architecture behavioral of up_down_counter is
    signal clk_div : std_logic_vector (5 downto 0);
    signal count   : std_logic_vector (7 downto 0);
begin
    process (CLK)
    begin
        if (CLK'Event and CLK = '1') then
            clk_div <= clk_div + '1';
        end if;
