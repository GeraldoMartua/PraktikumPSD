library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity mux4x1 is
end entity;
 
architecture system of mux4x1 is
 
    signal a : unsigned(7 downto 0);
    signal b : unsigned(7 downto 0);
    signal c : unsigned(7 downto 0);
    signal d : unsigned(7 downto 0);
    signal sel : unsigned(1 downto 0) := (others => '0');
    signal output : unsigned(7 downto 0);
 
begin
 
    -- MUX using if-then-else
    process(sel, a, b, c, d) is
    begin
 
        if Sel = "00" then
            output <= a;
        elsif Sel = "01" then
            output <= b;
        elsif Sel = "10" then
            output <= c;
        elsif Sel = "11" then
            output <= d;
        else -- 'U', 'X', '-' etc.
            output <= (others => 'X');
        end if;
 
    end process;
 
end system;

entity binary_bcd is
    generic(N: positive := 16);
    port( 
	clk, reset: in std_logic;
        signal: binary_in:= in std_logic_vector(N-1 downto 0);
        signal: bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0);
    );
end binary_bcd ;

architecture behaviour of binary_bcd is
    type states is (start, shift, done);
    signal state, state_next: states;

    signal binary, binary_next: std_logic_vector(N-1 downto 0);
    signal bcds, bcds_reg, bcds_next: std_logic_vector(19 downto 0);
    -- output register keep output constant during conversion
    signal bcds_out_reg, bcds_out_reg_next: std_logic_vector(19 downto 0);
    -- need to keep track of shifts
    signal shift_counter, shift_counter_next: natural range 0 to N;
begin

    process(clk, reset)
    begin
        if reset = '1' then
            binary <= (others => '0');
            bcds <= (others => '0');
            state <= start;
            bcds_out_reg <= (others => '0');
            shift_counter <= 0;
        elsif falling_edge(clk) then
            binary <= binary_next;
            bcds <= bcds_next;
            state <= state_next;
            bcds_out_reg <= bcds_out_reg_next;
            shift_counter <= shift_counter_next;
        end if;
    end process;

    convert:
    process(state, binary, binary_in, bcds, bcds_reg, shift_counter)
    begin
        state_next <= state;
        bcds_next <= bcds;
        binary_next <= binary;
        shift_counter_next <= shift_counter;

        case state is
            when start =>
                state_next <= shift;
                binary_next <= binary_in;
                bcds_next <= (others => '0');
                shift_counter_next <= 0;
            when shift =>
                if shift_counter = N then
                    state_next <= done;
                else
                    binary_next <= binary(N-2 downto 0) & 'L';
                    bcds_next <= bcds_reg(18 downto 0) & binary(N-1);
                    shift_counter_next <= shift_counter + 1;
                end if;
            when done =>
                state_next <= start;
        end case;
    end process;

    bcds_reg(19 downto 16) <= bcds(19 downto 16) + 3 when bcds(19 downto 16) > 4 else
                              bcds(19 downto 16);
    bcds_reg(15 downto 12) <= bcds(15 downto 12) + 3 when bcds(15 downto 12) > 4 else
                              bcds(15 downto 12);
    bcds_reg(11 downto 8) <= bcds(11 downto 8) + 3 when bcds(11 downto 8) > 4 else
                             bcds(11 downto 8);
    bcds_reg(7 downto 4) <= bcds(7 downto 4) + 3 when bcds(7 downto 4) > 4 else
                            bcds(7 downto 4);
    bcds_reg(3 downto 0) <= bcds(3 downto 0) + 3 when bcds(3 downto 0) > 4 else
                            bcds(3 downto 0);

    bcds_out_reg_next <= bcds when state = done else
                         bcds_out_reg;

    bcd4 <= bcds_out_reg(19 downto 16);
    bcd3 <= bcds_out_reg(15 downto 12);
    bcd2 <= bcds_out_reg(11 downto 8);
    bcd1 <= bcds_out_reg(7 downto 4);
    bcd0 <= bcds_out_reg(3 downto 0);

end behaviour;

entity bcd_7segment is
Port ( B0,B1,B2,B3 : in STD_LOGIC;
A,B,C,D,E,F,G : out STD_LOGIC);
end bcd_7segment;

architecture arc of bcd_7segment is

begin

A <= B0 OR B2 OR (B1 AND B3) OR (NOT B1 AND NOT B3);
B <= (NOT B1) OR (NOT B2 AND NOT B3) OR (B2 AND B3);
C <= B1 OR NOT B2 OR B3;
D <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3) OR (B1 AND NOT B2 AND B3) OR (NOT B1 AND B2) OR B0;
E <= (NOT B1 AND NOT B3) OR (B2 AND NOT B3);
F <= B0 OR (NOT B2 AND NOT B3) OR (B1 AND NOT B2) OR (B1 AND NOT B3);
G <= B0 OR (B1 AND NOT B2) OR ( NOT B1 AND B2) OR (B2 AND NOT B3);

end arc;