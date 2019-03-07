library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity up_and_down is
port (
cout    :out std_logic_vector (7 downto 0); 15     
 reset   :in  std_logic                   						     -- Insert reset
 up_down :in  std_logic;                   						     -- counter up_down
 clk     :in  std_logic;                   						     -- Insert clock   
);
end entity;


architecture Behavioral of up_and_down is
signal count :std_logic_vector (7 downto 0);
begin
 process (clk, reset) begin
 	if (reset = '1') then
		count <= (others=>'0');
	elsif (rising_edge(clk)) then
 		if (up_down = '1') then
   			 count <= count + 1;
	else
		count <= count - 1;
	end if;
	end if;
	end process;
 		cout <= count;
end architecture;
