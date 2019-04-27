library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subtr_3bit is
 port(
	x : in STD_LOGIC_VECTOR (2 downto 0);
	y : in STD_LOGIC_VECTOR (2 downto 0);
	bin : in STD_LOGIC;
	diff : out STD_LOGIC_VECTOR (2 downto 0);
	bout : out STD_LOGIC
 );
end subtr_3bit;

architecture bhv of subtr_3bit is
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
component subt_full is
 port(
	a 		: in STD_LOGIC;
	b 		: in STD_LOGIC;
	bin 	: in STD_LOGIC;
	diff 	: out STD_LOGIC;
	bout 	: out STD_LOGIC
 );
end component;

signal br0,br1: std_logic;
begin
fs1: subt_full port map(x(0),y(0),bin,diff(0),br0);
fs2: subt_full port map(x(1),y(1),br0,diff(1),br1);
fs3: subt_full port map(x(2),y(2),br1,diff(2),bout);
end bhv;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity subt_full is
 port(
	a : in STD_LOGIC;
	b : in STD_LOGIC;
	bin : in STD_LOGIC;
	diff : out STD_LOGIC;
	bout : out STD_LOGIC
 );
end subt_full;

architecture Behavioral of subt_full is
begin
diff <= a xor b xor bin;
bout <= ((not a)and b)or((not a)and bin)or(b and bin);
end Behavioral;