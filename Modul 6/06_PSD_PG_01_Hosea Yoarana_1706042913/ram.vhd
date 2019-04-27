LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY lpm;
USE lpm.lpm_components.all;

ENTITY ram IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		we		: IN STD_LOGIC  := '1';
		inclock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END ram;


ARCHITECTURE SYN OF ram IS

	SIGNAL sub_wire0	: STD_LOGIC_VECTOR (7 DOWNTO 0);



	COMPONENT lpm_ram_dq
	GENERIC (
		intended_device_family		: STRING;
		lpm_width		: NATURAL;
		lpm_widthad		: NATURAL;
		lpm_indata		: STRING;
		lpm_address_control		: STRING;
		lpm_outdata		: STRING;
		lpm_file		: STRING;
		use_eab		: STRING;
		lpm_hint		: STRING;
		lpm_type		: STRING
	);
	PORT (
			address	: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
			inclock	: IN STD_LOGIC ;
			q	: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
			data	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			we	: IN STD_LOGIC 
	);
	END COMPONENT;

BEGIN
	q    <= sub_wire0(7 DOWNTO 0);

	lpm_ram_dq_component : lpm_ram_dq
	GENERIC MAP (
		intended_device_family => "FLEX10K",
		lpm_width => 8,
		lpm_widthad => 11,
		lpm_indata => "REGISTERED",
		lpm_address_control => "REGISTERED",
		lpm_outdata => "UNREGISTERED",
		lpm_file => "VHDL_CPU_ram.mif",
		use_eab => "ON",
		lpm_hint => "MAXIMUM_DEPTH=2048",
		lpm_type => "LPM_RAM_DQ"
	)
	PORT MAP (
		address => address,
		inclock => inclock,
		data => data,
		we => we,
		q => sub_wire0
	);



END SYN;
