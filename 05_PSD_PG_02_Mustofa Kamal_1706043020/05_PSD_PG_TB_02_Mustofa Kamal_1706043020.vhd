LIBRARY ieee;
	USE ieee.std_logic_1164.ALL;
	ENTITY tb_ctelp Is
	END tb_ctelp;
	ARCHITECTURE behavior OF tb_ctelp IS
	-- Component Declaration for the Unit Under Test (UUT)
	 
	COMPONENT ctelp
	PORT(
	clk : IN std_logic;
	ic : IN std_logic;
	it : IN std_logic;
	tt : IN std_logic;
	tnj : IN std_logic;
	ib : IN std_logic;
	id : IN std_logic;
	rst : IN std_logic;
	ia : IN std_logic
	);
	END COMPONENT;
	 
	--Inputs
	signal clk : std_logic := '0';
	signal ic : std_logic := '0';
	signal rst : std_logic := '0';
	signal ia : std_logic := '0';
	signal id : std_logic := '0';
	signal ib : std_logic := '0';
	signal tt : std_logic := '0';
	signal it : std_logic := '0';
	signal tnj : std_logic := '0';
	 
	
	 
	-- Clock period definitions
	constant clk_period : time := 20 ns;
	 
	BEGIN
	 
	-- Instantiate the Unit Under Test (UUT)
	uut: ctelp PORT MAP (
	clk => clk,
	rst => rst,
	ic => ic, 
	ia => ia,
	it => it,
	tt => tt,
	tnj => tnj,
	ib => ib,
	id => id
	
	);
	 
	-- Clock process definitions
	clk_process :process
	begin
	clk <= '0';
	wait for clk_period/2;
	clk <= '1';
	wait for clk_period/2;

	end process;
	 
	-- Stimulus process
	stim_proc: process
	begin
	rst <= '1';
	wait for 100 ns;
	rst <= '0';
	--Skenario: Angkat telp, Masukan koin, isi no.,tunggu , tunggu jawaban, diangkat, biacara, waktu habis
	ic <= '1';
	ia <= '1';
	wait for 20 ns;
	it <= '1';
	tt <= '1';
	wait for 20 ns;
	it <= '1';
	tt <= '0';
	wait for 20 ns;
	id <= '0';
	tnj <= '1';
	wait for 20 ns;
	id <= '1';
	wait for 20 ns;
	ib <= '1';
	ia <= '1';
	wait for 20 ns;
	ib <= '0';

	end process;
	END;
