LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY R3_tb IS
END R3_tb;
 
ARCHITECTURE behavior OF R3_tb IS 

    COMPONENT R3
    PORT(
         RIN : IN  std_logic_vector(0 to 5);
         ROUT3 : BUFFER  std_logic_vector(0 to 5);
         CLK : IN  std_logic;
         LD3 : IN  std_logic;
         ZR3 : OUT  std_logic
        );
    END COMPONENT;  

   --Inputs
   signal RIN : std_logic_vector(0 to 5) := (others => '0');
   signal CLK : std_logic := '0';
   signal LD3 : std_logic := '0';

 	--Outputs
   signal ROUT3 : std_logic_vector(0 to 5);
   signal ZR3 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN

   uut: R3 PORT MAP (
          RIN => RIN,
          ROUT3 => ROUT3,
          CLK => CLK,
          LD3 => LD3,
          ZR3 => ZR3
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
      -- hold for 100 ns (LD3 = '0')
      wait for 100 ns;	

      -- insert stimulus here
		LD3 <= '1', '0' after 30 ns, '1' after 50 ns;
		RIN <= "110011", "101010" after 20 ns, "010101" after 40 ns, "000111" after 60 ns, "111000" after 80 ns, "000000" after 100 ns;
      wait;
   end process;
END;
