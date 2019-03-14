library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity morsecode is
end entity;
 
architecture sim of morsecode is
 
    -- biar 1/2 detik
    constant ClockFrequencyHz : integer := 10; -- 10 Hz
    constant ClockPeriod      : time := 500 ms / ClockFrequencyHz;
 
    signal clk     : std_logic := '1';
    signal reset   : std_logic := '0';
    signal kode    : std_logic := '0';
 
begin
 
    -- nge port device aslinya
    i_Timer : entity work.morse(esrom)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        clk     => clk,
        reset   => reset,
        kode    => kode);
  
    -- Proses buat Clock nya
    clk <= not clk after ClockPeriod / 2;
 
    -- proses Testbench buat simulasi
    process is
    begin
        wait until rising_edge(clk);
        wait until rising_edge(clk);
 
        -- biar mulai
        reset <= '1';
 
        wait;
    end process;
 
end architecture;
