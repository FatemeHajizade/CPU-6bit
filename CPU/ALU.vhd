library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
	port( IN1: in std_logic_vector(0 to 5);
			IN2: in std_Logic_vector(0 to 5);
			CMD: in std_logic;
			ALURes: out std_logic_vector(0 to 5) );
end ALU;

architecture Behavioral of ALU is
begin
	process(IN1, IN2, CMD) 
	begin
		if(CMD = '0') then
			ALURes <= std_logic_vector(unsigned(IN1) + unsigned(IN2));
		else
			ALURes <= std_logic_vector(unsigned(IN1) - unsigned(IN2));
		end if;
	end process;
end Behavioral;

