library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shift_register_top is
    Port ( CLK : in  STD_LOGIC;
           D   : in  STD_LOGIC;
           LED : out STD_LOGIC_VECTOR(7 downto 0));
end shift_register_top;
    
architecture Behavioral of shift_register_top is
    signal clock_div : STD_LOGIC_VECTOR(4 downto 0);
    signal shift_reg : STD_LOGIC_VECTOR(7 downto 0) := X"00";
begin

    -- clock divider
    process (CLK)
    begin
        if (CLK'event and CLK = '1') then
            clock_div <= clock_div + '1';
        end if;
    end process;
    
    -- shift register
    process (clock_div(4))
    begin
        if (clock_div(4)'event and clock_div(4) = '1') then
            shift_reg(7) <= D;
            shift_reg(6) <= shift_reg(7);
            shift_reg(5) <= shift_reg(6);
            shift_reg(4) <= shift_reg(5);
            shift_reg(3) <= shift_reg(4);
            shift_reg(2) <= shift_reg(3);
            shift_reg(1) <= shift_reg(2);
            shift_reg(0) <= shift_reg(1);
        end if;
    end process;
    
    -- hook up the shift register bits to the LEDs
    LED <= shift_reg;

end Behavioral;
