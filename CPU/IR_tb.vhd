LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY IR_tb IS
END IR_tb;
 
ARCHITECTURE behavior OF IR_tb IS 
 
    COMPONENT IR
    PORT(
         RIN : IN  std_logic_vector(0 to 5);
         ROUTIR : OUT  std_logic_vector(0 to 5);
         CLK : IN  std_logic;
         LDIR : IN  std_logic
        );
    END COMPONENT;

   --Inputs
   signal RIN : std_logic_vector(0 to 5) := (others => '0');
   signal CLK : std_logic := '0';
   signal LDIR : std_logic := '0';

 	--Outputs
   signal ROUTIR : std_logic_vector(0 to 5);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN

   uut: IR PORT MAP (
          RIN => RIN,
          ROUTIR => ROUTIR,
          CLK => CLK,
          LDIR => LDIR
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
     -- hold for 100 ns (LDIR = '0')
      wait for 100 ns;	

      -- insert stimulus here
		LDIR <= '1', '0' after 30 ns, '1' after 55 ns;
		RIN <= "000011", "00011" after 20 ns, "000111" after 40 ns, "000101" after 60 ns, "010001" after 80 ns, "000000" after 100 ns;
      wait;
   end process;

END;
