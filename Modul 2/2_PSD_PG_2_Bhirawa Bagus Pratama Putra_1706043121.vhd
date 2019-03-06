library IEEE;
    use IEEE.std_logic_1164.all;
    use IEEE.std_logic_arith.all;
    use IEEE.std_logic_unsigned.all;
entity tester is
    port (
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
	down: in STD_LOGIC
            );
end;

architecture x of tester is
signal sig_write_data : std_logic;
signal counter : std_logic_vector(3 downto 0);
begin
  Process (clk, rst)
      begin
	if(down='0')then
         if (rst = '0') then
            counter <= "1111";
         elsif (clk'event and clk = '1') then
            counter <= counter + 1;           
         end if;
	elsif(down='1')then
	 if (rst = '0') then
            counter <= "1111";
         elsif (clk'event and clk = '1') then
            counter <= counter - 1;
	 end if;
	end if;  
   end process ;
end x;