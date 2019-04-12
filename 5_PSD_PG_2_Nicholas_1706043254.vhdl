library ieee;
use IEEE.std_logic_1164.all;

entity vending is
port (	CLK : in std_logic; 
 	RSTn : in std_logic; 
 	pilihan : in std_logic_vector (1 downto 0); 
 	keluar : out std_logic_vector (1 downto 0) 
 );

end entity;

architecture behavior of vending is

type state_type is (idle, --start state/reset
 choice --enter da choice boi
 );
signal current_s,next_s: state_type; --current and next state declaration.

begin

process(CLK,RSTn)
begin
 if(RSTn = '0') then
 current_s <= idle; --defualt state is on RESET
 elsif(clk'event and clk = '1') then
 current_s <= next_s;
 end if;
end process;

--FSM process:
process(current_s,pilihan)
begin
case current_s is
 when idle => 
 keluar <= "00";
 next_s <= choice;

 when choice => 
 if(pilihan = "00")then
 keluar <= "00";
 next_s <= choice;

 elsif(pilihan = "01")then --pilihan 1
 keluar <= "01";
 next_s <= choice;

 elsif(pilihan = "10")then --pilihan 2
 keluar <= "10";
 next_s <= choice;

 elsif(pilihan = "11")then --pilihan 3
 keluar <= "11";
 next_s <= choice;
 end if;

end case;
end process;

end behavior;