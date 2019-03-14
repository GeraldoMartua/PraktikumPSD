library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity detection_e is
port(
		clk_i 			: in std_logic;
		reset_i			: in std_logic;
		morse_i 		: in std_logic;
      	        char_o			: out std_logic_vector (7 downto 0);
		--temp
		high_count_o	        : out integer;
		low_count_o		: out integer;
		sreg_o			: out std_logic_vector (7 downto 0)
	);
end detection_e; 

architecture detection_a of detection_e is
type state_type_t is (rst_st, wait_st, ccheck_st, scheck_st);

signal state_s, nextstate_s        : state_type_t;
signal sreg_s, sreg_nxt_s           : std_logic_vector (7 downto 0);
signal high_count_s, high_count_nxt_s : integer range 0 to 100000;
signal low_count_s, low_count_nxt_s   : integer range 0 to 100000;
signal dd_space_s, dd_space_nxt_s     : integer range 0 to 65500;

begin

  process(clk_i, reset_i)
  begin
    if (reset_i = '1') then
        state_s <= rst_st;
    elsif (clk_i'event and clk_i = '1') then
        state_s <= nextstate_s;
        sreg_s <= sreg_nxt_s;
	high_count_s <= high_count_nxt_s;
	low_count_s <= low_count_nxt_s;
	dd_space_s <= dd_space_nxt_s;
    end if;
  end process;
	process (clk_i, state_s, morse_i, high_count_s, low_count_s, sreg_s, dd_space_s)
		begin
			nextstate_s <= state_s;
			sreg_nxt_s <= sreg_s;
			high_count_nxt_s <= high_count_s;
			low_count_nxt_s <= low_count_s;
			dd_space_nxt_s <= dd_space_s;
			
			case state_s is
     			        when rst_st  => 	sreg_nxt_s <= "00000001";
							high_count_nxt_s <= 0;
							low_count_nxt_s <=0;
							char_o <= "00000001";
							nextstate_s <= wait_st;
										
				when wait_st  =>	if (morse_i = '1') then  
							    high_count_nxt_s <= high_count_s+ 1;
							    nextstate_s <= ccheck_st;
							elsif (morse_i = '0') then 
								low_count_nxt_s <= low_count_s + 1;
								nextstate_s <= scheck_st;
							end if;
				
				when ccheck_st=>	
							-- condition to check for dot
							if (high_count_s /=0 and high_count_s = low_count_s) then
								high_count_nxt_s <= 0;
								low_count_nxt_s <=0;
								dd_space_nxt_s   <= low_count_s;
								sreg_nxt_s <= sreg_s(6 downto 0) & '0';
								nextstate_s <= wait_st;
							-- condition to check for dash
							elsif (high_count_s /=0 and high_count_s = 3*low_count_s) then
								high_count_nxt_s <= 0;
								low_count_nxt_s <=0;
								dd_space_nxt_s   <= low_count_s;
								sreg_nxt_s <= sreg_s(6 downto 0) & '1';
								nextstate_s <= wait_st;
							
							elsif (morse_i = '1') then  
								high_count_nxt_s <= high_count_s+ 1;
								elsif (morse_i = '0') then 
								low_count_nxt_s <= low_count_s + 1;
							end if;
										
				when scheck_st  =>
							if (low_count_s /=0 and low_count_s = 3*dd_space_s) then
								high_count_nxt_s <= 0;
								low_count_nxt_s <=0;
								dd_space_nxt_s   <= low_count_s;
								char_o <= sreg_s;
								sreg_nxt_s <= x"01";
								nextstate_s <= wait_st;
							 elsif (morse_i = '0') then 
								low_count_nxt_s <= low_count_s + 1;
							elsif (morse_i = '1') then 
								low_count_nxt_s <= 0;
								high_count_nxt_s <= high_count_s + 1;
								nextstate_s <= ccheck_st;
							end if;
										
				when others => nextstate_s <= rst_st;
			end case;				
	end process;

	high_count_o <= high_count_nxt_s;
	low_count_o <= low_count_nxt_s;	
	sreg_o <= sreg_s;

end detection_a;
