LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY counter IS
port (clk,rst: IN std_logic;
    dir: IN std_logic;
    sevseg: OUT std_logic_vector(6 downto 0) );
END counter;

ARCHITECTURE behavioral OF counter IS
signal count_sig: integer range 0 to 9;
signal count: std_logic_vector (6 downto 0);
BEGIN
    PROCESS(clk,rst) 
    begin
        if(rst='1')then
            count_sig<=0;
        elsif(rising_edge (clk))then
		if (dir='1') then
            	count_sig<= count_sig+1; --counter up
		elsif (dir='0') then
		count_sig<=count_sig-1; --counter down
		end if;
        end if;

        if (count_sig=0)    then count <= "1000000";
        elsif (count_sig=1) then count <= "1111001";
        elsif (count_sig=2) then count <= "0100100";
        elsif (count_sig=3) then count <= "0110000";
        elsif (count_sig=4) then count <= "0011001";
        elsif (count_sig=5) then count <= "0010010";
        elsif (count_sig=6) then count <= "0000010";
        elsif (count_sig=7) then count <= "1111000";
	elsif (count_sig=8) then count <= "0000000";
	elsif (count_sig=9) then count <= "0010000";
        end if;
    end PROCESS;
sevseg <= not count;
END behavioral;
