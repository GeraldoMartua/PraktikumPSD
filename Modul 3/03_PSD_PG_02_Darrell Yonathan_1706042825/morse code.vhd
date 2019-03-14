
library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

use ieee.std_logic_unsigned.all;

-- Entity Penambahan Jumlah Karakter --

--Berdasarkan Input Huruf dan Korelasinya--

entity morsecode is

port(

 clk  : in std_logic;

 x  : in std_logic;

 z  : out std_logic;

 q12 : out std_logic_vector (1 DOWNTO 0)

);

end morsecode;



architecture behavioral of morsecode is



type state_type is (S00,S01,S10,S11);  

signal state,next_state : state_type;



begin



process(clk)

begin

 if(clk = '1' and clk'event) then

    state<=next_state;

 end if;

end process;



process(state,x)

begin

 case state is    

  when S00 =>         

   q12 <= "00";         

   if(x = '0') then

          z <= '0';

          next_state  <= S00;

       else

       z <= '0';

          next_state  <= S01;

        end if;  

 

  when S01 =>         

   q12 <= "01";        

   if(x = '0') then

          z <= '0';

          next_state  <= S00;

       else

          z <= '0';

          next_state  <= S10;

        end if;  

  

  when S10 =>         

   q12 <= "10";        

   if(x = '0') then

          z <= '0';

          next_state  <= S00;

       else

          z <= '1';

          next_state  <= S10;

        end if;  

 

  when S11 =>          

   q12 <= "11";

   if(x = '0') then

          z <= '0';

          next_state  <= S00;

       else

          z <= '1';

          next_state  <= S10;

       end if;  

   end case;

end process;

end behavioral;