library ieee;

use ieee.std_logic_1164.all;

use ieee.numeric_std.all;

 

entity morsecode rafiul is

generic(ClockFrequencyHz : integer := 10);

port(

    clk     : in std_logic;  -- Clock

    reset   : in std_logic;   -- reset

    hasilkode    : inout std_logic); -- Hasil hasilkode Morse

end entity;

 

architecture morse of morsecoderafiul is

 -- HAI RAFIUL    | = PER KATA, ~ = SPASI

   -- Sinyal periode clock

   signal atom  : integer;

 signal urutan  : integer := 0;

 signal unit  : integer := 0;

 

begin

 

    process(clk) is

    begin

        if rising_edge(clk) then

    -- reset 

            if reset  = '0' then

                atom  <= 0;

      urutan  <= 0;

      unit  <= 0;

      

            else

                -- aktif untuk tiap unit

               if atom = ClockFrequencyHz - 1 then

      atom <= 0;

       if urutan = 0 then    

        if unit = 0 then   

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 1 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 2 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 3 then -- .

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 4 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 5 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 6 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 7 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 8 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 9 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 10 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 11 then

         hasilkode <= '0';

         unit <= unit + 1;

        else

         hasilkode <= '0';

         unit <= 0;

         urutan <= urutan + 1;

        end if;

         

       elsif urutan = 1 then   

        if unit = 0 then   

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 1 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 2 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 3 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 4 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 5 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 6 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 7 then

         hasilkode <= '0';

         unit <= unit + 1;

        else

         hasilkode <= '0';

         unit <= 0;

         urutan <= urutan + 1;

        end if;

       

       elsif urutan = 2 then    

        if unit = 0 then   

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 1 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 2 then

         hasilkode <= '0';

         unit <= unit + 1; 

        elsif unit = 3 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 4 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 5 then

         hasilkode <= '0';

         unit <= unit + 1;

        else

         hasilkode <= '0';

         unit <= 0;

         urutan <= urutan + 1;

        end if;

        

       elsif urutan = 3 then   

        if unit = 0 then   

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 1 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 2 then

         hasilkode <= '0';

         unit <= unit + 1;

        else

         hasilkode <= '0';

         unit <= 0;

         urutan <= urutan + 1;

        end if;

         

       elsif urutan = 4 then  

        if unit = 0 then   

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 1 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 2 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 3 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 4 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 5 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 6 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 7 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 8 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 9 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 10 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 11 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 12 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 13 then

         hasilkode <= '0';

         unit <= unit + 1;

        else

         hasilkode <= '0';

         unit <= 0;

         urutan <= urutan + 1;

        end if; 

         

       elsif urutan = 5 then   

        if unit = 0 then   

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 1 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 2 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 3 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 4 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 5 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 6 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 7 then

         hasilkode <= '0';

         unit <= unit + 1;

        else

         hasilkode <= '0';

         unit <= 0;

         urutan <= urutan + 1;

        end if;

         

       elsif urutan = 6 then   

        if unit = 0 then   

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 1 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 2 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 3 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 4 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 5 then

         hasilkode <= '0';

         unit <= unit + 1;

        else

         hasilkode <= '0';

         unit <= 0;

         urutan <= urutan + 1;

        end if; 

         

       elsif urutan = 7 then   

        if unit = 0 then   

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 1 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 2 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 3 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 4 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 5 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 6 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 7 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 8 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 9 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 10 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 11 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 12 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 13 then 

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 14 then

         hasilkode <= '1';

         unit <= unit + 1;

        elsif unit = 15 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 16 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 17 then 

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 18 then

         hasilkode <= '0';

         unit <= unit + 1;

        elsif unit = 19 then

         hasilkode <= '0';

         unit <= unit + 1;

        else

         hasilkode <= '0';

         unit <= 0;

         urutan <= 0;

        end if;

                

       end if;

     else

      atom  <= atom  + 1;

     end if;

            end if;

        end if;

    end process;

 

end architecture;
