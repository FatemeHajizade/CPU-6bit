LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY CPU_tb IS
END CPU_tb;
 
ARCHITECTURE behavior OF CPU_tb IS 
 
    COMPONENT CPU
    PORT(
         clock : IN  std_logic;
			reset: IN std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal clock : std_logic := '0';
	signal reset : std_logic := '0';

   -- Clock period definitions
   constant clock_period : time := 10 ns; 
 
BEGIN

   uut: CPU PORT MAP (
          clock => clock,
			 reset => reset
        );

   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
   stim_proc: process
   begin	
      -- insert stimulus here 
		reset <= '1', '0' after 4 ns;
      wait;
   end process;

END;
