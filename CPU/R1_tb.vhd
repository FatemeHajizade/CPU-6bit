LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY R1_tb IS
END R1_tb;
 
ARCHITECTURE behavior OF R1_tb IS 

    COMPONENT R1
    PORT(
         RIN : IN  std_logic_vector(0 to 5);
         ROUT1 : BUFFER  std_logic_vector(0 to 5);
         CLK : IN  std_logic;
         LD1 : IN  std_logic;
         ZR1 : OUT  std_logic
        );
    END COMPONENT;  

   --Inputs
   signal RIN : std_logic_vector(0 to 5) := (others => '0');
   signal CLK : std_logic := '0';
   signal LD1 : std_logic := '0';

 	--Outputs
   signal ROUT1 : std_logic_vector(0 to 5);
   signal ZR1 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN

   uut: R1 PORT MAP (
          RIN => RIN,
          ROUT1 => ROUT1,
          CLK => CLK,
          LD1 => LD1,
          ZR1 => ZR1
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
      -- hold for 100 ns (LD1 = '0')
      wait for 100 ns;	

      -- insert stimulus here
		LD1 <= '1', '0' after 30 ns, '1' after 70 ns;
		RIN <= "010011", "100110" after 20 ns, "000011" after 40 ns, "000000" after 60 ns, "110011" after 80 ns, "111111" after 100 ns;
      wait;
   end process;
END;
