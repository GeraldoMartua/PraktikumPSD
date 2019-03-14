library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity TestBench is
end entity;
 
architecture output of TestBench is
 
constant ClockFrequency	: integer := 10;
constant ClockTime	: time := 500 ms / ClockFrequency;
 
signal clock	: std_logic := '1';
signal reset	: std_logic := '0';
signal morse	: std_logic := '0';
 
begin

    Timer	: entity work.MorseCode(Morse)
    generic map(ClockFrequency => ClockFrequency)
    port map (
        clock	=> clock,
        reset	=> reset,
        morse	=> morse);
  
    clock <= not clock after ClockTime / 2;
 
    process is
    begin
        wait until rising_edge(clock);
        wait until rising_edge(clock);

        reset <= '1';
 
        wait;
    end process;
 
end output;