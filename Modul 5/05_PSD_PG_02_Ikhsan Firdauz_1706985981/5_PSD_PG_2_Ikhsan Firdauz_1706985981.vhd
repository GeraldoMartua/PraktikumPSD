library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity vending is
	port ( 
		coin: inout std_logic;
  		sel: inout std_logic;
   		clk, reset: in std_logic;
		cola_1: inout std_logic;
        	cola_2: inout std_logic);
end vending;

architecture behav of vending is
	type state_type is (Idle,Selection,Cola_out);
 	signal state, nextstate: state_type;
begin
	process (clk, reset)
	begin
  		if rising_edge (clk) then
  			state <= nextstate;

 		elsif (reset = '1') then
  			state <= Idle;
  		end if;
 
 	end process;

 	process (state, coin, sel)
 	begin
  		case state is
   			when Idle =>
    				if (coin = '1') 
     					then nextstate <= Selection;
    				else 
     					nextstate <= Idle;
    				end if;

   			when Selection =>
   	 			if (sel = '0') then
					nextstate <= Cola_out;		
   	 			elsif (sel = '1') then
					nextstate <= Cola_out;
				else
					nextstate <= Selection;
				end if;
   
  			when Cola_out =>
				if (cola_1 = '1' or cola_2 = '1') then
				nextstate <= Idle;
				else
				nextstate <= Cola_out;
				end if;
	
  		end case;
 	end process;

	process (state)
 	begin
  		case state is
   			when Idle =>
				cola_1 <= '0';
				cola_2 <= '0';

   			when Selection =>
   	 			coin <= '1';
   
  			when Cola_out =>
				coin <= '0';
   	 			if (sel = '0') then
					cola_1 <= '1';
					sel <= 'U';
   	 			elsif (sel = '1') then
					sel <= 'U';
					cola_2 <= '1';
				else
					cola_1 <= '0';
					cola_2 <= '0';
				end if;
	
  		end case;
 	end process;


end behav;