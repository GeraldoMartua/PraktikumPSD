library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity hitung is
   port(clk, clr,LOAD,UP : in std_logic;
	D : in std_logic_vector(3 downto 0);
	segmen : out std_logic_vector(6 downto 0)
	);
end hitung;
 
architecture cara3 of hitung is
   signal temp, Q: unsigned(3 downto 0);
begin process(clk,clr,LOAD,UP)
   begin
      if (clr='1') then
         temp <= "0000";
      elsif(clk'event AND clk='1') then
            if (LOAD= '1') then temp <=unsigned(D);
	      else
                if (UP='1') then 
		  if temp="1001" then temp <= "0000"; 	--modulo 9
	          else temp <= temp + 1;		--counter up
		  end if;	
		else
		temp<= temp - 1;  			--counter down
		end if;
	    end if;
      end if;	
   
	Q <= temp; 
	if     (Q="0000") then	--0
		segmen <= "1111110";
	elsif  (Q="0001") then	--1
		segmen <= "0110000";
	elsif  (Q="0010") then	--2
		segmen <= "1101101";
	elsif  (Q="0011") then	--3
		segmen <= "1111001";
	elsif  (Q="0100") then	--4
		segmen <= "0110011";
	elsif  (Q="0101") then	--5
		segmen <= "1011011";
	elsif  (Q="0110") then	--6
		segmen <= "1011111";
	elsif  (Q="0111") then	--7
		segmen <= "1110000";
	elsif  (Q="1000") then	--8
		segmen <= "1111111";
	elsif  (Q="1001") then	--9
		segmen <= "1111001";
	end if;
end process;
   
end cara3;