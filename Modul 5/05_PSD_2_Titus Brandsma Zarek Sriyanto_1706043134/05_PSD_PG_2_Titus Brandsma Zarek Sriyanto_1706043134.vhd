library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fsm2 is 
port(		clock		: in std_logic;
		reset		: in std_logic;
		input		: inout integer;
		choose		: in std_logic_vector (1 downto 0);
		fanta		: inout std_logic;
		sprite		: inout std_logic;
		coke		: inout std_logic;
		pepsi		: inout std_logic;
		kembalian	: inout integer
	);
end fsm2;

architecture v_machine of fsm2 is 
type state is (IDLE, Cek_Uang, Uang_Kurang_4000, Uang_Kurang_3000,
				Uang_Kurang_2000, Uang_Kurang_1000, Pilih_Minuman,
				Out_Kembalian);
			signal next_state : state; --next_state itu state 

begin			
	process(clock, reset)
	begin
		if (reset='1') then
			next_state <= IDLE;
			input <= 0;
			fanta <= '0';
			sprite <= '0';
			coke <= '0';
			pepsi <= '0';
			kembalian <= 0;
			
		elsif rising_edge(clock) then
			case next_state is 
				when IDLE => 
					if (input > 0 ) then 
						next_state <= Cek_Uang;
					end if;
				
				when Cek_Uang =>
					if (input = 1000) then
						next_state <= Uang_Kurang_4000;
					elsif (input = 2000) then
						next_state <= Uang_Kurang_3000;
					elsif (input = 3000) then
						next_state <= Uang_Kurang_2000;
					elsif (input = 4000) then
						next_state <= Uang_Kurang_1000;
					elsif (input >= 5000) then
						next_state <= Pilih_Minuman;
					end if;
					
				when Uang_Kurang_4000 =>
					if (input = 1000) then
						next_state <= Uang_Kurang_3000;
					elsif (input = 2000) then
						next_state <= Uang_Kurang_2000;
					elsif (input = 3000) then
						next_state <= Uang_Kurang_1000;
					elsif (input = 4000) then
						next_state <= Pilih_Minuman;
					end if;
					
				when Uang_Kurang_3000 =>
					if (input = 1000) then 
						next_state <= Uang_Kurang_2000;
					elsif (input = 2000) then
						next_state <= Uang_Kurang_1000;
					elsif (input = 3000) then
						next_state <= Pilih_Minuman;
					end if;
					
				when Uang_Kurang_2000 =>
					if (input = 1000) then
						next_state <= Uang_Kurang_1000;
					elsif (input = 2000) then
						next_state <= Pilih_Minuman;
					end if;
					
				when Uang_Kurang_1000 =>
					if (input = 1000) then 
						next_state <= Pilih_Minuman;
					end if;
					
				when Pilih_Minuman =>
					case choose is
						when "00" =>
							Sprite <= '1';
							Fanta <= '0';
							Coke <= '0';
							Pepsi <= '0';
						
						when "01" =>
							Fanta <= '1';
							Sprite <= '0';
							Coke <= '0';
							Pepsi <= '0';
							
						when "10" =>
							Coke <= '1';
							Sprite <= '0';
							Fanta <= '0';
							Pepsi <= '0';
							
						when others =>
							Pepsi <= '1';
							Sprite <= '0';
							Fanta <= '0';
							Coke <= '0';
							
					end case;
					
					next_state <= Out_Kembalian;
					
				when Out_Kembalian =>
					if (input >= 5000) then
						kembalian <= input - 5000;
						next_state <= IDLE;
					else 
						next_state <= IDLE;
					end if;
			end case;
		end if;
	end process;
end v_machine;
				
				
