
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity morse is


port (clk : in std_logic;
clk2 :in std_logic;
	
      morseout : out std_logic
     );
end morse;



architecture WAYOFWORKS of morse is
	

	signal my_string : string(1 to 14):= " hai stefannov";
	signal i : integer range 1 to 10:=1;
	signal awd: character;
	begin
	
	process(clk,clk2)
		begin
		
		if(clk'event and clk='1') then 
    			if (my_string(i) = 'a') then
				awd<= 'a';
  	    			
				ulang : for i in 1 to 4 loop
				if(clk2'event and clk2='1') then
				if i = 1 then
  	    			morseout  <= '1' after 1 sec;
				elsif i=2 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=3 then
				morseout <= '0' after 2 sec;
				elsif i=4 then
				
				end if;
				end if;
				end loop ulang;

			elsif (my_string(i) = 'b') then
  	    			morseout  <= '0';
				morseout <= '1';
				morseout <= '1';
				morseout <= '1';
			elsif (my_string(i) = 'c') then
  	    			morseout  <= '0';
				morseout <= '1';
				morseout <= '0';
				morseout <= '1';
			elsif (my_string(i) = 'd') then
  	    			morseout  <= '0';
				morseout <= '1';

				morseout <= '1';
			elsif (my_string(i) = 'e') then
  	 			awd<= 'e';
				morseout <= '1' after 1 sec;
				morseout  <= 'U' after 0.5 sec;
			elsif (my_string(i) = 'f') then
				
				ulang1 : for i in 1 to 8 loop
				awd<= 'f';
				if(clk2'event and clk2='1') then
				if i = 1 then
  	    			morseout  <= '1' after 1 sec;
				elsif i=2 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=3 then
				morseout <= '1' after 1 sec;
				elsif i=4 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=5 then
				morseout <= '0' after 2 sec;
				elsif i=6 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=7 then
				morseout <= '1' after 1 sec;
				elsif i=8 then
				

				end if;
				end if;
				end loop ulang1;
				
			elsif (my_string(i) = 'g') then
  	    			morseout  <= '0';
		
				morseout <= '0';
				morseout <= '1';
			elsif (my_string(i) = 'h') then
  	    			

				ulang9 : for i in 1 to 8 loop
				if(clk2'event and clk2='1') then
				if i = 1 then
  	    			morseout  <= '1' after 1 sec;
				elsif i=2 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=3 then
				morseout <= '1' after 1 sec;
				elsif i=4 then
				morseout  <= 'U' after 0.5 sec;
				elsif i = 5 then
  	    			morseout  <= '1' after 1 sec;
				elsif i=6 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=7 then
				morseout <= '1' after 1 sec;
				elsif i=8 then
				
				end if;
				end if;
				end loop ulang9;

			elsif (my_string(i) = 'i') then
  	    		
				morseout <= '1';
				morseout <= '1';

				ulang8 : for i in 1 to 4 loop
				if(clk2'event and clk2='1') then
				if i = 1 then
  	    			morseout  <= '1' after 1 sec;
				elsif i=2 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=3 then
				morseout <= '1' after 1 sec;
				elsif i=4 then
				
				end if;
				end if;
				end loop ulang8;

			elsif (my_string(i) = 'j') then
  	    			morseout  <= '1';
				morseout <= '0';
				morseout <= '0';
				morseout <= '1';
			elsif (my_string(i) = 'k') then
  	    			morseout  <= '0';
				morseout <= '1';
				morseout <= '0';
			elsif (my_string(i) = 'l') then
  	    			morseout  <= '1';
				morseout <= '0';
				morseout <= '1';
				morseout <= '1';
			elsif (my_string(i) = 'm') then
  	    		
				morseout <= '0';
				morseout <= '0';
			elsif (my_string(i) = 'n') then
				awd<= 'n';
  	    			

				ulang2 : for i in 1 to 4 loop
				if(clk2'event and clk2='1') then
				if i = 1 then
  	    			morseout  <= '0' after 2 sec;
				elsif i=2 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=3 then
				morseout <= '1' after 2 sec;
				elsif i=4 then
				
				
				end if;
				end if;
				end loop ulang2;
			elsif (my_string(i) = 'o') then
				awd<= 'o';
  	    			ulang3 : for i in 1 to 4 loop
				if(clk2'event and clk2='1') then
				if i = 1 then
  	    			morseout  <= '0' after 2 sec;
				elsif i=2 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=3 then
				morseout <= '0' after 2 sec;
				elsif i=4 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=5 then
				morseout <= '0' after 2 sec;
				elsif i=6 then
				
				
				end if;
				end if;
				end loop ulang3;

			elsif (my_string(i) = 'p') then
  	    			morseout  <= '1';
				morseout <= '0';
				morseout <= '0';
				morseout <= '1';
			elsif (my_string(i) = 'q') then
  	    			morseout  <= '0';
				morseout <= '0';
				morseout <= '1';
				morseout <= '0';
			elsif (my_string(i) = 'r') then
  	    		
				morseout <= '1';
				morseout <= '0';
				morseout <= '1';
			elsif (my_string(i) = 's') then
				awd<= 's';
  	    			


				ulang4 : for i in 1 to 6 loop
				if(clk2'event and clk2='1') then
				if i = 1 then
  	    			morseout  <= '1' after  1 sec;
				elsif i=2 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=3 then
				morseout <= '1' after 1 sec;
				elsif i=4 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=5 then
				
				morseout <= '1' after 1 sec;
				elsif i=6 then
				
				end if;
				end if;
				end loop ulang4;
			

			elsif (my_string(i) = 't') then
  	    			awd<= 't';
				morseout <= '0' after 2 sec;
				morseout  <= 'U' after 0.5 sec;

				
			elsif (my_string(i) = 'u') then
  	    			morseout  <= '0';
			elsif (my_string(i) = 'v') then
				awd<= 'v';
  	    			morseout  <= '1';
				morseout <= '1';
				morseout <= '0';

				ulang5 : for i in 1 to 6 loop
				if(clk2'event and clk2='1') then
				if i = 1 then
  	    			morseout  <= '1' after 1 sec;
				elsif i=2 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=3 then
				morseout <= '1' after 2 sec;
				elsif i=4 then
				morseout  <= 'U' after 0.5 sec;
				elsif i=5 then
				morseout <= '0' after 2 sec;
				elsif i=6 then
				
				end if;
				end if;
				end loop ulang5;

			elsif (my_string(i) = 'w') then
  	    			morseout  <= '0';
				morseout <= '1';
				morseout <= '1';
				morseout <= '0';
			elsif (my_string(i) = 'x') then
  	    			morseout  <= '0';
				morseout <= '1';
				morseout <= '1';
				morseout <= '0';
			elsif (my_string(i) = 'y') then
  	    			morseout  <= '0';
				morseout <= '1';
				morseout <= '0';
				morseout <= '0';
			elsif (my_string(i) = 'z') then
  	    			morseout  <= '0';
				morseout <= '0';
				morseout <= '1';
				morseout <= '1';

    			
    			end if;
  		
		i <= i+1;

	end if;

	end process;

	

end WAYOFWORKS;