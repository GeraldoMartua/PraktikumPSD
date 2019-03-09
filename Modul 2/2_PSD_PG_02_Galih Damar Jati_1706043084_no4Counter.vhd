library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity UpDown is
port  (Num: in std_logic_vector(0 to 3);
      C,Ld,R,Direct: in std_logic;
	Q: out std_logic_vector(0 to 3));
end UpDown;

architecture funct of UpDown is
signal tmp: std_logic_vector(0 to 3);
begin
 process(C,R)
 begin
	if R='1' then
	tmp <= "0000";
		elsif (C'event and C='1') then
		if Ld='1' then
		tmp <= Num;
		elsif (Ld='0' and Direct='0') then
		tmp <= tmp + 1;
		elsif (Ld='0' and Direct='1') then
		tmp <= tmp - 1;
		end if;
	end if;
end process;
Q <= tmp;
end funct;
