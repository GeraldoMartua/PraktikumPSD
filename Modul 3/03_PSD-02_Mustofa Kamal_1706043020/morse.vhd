library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cmorse is
	port (	clk	: in std_logic;
		reset	: in std_logic := '0' ;
		morse	: out std_logic
		);
end cmorse;

architecture code of cmorse is
	signal	rclk	: std_logic := '1';
	signal	period	: time := 500 ms;
	signal 	tmp	: std_logic_vector(0 to 3);
	signal	huruf	: integer:=2;
	signal	nama	: string (1 to 10):="Hai Joshua"; --ganti angka 13 sesuai panjang nama+4
	signal  no	: integer :=0;
	
	begin
	process(rclk, huruf)

		begin
--		if rising_edge(clk) then
--			count <= count + 1;
--			if(count=2) then
--				count <= 0;
				
--			end if;
--		end if;
		if falling_edge(rclk) then
			if no=0 then
				huruf <= 0; 
				--morse <= rclk;
			end if;
			if no=1 then
				huruf <= 0;
			end if;
			if no=2 then
				huruf <= 0; 
				
			end if;
			if no=3 then
				huruf <= 0;
			end if;
				--	h
			if no=4 then
				huruf <= 0; 
				--morse <= rclk;
			end if;
			if no=5 then
				huruf <= 1;
			end if;--a
			if no=6 then
				huruf <= 0;
			end if;
			if no=7 then
				huruf <= 0;
			end if;--i
			if no=8 then
				huruf <= 0;
			end if;
			if no=9 then
				huruf <= 0;
			end if;--spasi
			if no=10 then
				huruf <= 0;
			end if;
			if no=11 then
				huruf <= 0;
			end if;
			if no=12 then
				huruf <= 0;
			end if;
			if no=13 then
				huruf <= 0;
			end if;
		end if;
		if rising_edge(rclk) then
			if no=0 then
				huruf <= 2;
			end if;
			if no=1 then
				huruf <= 2;
			end if;
			if no=2 then
				huruf <= 2;
			end if;
			if no=3 then
				huruf <= 2;
			end if;
			if no=4 then
				huruf <= 2;
			end if;
			if no=5 then
				huruf <= 2;
			end if;
			if no=6 then
				huruf <= 2;
			end if;
			if no=7 then
				huruf <= 2;
			end if;
			if no=8 then
				huruf <= 2;
			end if;
			if no=9 then
				huruf <= 2;
			end if;
			if no=10 then
				huruf <= 2;
			end if;
			if no=11 then
				huruf <= 2;
			end if;
			if no=12 then
				huruf <= 2;
			end if;
			if no=13 then
				huruf <= 2;
			end if;
			if no=14 then
				huruf <= 2;
			end if;
			no<=no+1;
		end if; 
	end process;
	with huruf select
		period 	<=	1000 ms when 0,
				2000 ms when 1,
				500 ms when 2,
				1000 ms	when others;

	rclk 	<= not rclk after period;

	--morse	<= rclk;
	
	
	
end code;

