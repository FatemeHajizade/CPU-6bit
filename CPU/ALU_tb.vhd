LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY ALU_tb IS
END ALU_tb;
 
ARCHITECTURE behavior OF ALU_tb IS 
 
    COMPONENT ALU
    PORT(
         IN1 : IN  std_logic_vector(0 to 5);
         IN2 : IN  std_logic_vector(0 to 5);
         CMD : IN  std_logic;
         ALURes : OUT  std_logic_vector(0 to 5)
        );
    END COMPONENT;
    
   --Inputs
   signal IN1 : std_logic_vector(0 to 5) := (others => '0');
   signal IN2 : std_logic_vector(0 to 5) := (others => '0');
   signal CMD : std_logic := '0';

 	--Outputs
   signal ALURes : std_logic_vector(0 to 5);


BEGIN

   uut: ALU PORT MAP (
          IN1 => IN1,
          IN2 => IN2,
          CMD => CMD,
          ALURes => ALURes
        );

   stim_proc: process
   begin
	
      -- insert stimulus here 
		CMD <= '0', '1' after 20 ns, '0' after 38 ns;
		IN1 <= "000000", "100011" after 5 ns, "001000" after 10 ns, "011100" after 20 ns, "111000" after 35 ns;
		IN2 <= "000000", "000101" after 5 ns, "000001" after 10 ns, "000110" after 20 ns, "000111" after 35 ns;

      wait;
   end process;

END;
