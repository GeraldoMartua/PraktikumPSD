LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


ENTITY KALKULATOR IS
PORT( HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
		SELECTOR : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		INPUT1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		INPUT2 : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		ENABLER : IN STD_LOGIC;
		CLOCK : IN STD_LOGIC
		);
END ENTITY;


ARCHITECTURE penghitung OF kalkulator IS
SIGNAL CLK : STD_LOGIC;
SIGNAL ADDRESS : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL DATA : STD_LOGIC_VECTOR(7 DOWNTO 0);
signal data1 : std_logic_vector(3 downto 0);
signal data2 : std_logic_vector(3 downto 0);
signal data_reg : std_logic_vector(4 downto 0);
signal data_reg2 : std_logic_vector(4 downto 0);
signal data_reg3 : std_logic_vector(7 downto 0);
signal data_reg4 : std_logic_vector(4 downto 0);
signal data_reg5 : std_logic_vector(7 downto 0);
SIGNAL EN :  STD_LOGIC;
SIGNAL Q :  STD_LOGIC_VECTOR(7 DOWNTO 0);
signal gabung : std_logic_vector(3 downto 0);
SIGNAL GABUNG1 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL GABUNG2 : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL GABUNG4 : STD_LOGIC_VECTOR(7 DOWNTO 0);


component jumlahin
port( datain : in std_logic_vector(3 downto 0);
		datain2 : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		dataout : out std_logic_vector(4 downto 0));
end component;


component kurangin
port( datain : in std_logic_vector(3 downto 0);
		datain2 : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		dataout : out std_logic_vector(4 downto 0));
end component;

component kaliin
port( datain : in std_logic_vector(3 downto 0);
		datain2 : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		dataout : out std_logic_vector(7 downto 0));
end component;


component bagiin
port( datain : in std_logic_vector(3 downto 0);
		datain2 : in std_logic_vector(3 downto 0);
		clk : in std_logic;
		dataout : out std_logic_vector(4 downto 0));
end component;


component factorial
 PORT( nilai : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
   CLK :  IN  STD_LOGIC;
   dataout :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0));
end component;
		
COMPONENT SEG7
PORT ( NILAI : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		 KELUAR : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END COMPONENT; 

BEGIN
CLK <= CLOCK;
EN <= ENABLER;
DATA1 <= INPUT1;
DATA2 <= input2;
ADDRESS <= selector;
GABUNG <= "000" & ADDRESS(4);
GABUNG1 <= "000" & DATA_REG;
GABUNG2 <= "000" & DATA_REG2;
GABUNG4 <= "000" & DATA_REG4;



WITH SELECTOR SELECT
			DATA  <= GABUNG1 WHEN "00000",
						GABUNG2 WHEN "00001",
						DATA_REG3 WHEN "00010",
						GABUNG4 WHEN "00011",
						DATA_REG5 WHEN "00100",
						"00000000" WHEN OTHERS;
						
Ram32x4_inst : ENTITY WORK.Ram32x4 PORT MAP (
		address	 => ADDRESS,
		clock	 => CLK,
		data	 => DATA,
		wren	 => EN,
		q	 => Q
	);

PENJUMLAH : jumlahin port map(data1,data2,clk,data_reg);
pengurang1 : kurangin port map(data1,data2,clk,data_reg2);
pengkali1 : kaliin port map(data1,data2,clk,data_reg3);
pembagi : bagiin port map(data1,data2,clk,data_reg4);
faktor1 : factorial port map(data1,clk,data_reg5);
SEVSEG0 : SEG7 PORT MAP(ADDRESS(3 DOWNTO 0),HEX0);
SEVSEG1 : SEG7 PORT MAP(GABUNG,HEX1);
SEVSEG2 : SEG7 PORT MAP(DATA(3 DOWNTO 0),HEX2);
SEVSEG3 : SEG7 PORT MAP(DATA(7 DOWNTO 4),HEX3); 
SEVSEG4 : SEG7 PORT MAP(Q(3 DOWNTO 0),HEX4); 
SEVSEG5 : SEG7 PORT MAP(Q(7 DOWNTO 4),HEX5);
SEVSEG6 : SEG7 PORT MAP("0000",HEX6);
SEVSEG7 : SEG7 PORT MAP("0000",HEX7);

END ARCHITECTURE;
