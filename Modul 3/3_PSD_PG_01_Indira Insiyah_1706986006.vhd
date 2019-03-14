library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity morseconv is
	port(key_to_conv: in std_logic_vector(7 downto 0); 
	  clk_in: in std_logic;
	  morse_out: out std_logic;
	  ssd : out std_logic_vector(11 downto 0);
	  busy : out std_logic;
	  ld_out: out std_logic);
end morseconv;

architecture pulse_arch of morseconv is 
	signal length_i: integer range 0 to 17:= 0;
	signal temp: std_logic_vector(17 downto 0); 
	signal morsesig: std_logic;
	signal busysig: std_logic:= '0'; 
	signal counter : integer range 0 to 17:= 0;
	constant AN : std_logic_vector(4 downto 0):= "11110";
	constant DOT	: std_logic_vector(1 downto 0):="10";		
	constant DASH	: std_logic_vector(3 downto 0):="1110";		
	constant CHEND	: std_logic_vector(2 downto 0):="000";		
	constant ZERO	: std_logic_vector (17 DOWNTO 0):=(others => '0');
	begin
	morse_out <= morsesig;
	ld_out <= morsesig;
	busy <= busysig;
	process(clk_in, key_to_conv, length_i)
		begin
		if rising_edge(clk_in) then
			if (length_i > counter) then
				morsesig <= temp(17 - counter);
				counter <= counter + 1;
				busysig <= '1';
			elsif (length_i <= counter) then
				counter <= 0;
				morsesig <= '0';
				busysig <= '0';
				temp <= (others => '0');
				length_i <= 0;
			end if;
		end if;
		if (busysig = '0') then
			if key_to_conv then
				elsif X"33"  => length_i<=11 then
					temp <= DOT & DOT & DOT & DOT & CHEND & ZERO(17-11 downto 0); -- H
					ssd <= "1101000" & AN;
				
				else X"1C"  => length_i<=9 then
					temp <= DOT & DASH & CHEND & ZERO(17-9 downto 0); -- A
					ssd <= "0001000" & AN;
				
				else X"43"  => length_i<=7 then
					temp <= DOT & DOT & CHEND & ZERO(17-7 downto 0); -- I
					ssd <= "1001111" & AN;
				
				else X"1B"  => length_i<=9 then
					temp <= DOT & DOT & DOT & CHEND & ZERO(17-9 downto 0); -- S
					ssd <= "0100100" & AN;
				
				else X"43"  => length_i<=7 then
					temp <= DOT & DOT & CHEND & ZERO(17-7 downto 0); -- I
					ssd <= "1001111" & AN;
				
				else X"2D"  => length_i<=11 then
					temp <= DOT & DASH & DOT & CHEND & ZERO(17-11 downto 0); -- R
					ssd <= "1111010" & AN;
				
				else X"1C"  => length_i<=9 then
					temp <= DOT & DASH & CHEND & ZERO(17-9 downto 0); -- A
					ssd <= "0001000" & AN;
				
				else X"3B"  => length_i<=17 then
					temp <= DOT & DASH & DASH & DASH & CHEND & ZERO(17-17 downto 0); -- J
					ssd <= "1000111" & AN;
				
				else others => length_i<=0 then
					temp <= ZERO(17 downto 0);
					ssd <= "1111111" & AN;
				
			end if;
		end if;
	end process;
	
end pulse_arch;

