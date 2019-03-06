library ieee;
use ieee.std_logic_1164.all;

entity RidhoGani_1706042932 is
  port(
        segment : out std_logic_vector(6 downto 0)              -- output sevensegment
      );
end RidhoGani_1706042932;

architecture machine of RidhoGani_1706042932 is
  signal bcd      : std_logic_vector(3 downto 0);               -- collecting input from mux
  signal selector : std_logic_vector(1 downto 0);               -- 2 bit selector mux
  signal in1      : std_logic_vector(3 downto 0) := B"0000";    -- input mux
  signal in2      : std_logic_vector(3 downto 0) := B"0001";    -- input mux
  signal in3      : std_logic_vector(3 downto 0) := B"0010";    -- input mux
  signal in4      : std_logic_vector(3 downto 0) := B"0011";    -- input mux

begin
  process(in1, in2, in3, in4, selector) is
  begin
    case selector is                                            -- mux working area

      when "00" => bcd <= in1;
      when "01" => bcd <= in2;
      when "10" => bcd <= in3;
      when "11" => bcd <= in4;
      when others => bcd <= "1111";

    end case;                                                   -- end of mux working area

    case bcd is                                                 -- decoder working area

      when "0000" => segment <= "0111111";                      -- 0
      when "0001" => segment <= "0000110";                      -- 1
      when "0010" => segment <= "1011011";                      -- 2
      when "0011" => segment <= "1001111";                      -- 3
      when others => segment <= "0000000";                      -- all off

    end case;                                                   -- end of decoder working area
  end process;

end architecture;
