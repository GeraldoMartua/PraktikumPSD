library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter_Up_Down_3bit is
    Port ( 
		Clock : in  STD_LOGIC;
          	Count : out  STD_LOGIC_VECTOR (2 downto 0));
end Counter_Up_Down_3bit;

architecture Model of Counter_Up_Down_3bit is
	signal in_UP : std_logic_vector(2 downto 0) :="000";
 	signal in_DOWN : std_logic_vector(2 downto 0) :="111";
begin
    process(Clock)
    begin
        if(rising_edge(Clock)) then ---untuk counter UP dimulai dari 000
            if(in_UP = "111") then
                in_UP <= "000";
            else
                in_UP <= in_UP + 1; ---bertambah tiap clock berjalan
            end if;
        end if;

	if(rising_edge(Clock)) then ---untuk counter DOWN dimulai dari 111
            if(in_DOWN = "000") then
                in_DOWN <= "111";
            else
                in_DOWN <= in_DOWN - 1; ---berkurang tiap clock berjalan
            end if;
        end if;
        
        Count <= in_UP; ---sinyal UP
	Count <= in_DOWN; ---sinyal DOWN
    end process;
end Model;
