library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 
entity Kalkulator is
 port (
	a 	: in STD_LOGIC_VECTOR (2 downto 0);
	b 	: in STD_LOGIC_VECTOR (2 downto 0);
	c	: in std_logic;
	clk: in STD_LOGIC;
	sel: in STD_LOGIC_VECTOR (1 downto 0);
	result 		: inout STD_LOGIC_VECTOR (5 downto 0);
	result_disp	: inout STD_LOGIC_VECTOR (0 to 6);
	address_in	: inout STD_LOGIC_VECTOR (4 downto 0);
	data_saved	: out STD_LOGIC_VECTOR (7 downto 0);
	data_out		: out STD_LOGIC_VECTOR (7 downto 0);
 );
end Kalkulator;

architecture bhv of Kalkulator is

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

component add_3bit
 port(
	x		: in std_logic_vector (2 downto 0);
	y		: in std_logic_vector (2 downto 0);
	cin	: in std_logic;
	--add_in: in std_logic_vector(4 downto 0);
	sum	: out std_logic_vector (2 downto 0);
	cout	: out std_logic
 );
end component;

component subtr_3bit
 port(
	x : in STD_LOGIC_VECTOR (2 downto 0);
	y : in STD_LOGIC_VECTOR (2 downto 0);
	bin : in STD_LOGIC;
	diff : out STD_LOGIC_VECTOR (2 downto 0);
	bout : out STD_LOGIC
 );
end component;

component mul_3bit
 port(
	a : in STD_LOGIC_VECTOR (2 downto 0);
	b : in STD_LOGIC_VECTOR (2 downto 0);
	p : out STD_LOGIC_VECTOR (5 downto 0)
 );
end component;


component div_3bit
 port(
	x				: in std_logic_vector(2 downto 0);
	y				: in std_logic_vector(2 downto 0);
	div_result	: out std_logic_vector(2 downto 0)
 );
 end component;

signal t_div,t_multi,t_sub,t_adder:std_logic_vector(5 downto 0):= (others => '0');
signal write: in std_logic;

begin
alu1: add_3bit
 port map(
	x=>a,
	y=>b,
	cin=>c,
	sum=>t_adder(2 downto 0),
	cout=>t_adder(3)
 );
alu2: subtr_3bit
 port map(
	x=>a,
	y=>b,
	bin=>c,
	diff=>t_sub(2 downto 0),
	bout=>t_sub(3)
 );
alu3: mul_3bit
 port map(
	a=>a,
	b=>b,
	p=>t_multi
 );
alu4: div_3bit
 port map(
	x=>a,
	y=>b,
	div_result(0)=>t_div(0),
	div_result(1)=>t_div(1),
	div_result(2)=>t_div(2)
 );

out7seg: SevSeg_hex
 port map(
	hex(0)=>result(0),
	hex(1)=>result(1),
	hex(2)=>result(2),
	hex(3)=>result(3),
	disp_out=>result_disp
 );

 raminterface: ram32x4
  port map(
	address=>address_in,
	clock=>clk,
	data=>data_saved,
	wren=>write,
	q=>data_out;
  );
	
process(sel,t_div,t_multi,t_sub,t_adder,clk)
begin
if rising_edge(clk) then
case sel is
when "00"=>result<=t_adder;
when "01"=>result<=t_sub;
when "10"=>result<=t_multi;
when "11"=>result<=t_div;
when others =>result<="000000";
end case;
"00" & result => data_saved;
end if;
end process;
end bhv;