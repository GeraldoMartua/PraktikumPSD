library ieee;
use ieee.std_logic_1164.all;

entity decoder is
port (
	--clk : in std_logic; --play clock at 0.1 sec
	charhex1 : in std_logic_vector(3 downto 0);
	charhex2 : in std_logic_vector(3 downto 0);
	signout : in std_logic
	en : out std_logic;
	);
end decoder;

architecture grass of decoder is
begin
	process --(clk)
	begin
		--if rst ='1' then
			--charhex1 <= '0';
			--charhex2 <= '0';
		--end if;
		
		--if rising_edge(clk) then
			if (charhex1 = "0100" AND charhex2 = "0001") then --huruf A 
				en <= 0;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <=1;
				
			
			elsif (charhex1 = "0100" AND charhex2 = "0010") then --huruf B
				en <= 0;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <='1';
				
			elsif (charhex1 = "0100" AND charhex2 = "0011") then --huruf C
				en <= '0'
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1'
				
			elsif (charhex1 = "0100" AND charhex2 = "0100") then --huruf D
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
			
			elsif (charhex1 = "0100" AND charhex2 = "0101") then --huruf E
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0100" AND charhex2 = "0110") then --huruf F
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0100" AND charhex2 = "0111") then --huruf G
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
			
			elsif (charhex1 = "0100" AND charhex2 = "1000") then --huruf H
				en <= '0'
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0100" AND charhex2 = "1001") then --huruf I
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0100" AND charhex2 = "1010") then --huruf J
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0100" AND charhex2 = "1011") then --huruf K
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0100" AND charhex2 = "1100") then --huruf L
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0100" AND charhex2 = "1101") then --huruf M
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '0';
				wait for 500 ms;
				en <='1';
				
			elsif (charhex1 = "0100" AND charhex2 = "1110") then --huruf N
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0100" AND charhex2 = "1111") then --huruf O
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
			
			elsif (charhex1 = "0101" AND charhex2 = "0000") then --huruf P
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
			
			elsif (charhex1 = "0101" AND charhex2 = "0001") then --huruf Q
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0101" AND charhex2 = "0010") then --huruf R
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <='1';
				
			elsif (charhex1 = "0101" AND charhex2 = "0011") then --huruf S
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0101" AND charhex2 = "0100") then --huruf T
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1'
				
			elsif (charhex1 = "0101" AND charhex2 = "0101") then --huruf U
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0101" AND charhex2 = "0110") then --huruf V
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0101" AND charhex2 = "0111") then --huruf W
				en <= '0';
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
			
			elsif (charhex1 = "0101" AND charhex2 = "1000") then --huruf X
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0101" AND charhex2 = "1001") then --huruf Y
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
				
			elsif (charhex1 = "0101" AND charhex2 = "1010") then --huruf Z
				en <= '0';
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1500 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 200 ms;
				signout <= '1';
				wait for 1000 ms;
				signout <= '0';
				wait for 500 ms;
				en <= '1';
			
			elsif (charhex1 = "0010" AND charhex2 = "0000") then --spasi
				en <= '0';
				wait for 1500 ms;
				en <= '1';
			
			end if;
		end if;
	end process;
end grass;
