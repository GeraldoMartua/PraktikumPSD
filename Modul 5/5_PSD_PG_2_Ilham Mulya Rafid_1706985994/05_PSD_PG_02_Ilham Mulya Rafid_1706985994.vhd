---Ilham Mulya Rafid
---1706985994
---Modul 5 : Nomor 4

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieeE.std_logic_unsigned.ALL;

ENTITY Coin_Telephone IS
    PORT (  interrupt   : IN STD_LOGIC;
            coin        : IN STD_LOGIC;
            inputs      : IN STD_LOGIC;
            change      : OUT STD_LOGIC);
END Coin_Telephone;

ARCHITECTURE dataflow of Coin_Telephone is
    TYPE state_type IS ( start, digit_1, digit_2, digit_3, digit_4, call,
                         digit_5, digit_6, digit_7, digit_8 , done);
    SIGNAL current_state, next_state : state_type;
    BEGIN
        --Processing coin input
        process
            begin
                wait until coin = '1' and coin'event;
                current_state <= start;
        end process;
        --Processing after coin input
        process ( current_state, coin, interrupt, inputs )
        begin
            case current_state is
                when start      =>  if ( coin = '1' ) then next_state <= digit_1;
                                    else next_state <= start;
                                    end if;
                when digit_1    =>  if ( inputs = '1' ) then next_state <= digit_2;
                                    else next_state <= start;
                                    end if;
                when digit_2    =>  if ( inputs  = '1' ) then next_state <= digit_3;
                                    else next_state <= start;
                                    end if;
                when digit_3    =>  if ( inputs  = '1' ) then next_state <= digit_4;
                                    else next_state <= start;
                                    end if;
                when digit_4    =>  if ( inputs  = '1' ) then next_state <= digit_5;
                                    else next_state <= start;
                                    end if;
                when digit_5    =>  if ( inputs = '1' ) then next_state <= digit_6;
                                    else next_state <= start;
                                    end if;
                when digit_6    =>  if ( inputs  = '1' ) then next_state <= digit_7;
                                    else next_state <= start;
                                    end if;
                when digit_7    =>  if ( inputs  = '1' ) then next_state <= digit_8;
                                    else next_state <= start;
                                    end if;
                when digit_8    =>  if ( inputs  = '1' ) then next_state <= call;
                                    else next_state <= start;
                                    end if;
                when call       =>  if ( interrupt = '1' ) then next_state <= done;
                                    else next_state <= start;
                                    end if;
                when done       =>  if ( inputs = '1' ) then next_state <= start;
                                    else next_state <= start;
                                    end if;
            end case;
        end process;
        --Processing data output
        process ( current_state, coin, interrupt )
        begin
            case current_state is
                when start       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when done       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when call       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when digit_1    =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when digit_2       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when digit_3       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when digit_4       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when digit_5    =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when digit_6       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when digit_7       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
                when digit_8       =>  if ( coin = '0' and interrupt = '0') then change <= '0'; 
                                    elsif (coin = '0' and interrupt = '1') then change <= '0';
                                    elsif ( coin = '1' and interrupt = '0') then change <= '1';
                                    else change <= '1';
                                    end if;
            end case;
        end process;
END dataflow;
