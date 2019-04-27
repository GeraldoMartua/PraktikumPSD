library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_system is
port(
			hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7 : out std_logic_vector(6 downto 0);
			address_in : in std_logic_vector(4 downto 0);
			selector : in std_logic_vector(4 downto 0);
			input00 : in std_logic_vector(3 downto 0);
			input11 : in std_logic_vector(3 downto 0);
			q : out std_logic_vector(7 downto 0);
			key, en : in std_logic
		);
end entity;

architecture machine of alu_system is
			signal data_S : std_logic_vector(7 downto 0);
			signal result1_s, result2_S, result3_s, result4_s, result5_s : std_logic_vector(7 downto 0);
			signal dataout_s : std_logic_vector(7 downto 0);
			signal en_s : std_logic_vector(4 downto 0); 
			
			component adder
			port (
						input0 : in std_logic_vector(3 downto 0);
						input1 : in std_logic_vector(3 downto 0);
						clock	 : in std_logic;
						output : out std_logic_vector(4 downto 0)
			);
			end component;
			
			component subtractor
			port (
						input0 : in std_logic_vector(3 downto 0);
						input1 : in std_logic_vector(3 downto 0);
						clock	 : in std_logic;
						output : out std_logic_vector(4 downto 0)
			);
			end component;
			
			component divider
			port (
						input0 : in std_logic_vector(3 downto 0);
						input1 : in std_logic_vector(3 downto 0);
						clock	 : in std_logic;
						output : out std_logic_vector(4 downto 0)
			);
			end component;
			
			component multiplication
			port (
						input0 : in std_logic_vector(3 downto 0);
						input1 : in std_logic_vector(3 downto 0);
						clock	 : in std_logic;
						output : out std_logic_vector(7 downto 0)
			);
			end component;
			
			component factorial
			port( 
						vals 	: in  std_logic_vector(3 downto 0);
						clock : in  std_logic := '1';
						get 	: out  std_logic_vector(7 downto 0)
			);
			end component;
			
			component seseg
			port(
						bcd_seseg : in std_logic_vector(3 downto 0);
						out_seseg : out std_logic_vector(6 downto 0)
			);
			end component;
			
		begin
		
			ram32x8_inst : entity work.ram32x8 port map(
				address => address_in,
				clock => key,
				data => data_s,
				wren => en,
				q => dataout_s;
			);
		
			with selector select
				data_s	<= "0000" & result1_s(3 downto 0) when "10000",
								"0000" & result2_s(3 downto 0) when "01000",
								result3_s when "00100",
								"0000" & result4_s(3 downto 0) when "00010",
								result5_s when "00001",
								"00000000" when others;
				q <= dataout_s;
				
			adder_system : adder port map (input00, input11, key, selector(4), result1_s(3 downto 0));
			subtractor_system : substract port map (input00, input11, key, selector(3) result2_s(3 downto 0));
			divider_system : divider port map (input00, input11, key, selector(1) result4_s(3 downto 0));
			multiplication_system : multiplication port map (input00, input11, key, selector(2) result3_s);
			
			seseg0 : seseg port map (data_S(3 downto 0), hex0);
			seseg1 : seseg port map (data_s(7 downto 4), hex1);
			seseg2 : seseg port map ("0000", hex2);
			seseg3 : seseg port map (address_in(3 downto 0), hex3);
			seseg4 : seseg port map ("000" & address_in(4), hex4);
			seseg5 : seseg port map (dataout_S(3 downto 0), hex5);
			seseg6 : seseg port map (dataout_s(7 downto 4), hex6);
				
end architecture;