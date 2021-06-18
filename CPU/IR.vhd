library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity IR is
	port( RIN: in std_logic_vector(0 to 5);
			ROUTIR: out std_Logic_vector(0 to 5);
			CLK: in std_logic;
			LDIR: in std_logic );
end IR;

architecture Behavioral of IR is
begin
	process(CLK)
	begin
		if rising_edge(CLK) then
			if(LDIR = '1') then
				ROUTIR <= RIN;
			end if;
		end if;
	end process;
end Behavioral;

