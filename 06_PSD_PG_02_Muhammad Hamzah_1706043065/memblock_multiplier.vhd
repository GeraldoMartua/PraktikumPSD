library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mul_3bit is
 port(
	a : in STD_LOGIC_VECTOR (2 downto 0);
	b : in STD_LOGIC_VECTOR (2 downto 0);
	p : out STD_LOGIC_VECTOR (5 downto 0)
 );
end mul_3bit;

architecture Behavioral of mul_3bit is
component ram32x4
	 port(
		address	: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q			: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	 );
end component;
component SevSeg_hex
		port(
				hex 		: in std_logic_vector(3 downto 0);
				disp_out	: out std_logic_vector(0 to 6)
		);
	end component;
component fulladder
 port(
	a : in STD_LOGIC;
	b : in STD_LOGIC;
	cin : in STD_LOGIC;
	s : out STD_LOGIC;
	cout : out STD_LOGIC
 );
end component;

component halfadder is
 port(
	a,b : in std_logic;
	s : out STD_LOGIC;
	cout : out STD_LOGIC
 );
end component;

signal f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f11,f12,s1,s2: std_logic;
begin

ha1: halfadder
 port map(f0,f1,p(1),f2);
fa1: fulladder
 port map(f2,f3,f4,s1,f5);
ha2: halfadder
 port map (f5,f6,s2,f7);
ha3: halfadder
 port map (s1,f8,p(2),f9);
fa2: fulladder
 port map (f9,s2,f10,p(3),f11);
fa3: fulladder
 port map (f11,f7,f12,p(4),p(5));
f0 <= a(0) and b(1);
f1 <= a(1) and b(0);
f3 <= a(0) and b(2);
f4 <= a(1) and b(1);
f6 <= a(1) and b(2);
f8 <= a(2) and b(0);
f10<= a(2) and b(1);
f12<= a(2) and b(2);
P(0)<=a(0) and b(0);
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
 port(
	a : in STD_LOGIC;
	b : in STD_LOGIC;
	cin : in STD_LOGIC;
	s : out STD_LOGIC;
	cout : out STD_LOGIC
 );
end fulladder;

architecture Behavioral of fulladder is

component halfadder
 port(
	a,b : in std_logic;
	s : out STD_LOGIC;
	cout : out STD_LOGIC
 );
end component;

signal s1,c1,c2:std_logic;
begin
ha1: halfadder
 port map(a,b,s1,c1);
ha2: halfadder
 port map(s1,cin,s,c2);
cout <= c1 or c2;
end Behavioral;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is
 port(
	a,b : in std_logic;
	s : out STD_LOGIC;
	cout : out STD_LOGIC
 );
end halfadder;

architecture Behavioral of halfadder is
begin
s <= a xor b;
cout <= a and b;
end Behavioral;