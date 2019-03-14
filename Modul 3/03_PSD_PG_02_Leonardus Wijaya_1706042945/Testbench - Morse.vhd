library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity kode_morsetb is
end entity;
 
architecture test of kode_morsetb is

    constant ClockFrequencyHz : integer := 10; -- 10 Hz
    constant ClockPeriod      : time := 500 ms / ClockFrequencyHz;
 
    signal cl     : std_logic := '1';
    signal rst   : std_logic := '0';
    signal kode    : std_logic := '0';
 
begin

    timer : entity work.kode_morse(tutam)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        cl    => cl,
        rst   => rst,
        kode  => kode);

    cl <= not cl after clper / 2;

    process is
    begin
        wait until rising_edge(cl);
        wait until rising_edge(cl);

        rst <= '1';
 
        wait;
    end process;
 
end architecture;