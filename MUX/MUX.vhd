----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX is
	port(
		in0, in1, sel : in std_logic;
		outp : out std_logic
	);
end MUX;

architecture Behavioral of MUX is
begin
	outp <= (in0 AND NOT sel) OR (in1 and sel);
	
  
end Behavioral;

