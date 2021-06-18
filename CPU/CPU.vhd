library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CPU is
	port( clock: in std_logic;
			reset: in std_logic;
			Reg0: out std_logic_vector(0 to 5);
			Reg1: out std_logic_vector(0 to 5);
			Reg2: out std_logic_vector(0 to 5);
			Reg3: out std_logic_vector(0 to 5) );			
end CPU;

architecture Behavioral of CPU is
signal myBus: std_logic_vector(0 to 5);
signal ROUT0: std_logic_vector(0 to 5);
signal ROUT1: std_logic_vector(0 to 5);
signal ROUT2: std_logic_vector(0 to 5);
signal ROUT3: std_logic_vector(0 to 5);
signal ROUTIR: std_logic_vector(0 to 5);
signal Address: std_logic_vector(0 to 5);
signal MData: std_logic_vector(0 to 5);
signal IN1: std_logic_vector(0 to 5);
signal IN2: std_logic_vector(0 to 5);
signal ALURes: std_logic_vector(0 to 5);
signal LD0: std_logic;
signal LD1: std_logic;
signal LD2: std_logic;
signal LD3: std_logic;
signal LDIR: std_logic;
signal LDPC: std_logic;
signal INC: std_logic;
signal CLR: std_logic;
signal ZR0: std_logic;
signal ZR1: std_logic;
signal ZR2: std_logic;
signal ZR3: std_logic;
signal CMD: std_logic;
signal BUS_Sel: std_logic;
signal S00: std_logic;
signal S01: std_logic;
signal S10: std_logic;
signal S11: std_logic;
begin

	R0: Entity work.R0(Behavioral)
			port map(RIN => myBus,
						ROUT0 => ROUT0,
						CLK => clock,
						ZR0 => ZR0,
						LD0 => LD0); 
						  
	R1: Entity work.R1(Behavioral)
			port map(RIN => myBus,
						ROUT1 => ROUT1,
						CLK => clock,
						ZR1 => ZR1,
						LD1 => LD1); 
						  
	R2: Entity work.R2(Behavioral)
			port map(RIN => myBus,
						ROUT2 => ROUT2,
						CLK => clock,
						ZR2 => ZR2,
						LD2 => LD2); 	

	R3: Entity work.R3(Behavioral)
			port map(RIN => myBus,
						ROUT3 => ROUT3,
						CLK => clock,
						ZR3 => ZR3,
						LD3 => LD3);
						
	IR: Entity work.IR(Behavioral)
			port map(RIN => myBus,
						ROUTIR => ROUTIR,
						CLK => clock,
						LDIR => LDIR);
						
	PC: Entity work.PC(Behavioral)
			port map(RIN => myBus,
						ROUTPC => Address,
						CLK => clock,
						LDPC => LDPC,
						INC => INC,
						CLR => CLR);
						
	ALU: Entity work.ALU(Behavioral)
			port map(IN1 => IN1,
						IN2 => In2,
						CMD => CMD,
						ALURes => ALURes);
						
	Memory: Entity work.Memory(Behavioral)
				port map(Address => Address,
							MData => MData);
							
	Control_Unit: Entity work.Control_Unit(Behavioral)
						port map(CLK => clock,
									reset => reset,
									ZR0 => ZR0,
									ZR1 => ZR1,
									ZR2 => ZR2,
									ZR3 => ZR3,
									ROUTIR => ROUTIR,
									LD0 => LD0,
									LD1 => LD1,
									LD2 => LD2,
									LD3 => LD3,
									LDPC => LDPC,
									LDIR => LDIR,
									S00 => S00,
									S01 => S01,
									S10 => S10,
									S11 => S11,
									BUS_Sel => BUS_Sel,
									CMD => CMD,
									INC => INC,
									CLR => CLR);
									
									
	IN1 <=	ROUT0 when (S00 = '0' and S01 = '0') else
				ROUT1 when (S00 = '1' and S01 = '0') else
				ROUT2 when (S00 = '0' and S01 = '1') else
				ROUT3;
							 
	IN2 <= 	ROUT0 when (S10 = '0' and S11 = '0') else
				ROUT1 when (S10 = '1' and S11 = '0') else
				ROUT2 when (S10 = '0' and S11 = '1') else
				ROUT3;

	myBus <= MData when (BUS_Sel = '0') else
				ALURes;
	
	process(reset, clock)
	begin
		if rising_edge(clock) then
			Reg0 <= ROUT0;
			Reg1 <= ROUT1;
			Reg2 <= ROUT2;
			Reg3 <= ROUT3;
		end if;
	end process;
	
end Behavioral;

