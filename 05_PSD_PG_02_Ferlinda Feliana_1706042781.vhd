-- Ferlinda Feliana
-- 1706042781
-- Vending Machine SnickerBar
-- Harga SnickerBar = 10.000
-- Uang yang diterima vending machine bisa berupa 5000, 10.000, dan 20.000
-- Sinyal uang:
-- 01 -> 5.000
-- 10 -> 10.000
-- 11 -> 20.000

library ieee;
use IEEE.std_logic_1164.all;

entity VendingMachine is
port(	CLK : in std_logic; 
		RST : in std_logic; 
		Uang_Masuk : in std_logic_vector (1 downto 0); 
		SnickerBar : out std_logic; 
		Kembali : out std_logic_vector (1 downto 0));
end entity;

architecture behavior of VendingMachine is

	type state_type is (idle, 
						sinyal_uang,
						in_5k,in_15k,in_25k,
						kembali_10k,
						SnickerBar_out); 
	signal current_s,next_s: state_type; 

	begin

	process(CLK,RST)
		begin
			if(RST = '1') then
				current_s <= idle;
			elsif(clk'event and clk = '1') then
				current_s <= next_s;
			end if;
	end process;
	
	process(current_s,Uang_Masuk)
		begin
		case current_s is
			when idle => 
				SnickerBar <= '0';
				Kembali <= "00";
				next_s <= sinyal_uang;
				
			when sinyal_uang => 
				if(Uang_Masuk = "00")then
					SnickerBar <= '0';
					Kembali <= "00";
					next_s <= sinyal_uang;
				elsif(Uang_Masuk = "01")then -- sum = 5k
					SnickerBar <= '0';
					Kembali <= "00";
					next_s <= in_5k;
				elsif(Uang_Masuk = "10")then -- sum = 10k
					SnickerBar <= '0';
					Kembali <= "00";
					next_s <= SnickerBar_out;
				elsif(Uang_Masuk = "11")then -- sum = 20k
					SnickerBar <= '1';
					Kembali <= "00";
					next_s <= kembali_10k;
				end if;
				
			when in_5k => 
				if(Uang_Masuk = "00") then
					SnickerBar <= '0';
					Kembali <= "00";
					next_s <= in_5k;
				elsif(Uang_Masuk = "01") then-- sum = 10k
					SnickerBar <= '0';
					Kembali <= "00";
					next_s <= SnickerBar_out;
				elsif(Uang_Masuk = "10") then--sum = 15k
					SnickerBar <= '0';
					Kembali <= "00";
					next_s <= in_15k;
				elsif(Uang_Masuk = "11") then--sum = 25k
					SnickerBar <= '0';
					Kembali <= "00";
					next_s <= in_25k;
				end if;
			
			when in_15k =>
				SnickerBar <= '0';
				Kembali <= "01"; --kembali 5k
				next_s <= SnickerBar_out;
			
			when in_25k =>
				SnickerBar <= '0';
				Kembali <= "01";--kembali 5k
				next_s <= kembali_10k; --sum 20k
			
			when kembali_10k => 
				SnickerBar <= '0';
				Kembali <= "10";--kembali 10k
				next_s <= SnickerBar_out;
			
			when SnickerBar_out =>
				SnickerBar <= '1';
				Kembali <= "00";
				next_s <= sinyal_uang; 
				
		end case;
	end process;

end behavior;