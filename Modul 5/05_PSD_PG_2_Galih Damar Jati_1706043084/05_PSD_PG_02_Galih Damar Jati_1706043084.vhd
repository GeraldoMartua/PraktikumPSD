library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity vending is
	port (UangMasuk: in integer;
	          milih: in std_logic;
	     	    clk: in std_logic;
	     UangKeluar: out integer;
	     Susu, Soda: out std_logic);
end vending;

architecture behavior of vending is
	type state_type is (Start,CekUang,Pilih,Kembalian);
	signal state, nextstate: state_type;
begin
	process (clk)
	begin
		if rising_edge (clk) then
		state <= nextstate;
		end if;
	
	end process;

	process (state, UangMasuk)
	begin
		case state is
			when Start =>
				if (UangMasuk > 0) 
					then nextstate <= CekUang;
				else 
					nextstate <= Start;
				end if;
			
			when CekUang =>
				if (UangMasuk < 5000)  --Harga minuman
					then nextstate <= CekUang;
				else
					nextstate <= Pilih;
				end if;

			when Pilih =>
				case milih is
					when '0' =>
						Susu <= '1';
						Soda <= '0';
					when others =>
						Susu <= '0';
						Soda <= '1';

				end case;
				nextstate <= Kembalian;
			
			when Kembalian =>
				if (UangMasuk >= 5000)
					then UangKeluar <= UangMasuk - 5000;
						nextstate <= Start;
				else
					nextstate <= Start;
				end if;

		end case;
	end process;
end behavior;
