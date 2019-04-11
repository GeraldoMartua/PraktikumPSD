library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	 
	entity ctelp is
	Port ( 	clk : in STD_LOGIC;
		ic : in STD_LOGIC;		--indikator coin masuk
		ia : in STD_LOGIC;		--indikator telp di angkat gagangnya
		it : in STD_LOGIC;		--indikator input no. telp
		rst : in STD_LOGIC;		--reset state ke idle
		tt : in STD_LOGIC;		--indikator waktu input habis
		tnj: in STD_Logic;		--indikator waktu nunggu habis
		ib : in STD_LOGIC;		--indikator waktu bicara habis
		id : in STD_LOGIC);		--indikator dijawab
	end ctelp;
	 
	architecture Behavioral of ctelp is
	type state is (s0, s1, s2, s3);
	signal present_state, next_state : state;
	begin
	 
	transisi_state : process (clk)
	begin
	if rising_edge(clk) then
	if (rst = '1') then
	present_state <= s0;
	else
	present_state <= next_state;
	end if;
	end if;
	end process;
	 
	next_state_and_output : process(present_state, clk)
	begin
	 
case (present_state) is 
when s0 =>
	if (ic = '0' or ia = '0') then
	next_state <= s0;
	else
	next_state <= s1;
	end if; 
when s1 =>
	if (tt= '0' and it = '1') then
	next_state <= s2;
	
	elsif(tt = '1') then
	next_state <= s1;
	 
	else
	next_state <= s0;
	end if;  
when s2 =>
	if (tnj = '1' and id = '0') then
	next_state <= s2;
	elsif(id = '1') then
	next_state <= s3;
	else
	next_state <= s0;
	end if;
when s3 =>
	if(ib = '1' and ia = '1') then
	next_state <= s3;
	else
	next_state <= s0;
	end if;
	end case;
	end process;
	end Behavioral;
