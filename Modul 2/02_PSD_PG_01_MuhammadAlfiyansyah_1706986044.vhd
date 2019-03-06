library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_arith.all;
    use ieee.std_logic_unsigned.all;

entity counter is
  port (
    cout    :out std_logic_vector (3 downto 0) := "0000";-- Output of the counter
    load    :in  std_logic;                    -- up_down control for counter
    clk     :in  std_logic;                    -- Input clock
    reset   :in  std_logic
  );
end entity;

architecture structural of counter is
	signal count : std_logic_vector (3 downto 0) := "0000";
begin
	process (clk, reset)
	begin
		if (clk'event and clk = '1') then
			elsif reset = '1' and(load = '1' or load = '0') then
				count <= "0000";
			elsif(load = '1') then
				count <= count + 1;
			else
				count <= count - 1;
			end if;
end process;
cout <= std_logic_vector (count);
end architecture;
	
		
		


