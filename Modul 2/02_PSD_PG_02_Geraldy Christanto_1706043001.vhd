-- Author  : Geraldy Christanto
-- NPM	   : 1706043001	
-------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity updown_counter is
  port (
    output  :out std_logic_vector (7 downto 0);-- Output of the counter
    up_down :in  std_logic;                    -- up_down control for counter
    clk     :in  std_logic;                    -- Input clock
    reset   :in  std_logic                     -- Input reset
  );
end entity;

architecture my_udc of updown_counter is
    signal count :std_logic_vector (7 downto 0);
begin
    process (clk, reset) begin
        if (reset = '1') then
            count <= (others=>'0');
        elsif (rising_edge(clk)) then
            if (up_down = '1') then
                count <= count + 1;
            else
                count <= count - 1;
            end if;
        end if;
    end process;
    output <= count;
end architecture;
