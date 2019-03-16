LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity rumput is
port (input  : in string  (9 downto 1):= "HAI FAQIH";      
      output : out std_logic
      );
end rumput;

architecture bhv_rumput of rumput is
signal temp : std_logic;

begin
process
  begin

      for count in 9 downto 0 loop 
	temp <= '0';
	wait for 0.5 sec;		--delay
	if (input(count) = 'A' or input(count) = 'a') then		--A
		temp <= '1'; 		
		wait for 1 sec;		--kecil
		temp <= '0'; 
		wait for 0.2 sec;	--delay
		temp <= '1'; 
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'B' or input(count)='b') then		--B
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'C' or input(count)='c') then		--C
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'D' or input(count)='d') then		--D
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'E' or input(count)='e') then		--E
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'F' or input(count)='f') then		--F
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';	
		wait for 1 sec;		--kecil
		temp <= '0';	
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';		
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'G' or input(count)='g') then		--G
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'H' or input(count)='h') then		--H
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'I' or input(count)='i') then		--I
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';		
		wait for 1 sec;		--kecil	
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'J' or input(count)='j') then		--J
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'K' or input(count)='k') then		--K
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'L' or input(count)='l') then		--L
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'M' or input(count)='m') then		--M
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'N' or input(count)='n') then		--N
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'O' or input(count)='o') then		--O
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'P' or input(count)='p') then		--P
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'Q' or input(count)='q') then		--Q
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'R' or input(count)='r') then		--R
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'S' or input(count)='s') then		--S
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'T' or input(count)='t') then		--T
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'U' or input(count)='u') then		--U
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'V' or input(count)='v') then		--V
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'W' or input(count)='w') then		--W
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'X' or input(count)='x') then		--X
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'Y' or input(count)='y') then		--Y
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = 'Z' or input(count)='z') then		--Z
		temp <= '1';
		wait for 1 sec;		--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1.5 sec;	--besar
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
		temp <= '1';
		wait for 1 sec;		--kecil
		temp <= '0';
		wait for 0.2 sec;	--delay
	elsif (input(count) = ' ') then				--spasi
	        temp <= '0';
		wait for 2 sec;	--delay
	end if;
     end loop;
	
end process;
end bhv_rumput;