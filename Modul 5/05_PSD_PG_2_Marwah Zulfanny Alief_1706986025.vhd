library ieee;
use IEEE.std_logic_1164.all;

entity vending_machine is
port (
	clk : in std_logic;
	rst : in std_logic; 	
	input : in std_logic_vector (1 downto 0); 
	minuman : out std_logic; 
	output : out std_logic_vector (1 downto 0)  );

end vending_machine;

architecture bhv of vending_machine is
	type state_type is (idle, 
			put_money,
			in_1,in_3,in_6,in_5, 
			change_1, 
 			minuman_out 
 			); 
signal current_s,next_s: state_type; 

begin
process(clk,rst)
begin
 if(rst = '0') then
 current_s <= idle; 
 elsif(clk'event and clk = '1') then
 current_s <= next_s;
 end if;
 end process;

process(current_s,input)
begin
 case current_s is
 when idle => 
 minuman <= '0';
 output <= "00";
 next_s <= put_money;
  when put_money => 
 if(input = "00")then
 minuman <= '0';
 output <= "00";
 next_s <= put_money;
 elsif(input = "01")then 
 minuman <= '0';
 output <= "00";
 next_s <= in_1;
 elsif(input = "10")then 
 minuman <= '0';
 output <= "00";
 next_s <= minuman_out;
 elsif(input = "11")then 
 minuman <= '0';
 output <= "00";
 next_s <= in_5;
 end if;
 when in_1 => 
 if(input = "00") then
 minuman <= '0';
 output <= "00";
 next_s <= in_1;
 elsif(input = "01") then
 minuman <= '0';
 output <= "00";
 next_s <= minuman_out;
 elsif(input = "10") then
 minuman <= '0';
 output <= "00";
 next_s <= in_3;
 elsif(input = "11") then
 minuman <= '0';
 output <= "10";
 next_s <= in_6;
 end if;
 when in_3 =>
 minuman <= '0';
 output <= "01";
 next_s <= minuman_out;
 when in_6 =>
 minuman <= '0';
 output <= "01";
 next_s <= in_5;
 when in_5 => 
 minuman <= '0';
 output <= "10";
 next_s <= change_1;
 when change_1 => 
 minuman <= '0';
 output <= "01";
 next_s <= minuman_out;
 when minuman_out =>
 minuman <= '1';
 output <= "00";
 next_s <= put_money; 
end case;
end process;
end bhv;
