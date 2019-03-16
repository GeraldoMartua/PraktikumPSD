library ieee;
use ieee.std_logic_1164.all;

entity tb_decoder is
end tb_decoder;

architecture tb_grass of tb_decoder is
	signal clk : std_logic;
	signal ch1, ch2 : std_logic_vector(3 downto 0);
	signal sout : std_logic;
	signal en : std_logic;
begin
	u1: entity work.decoder(grass) 
	port map ( clk => clk,
	 charhex1 => ch1,
	 charhex2 => ch2,
	 signout => sout,
	 en => en);
	process is
	begin
		ch1 <= "0100";
		ch2 <= "1000";
		wait on ch1, ch2;
		
		ch1 <= "0100";
		ch2 <= "0001";
		wait on ch1, ch2;
		
		ch1 <= "0100";
		ch2 <= "1001";
		wait on ch1, ch2;
		
		ch1 <= "0010";
		ch2 <= "0000";
		wait on ch1, ch2;
		
		ch1 <= "0100";
		ch2 <= "1010";
		wait on ch1, ch2;
		
		ch1 <= "0100";
		ch2 <= "1000";
		wait on ch1, ch2;
		
		ch1 <= "0100";
		ch2 <= "0001";
		wait on ch1, ch2;
		
		ch1 <= "0100";
		ch2 <= "1001";
		wait on ch1, ch2;
		
		ch1 <= "0101";
		ch2 <= "0010";
		wait on ch1, ch2;
		
		ch1 <= "0100";
		ch2 <= "1001";
		wait on ch1, ch2;
	end process;
end tb_grass;