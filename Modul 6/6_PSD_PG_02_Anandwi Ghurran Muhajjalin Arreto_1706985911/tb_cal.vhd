LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY tb_cal IS
	PORT(	choice			: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			data1, data2	: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			addr				: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
			key, wren		: IN STD_LOGIC;
			q					: OUT STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
			hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7	: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END tb_cal;

ARCHITECTURE calculator OF tb_cal IS
	SIGNAL data,hsl1,hsl2,hsl3,hsl4,hsl5	:	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL data_out			: 	STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL enable 				: 	STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
	
	COMPONENT sevensegment
		PORT
		(
			bcd		: IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
			sev		: OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT ADDER
		PORT
		(
			NUM1, NUM2	:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			CLK	: 	IN		STD_LOGIC := '1';
			EN		:	IN		STD_LOGIC;
			RES	: 	OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT Subtract
		PORT
		(
			NUM1, NUM2	:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			CLK	: 	IN		STD_LOGIC := '1';
			EN		:	IN		STD_LOGIC;
			RES	: 	OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT Multiply
		PORT
		(
			NUM1, NUM2	:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			CLK	: 	IN		STD_LOGIC := '1';
			EN		:	IN		STD_LOGIC;
			RES	: 	OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT Divider
		PORT
		(
			NUM1, NUM2	:	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			CLK	: 	IN		STD_LOGIC := '1';
			EN		:	IN		STD_LOGIC;
			RES	: 	OUT 	STD_LOGIC_VECTOR(3 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT Factorial
		PORT
		(
			NUM	: 	IN		STD_LOGIC_VECTOR(3 DOWNTO 0);
			CLK	: 	IN		STD_LOGIC := '1';
			EN		:	IN		STD_LOGIC;
			RES	: 	OUT 	STD_LOGIC_VECTOR(7 DOWNTO 0)
		);
	END COMPONENT;
	
	BEGIN
	
		RAM8x32_inst : 
		ENTITY WORK.RAM8x32 PORT MAP (
			address	 => addr,
			clock	 => key,
			data	 => data,
			wren	 => wren,
			q	 => data_out
		);
		
		WITH choice SELECT
			data <= "0000"&hsl1(3 DOWNTO 0) WHEN "10000",
					  "0000"&hsl2(3 DOWNTO 0) WHEN "01000",
					  hsl3 WHEN "00100",
					  "0000"&hsl4(3 DOWNTO 0) WHEN "00010",
					  hsl5 WHEN "00001",
					  "00000000" WHEN OTHERS;
			
		q <= data_out;		
					 
		add1	: ADDER PORT MAP (data1, data2, key, choice(4), hsl1(3 DOWNTO 0));
		sub2	: Subtract PORT MAP (data1, data2, key, choice(3), hsl2(3 DOWNTO 0));
		mul3	: Multiply PORT MAP (data1, data2, key, choice(2), hsl3);
		div4	: Divider PORT MAP (data1, data2, key, choice(1), hsl4(3 DOWNTO 0));
		fact5	: Factorial PORT MAP (data1, key, choice(0), hsl5);
		
		sevseg1	: sevensegment PORT MAP (data(3 DOWNTO 0), hex0); 
		sevseg2	: sevensegment PORT MAP (data(7 DOWNTO 4), hex1);
		sevseg3	: sevensegment PORT MAP ("0000", hex2);
		sevseg4	: sevensegment PORT MAP (addr(3 DOWNTO 0), hex3);
		sevseg5	: sevensegment PORT MAP ("000"&addr(4), hex4);
		sevseg6	: sevensegment PORT MAP (data_out(3 DOWNTO 0), hex5);
		sevseg7	: sevensegment PORT MAP (data_out(7 DOWNTO 4), hex6);
		
	
END calculator;	