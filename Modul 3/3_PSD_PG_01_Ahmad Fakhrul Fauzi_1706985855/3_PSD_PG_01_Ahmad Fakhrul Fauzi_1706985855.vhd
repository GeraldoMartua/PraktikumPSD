LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Sandi_Rumput IS
	PORT(
	s_rumput : OUT STD_LOGIC := '0');
END Sandi_Rumput;

ARCHITECTURE BEHAVIOUR OF Sandi_Rumput IS

--ascii untuk huruf dalam biner
signal sandi : std_logic_vector(6 downto 0);

BEGIN 

PROCESS
	
BEGIN		

		sandi <="1001000"; --H
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;

		sandi <= "1100001"; --a
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1.5 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;
		
		sandi <= "1101001";--i
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;

		sandi <= "0000000";-- spasi
		s_rumput <= '0'; 
		wait for 2 sec;

		sandi <= "1001101";--M
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;

		sandi <= "1100001"; --a
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1.5 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;

		sandi <= "1110010";--r
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1.5 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;

		sandi <= "1110100";--t
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;	
	
		sandi <= "1101001";--i
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;

		sandi <= "1101110"; --n
		s_rumput <= '1'; 
		wait for 1.5 sec;
		s_rumput <= '0'; 
		wait for 0.2 sec;
		s_rumput <= '1'; 
		wait for 1 sec;
		s_rumput <= '0'; 
		wait for 0.5 sec;

		sandi <= "0000000";-- spasi
		s_rumput <= '0'; 
		wait for 100 sec;

END PROCESS;
END BEHAVIOUR;
