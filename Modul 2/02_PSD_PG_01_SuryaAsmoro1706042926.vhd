library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity up_dn_counter_top is
    Port ( CLK : in  STD_LOGIC;    
           -- LEDs to display count
           LED : out  STD_LOGIC_VECTOR (7 downto 0);
           DIR : in  STD_LOGIC);   
end up_dn_counter_top;

architecture Behavioral of up_dn_counter_top is
    signal clk_div : STD_LOGIC_VECTOR (3 downto 0) := X"0";
    signal count   : STD_LOGIC_VECTOR (7 downto 0) := X"00";
begin

    process (CLK)
    begin
        if (CLK'Event and CLK = '1') then
            clk_div <= clk_div + '1';
        end if;
    end process;
    
    process (clk_div(3), DIR)
    begin
        if (clk_div(3)'Event and clk_div(3) = '1') then
            if (DIR = '1') then
                count <= count + '1'; 
            elsif (DIR = '0') then
                count <= count - '1';  
            end if;
        end if;
    end process;
