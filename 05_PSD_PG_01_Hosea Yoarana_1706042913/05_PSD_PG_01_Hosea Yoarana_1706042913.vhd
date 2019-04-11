library ieee;
use IEEE.std_logic_1164.all;

entity FSM is
port (CLK : in std_logic; --Clock
 RSTn : in std_logic; --Reset
 CoinIn : in std_logic_vector (1 downto 0); --Coin Input
 LineOut : out std_logic; --Apakah LineOut Triggered?
 CoinOut : out std_logic_vector (1 downto 0) --Coin Output
 );

end entity;

architecture behavior of FSM is
-- add your code here
type state_type is (idle, --Start 
 put_money, --waiting CoinIn
 in_1,in_3,in_6,in_5, --Sum Coin untuk kembalian
 change_1, --kembalian
 LineOut_out --Mulai LineOut
 ); 
signal current_s,next_s: state_type; --current dan next state

begin

process(CLK,RSTn)
begin
 if(RSTn = '0') then
 current_s <= idle; --default stateRESET
 elsif(clk'event and clk = '1') then
 current_s <= next_s;
 end if;
end process;
--------------------

process(current_s,CoinIn)
begin
case current_s is
 when idle => --State idle
 LineOut <= '0';
 CoinOut <= "00";
 next_s <= put_money;
 ------------------------------------------------------
 when put_money => --waiting CoinIn
 if(CoinIn = "00")then
 LineOut <= '0';
 CoinOut <= "00";
 next_s <= put_money;
 elsif(CoinIn = "01")then --insert 100
 LineOut <= '0';
 CoinOut <= "00";
 next_s <= in_1;
 elsif(CoinIn = "10")then --insert 200
 LineOut <= '0';
 CoinOut <= "00";
 next_s <= LineOut_out;
 elsif(CoinIn = "11")then --insert 500
 LineOut <= '0';
 CoinOut <= "00";
 next_s <= in_5;
 end if;
 ------------------------------------------------------
 when in_1 => 
 if(CoinIn = "00") then--stay
 LineOut <= '0';
 CoinOut <= "00";
 next_s <= in_1;
 elsif(CoinIn = "01") then--Masuk 100 sete;ah
 LineOut <= '0';
 CoinOut <= "00";
 next_s <= LineOut_out;
 elsif(CoinIn = "10") then--Masuk 200 setelah
 LineOut <= '0';
 CoinOut <= "00";
 next_s <= in_3;
 elsif(CoinIn = "11") then
 LineOut <= '0';
 CoinOut <= "10";
 next_s <= in_6;
 end if;
 ------------------------------------------------------
 when in_3 =>
 LineOut <= '0';
 CoinOut <= "01";
 next_s <= LineOut_out;
 ------------------------------------------------------
 when in_6 =>
 LineOut <= '0';
 CoinOut <= "01";
 next_s <= in_5;
 ------------------------------------------------------
 when in_5 => -- input = 5 coin
 LineOut <= '0';
 CoinOut <= "10";
 next_s <= change_1;
 ------------------------------------------------------
 when change_1 => -- input = 5 coin
 LineOut <= '0';
 CoinOut <= "01";
 next_s <= LineOut_out;
 ------------------------------------------------------
 when LineOut_out =>
 LineOut <= '1';
 CoinOut <= "00";
 next_s <= put_money; 
end case;
end process;

end behavior;
