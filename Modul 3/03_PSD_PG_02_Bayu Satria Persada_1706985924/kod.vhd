LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY KODE_MORSE IS
generic( ngitung : integer := 1);
PORT(
	CLK : IN STD_LOGIC ;
	reset : IN STD_LOGIC;
	MASUKAN : IN STRING(1 To 10);
	output : inout std_logic);

END ENTITY;

ARCHITECTURE MORSECODE OF KODE_MORSE IS
SIGNAL steping : integer := 0;
SIGNAL LOOPS : INTEGER ;
signal maju : integer:=1;
BEGIN
process (CLK, MASUKAN)
BEGIN 

if rising_edge(CLK) then
	IF RESET =  '1' THEN
	
		STEPING <= 0;
		LOOPS <= 0;
	ELSE
		IF LOOPS = ngitung - 1 then
				loops <= 0;
	
			if masukan(maju) = 'H' then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 2 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 3 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 4 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 5 then
					output <= '0';
					steping <= steping +1; --keluaran titik
				elsif steping = 6 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 7 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 8 then
					output <= '0';
					steping <= steping +1; --keluaran titik
				elsif steping = 9 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 10 then
					output <= '1';
					steping <= steping +1;
				elsif steping = 11 then
					output <= '0';
					steping <= steping +1; 
				else
					output <= '0';
					steping <= 0; --keluaran titik
					maju <= maju + 1;
				
				end if;
				
			Elsif (masukan(maju) = 'A') then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 2 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 3 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 4 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 5 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 6 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 7 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 8 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 9 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 10 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 11 then
					output <= '0';
					steping <= steping + 1; --keluaran garis
				else
					output <= '0';
					steping <= 0;
					maju <= maju + 1;
				end if;
		
			Elsif (masukan(maju) = 'I') then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 2 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 3 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 4 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 5 then
					output <= '0';
					steping <= steping +1; --keluaran titik
				else
					output <= '0';
					steping <= 0; --keluaran titik
					maju <= maju + 1;
				end if;
			elsif masukan(maju) = ' ' then
				if steping = 0 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '0';
					steping <= steping +1; --keluaran titik
				elsif steping = 2 then
					output <= '0';
					steping <= steping + 1;
				
				else
					output <= '0';
					steping <= 0; --keluaran titik
					maju <= maju + 1;
				
				end if;
			Elsif (masukan(maju) = 'L') then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 2 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 3 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 4 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 5 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 6 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 7 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 8 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 9 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 10 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 11 then
					output <= '0';
					steping <= steping + 1; --keluaran garis
				elsif steping = 12 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 13 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 14 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 15 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 16 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 17 then
					output <= '0';
					steping <= steping + 1;
				else
					output <= '0';
					steping <= 0;
					maju <= maju + 1;
				end if;

				Elsif (masukan(maju) = 'F') then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 2 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 3 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 4 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 5 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 6 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 7 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 8 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 9 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 10 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 11 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 12 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 13 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 14 then
					output <= '0';
					steping <= steping + 1; --keluaran garis
				elsif steping = 15 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 16 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 17 then
					output <= '0';
					steping <= steping + 1;
				else
					output <= '0';
					steping <= 0;
					maju <= maju + 1;
				end if;
				Elsif (masukan(maju) = 'N') then
				if steping = 0 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 2 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 3 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 4 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 5 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 6 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 7 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 8 then
					output <= '0';
					steping <= steping + 1; --keluaran garis
				ELSif steping = 9 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 10 then
					output <= '1';
					steping <= steping +1; --keluaran titik
				elsif steping = 11 then
					output <= '0';
					steping <= steping + 1;
				else
					output <= '0';
					steping <= 0;
					maju <= 1;
					
				end if;
			end if;
		ELSE
			loops <= loops +1;

		
		end if;
	
	END IF;
end if;
end process;
end architecture;
