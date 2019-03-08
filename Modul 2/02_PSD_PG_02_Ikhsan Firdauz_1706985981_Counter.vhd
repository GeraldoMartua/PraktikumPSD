library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
        
entity updn_counter is  
        port(
		Clk, CLR, up_down : in std_logic;
        	Q : out std_logic_vector(3 downto 0);
		sevseg : out std_logic_vector (6 downto 0));
end updn_counter;
        
architecture behaviour of updn_counter is 
signal temp: std_logic_vector(3 downto 0);  
begin     

	process (Clk, CLR, up_down)   
        begin

        	if (CLR='1') then         
        		temp <= "0000";    
        	elsif falling_edge(Clk) then
			if (temp="1001") then
				temp <= "0000";
        		elsif (up_down='1') then  
        			temp <= temp + 1;        
        		elsif (up_down='0') then          
        			temp <= temp - 1;    
        		end if;        
        	end if;

		case temp is
			when "0000" =>
			sevseg <= "0000001"; ---0
			when "0001" =>
			sevseg <= "1001111"; ---1
			when "0010" =>
			sevseg <= "0010010"; ---2
			when "0011" =>
			sevseg <= "0000110"; ---3
			when "0100" =>
			sevseg <= "1001100"; ---4
			when "0101" =>
			sevseg <= "0100100"; ---5
			when "0110" =>
			sevseg <= "0100000"; ---6
			when "0111" =>
			sevseg <= "0001111"; ---7
			when "1000" =>
			sevseg <= "0000000"; ---8
			when "1001" =>
			sevseg <= "0000100"; ---9
			when others =>
			sevseg <= "1111111"; ---null
		end case;
	end process;          
	Q <= temp;
end behaviour;
			 