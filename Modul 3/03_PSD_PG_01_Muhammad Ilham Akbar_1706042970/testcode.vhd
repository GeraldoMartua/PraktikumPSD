library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test_b is
end entity;
architecture sim of test_b is
	constant Frekuensi			: integer := 10; 
	constant ClockPeriod		: time := 500 ms / Frekuensi;
	signal clk     				: std_logic := '1';
	signal rst					: std_logic := '0';
	signal output    			: std_logic := '0';
	
begin
	i_Timer : entity work.morse(behavioral)
	generic map(Frekuensi => Frekuensi)
	port map (
	clk     => clk,
	rst   => rst,
	output    => output);

	clk <= not clk after ClockPeriod / 2;

process is
	begin
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	rst <= '1';
	wait;
end process;
end architecture;