library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_counter is
    Port ( CLK : in  STD_LOGIC;     
           DIRECTION : in  STD_LOGIC;
	   SevenSegment : out  STD_LOGIC_VECTOR (7 downto 0));
end updown_counter;

architecture bestupdown_counter of updown_counter is
    signal clk_now : STD_LOGIC_VECTOR (3 downto 0) := X"0";
    signal count   : STD_LOGIC_VECTOR (7 downto 0) := X"00";
begin
    process (CLK)
    begin
        if (CLK'Event and CLK = '1') then
            clk_now <= clk_now + '1';
        end if;
    end process;
    
    process (clk_now(3), DIRECTION)
    begin
        if (clk_now(3)'Event and clk_now(3) = '1') then
            if (DIRECTION = '1') then
                count <= count + '1';
            elsif (DIRECTION = '0') then
                count <= count - '1';
            end if;
        end if;
    end process;
    
    SevenSegment <= not count;
    
end bestupdown_counter;
