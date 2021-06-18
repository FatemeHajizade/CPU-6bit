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
	 myMemory(1) <= "000101"; 
	 myMemory(2) <= "000111"; 
	 myMemory(3) <= "000011"; 
	 myMemory(4) <= "010001"; 

	MData <= myMemory(to_integer(unsigned(Address)));
end Behavioral;