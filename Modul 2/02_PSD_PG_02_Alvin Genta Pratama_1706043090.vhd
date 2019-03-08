library IEEE;	
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter_up_dnis

port( 
  angka: in std_logic_vector(0 to 3);
  CLK, CLR, Load, DIR: in std_logic;
  Q: out std_logic_vector(0 to 3) );
end Counter_VHDL;

architecture bhv of counter_up_dn is
  signal temp: std_logic_vector(0 to 3);
begin

  process(CLK,CLR)
  begin
    if CLR='1' then
     temp <= "0000";
    elsif rising_edge(CLK) then

    if Load='1' then
     temp <= angka;
    elsif (Load='0' and DIR='0') then
     temp <= temp + 1;
    elsif (Load='0' and DIR='1') then
     temp <= temp - 1;

    end if;
   end if;

end process;
Q <= temp;
end bhv;

