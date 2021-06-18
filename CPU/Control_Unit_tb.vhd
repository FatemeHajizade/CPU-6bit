LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Control_Unit_tb IS
END Control_Unit_tb;
 
ARCHITECTURE behavior OF Control_Unit_tb IS 
 
    COMPONENT Control_Unit
    PORT(
         CLK : IN  std_logic;
			reset: IN std_logic;
         ZR0 : IN  std_logic;
         ZR1 : IN  std_logic;
         ZR2 : IN  std_logic;
         ZR3 : IN  std_logic;
         ROUTIR : IN  std_logic_vector(0 to 5);
         LD0 : OUT  std_logic;
         LD1 : OUT  std_logic;
         LD2 : OUT  std_logic;
         LD3 : OUT  std_logic;
         LDPC : OUT  std_logic;
         LDIR : OUT  std_logic;
         S00 : OUT  std_logic;
         S01 : OUT  std_logic;
         S10 : OUT  std_logic;
         S11 : OUT  std_logic;
         BUS_Sel : OUT  std_logic;
         CMD : OUT  std_logic;
         INC : OUT  std_logic;
         CLR : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal CLK : std_logic := '0';
	signal reset: std_logic := '0';
   signal ZR0 : std_logic := '0';
   signal ZR1 : std_logic := '0';
   signal ZR2 : std_logic := '0';
   signal ZR3 : std_logic := '0';
   signal ROUTIR : std_logic_vector(0 to 5) := (others => '0');

 	--Outputs
   signal LD0 : std_logic;
   signal LD1 : std_logic;
   signal LD2 : std_logic;
   signal LD3 : std_logic;
   signal LDPC : std_logic;
   signal LDIR : std_logic;
   signal S00 : std_logic;
   signal S01 : std_logic;
   signal S10 : std_logic;
   signal S11 : std_logic;
   signal BUS_Sel : std_logic;
   signal CMD : std_logic;
   signal INC : std_logic;
   signal CLR : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN

   uut: Control_Unit PORT MAP (
          CLK => CLK,
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
          CLR => CLR
        );

   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 
   stim_proc: process
   begin
		
		reset <= '1', '0' after 2 ns;
		ROUTIR <= "000011" after 12 ns, "010110" after 42 ns, "101011" after 72 ns, "110011" after 102 ns;
		ZR0 <= '1' after 102 ns;
		
      wait;
   end process;

END;
