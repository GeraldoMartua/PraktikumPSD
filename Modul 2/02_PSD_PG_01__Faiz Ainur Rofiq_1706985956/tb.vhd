LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY tb  IS 
END ; 
 
ARCHITECTURE tb_arch OF tb IS
  SIGNAL max_selector   :  std_logic_vector (3 downto 0)  ; 
  SIGNAL sev1_out   :  std_logic_vector (6 downto 0)  ; 
  SIGNAL CLK   :  STD_LOGIC  ; 
  SIGNAL sev2_out   :  std_logic_vector (6 downto 0)  ; 
  SIGNAL DIR   :  STD_LOGIC  ; 
  COMPONENT counter  
    PORT ( 
      max_selector  : in std_logic_vector (3 downto 0) ; 
      sev1_out  : out std_logic_vector (6 downto 0) ; 
      CLK  : in STD_LOGIC ; 
      sev2_out  : out std_logic_vector (6 downto 0) ; 
      DIR  : in STD_LOGIC ); 
  END COMPONENT ; 
BEGIN
  DUT  : counter  
    PORT MAP ( 
      max_selector   => max_selector  ,
      sev1_out   => sev1_out  ,
      CLK   => CLK  ,
      sev2_out   => sev2_out  ,
      DIR   => DIR   ) ; 



-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 1 us, Period = 100 ns
  Process
	Begin
	 clk  <= '0'  ;
	wait for 50 ns ;
-- 50 ns, single loop till start period.
	for Z in 1 to 9
	loop
	    clk  <= '1'  ;
	   wait for 50 ns ;
	    clk  <= '0'  ;
	   wait for 50 ns ;
-- 950 ns, repeat pattern in loop.
	end  loop;
	 clk  <= '1'  ;
	wait for 50 ns ;
-- dumped values till 1 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  Process
	Begin
	 dir  <= '1'  ;
	wait for 1 us ;
-- dumped values till 1 us
	wait;
 End Process;


-- "Constant Pattern"
-- Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  Process
	Begin
	 max_selector  <= "0010"  ;
	wait for 1 us ;
-- dumped values till 1 us
	wait;
 End Process;
END;
