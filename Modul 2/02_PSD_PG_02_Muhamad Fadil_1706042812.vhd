library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity up_down_counter is 
	port (clk : in std_logic; 	-- clock input
		reset: in std_logic;	-- reset input 
	   up_down: in std_logic; 	-- up or down
		counter : out std_logic_vector (3 downto 0)	-- output 4 - bit counter 
	); 
end up_down_counter; 

architecture Behavioral of up_down_counter is 
	signal counter_updown : std_logic_vector (3 downto 0); 

begin 

	-- down counter
	process (clk,reset) 
	begin
		if (rising_edge (clk)) then  
			if (reset = '1') then 
				counter_updown <= x"0"; 
	 		elsif (up_down = '1') then 
				counter_updown <= counter_updown - x"1"; 	-- menghitung kebawah
		else
		   counter_updown <= counter_updown + x"1";      -- menghitung ke atas
			end if;  
		end if; 
	end process; 
	    counter <= counter_updown; 

end Behavioral; 
