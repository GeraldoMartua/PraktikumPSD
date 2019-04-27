LIBRARY IEEE;
use ieee.std_logic_1164.all;

entity add_3bit is
 port(
	x		: in std_logic_vector (2 downto 0);
	y		: in std_logic_vector (2 downto 0);
	cin	: in std_logic;
	sum	: out std_logic_vector (2 downto 0);
	cout	: out std_logic
 );
end add_3bit;

architecture bhv of add_3bit is
	component ram32x4
	 port(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	 );
	end component;
	component SevSeg_hex
		port(
				hex 		: in std_logic_vector(3 downto 0);
				disp_out	: out std_logic_vector(0 to 6)
		);
	end component;
	component add_full
	 port(
		x		: in std_logic;
		y		: in std_logic;
		cin	: in std_logic;
		sum	: out std_logic;
		cout	: out std_logic
	 );
	end component;
signal i_carry	: std_logic_vector(1 downto 0);
begin
block1	: add_full port map(x(0), y(0), cin, sum(0), i_carry(0));
block2	: add_full port map(x(1), y(1), i_carry(0), sum(1), i_carry(1));
block3	: add_full port map(x(2), y(2), i_carry(1), sum(2), cout);
end bhv;


library ieee;
use ieee.std_logic_1164.all;

entity add_full is
 port(
	x		: in std_logic;
	y		: in std_logic;
	cin	: in std_logic;
	sum	: out std_logic;
	cout	: out std_logic
 );
 end add_full;
 
 architecture bhv of add_full is
 begin
	sum <= x xor y xor cin;
	cout <= (x and y)or(x and cin)or(y and cin);
end bhv;