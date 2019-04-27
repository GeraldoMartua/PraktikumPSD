
LIBRARY ieee;

USE ieee.std_logic_1164.all;



LIBRARY altera_mf;

USE altera_mf.altera_mf_components.all;



ENTITY ram32x4 IS

 PORT

 (

  address  : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

  clock  : IN STD_LOGIC ;

  data  : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

  wren  : IN STD_LOGIC ;

  q  : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)

 );

END ram32x4;





ARCHITECTURE SYN OF ram32x4 IS



 SIGNAL sub_wire0 : STD_LOGIC_VECTOR (7 DOWNTO 0);

 

 COMPONENT altsyncram

 GENERIC (

   clock_enable_input_a  : STRING;

   clock_enable_output_a : STRING;

   intended_device_family : STRING;

   lpm_hint      : STRING;

   lpm_type      : STRING;

   numwords_a      : NATURAL;

   operation_mode    : STRING;

   outdata_aclr_a    : STRING;

   outdata_reg_a     : STRING;

   power_up_uninitialized  : STRING;

   ram_block_type    : STRING;

   widthad_a      : NATURAL;

   width_a       : NATURAL;

   width_byteena_a   : NATURAL

   );

  PORT (

   wren_a : IN STD_LOGIC;

   clock0 : IN STD_LOGIC;

   address_a: IN STD_LOGIC_VECTOR (7 DOWNTO 0);

   q_a  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);

   data_a : IN STD_LOGIC_VECTOR(7 DOWNTO 0)

   );

 END COMPONENT;

  


BEGIN

 q    <= sub_wire0(7 DOWNTO 0);


 altsyncram_component : altsyncram

 GENERIC MAP (

  clock_enable_input_a => "BYPASS",

  clock_enable_output_a => "BYPASS",

  intended_device_family => "Cyclone V",

  lpm_hint => "ENABLE_RUNTIME_MOD=NO",

  lpm_type => "altsyncram",

  numwords_a => 256,

  operation_mode => "SINGLE_PORT",

  outdata_aclr_a => "NONE",

  outdata_reg_a => "UNREGISTERED",

  power_up_uninitialized => "FALSE",

  ram_block_type => "M4K",

  widthad_a => 8,

  width_a => 8,

  width_byteena_a => 1

 )

 PORT MAP (

  address_a => address,

  clock0 => clock,

  data_a => data,

  wren_a => wren,

  q_a => sub_wire0

 );


END SYN;