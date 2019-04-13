library ieee;
use IEEE.std_logic_1164.all;

entity FSM is
port(	CLK : in std_logic; 
 	RSTn : in std_logic; 
 	CoinIn : in std_logic_vector (1 downto 0); 
 	Soda : out std_logic; 
 	CoinOut : out std_logic_vector (1 downto 0) 
     );

end entity;

architecture behavior of FSM is
type state_type is(idle, put_money, in_1, in_3, in_6, in_5, change_1, soda_out); 
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

	process(current_s,CoinIn)
	begin
	case current_s is
 		when idle => 
			Soda <= '0';
 			CoinOut <= "00";
 			next_s <= put_money;
 
 		when put_money => 
 			if(CoinIn = "00")then
 				Soda <= '0';
 				CoinOut <= "00";
 				next_s <= put_money;
 			elsif(CoinIn = "01")then 
 				Soda <= '0';
 				CoinOut <= "00";
 				next_s <= in_1;
 			elsif(CoinIn = "10")then 
 				Soda <= '0';
 				CoinOut <= "00";
 				next_s <= soda_out;
 			elsif(CoinIn = "11")then 
 				Soda <= '0';
 				CoinOut <= "00";
 				next_s <= in_5;
 			end if;

 		when in_1 => 
 			if(CoinIn = "00") then
 				Soda <= '0';
 				CoinOut <= "00";
 				next_s <= in_1;
			elsif(CoinIn = "01") then
 				Soda <= '0';
 				CoinOut <= "00";
 				next_s <= soda_out;
			elsif(CoinIn = "10") then
 				Soda <= '0';
 				CoinOut <= "00";
 				next_s <= in_3;
 			elsif(CoinIn = "11") then
 				Soda <= '0';
 				CoinOut <= "10";
 				next_s <= in_6;
 			end if;
 
 		when in_3 =>
 			Soda <= '0';
 			CoinOut <= "01";
 			next_s <= soda_out;
 
 		when in_6 =>
 			Soda <= '0';
 			CoinOut <= "01";
 			next_s <= in_5;
 
 		when in_5 => 
 			Soda <= '0';
 			CoinOut <= "10";
 			next_s <= change_1;
 
 		when change_1 => 
 			Soda <= '0';
 			CoinOut <= "01";
 			next_s <= soda_out;
 
 		when soda_out =>
 			Soda <= '1';
 			CoinOut <= "00";
 			next_s <= put_money; 
		end case;
	end process;

end behavior;
