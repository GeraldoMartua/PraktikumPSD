LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY microcomputer IS 
	port
	(
		reset :  IN  STD_LOGIC;
		CLOCK_IN :  IN  STD_LOGIC;
		KeyPad_In :  IN  STD_LOGIC_VECTOR(7 downto 0);
		read :  OUT  STD_LOGIC;
		write :  OUT  STD_LOGIC;
		ram_clk :  OUT  STD_LOGIC;
		rom :  OUT  STD_LOGIC;
		ram_oe :  OUT  STD_LOGIC;
		LED_SEL :  OUT  STD_LOGIC;
		LED_CHAR :  OUT  STD_LOGIC;
		LINE1_KP :  OUT  STD_LOGIC;
		LINE2_KP :  OUT  STD_LOGIC;
		LINE3_KP :  OUT  STD_LOGIC;
		LINE4_KP :  OUT  STD_LOGIC;
		A :  OUT  STD_LOGIC_VECTOR(15 downto 0);
		D_out :  OUT  STD_LOGIC_VECTOR(7 downto 0);
		Din :  OUT  STD_LOGIC_VECTOR(7 downto 0)
	);
END microcomputer;

ARCHITECTURE bdf_type OF microcomputer IS 

component vhdl_cpu
	PORT(clock : IN STD_LOGIC;
		 nReset : IN STD_LOGIC;
		 IRQ : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 downto 0);
		 IACK : OUT STD_LOGIC;
		 nRead : OUT STD_LOGIC;
		 nWrite : OUT STD_LOGIC;
		 address_out : OUT STD_LOGIC_VECTOR(15 downto 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component a8bittri
	PORT(enabledt : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(7 downto 0);
		 tridata : INOUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component ram
	PORT(we : IN STD_LOGIC;
		 inclock : IN STD_LOGIC;
		 address : IN STD_LOGIC_VECTOR(10 downto 0);
		 data : IN STD_LOGIC_VECTOR(7 downto 0);
		 q : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

component address_decoder
	PORT(ADDRESS_IN : IN STD_LOGIC_VECTOR(15 downto 0);
		 ROM_EN : OUT STD_LOGIC;
		 RAM_EN : OUT STD_LOGIC;
		 LED_SEL : OUT STD_LOGIC;
		 LED_VAL : OUT STD_LOGIC;
		 KEY_LINE1 : OUT STD_LOGIC;
		 KEY_LINE2 : OUT STD_LOGIC;
		 KEY_LINE3 : OUT STD_LOGIC;
		 KEY_LINE4 : OUT STD_LOGIC;
		 KEY_READ : OUT STD_LOGIC
	);
end component;

component clock_divider
	PORT(CLOCK_IN : IN STD_LOGIC;
		 CLOCK_OUT : OUT STD_LOGIC
	);
end component;

component rom
	PORT(address : IN STD_LOGIC_VECTOR(5 downto 0);
		 q : OUT STD_LOGIC_VECTOR(7 downto 0)
	);
end component;

signal	ADDR :  STD_LOGIC_VECTOR(15 downto 0);
signal	clock :  STD_LOGIC;
signal	Din_ALTERA_SYNTHESIZED :  STD_LOGIC_VECTOR(7 downto 0);
signal	Dout :  STD_LOGIC_VECTOR(7 downto 0);
signal	read_ALTERA_SYNTHESIZED :  STD_LOGIC;
signal	write_ALTERA_SYNTHESIZED :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_21 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_22 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_17 :  STD_LOGIC_VECTOR(7 downto 0);
signal	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
signal	SYNTHESIZED_WIRE_19 :  STD_LOGIC_VECTOR(7 downto 0);
signal	SYNTHESIZED_WIRE_20 :  STD_LOGIC;


BEGIN 
ram_clk <= SYNTHESIZED_WIRE_2;
rom <= SYNTHESIZED_WIRE_16;
ram_oe <= SYNTHESIZED_WIRE_18;
SYNTHESIZED_WIRE_0 <= '0';
SYNTHESIZED_WIRE_22 <= '0';



b2v_inst : vhdl_cpu
PORT MAP(clock => clock,
		 nReset => reset,
		 IRQ => SYNTHESIZED_WIRE_0,
		 data_in => Din_ALTERA_SYNTHESIZED,
		 nRead => read_ALTERA_SYNTHESIZED,
		 nWrite => write_ALTERA_SYNTHESIZED,
		 address_out => ADDR,
		 data_out => Dout);

b2v_inst1 : a8bittri
PORT MAP(enabledt => SYNTHESIZED_WIRE_1,
		 data => KeyPad_In,
		 tridata => Din_ALTERA_SYNTHESIZED);

b2v_inst11 : ram
PORT MAP(we => SYNTHESIZED_WIRE_2,
		 inclock => clock,
		 address => ADDR(10 downto 0),
		 data => Dout,
		 q => SYNTHESIZED_WIRE_19);

b2v_inst12 : address_decoder
PORT MAP(ADDRESS_IN => ADDR,
		 ROM_EN => SYNTHESIZED_WIRE_4,
		 RAM_EN => SYNTHESIZED_WIRE_21,
		 LED_SEL => SYNTHESIZED_WIRE_20,
		 LED_VAL => SYNTHESIZED_WIRE_5,
		 KEY_LINE1 => SYNTHESIZED_WIRE_7,
		 KEY_LINE2 => SYNTHESIZED_WIRE_9,
		 KEY_LINE3 => SYNTHESIZED_WIRE_11,
		 KEY_LINE4 => SYNTHESIZED_WIRE_13,
		 KEY_READ => SYNTHESIZED_WIRE_14);

SYNTHESIZED_WIRE_2 <= NOT(write_ALTERA_SYNTHESIZED OR SYNTHESIZED_WIRE_21);

SYNTHESIZED_WIRE_16 <= NOT(SYNTHESIZED_WIRE_4 OR read_ALTERA_SYNTHESIZED);

LED_CHAR <= NOT(write_ALTERA_SYNTHESIZED OR SYNTHESIZED_WIRE_5);

LINE1_KP <= NOT(SYNTHESIZED_WIRE_22 OR SYNTHESIZED_WIRE_7);

LINE2_KP <= NOT(SYNTHESIZED_WIRE_22 OR SYNTHESIZED_WIRE_9);

b2v_inst2 : clock_divider
PORT MAP(CLOCK_IN => CLOCK_IN,
		 CLOCK_OUT => clock);

LINE3_KP <= NOT(SYNTHESIZED_WIRE_22 OR SYNTHESIZED_WIRE_11);

LINE4_KP <= NOT(SYNTHESIZED_WIRE_22 OR SYNTHESIZED_WIRE_13);

SYNTHESIZED_WIRE_1 <= NOT(SYNTHESIZED_WIRE_14 OR read_ALTERA_SYNTHESIZED);

SYNTHESIZED_WIRE_18 <= NOT(read_ALTERA_SYNTHESIZED OR SYNTHESIZED_WIRE_21);

b2v_inst4 : a8bittri
PORT MAP(enabledt => SYNTHESIZED_WIRE_16,
		 data => SYNTHESIZED_WIRE_17,
		 tridata => Din_ALTERA_SYNTHESIZED);

b2v_inst5 : a8bittri
PORT MAP(enabledt => SYNTHESIZED_WIRE_18,
		 data => SYNTHESIZED_WIRE_19,
		 tridata => Din_ALTERA_SYNTHESIZED);

b2v_inst7 : rom
PORT MAP(address => ADDR(5 downto 0),
		 q => SYNTHESIZED_WIRE_17);

LED_SEL <= write_ALTERA_SYNTHESIZED OR SYNTHESIZED_WIRE_20;
read <= read_ALTERA_SYNTHESIZED;
write <= write_ALTERA_SYNTHESIZED;
A <= ADDR;
D_out <= Dout;
Din <= Din_ALTERA_SYNTHESIZED;

END; 