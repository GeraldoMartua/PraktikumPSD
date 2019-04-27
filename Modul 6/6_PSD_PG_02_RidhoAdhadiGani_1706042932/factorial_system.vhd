library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity factorial_system is
port( hex0, hex1, hex2, hex3, hex4, hex5, hex6, hex7 : out std_logic_vector(6 downto 0));
		data  : in std_logic_vector(3 downto 0);
		addr  : in std_logic_vector(4 downto 0);
		key, wren: in std_logic;
		q   : out std_logic_vector(7 downto 0);
end entity;

architecture machine of factorial_system is
		signal hsl : std_logic_vector(7 downto 0);
 
		component seseg
		port(
				bcd_seseg : in std_logic_vector(3 downto 0);
				out_seseg : out std_logic_vector(6 downto 0)
		);
		end component;
 
		component factorial
		port( 
				vals 	: in  std_logic_vector(3 downto 0);
				clock : in  std_logic := '1';
				get 	: out  std_logic_vector(7 downto 0)
		);
		end component;
 
begin
ram32x8_inst : entity work.ram32x8 port map(
		address => address_s,
		clock => clock_s,
		data => data_s,
		wren => en_s,
		q => q_s
);
 
fact : factorial port map (data, key, hsl);
end architecture;
