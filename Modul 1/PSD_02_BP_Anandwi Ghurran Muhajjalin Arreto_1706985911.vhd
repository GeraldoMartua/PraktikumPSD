library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUXtoSevSeg is
	port(
	A0,A1,A2,A3 : in std_logic_vector (3 downto 0);
	S	    : in integer range 0 to 3;
	Out0,Out1,Out2,Out3,Out4,Out5,Out6,Out7,Out8,Out9 : out std_logic_vector (6 downto 0));
end MUXtoSevSeg;


architecture design of MUXtoSevSeg is

signal BCD : std_logic_vector (3 downto 0);

begin
	process (S, A0, A1, A2, A3, BCD)
	begin
		IF S = 0 THEN BCD <= A0;
		ELSIF S = 1 THEN BCD <= A1;
		ELSIF S = 2 THEN BCD <= A2;
		ELSIF S = 3 THEN BCD <= A3;
		ELSE BCD <= "UUUU";
		END IF;

		IF BCD = "0000" THEN Out0 <= "1111110";
		ELSE Out0 <= "0000000";
		END IF;

		IF BCD = "0001" THEN Out1 <= "0110000";
		ELSE Out1 <= "0000000";
		END IF;

		IF BCD = "0000" THEN Out2 <= "1101101";
		ELSE Out2 <= "0000000";
		END IF;

		IF BCD = "0000" THEN Out3 <= "1111001";
		ELSE Out3 <= "0000000";
		END IF;

		IF BCD = "0000" THEN Out4 <= "0110011";
		ELSE Out4 <= "0000000";
		END IF;

		IF BCD = "0000" THEN Out5 <= "1011011";
		ELSE Out5 <= "0000000";
		END IF;

		IF BCD = "0000" THEN Out6 <= "0011111";
		ELSE Out6 <= "0000000";
		END IF;

		IF BCD = "0000" THEN Out7 <= "1110000";
		ELSE Out7 <= "0000000";
		END IF;

		IF BCD = "0000" THEN Out8 <= "1111111";
		ELSE Out8 <= "0000000";
		END IF;

		IF BCD = "0000" THEN Out9 <= "1110011";
		ELSE Out9 <= "0000000";
		END IF;
		
	end process;
	
	
end design;
