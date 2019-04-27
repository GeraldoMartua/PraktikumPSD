LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


ENTITY Calculator IS
PORT( HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		S : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		IN1,IN2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		EN : IN STD_LOGIC;
		clk : IN STD_LOGIC
		);
END Calculator;


ARCHITECTURE Structural OF Calculator IS
signal join : std_logic_vector(3 downto 0);
SIGNAL join_1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL join_2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL join_4 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL addr : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL dat : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal dat_1 : std_logic_vector(3 downto 0);
signal dat_2 : std_logic_vector(3 downto 0);
signal dreg : std_logic_vector(4 downto 0);
signal dreg2 : std_logic_vector(4 downto 0);
signal dreg3 : std_logic_vector(7 downto 0);
signal dreg4 : std_logic_vector(4 downto 0);
signal dreg5 : std_logic_vector(7 downto 0);
SIGNAL enable :  STD_LOGIC;
SIGNAL Q :  STD_LOGIC_VECTOR(7 DOWNTO 0);



component addition
Port (	  NUM1 : in  STD_LOGIC_VECTOR (3 downto 0) := "1111";
           NUM2 : in  STD_LOGIC_VECTOR (3 downto 0) := "1111";
           SUM  : out STD_LOGIC_VECTOR (3 downto 0));
end component;


component substract
Port ( 	  NUM1 : in  STD_LOGIC_VECTOR (4 downto 0) := "11111";
           NUM2 : in  STD_LOGIC_VECTOR (4 downto 0) := "11111";
           hasil  : out STD_LOGIC_VECTOR (4 downto 0));
end component;

component KALI
port( clk,St: in std_logic;
		Mplier,Mcand : in std_logic_vector(3 downto 0);
		Done: out std_logic;
		Product: out std_logic_vector (7 downto 0));
end component;


component pembagian
Port (Dividend_in: in std_logic_vector(7 downto 0);
		Divisor: in std_logic_vector(3 downto 0);
		St, clk: in std_logic;
		Quotient: out std_logic_vector(3 downto 0);
		Remainder: out std_logic_vector(3 downto 0);
		Overflow: out std_logic);
end component;


component faktorial
 port (clk,S : IN STD_LOGIC;
		 MULTIPLIER,MULTIPLICAND: IN STD_LOGIC_VECTOR (3 DOWNTO 0);
		 PRODUCT: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
		 D: OUT STD_LOGIC);
end component;
		
COMPONENT seven_segment
PORT(
 KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
 SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
 HEX7, HEX6, HEX5, HEX4,
 HEX3, HEX2, HEX1, HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6);
 LEDG : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
 );
 end component;

BEGIN
clock <= CLK;
dat_1 <= IN1;
dat_2 <= IN2;
enable <= EN;
ADDRESS <= S;
join <= "000" & address(4);
join_1 <= "000" & dreg;
join_2 <= "000" & dreg2;
join_4 <= "000" & dreg4;

WITH S SELECT
			dat  <= join_1 WHEN "00000",
						join_2 WHEN "00001",
						dreg3 WHEN "00010",
						join_4 WHEN "00011",
						dreg5 WHEN "00100",
						"00000000" WHEN OTHERS;
						
ram32x4_inst : ENTITY WORK.ram32x4 PORT MAP (
		address	 => addr,
		clock	 => clk,
		data	 => dat,
		wren	 => EN,
		q	 => Q
	);

plus : addition port map(dat_1,dat_2,clk,dreg);
min : substract port map(dat_1,dat_2,clk,dreg2);
mul : KALI port map(dat_1,dat_2,clk,dreg3);
div : pembagian port map(dat_1,dat_2,clk,dreg4);
factory : faktorial port map(dat_1,clk,dreg5);
SEG0 : seven_segment PORT MAP(addr(3 DOWNTO 0),HEX0);
SEG1 : seven_segment PORT MAP(join,HEX1);
SEG2 : seven_segment PORT MAP(dat(3 DOWNTO 0),HEX2);
SEG3 : seven_segment PORT MAP(dat(7 DOWNTO 4),HEX3); 
SEG4 : seven_segment PORT MAP(Q(3 DOWNTO 0),HEX4); 
SEG5 : seven_segment PORT MAP(Q(7 DOWNTO 4),HEX5);
SEG6 : seven_segment PORT MAP("0000",HEX6);
SEG7 : seven_segment PORT MAP("0000",HEX7);

END Structural;