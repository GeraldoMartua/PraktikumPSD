
library ieee;
use IEEE.std_logic_1164.all;

entity VM is
port (
 clk : in std_logic; 
 RSTn : in std_logic; 
 Coin_msk : in std_logic_vector (1 downto 0); 
 Soda : out std_logic; 
 CoinOut : out std_logic_vector (1 downto 0) 
 );

end entity;

architecture bhv of VM is

type state_type is (
 idle, 
 put_money, 
 st_1,st_3,st_6,st_5, 
 change_1, 
 soda_out 
 );
signal current_s,next_s: state_type;

begin

process(clk,RSTn)
begin
 if(RSTn = '0') then
 current_s <= idle; --defualt state di RSTn

 elsif(clk'event and clk = '1') then
 current_s <= next_s;
 end if;
end process;


process(current_s,Coin_msk)
begin
case current_s is
 when idle => 
 	Soda <= '0';
 	CoinOut <= "00";
 	next_s <= put_money;

 when put_money =>
   if(Coin_msk = "00")then
 	Soda <= '0';
 	CoinOut <= "00";
 	next_s <= put_money;

  elsif(Coin_msk = "01")then --Uang 1$
 	Soda <= '0';
 	CoinOut <= "00";
 	next_s <= st_1;

  elsif(Coin_msk = "10")then --Uang 2$
 	Soda <= '0';
 	CoinOut <= "00";
 	next_s <= soda_out;

  elsif(Coin_msk = "11")then --uang 5$
 	Soda <= '0';
 	CoinOut <= "00";
 	next_s <= st_5;

  end if;

  when st_1 => 
 	if(Coin_msk = "00") then --loop sini
 	Soda <= '0';
 	CoinOut <= "00";
 	next_s <= st_1;

  elsif(Coin_msk = "01") then--mskin 1$ lagi
 	Soda <= '0';
 	CoinOut <= "00";
 	next_s <= soda_out;

  elsif(Coin_msk = "10") then--masukin 2$ lagi
	Soda <= '0';
	CoinOut <= "00";
	next_s <= st_3;

  elsif(Coin_msk = "11") then
 	Soda <= '0';
 	CoinOut <= "10";
 	next_s <= st_6;
 end if;

 when st_3 =>
 	Soda <= '0';
	CoinOut <= "01";
	next_s <= soda_out;
 
 when st_6 =>
 	Soda <= '0';
 	CoinOut <= "01";
 	next_s <= st_5;
 
 when st_5 => -- input = 5 coin
 	Soda <= '0';
 	CoinOut <= "10";
 	next_s <= change_1;

 when change_1 => -- input = 5 coin
 	Soda <= '0';
 	CoinOut <= "01";
 	next_s <= soda_out;
 
 when soda_out =>
 	Soda <= '1';
 	CoinOut <= "00";
 	next_s <= put_money; 
end case;
end process;

end bhv;