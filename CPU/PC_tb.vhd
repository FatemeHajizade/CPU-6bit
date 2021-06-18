LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY PC_tb IS
END PC_tb;
 
ARCHITECTURE behavior OF PC_tb IS 
 
    COMPONENT PC
    PORT(
         RIN : IN  std_logic_vector(0 to 5);
         ROUTPC : OUT  std_logic_vector(0 to 5);
         CLK : IN  std_logic;
         LDPC : IN  std_logic;
         INC : IN  std_logic;
         CLR : IN  std_logic
        );
    END COMPONENT;

   --Inputs
   signal RIN : std_logic_vector(0 to 5) := (others => '0');
   signal CLK : std_logic := '0';
   signal LDPC : std_logic := '0';
   signal INC : std_logic := '0';
   signal CLR : std_logic := '0';

 	--Outputs
   signal ROUTPC : std_logic_vector(0 to 5);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN

   uut: PC PORT MAP (
          RIN => RIN,
          ROUTPC => ROUTPC,
          CLK => CLK,
          LDPC => LDPC,
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
	
		INC <= '0', '1' after 6 ns, '0' after 45 ns, '1' after 46 ns;	
		LDPC <= '0', '1' after 25 ns, '0' after 26 ns, '1' after 45 ns, '0' after 46 ns;
		RIN <= "000000", "010000" after 25 ns, "100000" after 45 ns;
		CLR <= '0', '1' after 62 ns;
		
      wait;
   end process;

END;
