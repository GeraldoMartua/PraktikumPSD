
Library IEEE;

use IEEE.STD_LOGIC_1164.all;

ENTITY Seg IS

PORT(

 KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);

 SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0);

 HEX7, HEX6, HEX5, HEX4,

 HEX3, HEX2, HEX1, HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6);

 LEDG : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)

 );

 END Seg;

 ARCHITECTURE Behaviour OF Seg IS

 COMPONENT ram32x4

  PORT(

   address : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

   clock : IN STD_LOGIC;

   data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);

   wren : IN STD_LOGIC := '1';

   q  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));

 END COMPONENT;

  COMPONENT hex7seg

  PORT(

   hex : IN STD_LOGIC_VECTOR(3 DOWNTO 0);

   display : OUT STD_LOGIC_VECTOR(0 TO 6));

 END COMPONENT;

  SIGNAL Clock, Write : STD_LOGIC;

 SIGNAL Address : STD_LOGIC_VECTOR(7 DOWNTO 0);

 SIGNAL DataIn, DataOut : STD_LOGIC_VECTOR(7 DOWNTO 0);

BEGIN

 Clock <= KEY(0);

 Write <= SW(17);

 DataIn <= SW(7 DOWNTO 0);

 Address <= SW(15 DOWNTO 8);

 

 digit0: hex7seg PORT MAP (DataOut(3 DOWNTO 0), HEX0);

 digit1: hex7seg PORT MAP (DataOut(7 DOWNTO 4), HEX1);

 HEX2 <= "1111111"; 

 HEX3 <= "1111111"; 

 digit4: hex7seg PORT MAP (DataIn(3 DOWNTO 0), HEX4);

 digit5: hex7seg Port MAP (DataIn(7 DOWNTO 4), HEX5);

 digit6: hex7seg PORT MAP (Address(3 DOWNTO 0), HEX6);

 digit7: hex7seg PORT MAP (("000" & Address(4)), HEX7);

 
 LEDG(0) <= Write;

END Behaviour;



ARCHITECTURE Behaviour OF hex7seg IS

BEGIN

 PROCESS (hex)

 BEGIN

  CASE (hex) IS

   WHEN "0000" => display <= "0000001";

   WHEN "0001" => display <= "1001111";

   WHEN "0010" => display <= "0010010";

   WHEN "0011" => display <= "0000110";

   WHEN "0100" => display <= "1001100";

   WHEN "0101" => display <= "0100100";

   WHEN "0110" => display <= "1100000";

   WHEN "0111" => display <= "0001111";

   WHEN "1000" => display <= "0000000";

   WHEN "1001" => display <= "0001100";

   WHEN "1010" => display <= "0001000";

   WHEN "1011" => display <= "1100000";

   WHEN "1100" => display <= "0110001";

   WHEN "1101" => display <= "1000010";

   WHEN "1110" => display <= "0110000";

   WHEN OTHERS => display <= "0111000";

  END CASE;

 END PROCESS;

END Behaviour;