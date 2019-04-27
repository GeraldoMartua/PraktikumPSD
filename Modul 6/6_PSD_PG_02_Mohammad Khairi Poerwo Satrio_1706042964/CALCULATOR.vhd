library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_Std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Calculator IS
	port( 	CHOICE           : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		DIN1             : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		DIN2             : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		Enable           : IN STD_LOGIC;
		Clock              : IN STD_LOGIC;
        	temp0,temp1,temp2,temp3,temp4,temp5,temp6,temp7 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
end entity Calculator;

ARCHITECTURE dataflow OF Calculator IS
    	SIGNAL CLK        	: STD_LOGIC;
    	SIGNAL ADDRESS      : STD_LOGIC_VECTOR(4 DOWNTO 0);
    	SIGNAL ENABLER      : STD_LOGIC;
    	SIGNAL DataOut         : STD_LOGIC_VECTOR(7 DOWNTO 0);
    	SIGNAL DATA         : STD_LOGIC_VECTOR(7 DOWNTO 0);
    	SIGNAL DataIn1      : STD_LOGIC_VECTOR(3 downto 0);
    	SIGNAL DataIn2      : STD_LOGIC_VECTOR(3 downto 0);
    	SIGNAL data_add1 : STD_LOGIC_VECTOR(4 downto 0);
    	SIGNAL data_add2 : STD_LOGIC_VECTOR(4 downto 0);
    	SIGNAL data_add3 : STD_LOGIC_VECTOR(7 downto 0);
    	SIGNAL data_add4 : STD_LOGIC_VECTOR(4 downto 0);
    	SIGNAL data_add5 : STD_LOGIC_VECTOR(7 downto 0);
    	SIGNAL case1    : STD_LOGIC_VECTOR(3 downto 0);
    	SIGNAL case2    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    	SIGNAL case3    : STD_LOGIC_VECTOR(7 DOWNTO 0);
    	SIGNAL case4    : STD_LOGIC_VECTOR(7 DOWNTO 0);

	COMPONENT sevseg
    	PORT (  datain : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            	display : OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
    	END COMPONENT;

    	COMPONENT TAMBAH
    	port(   input1  : in std_logic_vector(3 downto 0);
            	input2  : in std_logic_vector(3 downto 0);
            	clock   : in std_logic;
            	dataout : out std_logic_vector(4 downto 0));
    	END COMPONENT;

    	COMPONENT KURANG
    	port(   input1  : in std_logic_vector(3 downto 0);
      	      	input2  : in std_logic_vector(3 downto 0);
    	        clock   : in std_logic;
        	    dataout : out std_logic_vector(4 downto 0));
  	  end component;
	
    	COMPONENT KALI
	port(   input1  : in std_logic_vector(3 downto 0);
        	input2  : in std_logic_vector(3 downto 0);
  	        clock   : in std_logic;
        	dataout : out std_logic_vector(7 downto 0));
  	  end component;

    BEGIN  
        CLK     <= Clock;
        Enabler <= Enable;
        DataIn1 <= DIN1;
        DataIn2 <= DIN2;
        ADDRESS <= CHOICE;
        case1   <= "000" & address(4);
        case2   <= "000" & data_add1;
        case3   <= "000" & data_add2;
        case4   <= "000" & data_add4;

        WITH CHOICE SELECT
                    data  <= case2      WHEN "00000",
                             case3      WHEN "00001",
                             data_add3  WHEN "00010",
                             case4      WHEN "00011",
                             data_add5  WHEN "00100",
                             "00000000" WHEN OTHERS;
                     
        RAM_Assigment : ENTITY work.ram32x8 PORT MAP (
                address	 => address,
                clock	 => clk,
                data	 => data,
                wren	 => enabler,
                q	 => dout
            );

        add : TAMBAH PORT MAP (datain1, datain2, clk, data_add1);
        sub : KURANG PORT MAP (datain1, datain2, clk, data_add2);
        mul : KALI PORT MAP (datain1, datain2, clk, data_add3);
        
        sevseg0     : sevensegment PORT MAP(address(3 DOWNTO 0), temp0);
        sevseg1     : sevensegment PORT MAP(case1, temp1);
        sevseg2     : sevensegment PORT MAP(data(3 DOWNTO 0),temp2);
        sevseg3     : sevensegment PORT MAP(data(7 DOWNTO 4),temp3); 
        sevseg4     : sevensegment PORT MAP(dout(3 DOWNTO 0),temp4); 
        sevseg5     : sevensegment PORT MAP(dout(7 DOWNTO 4),temp5);
        sevseg6     : sevensegment PORT MAP("0000",temp6);
        sevseg7     : sevensegment PORT MAP("0000",temp7);
        
END Calculator;
