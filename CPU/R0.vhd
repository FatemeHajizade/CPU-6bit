library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity R0 is
	port( RIN: in std_logic_vector(0 to 5);
			ROUT0: buffer std_Logic_vector(0 to 5); --the type is buffer because of reading from ROUT0 in line 23
			CLK: in std_logic;
			LD0: in std_logic;
			ZR0: out std_logic );		
end R0;

architecture Behavioral of R0 is
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if(LD0 = '1') then
				ROUT0 <= RIN;
			end if;
		end if;
	end process;
	
ZR0 <= '1' when ROUT0 = "000000" else '0' ;
end Behavioral;

