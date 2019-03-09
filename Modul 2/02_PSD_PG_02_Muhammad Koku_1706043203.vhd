library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity updown_cntr is
    Port ( LED : out  STD_LOGIC_VECTOR (7 downto 0);
	   CLK : in  STD_LOGIC; 
           DIR : in  STD_LOGIC);    
end updown_cntr;

architecture Behavioral of updown_cntr is
    signal clk_div : STD_LOGIC_VECTOR (3 downto 0) := X"0";
    signal cnt     : STD_LOGIC_VECTOR (7 downto 0) := X"00";
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
                cnt <= cnt + '1';   
            elsif (DIR = '0') then
                cnt <= cnt - '1';   
            end if;
        end if;
    end process;
    
    
    LED <= not cnt;
    
end Behavioral;
