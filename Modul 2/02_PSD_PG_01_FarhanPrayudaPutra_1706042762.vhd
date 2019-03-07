library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity test is
    Port ( 
	Clk : in  STD_LOGIC;
           Dir : in  STD_LOGIC;
           Nilai : out  STD_LOGIC_VECTOR (7 downto 0));
end test;

architecture Behavioral of test is
    
    signal count   : STD_LOGIC_VECTOR (7 downto 0);
begin
    
    end process;
    process (Clk(5))
    begin
        if (Clk(5) and Clk(5) = '1') then
            if (Dir = '1') then
                while (count < 100) loop
                    count <= count + '1';  
                end loop;
            else
                -- count down to 0 then stop
                while (count > 0) loop
                    count <= count - '1';
                end loop;
            end if;
        end if;
    end process;
end Behavioral;