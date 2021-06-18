library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Control_Unit is
	port( CLK: in std_logic;
			reset: in std_logic;
			ZR0: in std_logic;
			ZR1: in std_logic;
			ZR2: in std_logic;
			ZR3: in std_logic;
			ROUTIR: in std_logic_vector(0 to 5);
			LD0: out std_logic;
			LD1: out std_logic;
			LD2: out std_logic;
			LD3: out std_logic;
			LDPC: out std_logic;
			LDIR: out std_logic;
			S00: out std_logic;
			S01: out std_logic;
			S10: out std_logic;
			S11: out std_logic;
			BUS_Sel: out std_logic;
			CMD: out std_logic;
			INC: out std_logic;
			CLR: out std_logic );
end Control_Unit;

architecture Behavioral of Control_Unit is
type myStates is (S0, S1, delay, S2, S3, S4, S5, S6, S7);
signal present_state: myStates;
signal next_state: myStates;
begin
	
	process(reset, CLK)
	begin
		if(reset = '1') then
			present_state <= S0;		
		elsif rising_edge(CLK) then
			present_state <= next_state;
		end if;
	end process;

	process(present_state, ROUTIR, ZR0, ZR1, ZR2, ZR3)
	begin
		LD0 <= '0';
		LD1 <= '0';
		LD2 <= '0';
		LD3 <= '0';
		LDIR <= '0';
		LDPC <= '0';
		S00 <= '0';
		S01 <= '0';
		S10 <= '0';
		S11 <= '0';
		BUS_Sel <= '0';
		CMD <= '0';
		INC <= '0';
		CLR <= '0';
		case present_state is
			when S0 =>
				CLR <= '1';
				next_state <= S1;
			when S1 =>
				LDIR <= '1';
				BUS_Sel <= '0';
				INC <= '1';
				next_state <= delay;
			when delay =>
				if(ROUTIR = "000000")then
					next_state <= S2;
				else
					if(ROUTIR(0 to 1) = "00")then
						next_state <= S3;
					elsif(ROUTIR(0 to 1) = "01")then
						next_state <= S4;
					elsif(ROUTIR(0 to 1) = "10")then
						next_state <= S5;
					else
						case ROUTIR(2 to 3) is
							when "00" => if(ZR0 = '0') then next_state <= S6; else next_state <= S7; end if;
							when "01" => if(ZR1 = '0') then next_state <= S6; else next_state <= S7; end if;
							when "10" => if(ZR2 = '0') then next_state <= S6; else next_state <= S7; end if;
							when "11" => if(ZR3 = '0') then next_state <= S6; else next_state <= S7; end if;
							when others => next_state <= present_state;
						end case;
					end if;
				end if;
			when S2 =>
				next_state <= S2;
			when S3 =>
				case ROUTIR(2 to 3) is
					when "00" => LD0 <= '1';
					when "01" => LD1 <= '1';
					when "10" => LD2 <= '1';
					when "11" => LD3 <= '1';
					when others => LD0 <= '0'; LD1 <= '0'; LD2 <= '0'; LD3 <= '0';
				end case;
				BUS_Sel <= '0';
				INC <= '1';
				next_state <= S1;
			when S4 =>
				case ROUTIR(2 to 3) is
					when "00" => LD0 <= '1';
					when "01" => LD1 <= '1';
					when "10" => LD2 <= '1';
					when "11" => LD3 <= '1';
					when others => LD0 <= '0'; LD1 <= '0'; LD2 <= '0'; LD3 <= '0';
				end case;
				CMD <= '0';
				S01 <= ROUTIR(2);
				S00 <= ROUTIR(3);
				S11 <= ROUTIR(4);
				S10 <= ROUTIR(5);
				BUS_Sel <= '1';
				next_state <= S1;
			when S5 =>
				case ROUTIR(2 to 3) is
					when "00" => LD0 <= '1';
					when "01" => LD1 <= '1';
					when "10" => LD2 <= '1';
					when "11" => LD3 <= '1';
					when others => LD0 <= '0'; LD1 <= '0'; LD2 <= '0'; LD3 <= '0';
				end case;
				CMD <= '1';
				S01 <= ROUTIR(2);
				S00 <= ROUTIR(3);
				S11 <= ROUTIR(4);
				S10 <= ROUTIR(5);
				BUS_Sel <= '1';
				next_state <= S1;
			when S6 =>
				LDPC <= '1';
				BUS_Sel <= '0';
				next_state <= S1;
			when S7 =>
				INC <= '1';
				next_state <= S1;
			when others =>
				next_state <= present_state;
		 end case;
	end process;
	
end Behavioral;

