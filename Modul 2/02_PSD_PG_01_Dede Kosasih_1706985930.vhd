 library ieee;
       use ieee.std_logic_1164.all;
       use ieee.std_logic_unsigned.all;
  
  entity counterUD is
    port (
      cout    :out std_logic_vector (3 downto 0);     
      UD      :in  std_logic;                  
      clock   :in  std_logic;                  
      reset   :in  std_logic                    
    );
  end entity;
  
  architecture rtl of counterUD is
      signal count :std_logic_vector (3 downto 0);
  begin
     process (clock, reset) begin
         if (reset = '1') then
            count <= (others=>'0');
         elsif (rising_edge(clock)) then
             if (UD = '1') then
                 count <= count + 1;
             else
                 count <= count - 1;
            end if;
         end if;
     end process;
     cout <= count;
 end architecture;
