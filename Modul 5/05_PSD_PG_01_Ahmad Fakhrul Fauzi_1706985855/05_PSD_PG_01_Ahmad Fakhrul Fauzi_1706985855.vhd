--harga minuman 10.000
-- 01 : 5.000
-- 10 : 10.000
-- 11 : 20.000

library IEEE;
use IEEE.std_logic_1164.all;

entity tutam5 is
port(
clk	: in std_logic; --clock
reset	: in std_logic; --reset
uang	: in std_logic_vector (1 downto 0); --input uang
kembalian : out std_logic_vector (1 downto 0); --kembalian
minuman : out std_logic);
end tutam5;

architecture vending_machine of tutam5 is
type state_type is (idle, enter_money, in_1, in_2, in_3, in_4, minuman_out);
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

process(state, uang)
begin
case state is
	when idle => 
	minuman <= '0';
	kembalian <= "00";
	next_s <= enter_money;

	when enter_money => 
	if(uang = "00") then
		minuman <= '0';
		kembalian <= "00";
		next_s <= enter_money;
	
	elsif(uang = "01") then --masukkan 5.000
		minuman <= '0';
		kembalian <= "00";
		next_s <= in_1;

	elsif(uang = "10") then --masukkan 10.000
		minuman <= '0';
		kembalian <= "00";
		next_s <= minuman_out;

	elsif(uang = "11") then --masukkan 20.000
		minuman <= '0';
		kembalian <= "00";
		next_s <= in_2;
	end if;

	when in_1 =>
		if(uang = "00") then
		minuman <= '0';
		kembalian <= "00";	
		next_s <= in_1;
	
		elsif(uang = "01") then
		minuman <= '0';
		kembalian <= "00";
		next_s <= minuman_out;

		elsif(uang = "10") then
		minuman <= '0';
		kembalian <= "01";
		next_s <= in_4;

		elsif(uang = "11") then
		minuman <= '0';
		kembalian <= "01";
		next_s <= in_3;
	
		end if;

	when in_2 => 
		minuman <= '0';
		kembalian <= "10";
		next_s <= minuman_out;

	when in_3 =>
		minuman <= '0';
		kembalian <= "01";
		next_s <= in_2;

	when in_4 => 
		minuman <= '0';
		kembalian <= "01";
		next_s <= minuman_out;

	when minuman_out =>
		minuman <= '1';
		kembalian <= "00";
		next_s <= enter_money;
end case;
end process;
end vending_machine;

		
	



