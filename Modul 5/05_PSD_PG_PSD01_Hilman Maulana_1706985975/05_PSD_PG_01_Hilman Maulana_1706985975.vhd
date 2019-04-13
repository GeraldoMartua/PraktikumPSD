library IEEE;
use IEEE.std_logic_1164.all;

entity no4 is
port(
	clk	: in std_logic; --clock
	reset	: in std_logic; --reset
	input_uang	: in std_logic_vector (1 downto 0); --input uang
	out_kembalian : out std_logic_vector (1 downto 0); --kembalian
	out_minuman : out std_logic);
end no4;

architecture vending_machine of no4 is
type state_type is (idle, masukan_uang, in1, in2, minuman_out);
signal state, next_s : state_type;
begin

process(clk, reset)
begin
	if(reset = '0') then
	state <= idle;
	elsif(clk'event and clk = '1') then
	state <= next_s;
	end if;
end process;

process(state, input_uang)
begin
case state is
	when idle => 
	out_minuman <= '0';
	out_kembalian <= "00";
	next_s <= masukan_uang;

	when masukan_uang => 
	if(input_uang = "00") then
		out_minuman <= '0';
		out_kembalian <= "00";
		next_s <= masukan_uang;
	
	elsif(input_uang = "01") then --masukkan 5.000
		out_minuman <= '0';
		out_kembalian <= "00";
		next_s <= minuman_out;

	elsif(input_uang = "10") then --masukkan 10.000
		out_minuman <= '0';
		out_kembalian <= "00";
		next_s <= in1;

	elsif(input_uang = "11") then --masukkan 15.000
		out_minuman <= '0';
		out_kembalian <= "00";
		next_s <= in2;
	end if;

	when in1 =>
		out_minuman <= '0';
		out_kembalian <= "01";
		next_s <= minuman_out;

	when in2 => 
		out_minuman <= '0';
		out_kembalian <= "10";
		next_s <= minuman_out;

	when minuman_out =>
		out_minuman <= '1';
		out_kembalian <= "00";
		next_s <= masukan_uang;
end case;
end process;
end vending_machine;
