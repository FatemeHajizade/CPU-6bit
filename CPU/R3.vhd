library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity R3 is
	port( RIN: in std_logic_vector(0 to 5);
			ROUT3: buffer std_Logic_vector(0 to 5); --the type is buffer because of reading from ROUT3 in line 23
			CLK: in std_logic;
			LD3: in std_logic;
			ZR3: out std_logic );		
end R3;

architecture Behavioral of R3 is
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if(LD3 = '1') then
				ROUT3 <= RIN;
			end if;
		end if;
	end process;
	
ZR3 <= '1' when ROUT3 = "000000" else '0' ;
end Behavioral;

