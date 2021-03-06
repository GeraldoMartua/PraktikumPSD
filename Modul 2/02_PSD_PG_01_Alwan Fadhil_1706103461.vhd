library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all; 

entity UP_DN_COUNTER is 
  port(C, CLR, UP_DOWN : in std_logic; 
        Q : out std_logic_vector(3 downto 0)); 
end UP_DN_COUNTER; 

architecture archi of UP_DN_COUNTER is 
  signal tmp: std_logic_vector(3 downto 0); 
  begin  
    process (C, CLR) 
      begin 
        if (CLR='1') then 
          tmp <= "0000"; 
        elsif (C'event and C='1') then 
          if (UP_DOWN='1') then 
            tmp <= tmp + 1; 
          else 
            tmp <= tmp - 1; 
          end if; 
        end if; 
    end process; 
    Q <= tmp; 
end archi; 