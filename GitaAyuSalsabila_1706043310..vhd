LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY gabungan IS
	PORT (i0 : in std_logic_vector (3 downto 0) := "0000";
	      i1 : in std_logic_vector (3 downto 0) := "0001";
	      i2 : in std_logic_vector (3 downto 0) := "0010";
	      i3 : in std_logic_vector (3 downto 0) := "0011";
	      s		 : in std_logic_vector (1 downto 0);
  	      segmen 	 : out std_logic_vector(6 downto 0)
	      );
END gabungan;

ARCHITECTURE cara OF gabungan IS
	signal BCD: std_logic_vector (3 downto 0);
BEGIN
PROCESS (s,i0,i1,i2,i3, BCD) is
BEGIN  	
	if (s="00") then
		BCD <= i0;
	elsif (s="01") then
		BCD <= i1;
	elsif (s="10") then	
		BCD <= i2;
	elsif (s="11") then
		BCD <= i3;
	end if;
	
	if     (BCD="0000") then	--0
		segmen <= "1111110";
	elsif  (BCD="0001") then	--1
		segmen <= "0110000";
	elsif  (BCD="0010") then	--2
		segmen <= "1101101";
	elsif  (BCD="0011") then	--3
		segmen <= "1111001";
	elsif  (BCD="0100") then	--4
		segmen <= "0110011";
	elsif  (BCD="0101") then	--5
		segmen <= "1011011";
	elsif  (BCD="0110") then	--6
		segmen <= "1011111";
	elsif  (BCD="0111") then	--7
		segmen <= "1110000";
	elsif  (BCD="1000") then	--8
		segmen <= "1111111";
	elsif  (BCD="1001") then	--9
		segmen <= "1111001";
	end if;
END PROCESS;
END cara;