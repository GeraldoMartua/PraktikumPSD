library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX_to_7Seg is
	port(
	input1,input2,input3,input4 : in std_logic_vector (3 downto 0);
	sel	    : in integer range 0 to 3;
	output0,output1,output2,output3,output4,output5,output6,output7,output8,output9 : out std_logic_vector (6 downto 0));
end MUX_to_7Seg;


architecture design of MUX_to_7Seg is

signal BCD : std_logic_vector (3 downto 0);

begin
	process (sel, input1, input2, input3, input4, BCD)
	begin

		if sel = 0 then 
			BCD <= input1;
		elsif sel = 1 then 
			BCD <= input2;
		elsif sel = 2 then 
			BCD <= input3;
		elsif sel = 3 then 
			BCD <= input4;
		elsif BCD <= "UUUU";
		end if;

		if BCD = "0000" then 
			output0 <= "1111110";
		else output0 <= "0000000";
		end if;

		if BCD = "0001" then 
			output1 <= "0110000";
		else output1 <= "0000000";
		end if;

		if BCD = "0010" then 
			output2 <= "1101101";
		else output2 <= "0000000";
		end if;

		if BCD = "0011" then 
			output3 <= "1111001";
		else output3 <= "0000000";
		end if;

		if BCD = "0100" then 
			output4 <= "0110011";
		else output4 <= "0000000";
		end if;

		if BCD = "0101" then 
			output5 <= "1011011";
		else output5 <= "0000000";
		end if;

		if BCD = "0110" then 
			output6 <= "0011111";
		else output6 <= "0000000";
		end if;

		if BCD = "0111" then 
			output7 <= "1110000";
		else output7 <= "0000000";
		end if;

		if BCD = "1000" then 
			output8 <= "1111111";
		else output8 <= "0000000";
		end if;

		if BCD = "1001" then 
			output9 <= "1110011";
		else output9 <= "0000000";
		end if;
		
	end process;
	
end design;