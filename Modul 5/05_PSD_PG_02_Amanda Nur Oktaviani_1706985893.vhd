library ieee;
use IEEE.std_logic_1164.all;

entity vending_machine is
	port (clk : in std_logic;
		rst : in std_logic;
		CoinIn : in std_logic_vector (1 downto 0);
		Candy : out std_logic;
		CoinOut : out std_logic_vector (1 downto 0));
end vending_machine;

architecture behavior of vending_machine is
	type state is (idle,
			put_money,
			in_1,in_3,in_6,in_5,
			change_1,
			candy_out);
signal present_state,next_state: state;
begin
process(clk,rst)
	begin
		if(rst = '0') then
			present_state <= idle;
		elsif(clk'event and clk = '1') then
			present_state <= next_state;
		end if;
end process;

process(present_state,CoinIn)
	begin
		case present_state is
			when idle =>
				Candy <= '0';
				CoinOut <= "00";
				next_state <= put_money;
			when put_money =>
				if(CoinIn = "00")then
					Candy <= '0';
					CoinOut <= "00";
					next_state <= put_money;
				elsif(CoinIn = "01")then
					Candy <= '0';
					CoinOut <= "00";
					next_state <= in_1;
				elsif(CoinIn = "10")then
					Candy <= '0';
					CoinOut <= "00";
					next_state <= candy_out;
				elsif(CoinIn = "11")then
					Candy <= '0';
					CoinOut <= "00";
					next_state <= in_5;
				end if;
			when in_1 => 
				if(CoinIn = "00") then
					Candy <= '0';
					CoinOut <= "00";
					next_state <= in_1;
				elsif(CoinIn = "01") then
					Candy <= '0';
					CoinOut <= "00";
					next_state <= candy_out;
				elsif(CoinIn = "10") then
					Candy <= '0';
					CoinOut <= "00";
					next_state <= in_3;
				elsif(CoinIn = "11") then
					Candy <= '0';
					CoinOut <= "10";
					next_state <= in_6;
				end if;
			when in_3 =>
				Candy <= '0';
				CoinOut <= "01";
				next_state <= candy_out;
			when in_6 =>
				Candy <= '0';
				CoinOut <= "01";
				next_state <= in_5;
			when in_5 =>
				Candy <= '0';
				CoinOut <= "10";
				next_state <= change_1;
			when change_1 =>
				Candy <= '0';
				CoinOut <= "01";
				next_state <= candy_out;
			when candy_out =>
				Candy <= '1';
				CoinOut <= "00";
				next_state <= put_money; 
		end case;
end process;
end behavior;