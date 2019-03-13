--Hizkia William Eben 1706042806
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity morse_tb is
end entity;
architecture sim of morse_tb is
	constant ClockFrequencyHz : integer := 10; -- 10 Hz
	constant ClockPeriod      : time := 500 ms / ClockFrequencyHz;
	signal clk     : std_logic := '1';
	signal reset   : std_logic := '0';
	signal output    : std_logic := '0';
begin
-- Porting device
	i_Timer : entity work.morse(esrom)
	generic map(ClockFrequencyHz => ClockFrequencyHz)
	port map (
	clk     => clk,
	reset   => reset,
	output    => output);
-- Clocking
	clk <= not clk after ClockPeriod / 2;
-- Simulating
process is
	begin
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	-- Begin
	reset <= '1';
	wait;
end process;
end architecture;