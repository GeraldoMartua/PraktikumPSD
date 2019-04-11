library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity TeleponKoin is
port(	clock	: IN STD_LOGIC;
	coin	: INOUT STD_LOGIC;
	angkat	: IN STD_LOGIC;
	input	: IN STD_LOGIC;
	call	: OUT STD_LOGIC;
	duration: OUT STD_LOGIC
);
end TeleponKoin;

architecture keadaan of TeleponKoin is
type state_type is (idle,number,calling);
signal state, next_state : state_type;
begin

process
begin
wait until clock = '1' and clock'event;
state <= next_state;
end process;

process(state,coin,angkat)
begin
case state is
	when idle	=>	if (coin='1') and (angkat='1') then
					next_state <= number;
				else
					next_state <= idle;
				end if;
	when number	=>	if (input='1') then
					next_state <= calling;
				else
					next_state <= idle;
				end if;
	when calling	=>	if (angkat='1') then
					next_state <= calling;
				else
					next_state <= idle;
				end if;
end case;
end process;

process(state)
begin
case state is
	when idle	=>	call 		<= 	'0';
				coin		<= 	'0';	
				duration	<=	'0';
	when number	=>	call		<= 	'1';
				coin		<= 	'1';
				duration	<=	'0';
	when calling	=>	call		<=	'1';
				coin		<=	'0';
				duration	<=	'1';
end case;
end process;

end keadaan;
