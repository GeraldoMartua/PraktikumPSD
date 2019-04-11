library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity payphone is
 port(
	clk 	: 	in std_logic;
	rst 	: 	in std_logic;	-- rst = 1, telepon tutup; rst = 0, telepon diangkat
	coin	:	in std_logic;   -- input koin ke telepon
	dur	:	out std_logic   -- output berupa durasi menelepon
 );
end payphone;

architecture bhv of payphone is
type state is (idle, coined, call, timeout);
signal present_state, next_state : state;
begin

syncronous_process : process (clk)
begin
if rising_edge(clk) then
if (rst = '1') then
present_state <= idle;
else
present_state <= next_state;
end if;
end if;
end process;

payphone_process : process (present_state, coin)
begin
case present_state is
when idle =>
	if(coin='1') then next_state <= coined;
	else next_state <= idle;
	end if;
	dur <= '0';
when coined =>
	next_state <= call;
	dur <= '1';
when call =>
	next_state <= timeout;
	dur <= '0';
when timeout =>
	if(coin='1') then next_state <= call;
	dur <= '1';
	else next_state <= idle;
	dur <= '0';
	end if;
end case;
end process;
end bhv;


