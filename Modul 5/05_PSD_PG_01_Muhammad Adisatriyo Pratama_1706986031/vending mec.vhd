-- 00 = Rp.0
-- 01 = Rp. 1000
-- 10 = Rp. 2000
-- 11 = Rp. 5000
library ieee;
use IEEE.std_logic_1164.all;

entity mesin_buat_jajan is
port(		clock : in std_logic; 
		reset : in std_logic; 
		inputuang : in std_logic_vector (1 downto 0); 
		ciki_komo : out std_logic; 
		kembalian : out std_logic_vector (1 downto 0));
end entity;

architecture behavior of mesin_buat_jajan is

	type state_type is (idle, sinyal_uang,in_1000,in_3000,in_5000,kembali_3000,
			keluarciki); 
	signal current_state,next_state: state_type; 

	begin

	process(clock,reset)
		begin
			if(reset = '1')
			then current_state <= idle;
			elsif(clock'event and clock = '1') 
			then current_state <= next_state;
			end if;
	end process;
	
	process(current_state,inputanuang)
		begin
		case current_state is
			when idle => 
				ciki_komo <= '0';
				kembalian <= "00";
				next_state <= sinyal_uang;
				
			when sinyal_uang => 
				if(inputanuang = "00")then
					ciki_komo <= '0';
					kembalian <= "00";
					next_state <= sinyal_uang;
				elsif(inputanuang = "01")then -- uang kurang Rp.1000
					ciki_komo <= '0';
					kembalian <= "00";
					next_state <= in_1000;
				elsif(inputanuang = "10")then -- uang Pas
					ciki_komo <= '0';
					kembalian <= "00";
					next_state <= keluarciki;
				elsif(inputanuang = "11")then -- Kembali Rp.3000
					ciki_komo <= '1';
					kembalian <= "00";
					next_state <= kembali_3000;
				end if;
				
			when in_1000 => 
				if(inputanuang = "00") then
					ciki_komo <= '0';
					kembalian <= "00";
					next_state <= in_1000;
				elsif(inputanuang = "01") then
					ciki_komo <= '0';
					kembalian <= "00";
					next_state <= keluarciki;
				elsif(inputanuang = "10") then
					ciki_komo <= '0';
					kembalian <= "00";
					next_state <= in_15k;
				elsif(inputanuang = "11") then
					ciki_komo <= '0';
					kembalian <= "00";
					next_state <= in_25k;
				end if;
			
			when in_3000 =>
				ciki_komo <= '0';
				kembalian <= "01"; 
				next_state <= keluarciki;
			
			when in_5000 =>
				ciki_komo <= '0';
				kembalian <= "01";
				next_state <= kembali_2000; 
			
			when kembali_2000 => 
				ciki_komo <= '0';
				kembalian <= "10";
				next_state <= keluarciki;
			
			when keluarciki =>
				ciki_komo <= '1';
				kembalian <= "00";
				next_state <= sinyal_uang; 
				
		end case;
	end process;

end behavior;
