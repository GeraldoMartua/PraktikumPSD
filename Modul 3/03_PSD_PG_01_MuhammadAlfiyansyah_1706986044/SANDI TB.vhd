library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity morse_tb is
end entity;
 
architecture sim of morse_tb is
 
    -- biar 1/2 detik
    constant ClockFrequencyHz : integer := 10; -- 10 Hz
    constant ClockPeriod      : time := 500 ms / ClockFrequencyHz;
 
    signal clk     : std_logic := '1';
    signal reset   : std_logic := '0';
    signal code    : std_logic := '0';
 
begin
 
    -- nge port device aslinya
    i_Timer : entity work.morse(HURUF)
    generic map(ClockFrequencyHz => ClockFrequencyHz)
    port map (
        clk     => clk,
        reset   => reset,
        code    => code);
  
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
