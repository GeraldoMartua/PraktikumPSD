library ieee;
use IEEE.std_logic_1164.all;

entity Vending_Machine is
port (CLK : in std_logic; 
 			RSTn : in std_logic; 
 		UangMasuk : in std_logic_vector (1 downto 0);
 	Soda : out std_logic; 
 Kembalian : out std_logic_vector (1 downto 0) 
 );

end entity;

architecture behavior of Vending_Machine is
	type state_type is (idle, 
		 uang_masuk, 
			 in_1,in_3,in_6,in_5, 
					 kembalian_1, 
						 soda_out 
								 ); 

signal current_s,next_s: state_type; 

begin

process(CLK,RSTn)
begin
 if(RSTn = '0') then
	 current_s <= idle;
			 elsif(clk'event and clk = '1') then
 				current_s <= next_s;
 					end if;
						end process;

process(current_s,UangMasuk)
begin
case current_s is
 when idle => 
 	Soda <= '0';
		 Kembalian <= "00";
 			next_s <= uang_masuk;

 when uang_masuk =>
	if(UangMasuk = "00")then
		 Soda <= '0';
			 Kembalian <= "00";
				 next_s <= uang_masuk;
 elsif(UangMasuk = "01")then 
 		Soda <= '0';
			 Kembalian <= "00";
				 next_s <= in_1;
 elsif(UangMasuk = "10")then 
		 Soda <= '0';
			 Kembalian <= "00";
				 next_s <= soda_out;
 elsif(UangMasuk = "11")then 
 		Soda <= '0';
 			Kembalian <= "00";
 				next_s <= in_5;
 end if;
 
 when in_1 => 
 		if(UangMasuk = "00") then
 			Soda <= '0';
 				Kembalian <= "00";
 					next_s <= in_1;
 elsif(UangMasuk = "01") then
 			Soda <= '0';
 				Kembalian <= "00";
 					next_s <= soda_out;
 
						elsif(UangMasuk = "10") then
 					Soda <= '0';
 				Kembalian <= "00";
 			next_s <= in_3;
 		elsif(UangMasuk = "11") then
 	Soda <= '0';
      Kembalian <= "10";
 next_s <= in_6;
 end if;
 
 when in_3 =>
 	Soda <= '0';
 		Kembalian <= "01";
 			next_s <= soda_out;
 
 when in_6 =>
 	Soda <= '0';
 		Kembalian <= "01";
 			next_s <= in_5;
 
 when in_5 => 
 	Soda <= '0';
 		Kembalian <= "10";
 			next_s <= kembalian_1;
 
 when kembalian_1 => 
 	Soda <= '0';
 		Kembalian <= "01";
 			next_s <= soda_out;

 when soda_out =>
 	Soda <= '1';
 		Kembalian <= "00";
 			next_s <= uang_masuk; 
end case;
end process;

end behavior;