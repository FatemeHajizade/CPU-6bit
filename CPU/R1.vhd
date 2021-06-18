library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity R1 is
	port( RIN: in std_logic_vector(0 to 5);
			ROUT1: buffer std_Logic_vector(0 to 5); --the type is buffer because of reading from ROUT1 in line 23
			CLK: in std_logic;
			LD1: in std_logic;
			ZR1: out std_logic );		
end R1;

architecture Behavioral of R1 is
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if(LD1 = '1') then
				ROUT1 <= RIN;
			end if;
		end if;
	end process;
	
ZR1 <= '1' when ROUT1 = "000000" else '0' ;
end Behavioral;

