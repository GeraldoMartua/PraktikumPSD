library ieee;
use ieee.std_logic_1164.all;

entity vendingmachine is
port( 	clk	: in std_logic; 					--clock input
	reset	: in std_logic; 					--reset input
	i	: in std_logic; 					--input money
	m	: in std_logic; 					--input money
	output  : out std_logic_vector(2 downto 0) 			--all output result
	);
end vendingmachine;

architecture one of vendingmachine is
	type statetype is (idle, s0, s1, s2, s3, s4, s5, s6);
	signal state, nextstate : statetype;
	signal input  : std_logic_vector(1 downto 0); 
	signal d, c, o: std_logic;					--d for drink, c o for cashout
	signal cashout:	std_logic_vector(1 downto 0); 			--for give cashback, if money greater than the price
begin

process(clk, reset)
begin
	if (reset = '0') then state <= idle;
	elsif (clk'event and clk = '1') then state <= nextstate;
	end if;
end process;

process(state, i, m, input)						--moore machine next state
begin
	input <= i & m;
	case state is
		when idle => nextstate <= s0;				--idle state
		when s0 => if (input = "00") then nextstate <= s0;	--s0 state
			   elsif (input = "01") then nextstate <= s3;
			   elsif (input = "10") then nextstate <= s6;
			   else nextstate <= s1;
			   end if;
		when s1 => nextstate <= s2;				--s1 state
		when s2 => nextstate <= s6;				--s2 state
		when s3 => if (input = "00") then nextstate <= s3;	--s3 state
			   elsif (input = "01") then nextstate <= s6;
			   elsif (input = "10") then nextstate <= s5;
			   else nextstate <= s4;
			   end if;
		when s4 => nextstate <= s2;				--s4 state
		when s5 => nextstate <= s6;				--s5 state
		when s6 => nextstate <= idle;				--s6 state
	end case;
end process;

process(state, d, c, o, cashout)					--moore machine output state
begin
	case state is
		when idle => d <= '0';
		  	     c <= '0';
			     o <= '0';
		when s0   => d <= '0';
			     c <= '0';
			     o <= '0';	
		when s1   => d <= '0';
			     c <= '1';
			     o <= '0';
		when s2   => d <= '0';
			     c <= '0';
			     o <= '1';
		when s3   => d <= '0';
			     c <= '0';
			     o <= '0';
		when s4   => d <= '0';
			     c <= '0';
			     o <= '1';
		when s5   => d <= '0';
			     c <= '0';
			     o <= '1';
		when s6   => d <= '1';					--you get your drink
			     c <= '0';
			     o <= '0';
	end case;
	cashout <= c & o;						--cashback
	output <= d & c & o;
end process;
end one;
		
