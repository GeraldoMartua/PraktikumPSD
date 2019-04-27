LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

LIBRARY lpm;
USE lpm.lpm_components.ALL;

ENTITY VHDL_CPU IS

PORT( 	clock, nReset				 				:IN STD_LOGIC;
		data_in										:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		data_out									:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		address_out									:OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		IRQ											:IN STD_LOGIC;
		IACK										:OUT STD_LOGIC;
		nRead, nWrite								:OUT STD_LOGIC
	);

END VHDL_CPU;

ARCHITECTURE CPU_BEHAVIOUR OF VHDL_CPU IS


TYPE STATE_TYPE IS (reset_cpu, reset_cpu_2, reset_cpu_3, halt, NOP,
					fetch_instr, fetch_instr_2, decode_instr, inca, deca, incx, 
					decx, shl, shr, rolc, rorc, setim, clrim, popa, popa_2, popa_3,
					popsr, popsr_2,popsr_3, pusha, pusha_2, push_3, push_4, pushsr,
					pushsr_2, add, add_2, add_3, addc, addc_2, addc_3, rts, rts_2, rts_3,
					rts_4, rts_5, rts_6, rti, rti_2, rti_3, rti_4, rti_5, rti_6, rti_7,
					rti_8, sub, sub_2, sub_3, subc, subc_2, subc_3, and_op, and_op2, 
					and_op3, or_op, or_op2, or_op3, xor_op, xor_op2, xor_op3, cmpa, cmpa_2,
					cmpa_3, lda, lda_2, bldiv, bldiv_2, bldiv_3, bldiv_4, bldiv_5, bldsp, 
					bldsp_2, bldsp_3, bldsp_4, bldsp_5, bldx, bldx_2, bldx_3, bldx_4, bldx_5,
					ABS_GP1, ABS_GP1_2, ABS_GP1_3, ABS_GP1_4, ABS_GP1_5, ABS_GP1_6, ABS_GP1_7,
					ABS_GP1_8, lda_abs, lda_abs_2, lda_abs_3, lda_abs_4, lda_abs_5, lda_abs_6,
					lda_abs_7, sta_abs, sta_abs_2, sta_abs_3, sta_abs_4, sta_abs_5, sta_abs_6,
					sta_abs_7, sta_abs_8, jmp_abs, jmp_abs2, jmp_abs3, jmp_abs4, jmp_abs5, jsr_abs,
					jsr_abs2, jsr_abs3, jsr_abs4, jsr_abs5, jsr_abs6, jsr_abs7, jsr_abs8, jsr_abs9,
					jsr_abs10, jc, jnc, jz, jnz, jo, jno, jn, jnn, ABS_GP6_2, ABS_GP6_3, ABS_GP6_4,
					ABS_GP6_5, FAIL_1, BAB_GP1, BAB_GP1_2, BAB_GP1_3, BAB_GP1_4, BAB_GP1_5, BAB_GP1_6,
					BAB_GP1_7, BAB_GP1_8, BAB_GP1_9, BAB_GP2, BAB_GP2_2, BAB_GP2_3, BAB_GP2_4,
					BAB_GP2_5, BAB_GP2_6, BAB_GP2_7, BAB_GP2_8, BAB_GP2_9, BAB_GP2_10, BAB_GP2_11,
					IND_GP1, IND_GP1_2, IND_GP1_3, IND_GP1_4, IND_GP1_5, IND_GP1_6, IND_GP1_7,
					IND_GP1_8, lda_absx, lda_absx_2, lda_absx_3, lda_absx_4, lda_absx_5, lda_absx_6,
					lda_absx_7, sta_absx, sta_absx_2, sta_absx_3, sta_absx_4, sta_absx_5, sta_absx_6,
					sta_absx_7, sta_absx_8, jmp_absx, jmp_absx_2, jmp_absx_3, jmp_absx_4, jmp_absx_5,
					jmp_absx_6, jsr_absx, jsr_absx_2, jsr_absx_3, jsr_absx_4, jsr_absx_5, jsr_absx_6,
					jsr_absx_7, jsr_absx_8, jsr_absx_9, jsr_absx_10, jsr_absx_11, jsr_absx_12,
					lda_ind, lda_ind_2, lda_ind_3, lda_ind_4, lda_ind_5, lda_ind_6, lda_ind_7,
					lda_ind_8, lda_ind_9, lda_ind_10, lda_ind_11, lda_ind_12, sta_ind, sta_ind_2,
					sta_ind_3, sta_ind_4, sta_ind_5, sta_ind_6, sta_ind_7, sta_ind_8, sta_ind_9,
					sta_ind_10, sta_ind_11, sta_ind_12, sta_ind_13, jmp_ind, jmp_ind_2, jmp_ind_3,
					jmp_ind_4, jmp_ind_5, jmp_ind_6, jmp_ind_7, jmp_ind_8, jmp_ind_9, jmp_ind_10,
					jsr_ind, jsr_ind_2, jsr_ind_3, jsr_ind_4, jsr_ind_5, jsr_ind_6, jsr_ind_7,
					jsr_ind_8, jsr_ind_9, jsr_ind_10, jsr_ind_11, jsr_ind_12, jsr_ind_13, jsr_ind_14,
					jsr_ind_15, jsr_ind_16, lda_pind, lda_pind_2, lda_pind_3, lda_pind_4, lda_pind_5,
					lda_pind_6, lda_pind_7, lda_pind_8, lda_pind_9, lda_pind_10, lda_pind_11, lda_pind_12,
					sta_pind, sta_pind_2, sta_pind_3, sta_pind_4, sta_pind_5, sta_pind_6, sta_pind_7,
					sta_pind_8, sta_pind_9, sta_pind_10, sta_pind_11, sta_pind_12, sta_pind_13,
					jmp_pind, jmp_pind_2, jmp_pind_3, jmp_pind_4, jmp_pind_5, jmp_pind_6, jmp_pind_7,
					jmp_pind_8, jmp_pind_9, jmp_pind_10, jsr_pind, jsr_pind_2, jsr_pind_3, jsr_pind_4,
					jsr_pind_5, jsr_pind_6, jsr_pind_7, jsr_pind_8, jsr_pind_9, jsr_pind_10, jsr_pind_11,
					jsr_pind_12, jsr_pind_13, jsr_pind_14, jsr_pind_15, jsr_pind_16, lda_indp, 
					lda_indp_2, lda_indp_3, lda_indp_4, lda_indp_5, lda_indp_6, lda_indp_7, lda_indp_8,
					lda_indp_9, lda_indp_10, lda_indp_11, lda_indp_12, sta_indp, sta_indp_2, sta_indp_3,
					sta_indp_4, sta_indp_5, sta_indp_6, sta_indp_7, sta_indp_8, sta_indp_9, sta_indp_10,
					sta_indp_11, sta_indp_12, sta_indp_13, jmp_indp, jmp_indp_2, jmp_indp_3, jmp_indp_4,
					jmp_indp_5, jmp_indp_6, jmp_indp_7, jmp_indp_8, jmp_indp_9, jmp_indp_10, jmp_indp_11,
					jsr_indp, jsr_indp_2, jsr_indp_3, jsr_indp_4, jsr_indp_5, jsr_indp_6, jsr_indp_7,
					jsr_indp_8, jsr_indp_9, jsr_indp_10, jsr_indp_11, jsr_indp_12, jsr_indp_13, jsr_indp_14,
					jsr_indp_15, jsr_indp_16, jsr_indp_17);

SIGNAL state												:STATE_TYPE;

SIGNAL IR_reg, ACCUMULATOR, TMP								:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ADDRESS_reg											:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL PC_reg, TPCA_reg, TPCB_reg, SP_reg, IV_reg, X_reg	:STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL write, read											:STD_LOGIC;
SIGNAL DATA_reg, DATA_IN_reg								:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL STAT_C, STAT_Z, STAT_N, STAT_O, STAT_I				:STD_LOGIC;
SIGNAL ADD_TEMP9, TMP1, TMP2								:STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL ADD_TEMP8, TMP3, TMP4								:STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL temp													:STD_LOGIC;

BEGIN

PROCESS (clock, nReset)
	BEGIN
	IF nReset = '0' THEN
		state <= reset_cpu;
	ELSIF clock'EVENT AND clock = '1' THEN
		
		CASE state IS
		WHEN reset_cpu =>
				PC_reg										<= "0000000000000001";
				TPCA_reg									<= "0000000000000000";
				TPCB_reg									<= "0000000000000000";
				SP_reg										<= "0000000000000000";
				IV_reg										<= "0000000000000000";
				X_reg										<= "0000000000000000";
				DATA_reg				 					<= "00000000";
				ADDRESS_reg									<= "0000000000000000";
				IR_reg										<= "00000000";
				ACCUMULATOR									<= "00000000";
				TMP											<= "00000000";
				write										<= '1';
				read										<= '1';
				
				STAT_C										<= '0';
				STAT_Z										<= '0';
				STAT_N										<= '0';
				STAT_O										<= '0';
				STAT_I										<= '0';
				
				temp										<= '0';
								
				state <= reset_cpu_2;
			
		WHEN reset_cpu_2 =>
			read <= '0';
			state <= reset_cpu_3;
			
		WHEN reset_cpu_3 =>
			read <= '1';
			IR_reg <= DATA_IN_reg;
			
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= decode_instr;	
						
		WHEN fetch_instr =>
			read <= '0';
			state <= fetch_instr_2;
			
		WHEN fetch_instr_2 =>
			IR_reg <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= decode_instr;
			
		WHEN decode_instr =>
			CASE IR_reg IS
				WHEN "00000000" =>
					state <= NOP;
				WHEN "00000001" =>
					state <= halt;
				WHEN "10000000" =>
					state <= inca;
				WHEN "10000001" =>
					state <= deca;
				WHEN "10000010" =>
					state <= incx;
				WHEN "10000011" =>
					state <= decx;
				WHEN "01110000" =>
					state <= shl;
				WHEN "01110001" =>
					state <= shr;
				WHEN "01111000" =>
					state <= rolc;
				WHEN "01111001" =>
					state <= rorc;
				WHEN "00001000" =>
					state <= setim;
				WHEN "00001001" =>
					state <= clrim;
				WHEN "10110000" =>
					state <= popa;
				WHEN "10110001" =>
					state <= popsr;
				WHEN "10110010" =>
					state <= pusha;
				WHEN "10110011" =>
					state <= pushsr;
				WHEN "11001111" =>
					state <= rts;
				WHEN "11000111" =>
					state <= rti;
				WHEN "00010000" =>
					state <= add;
				WHEN "00011000" =>
					state <= addc;
				WHEN "00100000" =>
					state <= sub;
				WHEN "00101000" =>
					state <= subc;
				WHEN "00110000" =>
					state <= and_op;
				WHEN "00111000" =>
					state <= or_op;
				WHEN "01000000" =>
					state <= xor_op;
				WHEN "01100000" =>
					state <= cmpa;
				WHEN "10010000" =>
					state <= lda;
				WHEN "11110000" =>
					state <= bldiv;
				WHEN "01010000" =>
					state <= bldsp;
				WHEN "10100000" =>
					state <= bldx;
				WHEN "00010001" =>
					--add abs
					state <= ABS_GP1;
				WHEN "00011001" =>
					--addc_abs
					state <= ABS_GP1;
				WHEN "00100001" =>
					--sub_abs
					state <= ABS_GP1;
				WHEN "00101001" =>
					--subc_abs
					state <= ABS_GP1;
				WHEN "01000001" =>
					--xor_abs
					state <= ABS_GP1;
				WHEN "00111001" =>
					--or_abs
					state <= ABS_GP1;
				WHEN "01100001" =>
					--cmpa_abs
					state <= ABS_GP1;
				WHEN "00110001" =>
					--and_abs
					state <= ABS_GP1;
				WHEN "10010001" =>
					state <= lda_abs;
				WHEN "10011001" =>
					state <= sta_abs;
				WHEN "11000001" =>
					state <= jmp_abs;
				WHEN "11001001" =>
					state <= jsr_abs;
				WHEN "11100001" =>
					state <= jc;
				WHEN "11011001" =>
					state <= jn;
				WHEN "11100110" =>
					state <= jnc;
				WHEN "11011110" =>
					state <= jnn;
				WHEN "11101110" =>
					state <= jno;
				WHEN "11010110" =>
					state <= jnz;
				WHEN "11101001" =>
					state <= jo;
				WHEN "11010001" =>
					state <= jz;
				WHEN "11110001" =>
					--BLDIV abs
					state <= BAB_GP1;
				WHEN "01010001" =>
					--BLDSP abs
					state <= BAB_GP1;
				WHEN "10100001" =>
					--BLDX abs
					state <= BAB_GP1;
				WHEN "01011001" =>
					--BSTSP
					state <= BAB_GP2;
				WHEN "10101001" =>
					--BSTX
					state <= BAB_GP2;
				WHEN "00010010" =>
					--ADD ABS-X
					state <= IND_GP1;
				WHEN "00011010" =>
					--ADDC ABS-X
					state <= IND_GP1;
				WHEN "00100010" =>
					--SUB ABS-X
					state <= IND_GP1;
				WHEN "00101010" =>
					--SUBC ABS-X
					state <= IND_GP1;
				WHEN "00110010" =>
					--AND ABS-X
					state <= IND_GP1;
				WHEN "00111010" =>
					--OR ABS-X
					state <= IND_GP1;
				WHEN "01000010" =>
					--XOR ABS-X
					state <= IND_GP1;
				WHEN "01100010" =>
					--CMPA ABS-X
					state <= IND_GP1;
				WHEN "10010010" =>
					state <= lda_absx;
				WHEN "10011010" =>
					state <= sta_absx;
				WHEN "11000010" =>
					state <= jmp_absx;
				WHEN "11001010" =>
					state <= jsr_absx;
				WHEN "10010011" =>
					state <= lda_ind;
				WHEN "10011011" =>
					state <= sta_ind;
				WHEN "11000011" =>
					state <= jmp_ind;
				WHEN "11001011" =>
					state <= jsr_ind;
				WHEN "10010100" =>
					state <= lda_pind;
				WHEN "10011100" =>
					state <= sta_pind;
				WHEN "11000100" =>
					state <= jmp_pind;
				WHEN "11001100" =>
					state <= jsr_pind;
				WHEN "10010101" =>
					state <= lda_indp;
				WHEN "10011101" =>
					state <= sta_indp;
				WHEN "11000101" =>
					state <= jmp_indp;
				WHEN "11001101" =>
					state <= jsr_indp;
					
				WHEN OTHERS =>
					state <= fetch_instr;
			END CASE;
			
		WHEN halt =>
			state <= halt;
			
		WHEN NOP =>
			state <= fetch_instr;
			
		WHEN inca =>
			ACCUMULATOR <= ACCUMULATOR + 1;
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
			state <= fetch_instr;
			
		WHEN deca =>
			ACCUMULATOR <= ACCUMULATOR - 1;
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
						
			state <= fetch_instr;	
			
		WHEN incx =>
			X_reg <= X_reg + 1;
			
			STAT_Z <= NOT(X_reg(15) OR X_reg(14) OR X_reg(13) OR X_reg(12) OR X_reg(11) 
				OR X_reg(10) OR X_reg(9) OR X_reg(8) OR X_reg(7) OR X_reg(6) OR X_reg(5) 
				OR X_reg(4) OR X_reg(3) OR X_reg(2) OR X_reg(1) OR X_reg(0));
			
			state <= fetch_instr;	
		
		WHEN decx =>
			X_reg <= X_reg - 1;
			
			STAT_Z <= NOT(X_reg(15) OR X_reg(14) OR X_reg(13) OR X_reg(12) OR X_reg(11) 
				OR X_reg(10) OR X_reg(9) OR X_reg(8) OR X_reg(7) OR X_reg(6) OR X_reg(5) 
				OR X_reg(4) OR X_reg(3) OR X_reg(2) OR X_reg(1) OR X_reg(0));
			
			state <= fetch_instr;	
	
		WHEN shl =>
			STAT_C <= ACCUMULATOR(7);
			ACCUMULATOR(7) <= ACCUMULATOR(6);
			ACCUMULATOR(6) <= ACCUMULATOR(5);
			ACCUMULATOR(5) <= ACCUMULATOR(4);
			ACCUMULATOR(4) <= ACCUMULATOR(3);
			ACCUMULATOR(3) <= ACCUMULATOR(2);
			ACCUMULATOR(2) <= ACCUMULATOR(1);
			ACCUMULATOR(1) <= ACCUMULATOR(0);
			ACCUMULATOR(0) <= '0';
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
						
			state <= fetch_instr;
						
		WHEN shr =>
			STAT_C <= ACCUMULATOR(0);
			ACCUMULATOR(0) <= ACCUMULATOR(1);
			ACCUMULATOR(1) <= ACCUMULATOR(2);
			ACCUMULATOR(2) <= ACCUMULATOR(3);
			ACCUMULATOR(3) <= ACCUMULATOR(4);
			ACCUMULATOR(4) <= ACCUMULATOR(5);
			ACCUMULATOR(5) <= ACCUMULATOR(6);
			ACCUMULATOR(6) <= ACCUMULATOR(7);
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
		
			state <= fetch_instr;
		
		WHEN rolc =>
			
			temp <= ACCUMULATOR(7);
			ACCUMULATOR(7) <= ACCUMULATOR(6);
			ACCUMULATOR(6) <= ACCUMULATOR(5);
			ACCUMULATOR(5) <= ACCUMULATOR(4);
			ACCUMULATOR(4) <= ACCUMULATOR(3);
			ACCUMULATOR(3) <= ACCUMULATOR(2);
			ACCUMULATOR(2) <= ACCUMULATOR(1);
			ACCUMULATOR(1) <= ACCUMULATOR(0);
			ACCUMULATOR(0) <= STAT_C;
			STAT_C <= temp;
			temp <= '0';
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
						
			state <= fetch_instr;
			
		WHEN rorc =>
			
			temp <= ACCUMULATOR(0);
			ACCUMULATOR(0) <= ACCUMULATOR(1);
			ACCUMULATOR(1) <= ACCUMULATOR(2);
			ACCUMULATOR(2) <= ACCUMULATOR(3);
			ACCUMULATOR(3) <= ACCUMULATOR(4);
			ACCUMULATOR(4) <= ACCUMULATOR(5);
			ACCUMULATOR(5) <= ACCUMULATOR(6);
			ACCUMULATOR(6) <= ACCUMULATOR(7);
			ACCUMULATOR(7) <= STAT_C;
			STAT_C <= temp;
			temp <= '0';
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
		
			state <= fetch_instr;
		
		WHEN setim =>
			STAT_I <= '1';
			
			state <= fetch_instr;
			
		WHEN clrim =>
			STAT_I <= '0';
			
			state <= fetch_instr;
		
		WHEN popa =>
			SP_reg <= SP_reg + 1;
			ADDRESS_reg <= SP_reg;
			state <= popa_2;
			
		WHEN popa_2 =>
			read <= '0';
			state <= popa_3;
			
		WHEN popa_3 =>
			ACCUMULATOR <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= fetch_instr;
		
		WHEN popsr =>
			SP_reg <= SP_reg + 1;
			ADDRESS_reg <= SP_reg;
			state <= popsr_2;
			
		WHEN popsr_2 =>
			read <= '0';
			state <= popsr_3;
			
		WHEN popsr_3 =>
			STAT_I <= DATA_IN_reg(4);
			STAT_O <= DATA_IN_reg(3);
			STAT_N <= DATA_IN_reg(2);
			STAT_Z <= DATA_IN_reg(1);
			STAT_C <= DATA_IN_reg(0);
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= fetch_instr;
			
		WHEN pusha =>
			ADDRESS_reg <= SP_reg;
			SP_reg <= SP_reg - 1;
			state <= pusha_2;
			
		WHEN pusha_2 =>
			write <= '0';
			DATA_reg <= ACCUMULATOR;
			state <= push_3;
			
		WHEN push_3 =>
			write <= '1';
			state <= push_4;
			
		WHEN push_4 =>
			ADDRESS_reg <= PC_reg;
			state <= fetch_instr;
			
		WHEN pushsr =>
			ADDRESS_reg <= SP_reg;
			SP_reg <= SP_reg - 1;
			state <= pushsr_2;
			
		WHEN pushsr_2 =>
			write <= '0';
			DATA_reg(7) <= '0';
			DATA_reg(6) <= '0';
			DATA_reg(5) <= '0';
			DATA_reg(4) <= STAT_I;
			DATA_reg(3) <= STAT_O;
			DATA_reg(2) <= STAT_N;
			DATA_reg(1) <= STAT_Z;
			DATA_reg(0) <= STAT_C;
			state <= push_3;
		
		WHEN add =>
			read <= '0';
			state <= add_2;
			
		WHEN add_2 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			
			state <= add_3;
			
		WHEN add_3 =>
			
			TMP1(8) <= '0';
			TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
			TMP2(8) <= '0';
			TMP2(7 DOWNTO 0) <= TMP(7 DOWNTO 0);
			
			ADD_TEMP9 <= TMP1 + TMP2;
			
			TMP3(7) <= '0';
			TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
			TMP4(7) <= '0';
			TMP4(6 DOWNTO 0) <= TMP(6 DOWNTO 0);
			
			ADD_TEMP8 <= TMP3 + TMP4;
			
			ACCUMULATOR <= ACCUMULATOR + TMP;
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
			STAT_C <= ADD_TEMP9(8);
			
			STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
								
			state <= fetch_instr;
			
		WHEN addc =>
			read <= '0';
			state <= addc_2;
			
		WHEN addc_2 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			
			state <= addc_3;
			
		WHEN addc_3 =>	
		
			TMP1(8) <= '0';
			TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
			TMP2(8) <= '0';
			TMP2(7 DOWNTO 0) <= TMP(7 DOWNTO 0);
			
			ADD_TEMP9 <= TMP1 + TMP2 + STAT_C;
			
			TMP3(7) <= '0';
			TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
			TMP4(7) <= '0';
			TMP4(6 DOWNTO 0) <= TMP(6 DOWNTO 0);
			
			ADD_TEMP8 <= TMP3 + TMP4 + STAT_C;
			
			ACCUMULATOR <= ACCUMULATOR + TMP + STAT_C;
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
			STAT_C <= ADD_TEMP9(8);
			
			STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
								
			state <= fetch_instr;
		
		WHEN rts =>
			ADDRESS_reg <= SP_reg + 1;
			SP_reg <= SP_reg + 1;
			state <= rts_2;
			
		WHEN rts_2 =>
			read <= '0';
			state <= rts_3;
			
		WHEN rts_3 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= SP_reg;
			state <= rts_4;
			
		WHEN rts_4 =>
			read <= '0';
			SP_reg <= SP_reg + 1;
			state <= rts_5;
			
		WHEN rts_5 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= rts_6;
			
		WHEN rts_6 =>
			ADDRESS_reg <= TPCA_reg;
			PC_reg <= TPCA_reg + 1;
			state <= fetch_instr;
		
		WHEN rti =>
			ADDRESS_reg <= SP_reg + 1;
			SP_reg <= SP_reg + 1;
			state <= rti_2;
			
		WHEN rti_2 =>
			read <= '0';
			state <= rti_3;
			
		WHEN rti_3 =>
			STAT_I <= DATA_IN_reg(4);
			STAT_O <= DATA_IN_reg(3);
			STAT_N <= DATA_IN_reg(2);
			STAT_Z <= DATA_IN_reg(1);
			STAT_C <= DATA_IN_reg(0);
			read <= '1';
			ADDRESS_reg <= SP_reg;
			SP_reg <= SP_reg + 1;
			state <= rti_4;
			
		WHEN rti_4 =>
			read <= '0';
			state <= rti_5;
			
		WHEN rti_5 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= SP_reg;
			state <= rti_6;
			
		WHEN rti_6 =>
			read <= '0';
			SP_reg <= SP_reg + 1;
			state <= rti_7;
		
		WHEN rti_7 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= rti_8;
			
		WHEN rti_8 =>
			ADDRESS_reg <= TPCA_reg;
			PC_reg <= TPCA_reg + 1;
			IACK <= '1';
			state <= fetch_instr;
		
		WHEN sub =>
			read <= '0';
			state <= sub_2;
			
		WHEN sub_2 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			
			
			
			state <= sub_3;
			
		WHEN sub_3 =>
			TMP1(8) <= '0';
			TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
			TMP2(8) <= '0';
			TMP2(7 DOWNTO 0) <= NOT(TMP(7 DOWNTO 0));
			
			ADD_TEMP9 <= TMP1 + TMP2 + 1;
			
			TMP3(7) <= '0';
			TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
			TMP4(7) <= '0';
			TMP4(6 DOWNTO 0) <= NOT(TMP(6 DOWNTO 0));
			
			ADD_TEMP8 <= TMP3 + TMP4 + 1;
			
			ACCUMULATOR <= ACCUMULATOR + NOT(TMP) + 1;
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
			STAT_C <= ADD_TEMP9(8);
			
			STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
								
			state <= fetch_instr;
		
		WHEN subc =>
			read <= '0';
			state <= subc_2;
			
		WHEN subc_2 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= subc_3;
			
		WHEN subc_3 =>
			TMP1(8) <= '0';
			TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
			TMP2(8) <= '0';
			TMP2(7 DOWNTO 0) <= NOT(TMP(7 DOWNTO 0));
			
			ADD_TEMP9 <= TMP1 + TMP2 + STAT_C;
			
			TMP3(7) <= '0';
			TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
			TMP4(7) <= '0';
			TMP4(6 DOWNTO 0) <= NOT(TMP(6 DOWNTO 0));
			
			ADD_TEMP8 <= TMP3 + TMP4 + STAT_C;
			
			ACCUMULATOR <= ACCUMULATOR + NOT(TMP) + STAT_C;
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
			STAT_C <= ADD_TEMP9(8);
			
			STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
								
			state <= fetch_instr;
			
		WHEN and_op =>
			read <= '0';
			state <= and_op2;
			
		WHEN and_op2 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= and_op3;
			
		WHEN and_op3 =>		
			ACCUMULATOR <= ACCUMULATOR AND TMP;
			STAT_N <= ACCUMULATOR(7);
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));			
			state <= fetch_instr;
			
		WHEN or_op =>
			read <= '0';
			state <= or_op2;
			
		WHEN or_op2 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= or_op3;
			
		WHEN or_op3 =>		
			ACCUMULATOR <= ACCUMULATOR OR TMP;
			STAT_N <= ACCUMULATOR(7);
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));		
			state <= fetch_instr;
		
		WHEN xor_op =>
			read <= '0';
			state <= xor_op2;
			
		WHEN xor_op2 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= xor_op3;
			
		WHEN xor_op3 =>			
			ACCUMULATOR <= ACCUMULATOR XOR TMP;
			STAT_N <= ACCUMULATOR(7);
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));			
			state <= fetch_instr;
			
		WHEN cmpa =>
			read <= '0';
			state <= cmpa_2;
			
		WHEN cmpa_2 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= cmpa_3;
			
		WHEN cmpa_3 =>
			IF (ACCUMULATOR > TMP) THEN
				STAT_C <= '1';
			ELSE
				STAT_C <= '0';
			END IF;
			IF (ACCUMULATOR = TMP) THEN
				STAT_Z <= '1';
			ELSE
				STAT_Z <= '0';
			END IF;					
			state <= fetch_instr;
		
		WHEN lda =>
			read <= '0';
			state <= lda_2;
		
		WHEN lda_2 =>
			ACCUMULATOR <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			STAT_N <= ACCUMULATOR(7);
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			state <= fetch_instr;
			
		WHEN bldiv =>
			read <= '0';
			state <= bldiv_2;
			
		WHEN bldiv_2 =>
			IV_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= bldiv_3;
			
		WHEN bldiv_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= bldiv_4;
			
		WHEN bldiv_4 =>
			IV_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= bldiv_5;
			
		WHEN bldiv_5 =>
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN bldsp =>
			read <= '0';
			state <= bldsp_2;
			
		WHEN bldsp_2 =>
			SP_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= bldsp_3;
			
		WHEN bldsp_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= bldsp_4;
			
		WHEN bldsp_4 =>
			SP_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= bldsp_5;
			
		WHEN bldsp_5 =>
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN bldx =>
			read <= '0';
			state <= bldx_2;
			
		WHEN bldx_2 =>
			X_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= bldx_3;
			
		WHEN bldx_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= bldx_4;
			
		WHEN bldx_4 =>
			X_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= bldx_5;
			
		WHEN bldx_5 =>
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
		
		WHEN ABS_GP1 =>
			read <= '0';
			state <= ABS_GP1_2;
			
		WHEN ABS_GP1_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= ABS_GP1_3;
			
		WHEN ABS_GP1_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= ABS_GP1_4;
			
		WHEN ABS_GP1_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= ABS_GP1_5;
			
		WHEN ABS_GP1_5 =>
			ADDRESS_reg <= TPCA_reg;
			state <= ABS_GP1_6;
			
		WHEN ABS_GP1_6 =>
			read <= '0';
			state <= ABS_GP1_7;
			
		WHEN ABS_GP1_7 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			
			state <= ABS_GP1_8;
			
		WHEN ABS_GP1_8 =>
		
			IF (IR_reg = "00010001") THEN
			
				TMP1(8) <= '0';
				TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
				TMP2(8) <= '0';
				TMP2(7 DOWNTO 0) <= TMP(7 DOWNTO 0);
			
				ADD_TEMP9 <= TMP1 + TMP2;
			
				TMP3(7) <= '0';
				TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
				TMP4(7) <= '0';
				TMP4(6 DOWNTO 0) <= TMP(6 DOWNTO 0);
			
				ADD_TEMP8 <= TMP3 + TMP4;
			
				ACCUMULATOR <= ACCUMULATOR + TMP;
			
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
				STAT_C <= ADD_TEMP9(8);
			
				STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
						
			ELSIF (IR_reg = "00011001") THEN
			
				TMP1(8) <= '0';
				TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
				TMP2(8) <= '0';
				TMP2(7 DOWNTO 0) <= TMP(7 DOWNTO 0);
			
				ADD_TEMP9 <= TMP1 + TMP2 + STAT_C;
			
				TMP3(7) <= '0';
				TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
				TMP4(7) <= '0';
				TMP4(6 DOWNTO 0) <= TMP(6 DOWNTO 0);
			
				ADD_TEMP8 <= TMP3 + TMP4 + STAT_C;
			
				ACCUMULATOR <= ACCUMULATOR + TMP + STAT_C;
			
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
				STAT_C <= ADD_TEMP9(8);
			
				STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
			
			ELSIF (IR_reg = "00110001") THEN
			
				ACCUMULATOR <= ACCUMULATOR AND TMP;
				
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
						
			ELSIF (IR_reg = "00111001") THEN
			
				ACCUMULATOR <= ACCUMULATOR OR TMP;
				
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
						
			ELSIF (IR_reg = "01000001") THEN
			
				ACCUMULATOR <= ACCUMULATOR XOR TMP;
				
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
						
			ELSIF (IR_reg = "00100001") THEN
				TMP1(8) <= '0';
				TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
				TMP2(8) <= '0';
				TMP2(7 DOWNTO 0) <= NOT(TMP(7 DOWNTO 0));
			
				ADD_TEMP9 <= TMP1 + TMP2 + 1;
			
				TMP3(7) <= '0';
				TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
				TMP4(7) <= '0';
				TMP4(6 DOWNTO 0) <= NOT(TMP(6 DOWNTO 0));
			
				ADD_TEMP8 <= TMP3 + TMP4 + 1;
			
				ACCUMULATOR <= ACCUMULATOR + NOT(TMP) + 1;
			
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
				STAT_C <= ADD_TEMP9(8);
			
				STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
			
			
			ELSIF (IR_reg = "00101001") THEN
			
				TMP1(8) <= '0';
				TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
				TMP2(8) <= '0';
				TMP2(7 DOWNTO 0) <= NOT(TMP(7 DOWNTO 0));
			
				ADD_TEMP9 <= TMP1 + TMP2 + STAT_C;
			
				TMP3(7) <= '0';
				TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
				TMP4(7) <= '0';
				TMP4(6 DOWNTO 0) <= NOT(TMP(6 DOWNTO 0));
			
				ADD_TEMP8 <= TMP3 + TMP4 + STAT_C;
			
				ACCUMULATOR <= ACCUMULATOR + NOT(TMP) + STAT_C;
			
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			
				STAT_C <= ADD_TEMP9(8);
			
				STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
						
			ELSIF (IR_reg <= "01100001") THEN
			
				IF (ACCUMULATOR = TMP) THEN
					STAT_Z <= '1';
				ELSE
					STAT_Z <= '0';
				END IF;
				
				IF (ACCUMULATOR > TMP) THEN
					STAT_C <= '1';
				ELSE
					STAT_C <= '0';
				END IF;
				
			ELSE
				--error
				state <= fetch_instr;
			END IF;
				
			STAT_N <= ACCUMULATOR(7);
			state <= fetch_instr;
		
		WHEN lda_abs =>
			read <= '0';
			state <= lda_abs_2;
			
		WHEN lda_abs_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= lda_abs_3;
			
		WHEN lda_abs_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= lda_abs_4;
			
		WHEN lda_abs_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			state <= lda_abs_5;
			
		WHEN lda_abs_5 =>
			ADDRESS_reg <= TPCA_reg;
			state <= lda_abs_6;
		
		WHEN lda_abs_6 =>
			read <= '0';
			state <= lda_abs_7;
			
		WHEN lda_abs_7 =>
			ACCUMULATOR <= DATA_IN_reg;
			read <= '1';
			
			STAT_N <= ACCUMULATOR(7);
			
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN sta_abs =>
			read <= '0';
			state <= sta_abs_2;
			
		WHEN sta_abs_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= sta_abs_3;
			
		WHEN sta_abs_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= sta_abs_4;
			
		WHEN sta_abs_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= sta_abs_5;
			
		WHEN sta_abs_5 =>
			ADDRESS_reg <= TPCA_reg;
			state <= sta_abs_6;
			
		WHEN sta_abs_6 =>
			write <= '0';
			DATA_reg <= ACCUMULATOR;
			state <= sta_abs_7;
			
		WHEN sta_abs_7 =>
			write <= '1';
			state <= sta_abs_8;
			
		WHEN sta_abs_8 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
		
		WHEN jmp_abs =>
			read <= '0';
			state <= jmp_abs2;
			
		WHEN jmp_abs2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jmp_abs3;
			
		WHEN jmp_abs3 =>
			read <= '0';
			state <= jmp_abs4;
			
		WHEN jmp_abs4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			state <= jmp_abs5;
			
		WHEN jmp_abs5 =>
			ADDRESS_reg <= TPCA_reg;
			PC_reg <= TPCA_reg + 1;
			state <= fetch_instr;
		
		WHEN jsr_abs =>
			read <= '0';
			state <= jsr_abs2;
			
		WHEN jsr_abs2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jsr_abs3;
			
		WHEN jsr_abs3 =>
			read <= '0';
			state <= jsr_abs4;
			
		WHEN jsr_abs4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= SP_reg;
			state <= jsr_abs5;
			
		WHEN jsr_abs5 =>
			SP_reg <= SP_reg - 1;
			state <= jsr_abs6;
			
		WHEN jsr_abs6 =>
			write <= '0';
			DATA_reg <= PC_reg(7 DOWNTO 0);
			state <= jsr_abs7;
			
		WHEN jsr_abs7 =>	
			write <= '1';
			state <= jsr_abs8;
			
		WHEN jsr_abs8 =>
			ADDRESS_reg <= SP_reg;
			SP_reg <= SP_reg - 1;
			state <= jsr_abs9;
			
		WHEN jsr_abs9 =>
			write <= '0';
			DATA_reg <= PC_reg(15 DOWNTO 8);
			state <= jsr_abs10;
			
		WHEN jsr_abs10 =>
			write <= '1';
			ADDRESS_reg <= TPCA_reg;
			PC_reg <= TPCA_reg + 1;
			state <= fetch_instr;
		
		WHEN jc =>
			IF (STAT_C = '1') THEN
				read <= '0';
				state <= ABS_GP6_2;
			ELSE
				ADDRESS_reg <= PC_reg + 1;
				PC_reg <= PC_reg + 1;
				state <= FAIL_1;
			END IF;
			
		WHEN jn =>
			IF (STAT_N = '1') THEN
				read <= '0';
				state <= ABS_GP6_2;
			ELSE
				ADDRESS_reg <= PC_reg + 1;
				PC_reg <= PC_reg + 1;
				state <= FAIL_1;
			END IF;
			
		WHEN jnc =>
			IF (STAT_C = '0') THEN
				read <= '0';
				state <= ABS_GP6_2;
			ELSE
				ADDRESS_reg <= PC_reg + 1;
				PC_reg <= PC_reg + 1;
				state <= FAIL_1;
			END IF;
			
		WHEN jnn =>
			IF (STAT_N = '0') THEN
				read <= '0';
				state <= ABS_GP6_2;
			ELSE
				ADDRESS_reg <= PC_reg + 1;
				PC_reg <= PC_reg + 1;
				state <= FAIL_1;
			END IF;
			
		WHEN jno =>
			IF (STAT_O = '0') THEN
				read <= '0';
				state <= ABS_GP6_2;
			ELSE
				ADDRESS_reg <= PC_reg + 1;
				PC_reg <= PC_reg + 1;
				state <= FAIL_1;
			END IF;
			
		WHEN jnz =>
			IF (STAT_Z = '0') THEN
				read <= '0';
				state <= ABS_GP6_2;
			ELSE
				ADDRESS_reg <= PC_reg + 1;
				PC_reg <= PC_reg + 1;
				state <= FAIL_1;
			END IF;
			
		WHEN jo =>
			IF (STAT_O = '1') THEN
				read <= '0';
				state <= ABS_GP6_2;
			ELSE
				ADDRESS_reg <= PC_reg + 1;
				PC_reg <= PC_reg + 1;
				state <= FAIL_1;
			END IF;
			
		WHEN jz =>
			IF (STAT_Z = '1') THEN
				read <= '0';
				state <= ABS_GP6_2;
			ELSE
				ADDRESS_reg <= PC_reg + 1;
				PC_reg <= PC_reg + 1;
				state <= FAIL_1;
			END IF;
				
		WHEN ABS_GP6_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= ABS_GP6_3;
			
		WHEN ABS_GP6_3 =>
			read <= '0';
			state <= ABS_GP6_4;
			
		WHEN ABS_GP6_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";	
			state <= ABS_GP6_5;
			
		WHEN ABS_GP6_5 =>
			ADDRESS_reg <= TPCA_reg;
			PC_reg <= TPCA_reg + 1;
			state <= fetch_instr;
		
		WHEN FAIL_1 =>
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN BAB_GP1 =>
			read <= '0';
			state <= BAB_GP1_2;
			
		WHEN BAB_GP1_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= BAB_GP1_3;
			
		WHEN BAB_GP1_3 =>
			read <= '0';
			PC_reg <= PC_reg + 2;
			state <= BAB_GP1_4;
			
		WHEN BAB_GP1_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= BAB_GP1_5;
			
		WHEN BAB_GP1_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= BAB_GP1_6;
			
		WHEN BAB_GP1_6 =>
			read <= '0';
			state <= BAB_GP1_7;
			
		WHEN BAB_GP1_7 =>
			IF (IR_reg = "11110001") THEN
				IV_reg(15 DOWNTO 8) <= DATA_IN_reg;
			ELSIF (IR_reg = "01010001") THEN
				SP_reg(15 DOWNTO 8) <= DATA_IN_reg;
			ELSIF (IR_reg = "10100001") THEN
				X_reg(15 DOWNTO 8) <= DATA_IN_reg;
			ELSE
				--error
			END IF;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= BAB_GP1_8;
			
		WHEN BAB_GP1_8 =>
			read <= '0';
			state <= BAB_GP1_9;
			
		WHEN BAB_GP1_9 =>
			IF (IR_reg = "11110001") THEN
				IV_reg(7 DOWNTO 0) <= DATA_IN_reg;
			ELSIF (IR_reg = "01010001") THEN
				SP_reg(7 DOWNTO 0) <= DATA_IN_reg;
			ELSIF (IR_reg = "10100001") THEN
				X_reg(7 DOWNTO 0) <= DATA_IN_reg;
			ELSE
				--error
			END IF;	
			read <= '1';
			ADDRESS_reg <= PC_reg - 1;
			state <= fetch_instr;
			
		WHEN BAB_GP2 =>
			read <= '0';
			state <= BAB_GP2_2;
			
		WHEN BAB_GP2_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= BAB_GP2_3;
			
		WHEN BAB_GP2_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= BAB_GP2_4;
			
		WHEN BAB_GP2_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= BAB_GP2_5;
			
		WHEN BAB_GP2_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= BAB_GP2_6;
			
		WHEN BAB_GP2_6 =>
			write <= '0';
			IF (IR_reg = "01011001") THEN
				DATA_reg <= SP_reg(15 DOWNTO 8);
			ELSIF (IR_reg = "10101001") THEN
				DATA_reg <= X_reg(15 DOWNTO 8);
			ELSE
				--nothing
			END IF;
			state <= BAB_GP2_7;
			
		WHEN BAB_GP2_7 =>
			write <= '1';
			state <= BAB_GP2_8;
			
		WHEN BAB_GP2_8 =>
			ADDRESS_reg <= TPCA_reg;
			state <= BAB_GP2_9;
			
		WHEN BAB_GP2_9 =>
			write <= '0';
			IF (IR_reg = "01011001") THEN
				DATA_reg <= SP_reg(7 DOWNTO 0);
			ELSIF (IR_reg = "10101001") THEN
				DATA_reg <= X_reg(7 DOWNTO 0);
			ELSE
				--nothing
			END IF;
			state <= BAB_GP2_10;
			
		WHEN BAB_GP2_10 =>
			write <= '1';
			state <= BAB_GP2_11;
			
		WHEN BAB_GP2_11 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN IND_GP1 =>
			read <= '0';
			state <= IND_GP1_2;
			
		WHEN IND_GP1_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= IND_GP1_3;
			
		WHEN IND_GP1_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= IND_GP1_4;
			
		WHEN IND_GP1_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= IND_GP1_5;
			
		WHEN IND_GP1_5 =>
			ADDRESS_reg <= TPCA_reg + X_reg;
			state <= IND_GP1_6;
			
		WHEN IND_GP1_6 =>
			read <= '0';
			state <= IND_GP1_7;
			
		WHEN IND_GP1_7 =>
			TMP <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= IND_GP1_8;
			
		WHEN IND_GP1_8 =>
		
			IF (IR_reg = "00010010") THEN
			
				TMP1(8) <= '0';
				TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
				TMP2(8) <= '0';
				TMP2(7 DOWNTO 0) <= TMP(7 DOWNTO 0);
			
				ADD_TEMP9 <= TMP1 + TMP2;
			
				TMP3(7) <= '0';
				TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
				TMP4(7) <= '0';
				TMP4(6 DOWNTO 0) <= TMP(6 DOWNTO 0);
			
				ADD_TEMP8 <= TMP3 + TMP4;
			
				ACCUMULATOR <= ACCUMULATOR + TMP;
			
				STAT_C <= ADD_TEMP9(8);
			
				STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
								
				STAT_N <= ACCUMULATOR(7);
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			ELSIF (IR_reg = "00011010") THEN
				TMP1(8) <= '0';
				TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
				TMP2(8) <= '0';
				TMP2(7 DOWNTO 0) <= TMP(7 DOWNTO 0);
			
				ADD_TEMP9 <= TMP1 + TMP2 + STAT_C;
			
				TMP3(7) <= '0';
				TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
				TMP4(7) <= '0';
				TMP4(6 DOWNTO 0) <= TMP(6 DOWNTO 0);
			
				ADD_TEMP8 <= TMP3 + TMP4 + STAT_C;
			
				ACCUMULATOR <= ACCUMULATOR + TMP + STAT_C;
			
				STAT_C <= ADD_TEMP9(8);
			
				STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
								
				STAT_N <= ACCUMULATOR(7);
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			ELSIF (IR_reg = "00100010") THEN
				TMP1(8) <= '0';
				TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
				TMP2(8) <= '0';
				TMP2(7 DOWNTO 0) <= NOT(TMP(7 DOWNTO 0));
			
				ADD_TEMP9 <= TMP1 + TMP2 + 1;
			
				TMP3(7) <= '0';
				TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
				TMP4(7) <= '0';
				TMP4(6 DOWNTO 0) <= NOT(TMP(6 DOWNTO 0));
			
				ADD_TEMP8 <= TMP3 + TMP4 + 1;
			
				ACCUMULATOR <= ACCUMULATOR + NOT(TMP) + 1;
			
				STAT_C <= ADD_TEMP9(8);
			
				STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
								
				STAT_N <= ACCUMULATOR(7);
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			ELSIF (IR_reg = "00101010") THEN
				TMP1(8) <= '0';
				TMP1(7 DOWNTO 0) <= ACCUMULATOR(7 DOWNTO 0);
			
				TMP2(8) <= '0';
				TMP2(7 DOWNTO 0) <= NOT(TMP(7 DOWNTO 0));
			
				ADD_TEMP9 <= TMP1 + TMP2 + STAT_C;
			
				TMP3(7) <= '0';
				TMP3(6 DOWNTO 0) <= ACCUMULATOR(6 DOWNTO 0);
			
				TMP4(7) <= '0';
				TMP4(6 DOWNTO 0) <= NOT(TMP(6 DOWNTO 0));
			
				ADD_TEMP8 <= TMP3 + TMP4 + STAT_C;
			
				ACCUMULATOR <= ACCUMULATOR + NOT(TMP) + STAT_C;
			
				STAT_C <= ADD_TEMP9(8);
			
				STAT_O <= ADD_TEMP9(8) XOR ADD_TEMP8(7);
								
				STAT_N <= ACCUMULATOR(7);
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			ELSIF (IR_reg = "00110010") THEN
				ACCUMULATOR <= ACCUMULATOR AND TMP;
				STAT_N <= ACCUMULATOR(7);
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			ELSIF (IR_reg = "00111010") THEN
				ACCUMULATOR <= ACCUMULATOR OR TMP;
				STAT_N <= ACCUMULATOR(7);
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			ELSIF (IR_reg = "01000010") THEN
				ACCUMULATOR <= ACCUMULATOR XOR TMP;
				STAT_N <= ACCUMULATOR(7);
				STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			ELSIF (IR_reg = "01100010") THEN
				IF (ACCUMULATOR > TMP) THEN
					STAT_C <= '1';
				ELSE
					STAT_C <= '0';
				END IF;
				IF (ACCUMULATOR = TMP) THEN
					STAT_Z <= '1';
				ELSE
					STAT_Z <= '0';
				END IF;
			ELSE
				--nothing
			END IF;
			state <= fetch_instr;
				
		
		WHEN lda_absx =>
			read <= '0';
			state <= lda_absx_2;

		WHEN lda_absx_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= lda_absx_3;

		WHEN lda_absx_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= lda_absx_4;

		WHEN lda_absx_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= lda_absx_5;

		WHEN lda_absx_5 =>
			ADDRESS_reg <= TPCA_reg + X_reg;
			state <= lda_absx_6;

		WHEN lda_absx_6 =>
			read <= '0';
			state <= lda_absx_7;

		WHEN lda_absx_7 =>
			ACCUMULATOR <= DATA_IN_reg;
			STAT_N <= ACCUMULATOR(7);
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN sta_absx =>
			read <= '0';
			state <= sta_absx_2;

		WHEN sta_absx_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= sta_absx_3;

		WHEN sta_absx_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= sta_absx_4;

		WHEN sta_absx_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= sta_absx_5;

		WHEN sta_absx_5 =>
			ADDRESS_reg <= TPCA_reg + X_reg;
			state <= sta_absx_6;
			
		WHEN sta_absx_6 =>
			write <= '0';
			DATA_reg <= ACCUMULATOR;
			state <= sta_absx_7;

		WHEN sta_absx_7 =>
			write <= '1';
			state <= sta_absx_8;
		
		WHEN sta_absx_8 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;

		WHEN jmp_absx =>
			read <= '0';
			state <= jmp_absx_2;

		WHEN jmp_absx_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jmp_absx_3;

		WHEN jmp_absx_3 =>
			read <= '0';
			state <= jmp_absx_4;

		WHEN jmp_absx_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jmp_absx_5;

		WHEN jmp_absx_5 =>
			PC_reg <= TPCA_reg + X_reg;
			state <= jmp_absx_6;

		WHEN jmp_absx_6 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;

		WHEN jsr_absx =>	
			read <= '0';
			state <= jsr_absx_2;

		WHEN jsr_absx_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jsr_absx_3;

		WHEN jsr_absx_3 =>
			read <= '0';
			state <= jsr_absx_4;

		WHEN jsr_absx_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= SP_reg;
			state <= jsr_absx_5;

		WHEN jsr_absx_5 =>
			SP_reg <= SP_reg - 1;
			state <= jsr_absx_6;

		WHEN jsr_absx_6 =>
			write <= '0';
			DATA_reg <= PC_reg(7 DOWNTO 0);
			state <= jsr_absx_7;

		WHEN jsr_absx_7 =>
			write <= '1';
			state <= jsr_absx_8;

		WHEN jsr_absx_8 =>
			ADDRESS_reg <= SP_reg;
			SP_reg <= SP_reg - 1;
			state <= jsr_absx_9;

		WHEN jsr_absx_9 =>
			write <= '0';
			DATA_reg <= PC_reg(15 DOWNTO 8);
			state <= jsr_absx_10;

		WHEN jsr_absx_10 =>
			write <= '1';
			state <= jsr_absx_11;
	
		WHEN jsr_absx_11 =>
			ADDRESS_reg <= "0000000000000000";
			PC_reg <= TPCA_reg + X_reg;
			state <= jsr_absx_12;

		WHEN jsr_absx_12 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;

		WHEN lda_ind =>
			read <= '0';
			state <= lda_ind_2;

		WHEN lda_ind_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= lda_ind_3;

		WHEN lda_ind_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= lda_ind_4;

		WHEN lda_ind_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= lda_ind_5;

		WHEN lda_ind_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= lda_ind_6;

		WHEN lda_ind_6 =>
			read <= '0';
			state <= lda_ind_7;

		WHEN lda_ind_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= lda_ind_8;

		WHEN lda_ind_8 =>
			read <= '0';
			state <= lda_ind_9;

		WHEN lda_ind_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= lda_ind_10;

		WHEN lda_ind_10 =>
			ADDRESS_reg <= TPCB_reg;
			state <= lda_ind_11;

		WHEN lda_ind_11 =>
			read <= '0';
			state <= lda_ind_12;

		WHEN lda_ind_12 =>
			ACCUMULATOR <= DATA_IN_reg;
			STAT_N <= ACCUMULATOR(7);
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN sta_ind =>
			read <= '0';
			state <= sta_ind_2;

		WHEN sta_ind_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= sta_ind_3;

		WHEN sta_ind_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= sta_ind_4;

		WHEN sta_ind_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= sta_ind_5;

		WHEN sta_ind_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= sta_ind_6;

		WHEN sta_ind_6 =>
			read <= '0';
			state <= sta_ind_7;
		
		WHEN sta_ind_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= sta_ind_8;

		WHEN sta_ind_8 =>
			read <= '0';
			state <= sta_ind_9;

		WHEN sta_ind_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= sta_ind_10;

		WHEN sta_ind_10 =>
			ADDRESS_reg <= TPCB_reg;
			state <= sta_ind_11;
		
		WHEN sta_ind_11 =>
			write <= '0';
			DATA_reg <= ACCUMULATOR;
			state <= sta_ind_12;

		WHEN sta_ind_12 =>
			write <= '1';
			state <= sta_ind_13;

		WHEN sta_ind_13 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;

		WHEN jmp_ind =>
			read <= '0';
			state <= jmp_ind_2;
			
		WHEN jmp_ind_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jmp_ind_3;
			
		WHEN jmp_ind_3 =>
			read <= '0';
			state <= jmp_ind_4;
			
		WHEN jmp_ind_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jmp_ind_5;
			
		WHEN jmp_ind_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= jmp_ind_6;
			
		WHEN jmp_ind_6 =>
			read <= '0';
			state <= jmp_ind_7;
			
		WHEN jmp_ind_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= jmp_ind_8;
			
		WHEN jmp_ind_8 =>
			read <= '0';
			state <= jmp_ind_9;
			
		WHEN jmp_ind_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jmp_ind_10;
			
		WHEN jmp_ind_10 =>
			ADDRESS_reg <= TPCB_reg;
			PC_reg <= TPCB_reg + 1;
			state <= fetch_instr;
			
		WHEN jsr_ind =>
			read <= '0';
			state <= jsr_ind_2;
			
		WHEN jsr_ind_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jsr_ind_3;
			
		WHEN jsr_ind_3 =>
			read <= '0';
			state <= jsr_ind_4;
			
		WHEN jsr_ind_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jsr_ind_5;
			
		WHEN jsr_ind_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= jsr_ind_6;
			
		WHEN jsr_ind_6 =>
			read <= '0';
			state <= jsr_ind_7;
			
		WHEN jsr_ind_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= jsr_ind_8;
			
		WHEN jsr_ind_8 =>
			read <= '0';
			state <= jsr_ind_9;
			
		WHEN jsr_ind_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= SP_reg;
			state <= jsr_ind_10;
			
		WHEN jsr_ind_10 =>
			SP_reg <= SP_reg - 1;
			state <= jsr_ind_11;
			
		WHEN jsr_ind_11 =>
			write <= '0';
			DATA_reg <= PC_reg(7 DOWNTO 0);
			state <= jsr_ind_12;
			
		WHEN jsr_ind_12 =>
			write <= '1';
			state <= jsr_ind_13;
			
		WHEN jsr_ind_13 =>
			ADDRESS_reg <= SP_reg;
			SP_reg <= SP_reg - 1;
			state <= jsr_ind_14;
			
		WHEN jsr_ind_14 =>
			write <= '0';
			DATA_reg <= PC_reg(15 DOWNTO 8);
			state <= jsr_ind_15;
			
		WHEN jsr_ind_15 =>
			write <= '1';
			state <= jsr_ind_16;
			
		WHEN jsr_ind_16 =>
			ADDRESS_reg <= TPCB_reg;
			PC_reg <= TPCB_reg + 1;
			state <= fetch_instr;
			
			
		WHEN lda_pind =>
			read <= '0';
			state <= lda_pind_2;

		WHEN lda_pind_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= lda_pind_3;

		WHEN lda_pind_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= lda_pind_4;

		WHEN lda_pind_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= lda_pind_5;

		WHEN lda_pind_5 =>
			ADDRESS_reg <= TPCA_reg + X_reg;
			TPCA_reg <= TPCA_reg + X_reg;
			state <= lda_pind_6;

		WHEN lda_pind_6 =>
			read <= '0';
			state <= lda_pind_7;

		WHEN lda_pind_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg + 1;
			state <= lda_pind_8;

		WHEN lda_pind_8 =>
			read <= '0';
			state <= lda_pind_9;

		WHEN lda_pind_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= lda_pind_10;

		WHEN lda_pind_10 =>
			ADDRESS_reg <= TPCB_reg;
			state <= lda_pind_11;

		WHEN lda_pind_11 =>
			read <= '0';
			state <= lda_pind_12;

		WHEN lda_pind_12 =>
			ACCUMULATOR <= DATA_IN_reg;
			STAT_N <= ACCUMULATOR(7);
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
		
		WHEN sta_pind =>
			read <= '0';
			state <= sta_pind_2;

		WHEN sta_pind_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= sta_pind_3;

		WHEN sta_pind_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= sta_pind_4;

		WHEN sta_pind_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= sta_pind_5;

		WHEN sta_pind_5 =>
			ADDRESS_reg <= TPCA_reg + X_reg;
			TPCA_reg <= TPCA_reg + X_reg;
			state <= sta_pind_6;

		WHEN sta_pind_6 =>
			read <= '0';
			state <= sta_pind_7;
		
		WHEN sta_pind_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg + 1;
			state <= sta_pind_8;

		WHEN sta_pind_8 =>
			read <= '0';
			state <= sta_pind_9;

		WHEN sta_pind_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= sta_pind_10;

		WHEN sta_pind_10 =>
			ADDRESS_reg <= TPCB_reg;
			state <= sta_pind_11;
		
		WHEN sta_pind_11 =>
			write <= '0';
			DATA_reg <= ACCUMULATOR;
			state <= sta_pind_12;

		WHEN sta_pind_12 =>
			write <= '1';
			state <= sta_pind_13;

		WHEN sta_pind_13 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;

		WHEN jmp_pind =>
			read <= '0';
			state <= jmp_pind_2;
			
		WHEN jmp_pind_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jmp_pind_3;
			
		WHEN jmp_pind_3 =>
			read <= '0';
			state <= jmp_pind_4;
			
		WHEN jmp_pind_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jmp_pind_5;
			
		WHEN jmp_pind_5 =>
			ADDRESS_reg <= TPCA_reg + X_reg;
			TPCA_reg <= TPCA_reg + X_reg;
			state <= jmp_pind_6;
			
		WHEN jmp_pind_6 =>
			read <= '0';
			state <= jmp_pind_7;
			
		WHEN jmp_pind_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg + 1;
			state <= jmp_pind_8;
			
		WHEN jmp_pind_8 =>
			read <= '0';
			state <= jmp_pind_9;
			
		WHEN jmp_pind_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jmp_pind_10;
			
		WHEN jmp_pind_10 =>
			ADDRESS_reg <= TPCB_reg;
			PC_reg <= TPCB_reg + 1;
			state <= fetch_instr;
		
		
		WHEN jsr_pind =>
			read <= '0';
			state <= jsr_pind_2;
			
		WHEN jsr_pind_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jsr_pind_3;
			
		WHEN jsr_pind_3 =>
			read <= '0';
			state <= jsr_pind_4;
			
		WHEN jsr_pind_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jsr_pind_5;
			
		WHEN jsr_pind_5 =>
			ADDRESS_reg <= TPCA_reg + X_reg;
			TPCA_reg <= TPCA_reg + X_reg;
			state <= jsr_pind_6;
			
		WHEN jsr_pind_6 =>
			read <= '0';
			state <= jsr_pind_7;
			
		WHEN jsr_pind_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg + 1;
			state <= jsr_pind_8;
			
		WHEN jsr_pind_8 =>
			read <= '0';
			state <= jsr_pind_9;
			
		WHEN jsr_pind_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= SP_reg;
			state <= jsr_pind_10;
			
		WHEN jsr_pind_10 =>
			SP_reg <= SP_reg - 1;
			state <= jsr_pind_11;
			
		WHEN jsr_pind_11 =>
			write <= '0';
			DATA_reg <= PC_reg(7 DOWNTO 0);
			state <= jsr_pind_12;
			
		WHEN jsr_pind_12 =>
			write <= '1';
			state <= jsr_pind_13;
			
		WHEN jsr_pind_13 =>
			ADDRESS_reg <= SP_reg;
			SP_reg <= SP_reg - 1;
			state <= jsr_pind_14;
			
		WHEN jsr_pind_14 =>
			write <= '0';
			DATA_reg <= PC_reg(15 DOWNTO 8);
			state <= jsr_pind_15;
			
		WHEN jsr_pind_15 =>
			write <= '1';
			state <= jsr_pind_16;
			
		WHEN jsr_pind_16 =>
			ADDRESS_reg <= TPCB_reg;
			PC_reg <= TPCB_reg + 1;
			state <= fetch_instr;

		WHEN lda_indp =>
			read <= '0';
			state <= lda_indp_2;

		WHEN lda_indp_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= lda_indp_3;

		WHEN lda_indp_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= lda_indp_4;

		WHEN lda_indp_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= lda_indp_5;

		WHEN lda_indp_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= lda_indp_6;

		WHEN lda_indp_6 =>
			read <= '0';
			state <= lda_indp_7;

		WHEN lda_indp_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= lda_indp_8;

		WHEN lda_indp_8 =>
			read <= '0';
			state <= lda_indp_9;

		WHEN lda_indp_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= lda_indp_10;

		WHEN lda_indp_10 =>
			ADDRESS_reg <= TPCB_reg + X_reg;
			state <= lda_indp_11;

		WHEN lda_indp_11 =>
			read <= '0';
			state <= lda_indp_12;

		WHEN lda_indp_12 =>
			ACCUMULATOR <= DATA_IN_reg;
			STAT_N <= ACCUMULATOR(7);
			STAT_Z <= NOT(ACCUMULATOR(7) OR ACCUMULATOR(6) OR ACCUMULATOR(5) OR ACCUMULATOR(4) OR ACCUMULATOR(3) 
						OR ACCUMULATOR(2) OR ACCUMULATOR(1) OR ACCUMULATOR(0));
			read <= '1';
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN sta_indp =>
			read <= '0';
			state <= sta_indp_2;

		WHEN sta_indp_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= sta_indp_3;

		WHEN sta_indp_3 =>
			read <= '0';
			PC_reg <= PC_reg + 1;
			state <= sta_indp_4;

		WHEN sta_indp_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= sta_indp_5;

		WHEN sta_indp_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= sta_indp_6;

		WHEN sta_indp_6 =>
			read <= '0';
			state <= sta_indp_7;
		
		WHEN sta_indp_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= sta_indp_8;

		WHEN sta_indp_8 =>
			read <= '0';
			state <= sta_indp_9;

		WHEN sta_indp_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= sta_indp_10;

		WHEN sta_indp_10 =>
			ADDRESS_reg <= TPCB_reg + X_reg;
			state <= sta_indp_11;
		
		WHEN sta_indp_11 =>
			write <= '0';
			DATA_reg <= ACCUMULATOR;
			state <= sta_indp_12;

		WHEN sta_indp_12 =>
			write <= '1';
			state <= sta_indp_13;

		WHEN sta_indp_13 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN jmp_indp =>
			read <= '0';
			state <= jmp_indp_2;
			
		WHEN jmp_indp_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jmp_indp_3;
			
		WHEN jmp_indp_3 =>
			read <= '0';
			state <= jmp_indp_4;
			
		WHEN jmp_indp_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jmp_indp_5;
			
		WHEN jmp_indp_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= jmp_indp_6;
			
		WHEN jmp_indp_6 =>
			read <= '0';
			state <= jmp_indp_7;
			
		WHEN jmp_indp_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= jmp_indp_8;
			
		WHEN jmp_indp_8 =>
			read <= '0';
			state <= jmp_indp_9;
			
		WHEN jmp_indp_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jmp_indp_10;
			
		WHEN jmp_indp_10 =>
			PC_reg <= TPCB_reg + X_reg;
			state <= jmp_indp_11;
			
		WHEN jmp_indp_11 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
			
		WHEN jsr_indp =>
			read <= '0';
			state <= jsr_indp_2;
			
		WHEN jsr_indp_2 =>
			TPCA_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= PC_reg;
			state <= jsr_indp_3;
			
		WHEN jsr_indp_3 =>
			read <= '0';
			state <= jsr_indp_4;
			
		WHEN jsr_indp_4 =>
			TPCA_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= "0000000000000000";
			state <= jsr_indp_5;
			
		WHEN jsr_indp_5 =>
			ADDRESS_reg <= TPCA_reg;
			TPCA_reg <= TPCA_reg + 1;
			state <= jsr_indp_6;
			
		WHEN jsr_indp_6 =>
			read <= '0';
			state <= jsr_indp_7;
			
		WHEN jsr_indp_7 =>
			TPCB_reg(15 DOWNTO 8) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= TPCA_reg;
			state <= jsr_indp_8;
			
		WHEN jsr_indp_8 =>
			read <= '0';
			state <= jsr_indp_9;
			
		WHEN jsr_indp_9 =>
			TPCB_reg(7 DOWNTO 0) <= DATA_IN_reg;
			read <= '1';
			ADDRESS_reg <= SP_reg;
			state <= jsr_indp_10;
			
		WHEN jsr_indp_10 =>
			SP_reg <= SP_reg - 1;
			state <= jsr_indp_11;
			
		WHEN jsr_indp_11 =>
			write <= '0';
			DATA_reg <= PC_reg(7 DOWNTO 0);
			state <= jsr_indp_12;
			
		WHEN jsr_indp_12 =>
			write <= '1';
			state <= jsr_indp_13;
			
		WHEN jsr_indp_13 =>
			ADDRESS_reg <= SP_reg;
			SP_reg <= SP_reg - 1;
			state <= jsr_indp_14;
			
		WHEN jsr_indp_14 =>
			write <= '0';
			DATA_reg <= PC_reg(15 DOWNTO 8);
			state <= jsr_indp_15;
			
		WHEN jsr_indp_15 =>
			write <= '1';
			state <= jsr_indp_16;
			
		WHEN jsr_indp_16 =>
			ADDRESS_reg <= "0000000000000000";
			PC_reg <= TPCB_reg + X_reg;
			state <= jsr_indp_17;
			
		WHEN jsr_indp_17 =>
			ADDRESS_reg <= PC_reg;
			PC_reg <= PC_reg + 1;
			state <= fetch_instr;
		
		WHEN OTHERS =>
			state <= fetch_instr;
		
		END CASE;
	END IF;
	END PROCESS;
	
	address_out <= ADDRESS_reg;
	nRead <= read;
	nWrite <= write;
	data_out <= DATA_reg;
	DATA_IN_reg <= data_in;
	
END CPU_BEHAVIOUR;