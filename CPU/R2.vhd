library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity R2 is
	port( RIN: in std_logic_vector(0 to 5);
			ROUT2: buffer std_Logic_vector(0 to 5); --the type is buffer because of reading from ROUT2 in line 23
			CLK: in std_logic;
			LD2: in std_logic;
			ZR2: out std_logic );		
end R2;

architecture Behavioral of R2 is
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if(LD2 = '1') then
				ROUT2 <= RIN;
			end if;
		end if;
	end process;
	
ZR2 <= '1' when ROUT2 = "000000" else '0' ;
end Behavioral;

