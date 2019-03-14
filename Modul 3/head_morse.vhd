library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity head_morse is
end entity;
 
architecture sim of head_morse is
 
    constant ClockFrequencyHz : integer := 10; -- 10 Hz
    constant ClockPeriod      : time := 500 ms / ClockFrequencyHz;
 
    signal clk     : std_logic := '1';
    signal kode    : std_logic := '0';
    signal r   : std_logic := '0';
 
begin
    i_Timer : entity work.test_bench_morse(esrom)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        clk     => clk,
        r   	=> r,
        kode    => kode);
  
    clk <= not clk after ClockPeriod / 2;
 
    -- test bench
    process is
    begin
        wait until rising_edge(clk);
        wait until rising_edge(clk);
 
        -- tanda mulai
        r <= '1';
 
        wait;
    end process;
 
end architecture;