library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PC is
	port( RIN: in std_logic_vector(0 to 5);
			ROUTPC: out std_Logic_vector(0 to 5);
			CLK: in std_logic;
			LDPC: in std_logic;
			INC: in std_logic;
			CLR: in std_logic );
end PC;

architecture Behavioral of PC is
begin
	process(CLK, CLR)
	variable temp: std_logic_vector(0 to 5) := "000000";
	begin
		if(CLR = '1') then
			temp := "000000";
		elsif rising_edge(CLK) then
			if(LDPC = '1') then 
				temp := RIN;
			end if;
			if (INC = '1') then
				temp := std_logic_vector (unsigned (temp) + 1);
			end if;
		end if;
		ROUTPC <= temp;
	end process;
end Behavioral;