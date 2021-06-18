LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY R2_tb IS
END R2_tb;
 
ARCHITECTURE behavior OF R2_tb IS 

    COMPONENT R2
    PORT(
         RIN : IN  std_logic_vector(0 to 5);
         ROUT2 : BUFFER  std_logic_vector(0 to 5);
         CLK : IN  std_logic;
         LD2 : IN  std_logic;
         ZR2 : OUT  std_logic
        );
    END COMPONENT;  

   --Inputs
   signal RIN : std_logic_vector(0 to 5) := (others => '0');
   signal CLK : std_logic := '0';
   signal LD2 : std_logic := '0';

 	--Outputs
   signal ROUT2 : std_logic_vector(0 to 5);
   signal ZR2 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN

   uut: R2 PORT MAP (
          RIN => RIN,
          ROUT2 => ROUT2,
          CLK => CLK,
          LD2 => LD2,
          ZR2 => ZR2
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
      -- hold for 100 ns (LD2 = '0')
      wait for 100 ns;	

      -- insert stimulus here
		LD2 <= '1';
		RIN <= "111111", "000000" after 20 ns, "010001" after 40 ns, "101011" after 60 ns, "110000" after 80 ns, "000011" after 100 ns;
      wait;
   end process;
END;
