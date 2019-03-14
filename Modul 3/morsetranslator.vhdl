library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity morsetrans is
end entity;
 
architecture test of morsetrans is

    constant ClockFrequencyHz : integer := 10; -- 10 Hz
    constant ClockPeriod      : time := 500 ms / ClockFrequencyHz;
 
    signal clk     : std_logic := '1';
    signal res   : std_logic := '0';
    signal kmorse    : std_logic := '0';
 
begin

    timer : entity work.tomorse(morseedit)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        clk    => clk,
        res   => res,
        kmorse  => kmorse);

    clk <= not clk after ClockPeriod / 2;

    process is
    begin
        wait until rising_edge(clk);
        wait until rising_edge(clk);

        res <= '1';
 
        wait;
    end process;
 
end architecture;