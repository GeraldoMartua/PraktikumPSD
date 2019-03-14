--Reference - https://vhdlwhiz.com/create-timer/

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
 
entity kod_bench is
end entity;
 
architecture morse of kod_bench is
 
    
    constant ClockFrequencyHz : integer := 1; -- 1 Hz
    constant ClockPeriod      : time := 500 ms / ClockFrequencyHz;
 
  	signal CLK : STD_LOGIC := '0';
	signal MASUKAN :  STRING(1 To 10) := "HAI ALFIAN";
	signal output :  std_logic := '0';
	SIGNAL RESET : STD_LOGIC :='1';
	
 
begin

    KODEMORSE : entity work.KODE_MORSE(MORSECODE)
    generic map(ngitung => ClockFrequencyHz)
    port map (
   	CLK => CLK,
	MASUKAN => MASUKAN,
	output => output,
	RESET => RESET);
 
    -- buat clock nya not :)
    Clk <= not Clk after ClockPeriod / 2;
    -- Testbench nya dong
    process is
    begin
        wait until rising_edge(Clk);
        wait until rising_edge(Clk);
 	
RESET <= '0';
        wait;
    end process;
 
end architecture;
