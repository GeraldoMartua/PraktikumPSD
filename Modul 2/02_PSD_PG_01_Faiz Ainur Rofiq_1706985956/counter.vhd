library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter is
    Port ( CLK : in  STD_LOGIC; 
				DIR : in  STD_LOGIC;											 -- DIRection => 0 == counting down 
--																										  1 == counting up
				sev1_out : out  STD_LOGIC_VECTOR (6 downto 0);
				sev2_out : out  STD_LOGIC_VECTOR (6 downto 0);
				max_selector : in STD_LOGIC_VECTOR(3 downto 0));    -- Maximum digit => 1 == 0 to 10
--																												2 == 0 to 20
--																												3 == 0 to 30
--																												4 == 0 to 40
--																												5 == 0 to 50
--																												6 == 0 to 60
--																												7 == 0 to 70
--																												8 == 0 to 80
--																												9 == 0 to 99
--																												0 == INVALID
			  
end counter;

architecture behavioral of counter is
    SIGNAL dig1, dig2   : STD_LOGIC_VECTOR (3 downto 0) := X"0";
	 SIGNAL decoded : STD_LOGIC_VECTOR (6 downto 0);
	 SIGNAL startState : STD_LOGIC := '1';
begin
	 
    process (CLK)
    begin
        if (rising_edge(CLK) and max_selector /= X"0") then
				startState <= '0';
             if (DIR = '1' and dig2 <= max_selector) then
                if (dig1 = X"9") then
						dig2 <= dig2 + '1'; 
					 else
						dig1 <= dig1 + '1'; 
					 end if;
            elsif (DIR = '0' and dig2 >= max_selector) then
                if (dig1 = X"0") then
						dig2 <= dig2 - '1'; 
					 else
						dig1 <= dig1 - '1'; 
					 end if;
            end if;
        end if;
    end process;
    
	
    sev1_out <= "1111110" when (dig1 = X"0") else 
					"0110000" when (dig1 = X"1") else
					"1101101" when (dig1 = X"2") else
					"1111001" when (dig1 = X"3") else
					"0110011" when (dig1 = X"4") else
					"1011011" when (dig1 = X"5") else
					"1011111" when (dig1 = X"6") else
					"1110000" when (dig1 = X"7") else
					"1111111" when (dig1 = X"8") else
					"1111011";
					
	sev2_out <= "1111110" when (dig2 = X"0") else 
					"0110000" when (dig2 = X"1") else
					"1101101" when (dig2 = X"2") else
					"1111001" when (dig2 = X"3") else
					"0110011" when (dig2 = X"4") else
					"1011011" when (dig2 = X"5") else
					"1011111" when (dig2 = X"6") else
					"1110000" when (dig2 = X"7") else
					"1111111" when (dig2 = X"8") else
					"1111011";
    
end behavioral;