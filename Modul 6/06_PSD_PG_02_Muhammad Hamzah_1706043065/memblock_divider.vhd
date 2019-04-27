library ieee;
use ieee.std_logic_1164.all;

entity div_3bit is
 port(
	x				: in std_logic_vector(2 downto 0);
	y				: in std_logic_vector(2 downto 0);
	div_result	: out std_logic_vector(2 downto 0)
 );
 end div_3bit;
 
architecture bhv of div_3bit is
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
component cmpr_3bit
	 port(
		a 			: in std_logic_vector(2 downto 0);
		b 			: in std_logic_vector(2 downto 0);
		less 		: out std_logic;
		equal 	: out std_logic;
		greater 	: out std_logic
	 );
end component;
	--signal t_div	: std_logic_vector(2 downto 0);
begin
divblock	: cmpr_3bit
 port map(
	a=>x,
	b=>y,
	less=>div_result(0),
	equal=>div_result(1),
	greater=>div_result(2)
 );
end bhv;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cmpr_3bit is
 port(
	a : in std_logic_vector(2 downto 0);
	b : in std_logic_vector(2 downto 0);
	less : out std_logic;
	equal : out std_logic;
	greater : out std_logic
 );
end cmpr_3bit;

architecture Behavioral of cmpr_3bit is
begin

process(a,b)
begin
if (a > b ) then
	less <= '0';
	equal <= '0';
	greater <= '1';
elsif (a < b) then
	less <= '1';
	equal <= '0';
	greater <= '0';
else
	less <= '0';
	equal <= '1';
	greater <= '0';
end if;
end process;
end Behavioral;