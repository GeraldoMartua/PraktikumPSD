library ieee;
use IEEE.std_logic_1164.all;

entity FinitedStateMachine is
port (
 CLK : in std_logic; 
 RSTn : in std_logic; 
 CoinIn : in std_logic_vector (1 downto 0); 
 Milk : out std_logic; 
 CoinOut : out std_logic_vector (1 downto 0) 
 );

end entity;

architecture behavior of FinitedStateMachine is
type state_type is (idle, 
 taro_duit, 
 in_1,in_3,in_6,in_5, --mengartikan jumlah duit setalah kembalian
 kembalian, 
 milk_out 
 ); 
signal current_s,next_s: state_type; --deklarasi current dan next state 
begin

process(CLK,RSTn)
begin
 if(RSTn = '0') then
 current_s <= idle;
 elsif(clk'event and clk = '1') then
 current_s <= next_s;
 end if;
end process;

--FSM process:
process(current_s,CoinIn)
begin
case current_s is
 when idle =>
 Milk <= '0';
 CoinOut <= "00";
 next_s <= taro_duit;

 when taro_duit => --nunggu koin untuk dimasukkan
 if(CoinIn = "00")then
 Milk <= '0';
 CoinOut <= "00";
 next_s <= taro_duit;
 elsif(CoinIn = "01")then --masukkin 1$
 Milk <= '0';
 CoinOut <= "00";
 next_s <= in_1;
 elsif(CoinIn = "10")then --masukkin 2$
 Milk <= '0';
 CoinOut <= "00";
 next_s <= milk_out;
 elsif(CoinIn = "11")then --masukkin 5$
 Milk <= '0';
 CoinOut <= "00";
 next_s <= in_5;
 end if;

 when in_1 => 
 if(CoinIn = "00") then--tetap di state yang sama
 Milk <= '0';
 CoinOut <= "00";
 next_s <= in_1;
 elsif(CoinIn = "01") then--masukkin lagi 1$
 Milk <= '0';
 CoinOut <= "00";
 next_s <= milk_out;
 elsif(CoinIn = "10") then--masukkin lagi 2$
 Milk <= '0';
 CoinOut <= "00";
 next_s <= in_3;
 elsif(CoinIn = "11") then
 Milk <= '0';
 CoinOut <= "10";
 next_s <= in_6;
 end if;

 when in_3 =>
 Milk <= '0';
 CoinOut <= "01";
 next_s <= milk_out;

 when in_6 =>
 Milk <= '0';
 CoinOut <= "01";
 next_s <= in_5;

 when in_5 => -- yg masuk = 5 coin
 Milk <= '0';
 CoinOut <= "10";
 next_s <= kembalian;

 when kembalian => -- yg masuk = 5 coin
 Milk <= '0';
 CoinOut <= "01";
 next_s <= milk_out;

 when milk_out =>
 Milk <= '1';
 CoinOut <= "00";
 next_s <= taro_duit; 
end case;
end process;

end behavior;