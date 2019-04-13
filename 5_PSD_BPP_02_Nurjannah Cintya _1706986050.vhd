library ieee;
use ieee.std_logic_1164.all;

entity adder is
    port(Clk,reset : in std_logic; 
            a,b,cin : in std_logic;  
            s,cout : out std_logic  
           );
end adder;

architecture behav of adder is


signal c,flag : std_logic := '0';

begin

process(clk,reset)

variable c : std_logic := '0'; 
begin
	if(reset = '1') then 
	    s <= '0';
	    cout <= c;
	    flag <= '0';

		elsif(rising_edge(clk)) then
		    if(flag = '0') then
		        c := cin;  
		        flag <= '1';  
		    end if; 
			    cout <= '0'; 
    
		s <= a xor b xor c;  
    		c := (a and b) or (c and b) or (a and c);  
end if;
end process;

end behav;
