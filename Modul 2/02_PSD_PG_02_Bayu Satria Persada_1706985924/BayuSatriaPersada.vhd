LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY SEVSEG2 IS
PORT(

	A : out STD_LOGIC;--output sevseg A
	B : OUT STD_LOGIC;--output sevseg b
	C : OUT STD_LOGIC;--output sevseg C
	D : out STD_LOGIC;--output sevseg D
	E : OUT STD_LOGIC;--output sevseg E
	F : OUT STD_LOGIC;--output sevseg F
	G : out STD_LOGIC;--output sevseg G
 counting : inout std_logic_vector(3 downto 0);
 naik,turun,clk : in std_logic

	);
	end SEVSEG2;
	
	
architecture BCD2 of SEVSEG2 is
component counter1 is
port(
	NAIK,TURUN : IN STD_LOGIC; --port dari sevseg untuk naik turun
	CLK : IN STD_LOGIC; --port clk dari sevseg 
	KELUARAN : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));--port untuk keluaran dalam 4 bit nilai bcd 0 - 9
end component;

	begin
	countah : counter1
	port map(
		NAIK => naik,--memberikan port naik dari counter ke signal naik
		TURUN => turun,--memberikan port turun dari counter ke signal turun
		CLK => clk, --memberikan port clk ke port clk di sevseg
		KELUARAN => counting);--memasukan output dari counter sebagai signal di sevseg
	process (counting)
	begin
		
		CASE counting IS --decoder sev seg function dari fungsi port keluaran counter
			WHEN "0000" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '1';
				E <= '1';
				F <= '1';
				G <= '0';

				WHEN "0001" =>
				A <= '0';
				B <= '1';
				C <= '1';
				D <= '0';
				E <= '0';
				F <= '0';
				G <= '0';			
				WHEN "0010" =>
				A <= '1';
				B <= '1';
				C <= '0';
				D <= '1';
				E <= '1';
				F <= '0';
				G <= '1';	
				WHEN "0011" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '1';
				E <= '0';
				F <= '0';
				G <= '1';		
				WHEN "0100" =>
				A <= '0';
				B <= '1';
				C <= '1';
				D <= '0';
				E <= '0';
				F <= '1';
				G <= '1';	
				WHEN "0101" =>
				A <= '1';
				B <= '0';
				C <= '1';
				D <= '1';
				E <= '0';
				F <= '1';
				G <= '1';	
				WHEN "0110" =>
				A <= '1';
				B <= '0';
				C <= '1';
				D <= '1';
				E <= '1';
				F <= '1';
				G <= '1';
			WHEN "0111" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '0';
				E <= '0';
				F <= '0';
				G <= '0';		
				WHEN "1000" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '1';
				E <= '1';
				F <= '1';
				G <= '1';	
				WHEN "1001" =>
				A <= '1';
				B <= '1';
				C <= '1';
				D <= '1';
				E <= '0';
				F <= '1';
				G <= '1';
			WHEN OTHERS =>
				A <= '-';
				B <= '-';
				C <= '-';
				D <= '-';
				E <= '-';
				F <= '-';
				G <= '-';	
			END CASE;
	End Process;
	end architecture;
		
