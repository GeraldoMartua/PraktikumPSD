LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY KODE_MORSE IS
generic( ngitung : integer := 1);
port(
	CLK : IN STD_LOGIC ;
	reset : IN STD_LOGIC;
	INPUT : IN STRING(1 To 10);
	output : inout std_logic);

end entity;

ARCHITECTURE MORSECODE OF KODE_MORSE IS
SIGNAL steping : integer := 0;
SIGNAL LOOPS : INTEGER ;
signal maju : integer:=1;
begin
process (CLK, INPUT)
begin

if rising_edge(CLK) then
	IF RESET =  '1' then
	
		STEPING <= 0;
		LOOPS <= 0;
	ELSE
		IF LOOPS = ngitung - 1 then
				loops <= 0;
	
			if INPUT(maju) = 'H' then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --titik
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
					steping <= steping +1; --titik
				elsif steping = 6 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 7 then
					output <= '1';
					steping <= steping +1; 
				elsif steping = 8 then
					output <= '0';
					steping <= steping +1; --titik
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
					steping <= 0; --titik
					maju <= maju + 1;
				
				end if;
				
			Elsif (INPUT(maju) = 'A') then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --titik
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
					steping <= steping + 1; --garis
				else
					output <= '0';
					steping <= 0;
					maju <= maju + 1;
				end if;
		
			Elsif (INPUT(maju) = 'I') then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --titik
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
					steping <= steping +1; --titik
				else
					output <= '0';
					steping <= 0; --titik
					maju <= maju + 1;
				end if;
			elsif INPUT(maju) = ' ' then
				if steping = 0 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '0';
					steping <= steping +1; --titik
				elsif steping = 2 then
					output <= '0';
					steping <= steping + 1;
				
				else
					output <= '0';
					steping <= 0; --titik
					maju <= maju + 1;
				
				end if;
			Elsif (INPUT(maju) = 'L') then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --titik
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
					steping <= steping + 1; --garis
				elsif steping = 12 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 13 then
					output <= '1';
					steping <= steping +1; --titik
				elsif steping = 14 then
					output <= '0';
					steping <= steping + 1;
				elsif steping = 15 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 16 then
					output <= '1';
					steping <= steping +1; --titik
				elsif steping = 17 then
					output <= '0';
					steping <= steping + 1;
				else
					output <= '0';
					steping <= 0;
					maju <= maju + 1;
				end if;

				Elsif (INPUT(maju) = 'E') then
				if steping = 0 then
					output <= '1';
					steping <= steping + 1;
				elsif steping = 1 then
					output <= '1';
					steping <= steping +1; --titik
					
				end if;
				Elsif (INPUT(maju) = 'O') then
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
					steping <= steping + 1; --garis
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
					steping <= steping + 1; --garis
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
					steping <= steping + 1; --garis
				else
					output <= '0';
					steping <= 0;
					maju <= 1;
					
				end if;
			end if;
		else
			loops <= loops +1;

		
		end if;
	
	END IF;
end if;
end process;
end architecture;