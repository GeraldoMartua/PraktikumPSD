library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.ALL;
use ieee.std_logic_unsigned.all;

entity telepon is
port (
 clk,state : in STD_LOGIC;
 object,subject: in STD_LOGIC_VECTOR (3 downto 0);
 hasil: out STD_LOGIC_VECTOR (7 downto 0);
 flipflop: out STD_LOGIC);
end telepon;

--c 		= coin dimasukkan;
--load 		= memulai telepon;
--done 		= selesai input nomor;
--duration 	= durasi telepon;
--ib,ia 	= input nomor tekepon;
--load1,load2,ea,ms = telepon sedang berjalan;
--Carry,Sum,Count = selesai menelepon;

architecture behavior of telepon is

signal x,y,pu,pl: STD_LOGIC_VECTOR (3 downto 0);
signal masking: STD_LOGIC_VECTOR (3 downto 0);
signal tambah: STD_LOGIC_VECTOR (4 downto 0);
signal mux: STD_LOGIC_VECTOR (3 downto 0);
signal c,load,done,durasi,ib,ia,load1,load2,ea,ms,Carry,Sum,Count: STD_LOGIC;
signal S, NS: INTEGER RANGE 0 TO 4;
alias y3: STD_LOGIC is y(3);
alias x3: STD_LOGIC is x(3);

begin
 c <='1' when y="0000" else '0';
 mux <= pu when ms='1' else pl;
 masking <= x when ea = '1' AND ia = '0' else
 NOT x when ea ='1' AND ia = '1' else
 "1111" when ea = '0' AND ia ='1' else "0000";
 tambah<=('0'&mux)+('0'&masking)+("0000"&Count); 
 hasil <= pu & pl;

process(state,S,c)
begin
	done<='0';load<='0';durasi<='0';ib<='0';ms<='0';Carry<='0';
	Sum<='0';ea<='0';ia<='0';load1<='0';
	load2 <='0';flipflop<= '0';
case S is
	when 0 =>
	done <= '1';load <= '1';
	if state='1' then NS <=1;
	else NS <= 0; 
	end if;

	when 1 =>
	NS <= 2;
	if y3 = '1' then Sum <='1';
	else Carry <= '1';
	end if;

	when 2 =>
	if c ='1' then NS <=4;
	else NS <= 3; load2 <= '1'; ea <='1';
	end if;
	if c ='0' AND y3 ='1' then ia <= '1';
	end if;

	when 3 =>
	load1 <= '1'; ms<= '1';NS <= 2;
	if y3='0' then Carry <= '1' ; durasi <= '1';
	else Sum <= '1'; ib <='1';
	end if;
	if (x3 XOR y3) = '1' then ia <= '1' ; 
	end if;

	when 4 =>
	flipflop<='1';
	if state='1' then NS <= 4;
	else NS <= 0; 
	end if;
end case ;
end process;

process (clk)
begin
	if clk'EVENT AND clk='1'then
	if load ='1' then y <= object ;
	x <= subject ;
	end if;

	if Carry='1' then Count <='0';
	elsif Sum ='1' then Count <='1';
	else Count <= tambah (4);
	end if;

	S <= NS;
	end if;
end process;
end behavior;
