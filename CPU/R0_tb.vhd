LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY R0_tb IS
END R0_tb;
 
ARCHITECTURE behavior OF R0_tb IS 

    COMPONENT R0
    PORT(
         RIN : IN  std_logic_vector(0 to 5);
         ROUT0 : BUFFER  std_logic_vector(0 to 5);
         CLK : IN  std_logic;
         LD0 : IN  std_logic;
         ZR0 : OUT  std_logic
        );
    END COMPONENT;  

   --Inputs
   signal RIN : std_logic_vector(0 to 5) := (others => '0');
   signal CLK : std_logic := '0';
   signal LD0 : std_logic := '0';

 	--Outputs
   signal ROUT0 : std_logic_vector(0 to 5);
   signal ZR0 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN

   uut: R0 PORT MAP (
          RIN => RIN,
          ROUT0 => ROUT0,
          CLK => CLK,
          LD0 => LD0,
          ZR0 => ZR0
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
      -- hold for 100 ns (LD0 = '0')
      wait for 100 ns;	

      -- insert stimulus here
		LD0 <= '1';
		RIN <= "000011", "000101" after 20 ns, "000111" after 40 ns, "001000" after 60 ns, "000000" after 80 ns, "111111" after 100 ns;
      wait;
   end process;
END;
