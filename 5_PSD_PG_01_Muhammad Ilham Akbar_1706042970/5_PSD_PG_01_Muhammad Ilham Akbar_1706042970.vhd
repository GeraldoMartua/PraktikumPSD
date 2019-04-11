
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY Telephone1 is
PORT (clock	 :    IN STD_LOGIC; -- CLOCK
      reset	 :    IN STD_LOGIC; -- RESET menunujukkan angkat = > tutup =1 dan angkat =0
	DURASI   : 	  OUT INTEGER; -- lama durasi telpon
      COIN 	 :    INOUT STD_LOGIC); -- COIN
	  
END Telephone1;


Architecture RTL of Telephone1 is
TYPE State_type IS (IDLE, Number, Dial, Waiting, CONV,CONV2,CONV3,FINISH); -- keadaan awal, masukkan nomor, memanggil, tunggu, coservasi 
	SIGNAL State : State_Type;     
							      
BEGIN 
  PROCESS (clock, reset) 
  BEGIN 
    If (reset = '1' ) THEN      -- TELPON TIDAK DIANGKAT , ATAU DIKEMBALIKAN KETEMPATNYA      
		State <= IDLE;
 
    ELSIF rising_edge(clock) THEN -- clock rising    
			 
	CASE State IS
 
		
		WHEN IDLE => 
			IF COIN='1' THEN 
				State <= Number; 
			END IF;
			
			
		when Number =>
			IF COIN='1' THEN 
				State <= DIAL;
			Else
				State <= IDLE; 
			END IF;
 
		
		WHEN DIAL => 
			IF COIN='1' THEN 
				State <= Waiting; 
			Else
				State <= IDLE; 
			END IF; 
 
		WHEN WAITING => 
			IF COIN='1' THEN 
				State <= CONV;
			ELse
				State <= IDLE;
			END IF; 
		
		WHEN CONV=> 
			IF COIN='1' THEN 
				State <= CONV2; 
			ELSE 
				State <= IDLE; 
			END IF;
		WHEN CONV2 =>
			IF COIN='1' THEN 
				State <= CONV3; 
			ELSE 
				State <= IDLE; 
			END IF;
		WHEN CONV3 =>
			IF COIN='1' THEN 
				State <= FINISH; 
			ELSE 
				State <= IDLE; 
			END IF;
			
		WHEN FINISH =>
			State <= IDLE;
			
		WHEN others =>
			State <= IDLE;
	END CASE; 
    END IF; 
  END PROCESS;
  
process (state)
	begin
	case state is
		when idle =>
			coin <= '0';
			durasi <= 0;
		when number =>
			coin<= '1';
			durasi <= 0;
		when dial =>
			coin<= '1';
			durasi <= 0;
		when waiting =>
			coin   <= '1';
			durasi <= 0;
		when CONV =>
			coin   <= '1';
			durasi <= 3;
		when CONV2 =>
			coin   <= '1';
			durasi <= 2;
		when CONV3 =>
			coin   <= '1';
			durasi <= 1;
		when FINISH =>
			coin   <= '0';
			durasi <= 0;
	end case;
end process;
		
--COIN <= '0' WHEN State=IDLE ELSE '1';
END rtl;
