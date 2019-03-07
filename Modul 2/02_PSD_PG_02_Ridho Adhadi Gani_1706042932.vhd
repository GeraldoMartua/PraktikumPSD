library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity updowncount is
port (  reset, clk, load, up : in  std_logic;
	d_input 	     : in  std_logic_vector(3 downto 0);	-- implementation : parking gate counter
	count		     : out std_logic_vector(3 downto 0);
	sevseg		     : out std_logic_vector(6 downto 0));
end updowncount;

architecture behavioral of updowncount is
	signal hold : unsigned(3 downto 0); 				-- hold signal
	signal conv : std_logic_vector(3 downto 0);			-- conversion signal
begin
process (clk, reset)
begin
	if (reset = '1') then
	hold <= (others => '0'); 					-- clear
	elsif (rising_edge(clk)) then
		if (load = '1') then hold <= unsigned(d_input); 	-- load (casting type to unsigned)
		else
			if (up = '1') then hold <= hold + 1; 		-- increment
			else hold <= hold - 1; 				-- decrement
			end if;
		end if;
	end if;
	count <= std_logic_vector(hold);				-- typecasting
	conv  <= std_logic_vector(hold);				-- typecasting
	case conv is							-- display on seven segment
		when X"0"=> sevseg <="0000001";				-- 0
		when X"1"=> sevseg <="1001111";				-- 1
		when X"2"=> sevseg <="0010010";				-- 2
		when X"3"=> sevseg <="0000110";                      	-- 3
		when X"4"=> sevseg <="1001100";				-- 4
		when X"5"=> sevseg <="0100100";				-- 5
		when X"6"=> sevseg <="0100000";				-- 6
		when X"7"=> sevseg <="0001111";				-- 7
		when X"8"=> sevseg <="0000000";				-- 8
		when X"9"=> sevseg <="0000100";				-- 9
		when others => sevseg <="1111111";			-- all off
	end case;
end process;
end behavioral;
