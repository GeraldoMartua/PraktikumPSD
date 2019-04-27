library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity divider_system is
port(
			hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7 : out std_logic_vector(6 downto 0);
			address_in : in std_logic_vector(4 downto 0);
			input00 : in std_logic_vector(3 downto 0);
			input11 : in std_logic_vector(3 downto 0);
			en		 : in std_logic;
			clock  : in std_logic
		);
end entity;

architecture machine of divider_system is
	signal clock_s : std_logic;
	signal address_s : std_logic_vector(4 downto 0);
	signal data_s : std_logic_vector(7 downto 0);
	signal data0_s : std_logic_vector(3 downto 0);
	signal data1_s : std_logic_vector(3 downto 0);
	signal datareg_s : std_logic_vector(4 downto 0);
	signal en_s : std_logic;
	signal q_s : std_logic_vector(7 downto 0);
	signal con0_s : std_logic_vector(3 downto 0);
	signal con1_s : std_logic_vector(7 downto 0);
	
	component divider
	port (
				input0 : in std_logic_vector(3 downto 0);
				input1 : in std_logic_vector(3 downto 0);
				clock	 : in std_logic;
				output : out std_logic_vector(4 downto 0)
	);
	end component;
	
	component seseg
	port(
				bcd_seseg : in std_logic_vector(3 downto 0);
				out_seseg : out std_logic_vector(6 downto 0)
	);
	end component;
	
	begin
	clock_s <= clock;
	en_s <= en;
	data0_s <= input00;
	data1_S <= input11;
	address_s <= address_in;
	con0_s <= "000" & address_s(4);
	con1_s <= "000" & datareg_s;
	data_s <= con1_s;
	
	ram32x8_inst : entity work.ram32x8 port map(
		address => address_s,
		clock => clock_s,
		data => data_s,
		wren => en_s,
		q => q_s
	);
	
	adder_go : divider port map(data0_s, data1_s, clock_s, datareg_s);
	seseg0 : seseg port map(address_s(3 downto 0), hex0);
	seseg1 : seseg port map(con0_s, hex1);
	seseg2 : seseg port map(data_s(3 downto 0), hex2);
	seseg3 : seseg port map(data_s(7 downto 4), hex3);
	seseg4 : seseg port map(q_s(3 downto 0), hex4);
	seseg5 : seseg port map(q_s(7 downto 4), hex5);
	seseg6 : seseg port map("0000", hex6);
	seseg7 : seseg port map("0000", hex7);
	
end architecture;
