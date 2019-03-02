library IEEE;
use IEEE.std_logic_1164.all;
 -- entity
entity program_utuh is
  port( Program_IN : in std_logic_vector(3 downto 0);
	Program_out : out std_logic_vector(6 downto 0));
end program_utuh;
 -- architecture
architecture kompilasi of program_utuh is

component mux4 is
port (D3,D2,D1,D0 : in std_logic_vector(3 downto 0);
MX_OUT : out std_logic_vector(3 downto 0);
MX_Sel : in std_logic_vector(3 downto 0)
);
end component;

component bcdto7seg is
port (
BCD_7in : in std_logic_vector(3 downto 0);
F7_OUT : out std_logic_vector(6 downto 0)
);
end component;

signal mux4_out : std_logic_vector(3 downto 0);
signal selec    : std_logic_vector(3 downto 0);
signal bcdto7seg_out : std_logic_vector(6 downto 0);
signal inD3, inD2, inD1, inD0 : std_logic_vector(3 downto 0);

begin

  -- deklarasi menggunakan komponen multiplexer
  x1: mux4 port map  (  D3 => inD3,  -- menyambungkan input ke input multiplexer
			D2 => inD2,
			D1 => inD1,
			D0 => inD0,
			MX_OUT => mux4_out,
			MX_Sel => selec);

  -- deklarasi menggunakan komponen multiplexer
  x2: bcdto7seg port map ( BCD_7in => mux4_out, -- input dari multiplexer menjadi input bcd ke 7-segment
			   F7_OUT => program_out); -- deklarisi output program yang adalah output 7-segmen

inD3 <= "0011";
inD2 <= "0010";
inD1 <= "0001";
inD0 <= "0000";

 -- fungsi dari multiplexer -------------------------------------------
 -- input program merupakan seleksi input dari komponen multiplexer
selec <= Program_IN;
 -- memilih input multiplexer untuk melewati output
 with selec select
mux4_out <=
  inD0 when "0000", -- 0
  inD1 when "0001", -- 1
  inD2 when "0010", -- 2
  inD3 when "0011", -- 3
  "1111" when others; -- turn off all LEDs
 ---------------------------------------------------------------------

 -- fungsi dari 7-segmen ---------------------------------------------
 -- memilih out 7-segmen yang akan ditampilkan berdasarkan output dari multiplexer
with mux4_out select
program_out <=
"0000001" when "0000", -- 0
"1001111" when "0001", -- 1
"0010010" when "0010", -- 2
"0000110" when "0011", -- 3
"1111111" when others; -- turn off all LEDs
  --------------------------------------------------------------------

end kompilasi;


