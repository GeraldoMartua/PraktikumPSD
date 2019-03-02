# PraktikumPSD

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PSD is 
	port(
	     seven_segment : out std_logic_vector (6 downto 0)     -- output bcd to 7 segment
	); 
	  
end PSD;

architecture machine of PSD is
	signal selector 	: std_logic_vector(1 downto 0); 		--selector 2 bit
	signal input1		: std_logic_vector(3 downto 0) := B"0000"; 	--input MUX 
	signal input2		: std_logic_vector(3 downto 0) := B"0001"; 	
	signal input3		: std_logic_vector(3 downto 0) := B"0010"; 	
	signal input4		: std_logic_vector(3 downto 0) := B"0011"; 	
begin
process(input1, input2, input3, input4, selector) is
  begin
    case selector is                                            
      when "00" => BCD <= input1;
      when "01" => BCD <= input2;
      when "10" => BCD <= input3;
      when "11" => BCD <= input4;
      when others => BCD <= "0000";
    end case;                                                   

    case bcd is                                                  
      when "0000" => seven_segment <= "0111111";                      
      when "0001" => seven_segment <= "0000110";                      
      when "0010" => seven_segment <= "1011011";                      
      when "0011" => seven_segment <= "1001111";                      
      when others => seven_segment <= "0000000";                      
    end case; 
    
  end process;
end architecture;
