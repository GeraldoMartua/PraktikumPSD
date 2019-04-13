library ieee;
use IEEE.std_logic_1164.all;

entity vending is
port (	clk: in std_logic;
	rst: in std_logic;
	ins_money: in std_logic_vector (1 downto 0);
	choice: in std_logic;
	drink: out std_logic);

end entity;

architecture behavioral of vending is

type state_type is (idle, put_money, choose, drink_out);
signal current_state, next_state: state_type;

begin

process (clk,rst)
begin
if(rst = '0') then
	current_state <= idle;
elsif(clk'event and clk = '1') then
	current_state <= next_state;
end if;
end process;

--vending machine
process(current_state, ins_money, choice)
begin
case current_state is
when idle =>
	drink <= '0';
	next_state <= put_money;

when put_money => 
if (ins_money = "00") then
	drink <= '0';
	next_state <= choose;
elsif (ins_money = "01") then 
	drink <= '0';
	next_state <= choose;
elsif (ins_money = "10") then
	drink <= '0';
	next_state <= choose;
elsif (ins_money = "11") then
	drink <= '0';
	next_state <= choose;
end if;

when choose =>

if (choice = '1') then --the price of this drink is $2
	if (ins_money = "00") then
		drink <= '0';
		next_state <= put_money;
	elsif (ins_money = "01") then
		drink <= '0';
		next_state <= put_money;
	elsif (ins_money = "10") then
		drink <= '0';
		next_state <= drink_out;
	elsif (ins_money = "11") then
		drink <= '0';
		next_state <= drink_out;
	end if;

else--the price of this drink is $5
	if (ins_money = "00") then
		drink <= '0';
		next_state <= put_money;
	elsif (ins_money = "01") then
		drink <= '0';
		next_state <= put_money;
	elsif (ins_money = "10") then
		drink <= '0';
		next_state <= put_money;
	elsif (ins_money = "11") then
		drink <= '0';
		next_state <= drink_out;
	end if;
end if;

when drink_out =>
	drink <= '1';
	next_state <= put_money;
end case;
end process;

end behavioral;
