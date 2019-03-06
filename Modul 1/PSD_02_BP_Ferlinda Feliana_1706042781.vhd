library ieee; 
use ieee.std_logic_1164.all; 
 
entity mux7seg is 
  port (
        button : in std_logic_vector (3 downto 0); --ada empat button yang dipakai karena multiplexer 4-to-1
		a_ke_g : out std_logic_vector (6 downto 0); --sebagai penyimpan tiap bagian seven-segment abcdefg
        an : out std_logic_vector(3 downto 0);	--untuk memilih multiplexer display yang akan dipakai, dimana ada 4 display seven-segment
		dp : out std_logic); --nantinya untuk turn off decimal point
end mux7seg; 

architecture sevenseg of mux7seg is
 
signal x: std_logic_vector (15 downto 0);
signal s: std_logic_vector (1 downto 0);
signal digit: std_logic_vector (3 downto 0);

begin
		
		x<= X"1234"; --ubah sesuai dengan angka yang ingin ditampilkan ke 4 display seven-segment
		--anggap 1234=dcba dimana 1=d, 2=c, 3=b, dan 4=a
		
		an<= not button;
		s(1)<=button(2) or button(3); --selector kedua multiplexer
		s(0)<=button(1) or button(3); --selector pertama multiplexer
		--kedua selector ini akan menentukan output multiplexer, apakah
		dp <= '1';
		
		--proses seleksi multiplexer
		process(s)
		begin
			case s is
				when "00"=> digit<=x(3 downto 0); 
				when "01"=> digit<=x(7 downto 4);
				when "10"=> digit<=x(11 downto 8);
				when others=> digit<=x(15 downto 12);
			end case;
		end process;
		
		--proses mengambil digit a/b/c/d dari button untuk ditampilkan dalam seven-segment
		process(digit)
		begin
			case digit is
				when X"0"=> a_ke_g<="0000001";
				when X"1"=> a_ke_g<="1001111";
				when X"2"=> a_ke_g<="0010010";
				when X"3"=> a_ke_g<="0000110";
				when X"4"=> a_ke_g<="1001100";
				when X"5"=> a_ke_g<="0100100";
				when X"6"=> a_ke_g<="0100000";
				when X"7"=> a_ke_g<="0001111";
				when X"8"=> a_ke_g<="0000000";
				when X"9"=> a_ke_g<="0000100";
				when X"A"=> a_ke_g<="0001000";
				when X"B"=> a_ke_g<="1100000";
				when X"C"=> a_ke_g<="0110001";
				when X"D"=> a_ke_g<="1000010";
				when X"E"=> a_ke_g<="0110000";
				when others=> a_ke_g<="0111000";
			end case;
		end process;
end sevenseg;


