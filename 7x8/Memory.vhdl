library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Memory is
	port( Address: in std_logic_vector(0 to 5);
			MData: out std_logic_vector(0 to 5) );
end Memory;

architecture Behavioral of Memory is
type myType is array (0 to 63) of std_logic_vector(0 to 5);
signal myMemory: myType;
begin
	 myMemory(0) <= "000011"; 
	 myMemory(1) <= "000000"; 
	 myMemory(2) <= "000111"; 
	 myMemory(3) <= "000111"; 
	 myMemory(4) <= "001011"; 
	 myMemory(5) <= "001000"; 
	 myMemory(6) <= "001111"; 
	 myMemory(7) <= "000001"; 
	 myMemory(8) <= "010010"; 
	 myMemory(9) <= "100111"; 
	 myMemory(10) <= "110111"; 
	 myMemory(11) <= "001000"; 
	 myMemory(12) <= "000000"; 
	MData <= myMemory(to_integer(unsigned(Address)));
end Behavioral;